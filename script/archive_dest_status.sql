-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the archive dest status
-- *                      on primary database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************

SELECT DESTINATION, STATUS, ARCHIVED_THREAD#, ARCHIVED_SEQ#
  FROM V$ARCHIVE_DEST_STATUS
 WHERE STATUS <> 'DEFERRED'
   AND STATUS <> 'INACTIVE';
