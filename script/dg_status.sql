-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : query the DG status
-- *                      on all role database
-- *                      
-- * Usage              : be called by check.sql
-- ********************************************************************
SELECT OPEN_MODE,
       PROTECTION_MODE,
       PROTECTION_LEVEL,
       DATABASE_ROLE ROLE,
       SWITCHOVER_STATUS
  FROM V$DATABASE;
