## Quick Intro

This project is a pg12/centos-7 version of vagrant-postgres10 (also centos 7)
Please see https://github.com/dgapitts/vagrant-postgres10 for more details

### Extra manual steps for root sar crontab 

```
# run system activity accounting tool every 1 minutes
*/1 * * * * /usr/lib64/sa/sa1 1 1
# generate a daily summary of process accounting at 23:53
53 23 * * * /usr/lib64/sa/sa2 -A
```
### systemctl commands for postgresql-12.service for status/start/stop with alias' for vagrant user

These can be run as the standard vagrant user
```
[pg12centos7:vagrant:~] # alias pgstatus='echo "sudo systemctl status postgresql-12.service";sudo systemctl status postgresql-12.service'
[pg12centos7:vagrant:~] # alias pgstart='echo "sudo systemctl start postgresql-12.service";sudo systemctl start postgresql-12.service'
[pg12centos7:vagrant:~] # alias pgstop='echo "sudo systemctl stop postgresql-12.service";sudo systemctl stop postgresql-12.service'
```
and demo'ing this:
```
[pg12centos7:vagrant:~] # pgstatus 
sudo systemctl status postgresql-12.service
● postgresql-12.service - PostgreSQL 12 database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql-12.service; enabled; vendor preset: disabled)
   Active: active (running) since do 2021-01-07 17:18:16 UTC; 14h ago
     Docs: https://www.postgresql.org/docs/12/static/
 Main PID: 16823 (postmaster)
   CGroup: /system.slice/postgresql-12.service
           ├─16823 /usr/pgsql-12/bin/postmaster -D /var/lib/pgsql/12/data/
           ├─16825 postgres: logger   
           ├─16827 postgres: checkpointer   
           ├─16828 postgres: background writer   
           ├─16829 postgres: walwriter   
           ├─16830 postgres: autovacuum launcher   
           ├─16831 postgres: stats collector   
           └─16832 postgres: logical replication launcher   

jan 07 17:18:15 pg12centos7 systemd[1]: Starting PostgreSQL 12 database server...
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.034 UTC [16823] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, com..., 64-bit
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.038 UTC [16823] LOG:  listening on IPv6 address "::1", port 5432
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.038 UTC [16823] LOG:  listening on IPv4 address "127.0.0.1", port 5432
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.039 UTC [16823] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.041 UTC [16823] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.051 UTC [16823] LOG:  redirecting log output to logging collector process
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.051 UTC [16823] HINT:  Future log output will appear in directory "log".
jan 07 17:18:16 pg12centos7 systemd[1]: Started PostgreSQL 12 database server.
Hint: Some lines were ellipsized, use -l to show in full.

[pg12centos7:vagrant:~] # pgstop
sudo systemctl stop postgresql-12.service
[pg12centos7:vagrant:~] # pgstatus 
sudo systemctl status postgresql-12.service
● postgresql-12.service - PostgreSQL 12 database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql-12.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since vr 2021-01-08 20:32:02 UTC; 7s ago
     Docs: https://www.postgresql.org/docs/12/static/
  Process: 16823 ExecStart=/usr/pgsql-12/bin/postmaster -D ${PGDATA} (code=exited, status=0/SUCCESS)
 Main PID: 16823 (code=exited, status=0/SUCCESS)

jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.034 UTC [16823] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, com..., 64-bit
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.038 UTC [16823] LOG:  listening on IPv6 address "::1", port 5432
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.038 UTC [16823] LOG:  listening on IPv4 address "127.0.0.1", port 5432
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.039 UTC [16823] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.041 UTC [16823] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.051 UTC [16823] LOG:  redirecting log output to logging collector process
jan 07 17:18:16 pg12centos7 postmaster[16823]: 2021-01-07 17:18:16.051 UTC [16823] HINT:  Future log output will appear in directory "log".
jan 07 17:18:16 pg12centos7 systemd[1]: Started PostgreSQL 12 database server.
jan 08 20:32:02 pg12centos7 systemd[1]: Stopping PostgreSQL 12 database server...
jan 08 20:32:02 pg12centos7 systemd[1]: Stopped PostgreSQL 12 database server.
Hint: Some lines were ellipsized, use -l to show in full.
[pg12centos7:vagrant:~] # pgstart
sudo systemctl  start postgresql-12.service
[pg12centos7:vagrant:~] # pgstatus 
sudo systemctl status postgresql-12.service
● postgresql-12.service - PostgreSQL 12 database server
   Loaded: loaded (/usr/lib/systemd/system/postgresql-12.service; enabled; vendor preset: disabled)
   Active: active (running) since vr 2021-01-08 20:32:23 UTC; 4s ago
     Docs: https://www.postgresql.org/docs/12/static/
  Process: 32672 ExecStartPre=/usr/pgsql-12/bin/postgresql-12-check-db-dir ${PGDATA} (code=exited, status=0/SUCCESS)
 Main PID: 32677 (postmaster)
   CGroup: /system.slice/postgresql-12.service
           ├─32677 /usr/pgsql-12/bin/postmaster -D /var/lib/pgsql/12/data/
           ├─32679 postgres: logger   
           ├─32681 postgres: checkpointer   
           ├─32682 postgres: background writer   
           ├─32683 postgres: walwriter   
           ├─32684 postgres: autovacuum launcher   
           ├─32685 postgres: stats collector   
           └─32686 postgres: logical replication launcher   

jan 08 20:32:23 pg12centos7 systemd[1]: Starting PostgreSQL 12 database server...
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.205 UTC [32677] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, com..., 64-bit
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.208 UTC [32677] LOG:  listening on IPv6 address "::1", port 5432
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.208 UTC [32677] LOG:  listening on IPv4 address "127.0.0.1", port 5432
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.212 UTC [32677] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.214 UTC [32677] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.224 UTC [32677] LOG:  redirecting log output to logging collector process
jan 08 20:32:23 pg12centos7 postmaster[32677]: 2021-01-08 20:32:23.224 UTC [32677] HINT:  Future log output will appear in directory "log".
jan 08 20:32:23 pg12centos7 systemd[1]: Started PostgreSQL 12 database server.
Hint: Some lines were ellipsized, use -l to show in full.
```


