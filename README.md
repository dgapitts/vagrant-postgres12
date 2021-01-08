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
### systemctl commands for 

These can be run as the standard vagrant user
```
[pg12centos7:vagrant:~] # alias pgstatus='echo "sudo systemctl status postgresql-12.service"'
[pg12centos7:vagrant:~] # alias pgstatus='echo "sudo systemctl start postgresql-12.service";sudo systemctl start postgresql-12.service'
[pg12centos7:vagrant:~] # alias pgstop='echo "sudo systemctl stop postgresql-12.service";sudo systemctl stop postgresql-12.service'
```

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


