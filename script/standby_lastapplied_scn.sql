-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the last applied scn of standby database
-- *                      on primary database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT DEST_ID, LOG_SEQUENCE, APPLIED_SCN
  FROM V$ARCHIVE_DEST
 WHERE TARGET = 'STANDBY';