### pg_ctl to reload/status/start/stop/restart postgresql-12.service as postgres user

This should be run as the postgres user
```
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ status
pg_ctl: server is running (PID: 16401)
/usr/pgsql-12/bin/postgres "-D" "/var/lib/pgsql/12/data/"
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ reload
server signaled
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ status
pg_ctl: server is running (PID: 16401)
```

The reload operation picks up new .conf setting but as above we are still running on the same PID.

Next with a stop and then start, the postmaster (the postgres master) is on a new PID:
```
/usr/pgsql-12/bin/postgres "-D" "/var/lib/pgsql/12/data/"
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ stop
waiting for server to shut down.... done
server stopped
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ start
waiting for server to start....2021-01-09 09:14:58.562 UTC [28968] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
2021-01-09 09:14:58.566 UTC [28968] LOG:  listening on IPv6 address "::1", port 5432
2021-01-09 09:14:58.566 UTC [28968] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2021-01-09 09:14:58.569 UTC [28968] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2021-01-09 09:14:58.573 UTC [28968] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2021-01-09 09:14:58.590 UTC [28968] LOG:  redirecting log output to logging collector process
2021-01-09 09:14:58.590 UTC [28968] HINT:  Future log output will appear in directory "log".
 done
server started
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ status
pg_ctl: server is running (PID: 28968)
/usr/pgsql-12/bin/postgres "-D" "/var/lib/pgsql/12/data"
```
there is a restart option runs back-to-back stop and start commands

