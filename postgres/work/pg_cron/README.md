# PostgreSQL pg_cron

 Run periodic jobs in PostgreSQL 

https://github.com/citusdata/pg_cron

Automating MERGE is important for error-prone MERGE execution and reducing maintenance hassle. PostgreSQL supports pg_cron extension. This extension is used to configure scheduled tasks for a PostgreSQL database. A typical pg_cron command mentioned below shows the scheduling options:

    SELECT cron.schedule('Minute Hour Date Month Day of the week', 'Task');



```
 ┌───────────── min (0 - 59)
 │ ┌────────────── hour (0 - 23)
 │ │ ┌─────────────── day of month (1 - 31) or last day of the month ($)
 │ │ │ ┌──────────────── month (1 - 12)
 │ │ │ │ ┌───────────────── day of week (0 - 6) (0 to 6 are Sunday to
 │ │ │ │ │                  Saturday, or use names; 7 is also Sunday)
 │ │ │ │ │
 │ │ │ │ │
 * * * * *
```

```sql
ELECT cron.schedule('30 * * * *', $$MERGE INTO station_main sm

           USING  station_1 s

           ON sm.station_id=s.station_id

           when matched then

           update set data=s.data

            WHEN NOT MATCHED THEN

           INSERT (station_id, data)

            VALUES (s.station_id, s.data);$$);
```

