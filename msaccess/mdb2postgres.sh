#!/usr/bin/env bash

# install mdbtools first!
# mdbtools: https://github.com/brianb/mdbtools
# ref: https://wiki.postgresql.org/wiki/Converting_from_other_Databases_to_PostgreSQL


DBMS=postgres

for MDB in `ls | grep .mdb$`
do
    # extract the mdb file basename, and substitute upcase letters to lowercase
    MdbBASE=`basename ${MDB} .mdb`
    lMdbBASE=`basename ${MDB} .mdb | tr 'A-Z' 'a-z'`
    echo "Processing ${MdbBASE}"
    # create mdb file basename and create directory for output
    if [ ! -d ${lMdbBASE} ]; then
        mkdir -p ${lMdbBASE}
    fi
    # check if the target database exists or not
    # if the database exists, back it up first
    checkdb=`psql -qA -t postgres -c "SELECT datname FROM pg_database where datname='${lMdbBASE}'"`
    if [[ ${checkdb} == ${lMdbBASE} ]]; then
        # backup existed database first
        pg_dump ${lMdbBASE} | gzip > ${lMdbBASE}.sql.gz
        dropdb ${lMdbBASE}
    fi
    # create database and import table schema
    createdb ${lMdbBASE}
    
    echo "mdb-schema ${MDB} ${DBMS} | sed 's/Char/Varchar/g' | sed 's/Postgres_Unknown 0x0c/text/g' | sed 's/Postgres_Unknown 0x10/INTEGER/g' | tr 'A-Z' 'a-z' | psql -d ${lMdbBASE}"

    mdb-schema ${MDB} ${DBMS} | sed 's/Char/Varchar/g' | sed 's/Postgres_Unknown 0x0c/text/g' | sed 's/Postgres_Unknown 0x10/INTEGER/g' | tr 'A-Z' 'a-z' | psql -d ${lMdbBASE}
    
    # import data
    for T in $(mdb-tables ${MDB})
    do 
        mdb-export ${MDB} ${T} > ${lMdbBASE}/${T}.csv
        mdb-export -q "'" -I ${DBMS} ${MDB} ${T} | tr 'A-Z' 'a-z' | psql -d ${lMdbBASE}
    done
done
