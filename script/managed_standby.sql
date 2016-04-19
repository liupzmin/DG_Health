-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the transfer and apply status
-- *                      on all role database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT PROCESS, STATUS, THREAD#, SEQUENCE#, BLOCK#, BLOCKS
  FROM V$MANAGED_STANDBY;
