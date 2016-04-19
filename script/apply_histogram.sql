-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the apply histogram
-- *                      on standby database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT *
  FROM V$STANDBY_EVENT_HISTOGRAM
 WHERE NAME = 'apply lag'
   AND COUNT > 0;
