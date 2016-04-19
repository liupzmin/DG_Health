-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the lag of transfer and apply
-- *                      on standby database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************

SELECT name, value, datum_time, time_computed FROM V$DATAGUARD_STATS;
