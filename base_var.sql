-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : Set up some variables
-- *                      the report home
-- *                      the author name...
-- * Usage              : be called by check.sql
-- ********************************************************************

SET termout off
set verify off

--define your variable

define Author='Peng Liu'
define report_dir='/home/oracle/DG_Health/report'
define standby_tns='minstd'
define passwd='oracle'


column today new_value today_file
select to_char(sysdate,'yyyymmdd') as today from dual;

column value new_value blocksize
select value as value from v$parameter where name ='db_block_size';

column date new_value time
select systimestamp as "date" from dual;

column db_name new_value dbname
select name as db_name from v$database;

column instname new_value inst_name
select instance_name as instname from v$instance;
