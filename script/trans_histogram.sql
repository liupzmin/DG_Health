-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the transfer histogram
-- *                      on primary database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT *
  FROM V$REDO_DEST_RESP_HISTOGRAM
 WHERE DEST_ID = 2
   AND FREQUENCY > 1;
