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