```
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ restart
waiting for server to shut down.... done
server stopped
waiting for server to start....2021-01-09 09:19:13.980 UTC [28987] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
2021-01-09 09:19:13.982 UTC [28987] LOG:  listening on IPv6 address "::1", port 5432
2021-01-09 09:19:13.982 UTC [28987] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2021-01-09 09:19:13.984 UTC [28987] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2021-01-09 09:19:13.986 UTC [28987] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2021-01-09 09:19:14.001 UTC [28987] LOG:  redirecting log output to logging collector process
2021-01-09 09:19:14.001 UTC [28987] HINT:  Future log output will appear in directory "log".
 done
server started
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ status
pg_ctl: server is running (PID: 28987)
/usr/pgsql-12/bin/postgres "-D" "/var/lib/pgsql/12/data"
[pg12centos7:postgres:~] # ps -ef|grep 28987
postgres 28987     1  0 09:19 ?        00:00:00 /usr/pgsql-12/bin/postgres -D /var/lib/pgsql/12/data
postgres 28988 28987  0 09:19 ?        00:00:00 postgres: logger
postgres 28990 28987  0 09:19 ?        00:00:00 postgres: checkpointer
postgres 28991 28987  0 09:19 ?        00:00:00 postgres: background writer
postgres 28992 28987  0 09:19 ?        00:00:00 postgres: walwriter
postgres 28993 28987  0 09:19 ?        00:00:00 postgres: autovacuum launcher
postgres 28994 28987  0 09:19 ?        00:00:00 postgres: stats collector
```

### reviewing pg_ctl shutdown modes 

There are three shutdown modes smart, fast and immediate
```
[pg12centos7:postgres:~] # pg_ctl --help | grep -A4 '^Shutdown modes'
Shutdown modes are:
  smart       quit after all clients have disconnected
  fast        quit directly, with proper shutdown (default)
  immediate   quit without complete shutdown; will lead to recovery on restart

```

here are a few notes, including a comparison to how the same terms are used in oracle but with a significantly different meaning: 
* smart is potentially very slow i.e. politely waiting for all connections to disconn
* fast (default) is reasonably fast, assuming the db is in a healthy state and cleanly shuts down the db i.e. like an oracle "shutdown immediate"
* immediate this is very fast, but crash recovery is required on the db restart i.e. this is similar to the oracle "shutdown abort" and not like an oracle "shutdown immediate"


For an idle database these are all loosely equivalent:

```
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ status
pg_ctl: server is running (PID: 1694)
/usr/pgsql-12/bin/postgres "-D" "/var/lib/pgsql/12/data"
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ stop immediate
pg_ctl: too many command-line arguments (first is "stop")
Try "pg_ctl --help" for more information.
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ stop -m immediate
waiting for server to shut down.... done
server stopped
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ start
waiting for server to start....2021-01-09 16:14:20.392 UTC [1715] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
2021-01-09 16:14:20.393 UTC [1715] LOG:  listening on IPv6 address "::1", port 5432
2021-01-09 16:14:20.393 UTC [1715] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2021-01-09 16:14:20.396 UTC [1715] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2021-01-09 16:14:20.399 UTC [1715] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2021-01-09 16:14:20.419 UTC [1715] LOG:  redirecting log output to logging collector process
2021-01-09 16:14:20.419 UTC [1715] HINT:  Future log output will appear in directory "log".
 done
server started
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ stop -m fast
waiting for server to shut down.... done
server stopped
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ start
waiting for server to start....2021-01-09 16:15:18.774 UTC [1728] LOG:  starting PostgreSQL 12.5 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
2021-01-09 16:15:18.774 UTC [1728] LOG:  listening on IPv6 address "::1", port 5432
2021-01-09 16:15:18.775 UTC [1728] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2021-01-09 16:15:18.776 UTC [1728] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2021-01-09 16:15:18.779 UTC [1728] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2021-01-09 16:15:18.796 UTC [1728] LOG:  redirecting log output to logging collector process
2021-01-09 16:15:18.796 UTC [1728] HINT:  Future log output will appear in directory "log".
 done
server started
[pg12centos7:postgres:~] # pg_ctl -D /var/lib/pgsql/12/data/ stop -m smart
waiting for server to shut down.... done
server stopped
[pg12centos7:postgres:~] # pg_ctl --help | grep -A3 '^Shutdown modes'
Shutdown modes are:
  smart       quit after all clients have disconnected
  fast        quit directly, with proper shutdown (default)
  immediate   quit without complete shutdown; will lead to recovery on restart
```



### Manually running quick-start-setup-pg-ora-demo-scripts.sh

