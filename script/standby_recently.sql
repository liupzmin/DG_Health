-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the recently recieved archive logs
-- *                      on standby database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************

select *
  from (SELECT THREAD#,
               DEST_ID,
               SEQUENCE#,
               FIRST_CHANGE#,
               NEXT_CHANGE#,
               APPLIED,
               STATUS
          FROM V$ARCHIVED_LOG
         order by SEQUENCE# desc)
 where rownum < 10;
