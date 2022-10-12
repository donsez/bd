START TRANSACTION;

\prompt 'Confirm abort (Y/N): ' confirm
\o /dev/null
select set_config('psql.confirm', :'confirm', false);
\o
do $$
  DECLARE var confirm = current_setting('psql.confirm');
BEGIN
    IF confirm = 'Y' THEN
        RAISE NOTICE 'Aborting';
        ROLLBACK
    ELSE
        RAISE NOTICE 'Committing';
        COMMIT;
    END IF;
END;
$$;
