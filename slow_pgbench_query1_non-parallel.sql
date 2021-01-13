SET max_parallel_workers_per_gather = 0;
explain (analyze,buffers) select max(abalance) from pgbench_accounts where bid = 7;wq