First let's review this setup script:
```
[root@pg12centos7 ~]# cat /vagrant/quick-start-setup-pg-ora-demo-scripts.sh
su -c "cd ~;pwd;git clone https://github.com/dgapitts/pg-ora-demo-scripts.git;ls -l pg-ora-demo-scripts" -s /bin/sh postgres
cp /vagrant/quick-start-setup-pg-ora-demo-scripts.sql /tmp/quick-start-setup-pg-ora-demo-scripts.sql
cp /vagrant/pgpass /tmp/pgpass
su -c "psql postgres -f /tmp/quick-start-setup-pg-ora-demo-scripts.sql" -s /bin/sh postgres
su -c "cat /tmp/pgpass >> ~/.pgpass" -s /bin/sh postgres
su -c "chmod 600 ~/.pgpass" -s /bin/sh postgres
cp /vagrant/bashrc.append.txt /tmp/bashrc.append.txt
su -c "cat /tmp/bashrc.append.txt >> ~/.bash_profile" -s /bin/sh postgres
```

Now stepping through manually, first you need to setup an ssh-key for the postgres user and upload it to github:

```
cd ~
ssh-keygen
cat ~/.ssh/id_rsa.pub
<< copy results into your https://github.com/settings/profile - SSH >>
```

i.e. as per https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
	

Next as root 

```
[root@pg12centos7 ~]# su -c "cd ~;pwd;git clone https://github.com/dgapitts/pg-ora-demo-scripts.git;ls -l pg-ora-demo-scripts" -s /bin/sh postgres
/var/lib/pgsql
Cloning into 'pg-ora-demo-scripts'...
remote: Enumerating objects: 97, done.
remote: Counting objects: 100% (97/97), done.
remote: Compressing objects: 100% (80/80), done.
remote: Total 249 (delta 33), reused 61 (delta 15), pack-reused 152
Receiving objects: 100% (249/249), 1.15 MiB | 1.47 MiB/s, done.
Resolving deltas: 100% (85/85), done.
total 40
drwxr-xr-x. 5 postgres postgres    44 Mar  9 12:57 demo
-rw-r--r--. 1 postgres postgres 35147 Mar  9 12:57 LICENSE
drwxr-xr-x. 6 postgres postgres   247 Mar  9 12:57 loadtest
drwxr-xr-x. 6 postgres postgres   100 Mar  9 12:57 memtest
drwxr-xr-x. 2 postgres postgres    72 Mar  9 12:57 oramon
drwxr-xr-x. 2 postgres postgres   199 Mar  9 12:57 pgmon
-rw-r--r--. 1 postgres postgres  1441 Mar  9 12:57 README.md
[root@pg12centos7 ~]# cp /vagrant/quick-start-setup-pg-ora-demo-scripts.sql /tmp/quick-start-setup-pg-ora-
[root@pg12centos7 ~]# cp /vagrant/pgpass /tmp/pgpass
[root@pg12centos7 ~]# cat /tmp/quick-start-setup-pg-ora-demo-scripts.sql
alter user postgres with password 'changeme';

CREATE DATABASE bench1;
\c bench1
create user bench1 with password 'changeme';
GRANT ALL PRIVILEGES ON DATABASE bench1 to bench1;

[root@pg12centos7 ~]# su -c "psql postgres -f /tmp/quick-start-setup-pg-ora-demo-scripts.sql" -s /bin/sh postgres
could not change directory to "/root": Permission denied
ALTER ROLE
CREATE DATABASE
You are now connected to database "bench1" as user "postgres".
CREATE ROLE
GRANT
[root@pg12centos7 ~]# su -c "cat /tmp/pgpass >> ~/.pgpass" -s /bin/sh postgres
[root@pg12centos7 ~]# su -c "chmod 600 ~/.pgpass" -s /bin/sh postgres
```

NB1 Currently I can read but not execute the 

```
[pg12centos7:postgres:~] # ls -ltr /vagrant/*.sh
-rw-r--r--. 1 vagrant vagrant  191 Mar  8 22:58 /vagrant/update_alluser_passwords_from_changeme.sh
-rwxr-xr-x. 1 vagrant vagrant  454 Mar  8 22:58 /vagrant/quick-start-setup-pg-ora-demo-scripts.sh
-rwxr-xr-x. 1 vagrant vagrant  555 Mar  8 22:58 /vagrant/developer-option-part2-setup-pg-ora-demo-scripts-run-as-postgres.sh
-rwxrwxrwx. 1 vagrant vagrant 2100 Mar  8 22:58 /vagrant/developer-option-part1-postgres-user-keygen-run-as-vagrant.sh
-rw-r--r--. 1 vagrant vagrant 2966 Mar  9 12:24 /vagrant/provision.sh
```

