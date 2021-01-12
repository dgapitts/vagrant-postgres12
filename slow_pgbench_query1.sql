-- https://wiki.ebabel.eu/index.php?title=Postgres_pgbench_demo_with_IO_intense_background_task
-- expense background task query triggering seq scan on large pgbench_accounts table (parallelize in later versions of postgres)
explain (analyze,buffers) select max(abalance) from pgbench_accounts where bid = 7;
