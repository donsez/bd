# PostgreSQL :: DVD Rental

https://neon.tech/postgresql/postgresql-getting-started/postgresql-sample-database

15 tables in the DVD Rental database:

    actor – stores actor data including first name and last name.
    film – stores film data such as title, release year, length, rating, etc.
    film_actor – stores the relationships between films and actors.
    category – stores film’s categories data.
    film_category- stores the relationships between films and categories.
    store – contains the store data including manager staff and address.
    inventory – stores inventory data.
    rental – stores rental data.
    payment – stores customer’s payments.
    staff – stores staff data.
    customer – stores customer data.
    address – stores address data for staff and customers
    city – stores city names.
    country – stores country names.

https://neon.tech/postgresql/postgresql-getting-started/load-postgresql-sample-database

pg_restore -U postgres -d dvdrental ./dvdrental.tar