interim solution to copy this local
```
-bash: /vagrant/update_alluser_passwords_from_changeme.sh: Permission denied
[pg12centos7:postgres:~] # cp /vagrant/update_alluser_passwords_from_changeme.* .
[pg12centos7:postgres:~] # ./update_alluser_passwords_from_changeme.sh ujMDgPM4qGmfRUe9Bm7Qv6x7wduaBp
ALTER ROLE
```

after running update password, switch the pg_hba.conf by running the following

```
cp /vagrant/pg_hba.conf /tmp/pg_hba.conf
su -c "cp -p /var/lib/pgsql/12/data/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf.`date '+%Y%m%d-%H%M'`.bak" -s /bin/sh postgres
su -c "cat /tmp/pg_hba.conf > /var/lib/pgsql/10/data/pg_hba.conf" -s /bin/sh postgres
systemctl stop postgresql-12.service
systemctl start postgresql-12.service
```

### Reviewing large tables


#### First (larger) database - pgbench scale factor 30

```
[pg12centos7:postgres:/pgmon] # psql -f /pgmon/top_20_relations.sql -d bench1
           relation           |    size
------------------------------+------------
 public.pgbench_accounts      | 384 MB
 public.pgbench_accounts_pkey | 64 MB
 pg_toast.pg_toast_2618       | 456 kB
 pg_toast.pg_toast_2619       | 24 kB
 public.pgbench_tellers_pkey  | 16 kB
 public.pgbench_tellers       | 16 kB
 pg_toast.pg_toast_2619_index | 16 kB
 pg_toast.pg_toast_2618_index | 16 kB
 public.pgbench_branches_pkey | 16 kB
 pg_toast.pg_toast_3394_index | 8192 bytes
 pg_toast.pg_toast_3456_index | 8192 bytes
 public.pgbench_branches      | 8192 bytes
 pg_toast.pg_toast_2612_index | 8192 bytes
 pg_toast.pg_toast_2606_index | 8192 bytes
 pg_toast.pg_toast_2604_index | 8192 bytes
 pg_toast.pg_toast_2328_index | 8192 bytes
 pg_toast.pg_toast_1417_index | 8192 bytes
 pg_toast.pg_toast_2609_index | 8192 bytes
 pg_toast.pg_toast_3466_index | 8192 bytes
 pg_toast.pg_toast_826_index  | 8192 bytes
(20 rows)
```

#### Second (small) database - pgbench scale factor 3

```
[pg12centos7:postgres:/pgmon] # psql -f /pgmon/top_20_relations.sql -d vagrant
           relation           |    size
------------------------------+------------
 public.pgbench_accounts      | 39 MB
 public.pgbench_accounts_pkey | 6600 kB
 public.pgbench_history       | 840 kB
 pg_toast.pg_toast_2618       | 456 kB
 public.pgbench_tellers       | 48 kB
 public.pgbench_branches      | 32 kB
 pg_toast.pg_toast_2619       | 24 kB
 pg_toast.pg_toast_2618_index | 16 kB
 public.pgbench_tellers_pkey  | 16 kB
 public.pgbench_branches_pkey | 16 kB
 pg_toast.pg_toast_2619_index | 16 kB
 pg_toast.pg_toast_3118_index | 8192 bytes
 pg_toast.pg_toast_3456_index | 8192 bytes
 pg_toast.pg_toast_2606_index | 8192 bytes
 pg_toast.pg_toast_3394_index | 8192 bytes
 pg_toast.pg_toast_2604_index | 8192 bytes
 pg_toast.pg_toast_2600_index | 8192 bytes
 pg_toast.pg_toast_2328_index | 8192 bytes
 pg_toast.pg_toast_2609_index | 8192 bytes
 pg_toast.pg_toast_3466_index | 8192 bytes
(20 rows)
```

#### shared_buffers 128M i.e. can cache the smaller DB but not the larger DB
```
[pg12centos7:postgres:/pgmon] # psql
psql (12.5)
Type "help" for help.

postgres=# show shared_buffers;
 shared_buffers
----------------
 128MB
(1 row)

postgres=#
```
