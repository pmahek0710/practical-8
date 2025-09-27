SQL*Plus: Release 21.0.0.0.0 - Production on Wed Sep 10 14:32:26 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Tue Sep 09 2025 12:18:26 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table clientmaster ( srno int , name varchar (20));

Table created.

SQL> create table audit_t as select * from clientmaster;

Table created.

SQL> insert into clientmaster (srno , name ) values ( 101 ,'vedant') ;

1 row created.

SQL> insert into clientmaster (srno , name ) values ( 102 ,'ayush') ;

1 row created.

SQL> insert into clientmaster (srno , name ) values ( 102 ,'dhruv') ;

1 row created.

SQL> @ C:\Users\System05\Documents\sql\update.sql

Warning: Trigger created with compilation errors.

SQL> @ C:\Users\System05\Documents\sql\update.sql

Trigger created.

SQL> select * from clientmaster
  2  ;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush
       102 dhruv

SQL> update clientmaster set srno = 103 where name = 'dhruv';

1 row updated.

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush
       103 dhruv

SQL> select  * from audit_t
  2  ;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush
       102 dhruv
       102 dhruv
       102 dhruv

SQL> delete from clientmaster where srno = 103;

1 row deleted.

SQL> select  * from audit_t
  2  ;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush
       102 dhruv
       102 dhruv
       102 dhruv
       103 dhruv

6 rows selected.

SQL> commit
  2  ;

Commit complete.

SQL> @ C:\Users\System05\Documents\sql\insert.sql;

Trigger created.

SQL> create table insertbackup as select * from clientmaster;

Table created.

SQL> @ C:\Users\System05\Documents\sql\insert.sql;

Trigger created.

SQL> select * from insertbackup
  2  ;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush

SQL> delete from clientmaster where srno = 102;

1 row deleted.

SQL> delete from clientmaster where srno = 101;

1 row deleted.

SQL> select * from insertbackup
  2  ;

no rows selected


SQL> insert into clientmaster (srno , name ) values ( 101 ,'apeksha') ;

1 row created.

SQL> select * from insertbackup
  2  ;

      SRNO NAME
---------- --------------------
       101 apeksha

SQL> select * from audit_t;

      SRNO NAME
---------- --------------------
       101 vedant
       102 ayush
       102 dhruv
       102 dhruv
       102 dhruv
       103 dhruv
       102 ayush
       101 vedant

8 rows selected.

SQL>
SQL> delete from audit_t where srno = 101;
delete from audit_t where srno = 101
            *
ERROR at line 1:
ORA-21000: error number argument to raise_application_error of -200000 is out
of range
ORA-06512: at "SYSTEM.AUDIT_INSERT", line 3
ORA-04088: error during execution of trigger 'SYSTEM.AUDIT_INSERT'


SQL> insert into audit_t (srno, name) values (104, 'xyz');
insert into audit_t (srno, name) values (104, 'xyz')
            *
ERROR at line 1:
ORA-21000: error number argument to raise_application_error of -200000 is out
of range
ORA-06512: at "SYSTEM.AUDIT_INSERT", line 3
ORA-04088: error during execution of trigger 'SYSTEM.AUDIT_INSERT'
