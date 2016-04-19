-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the FSFO status
-- *                      on primary database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT FS_FAILOVER_STATUS           "FSFO STATUS",
       FS_FAILOVER_CURRENT_TARGET   TARGET,
       FS_FAILOVER_THRESHOLD        THRESHOLD,
       FS_FAILOVER_OBSERVER_PRESENT "OBSERVER PRESENT",
       FS_FAILOVER_OBSERVER_HOST    "OBSERVER HOST"
  FROM V$DATABASE;
