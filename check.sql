-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_var.sql
-- * Author             : Peng Liu
-- * Original           : 20160419
-- * Last Update        : 20160419
-- * Description        : generate the html report
-- *                      
-- *                      
-- * Usage              : @check.sql
-- ********************************************************************

REM define the base path and the file path
@@base_var.sql
REM startup html
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF -
HEAD "<TITLE>DG Health Report for DB:&dbname,Inst:&inst_name</TITLE>  -
<STYLE type='text/css'>  -
body {font:bold 10pt Arial,Helvetica,Geneva,sans-serif;color:black; background:White;}  -
table	{border_collapse: collapse; width:800;}  -
th {font:bold 8pt Arial,Helvetica,Geneva,sans-serif; color:White; background:#0066CC;padding-left:4px; padding-right:4px;padding-bottom:2px}  -
td {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:#FFFFCC; vertical-align:top;}  -
tr:nth-child(even) td  {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:#FFFFCC; vertical-align:top;} -
tr:nth-child(odd) td {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:White;vertical-align:top;} -
a:-webkit-any-link {color: -webkit-link;text-decoration: underline;cursor: auto;}-
a.awr {font: bold 8pt Arial,Helvetica,sans-serif;color: #663300;vertical-align: top;margin-top: 0pt;margin-bottom: 0pt;}-
li {display: list-item;text-align: -webkit-match-parent;} -
li.awr {font: 8pt Arial,Helvetica,Geneva,sans-serif;color: black;background: White;} -
H1 {font: bold 18pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;margin-top: 5pt;margin-bottom: 5pt;} -
H3 {font: bold 16pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;margin-top: 5pt;margin-bottom: 5pt;} -
H1.title {font: bold 20pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;border-bottom: 1px solid #cccc99;margin-top: 0pt;margin-bottom: 0pt;padding: 0px 0px 0px 0px;}-
table.awrred td:last-child{text-align:right;} -
table.awrredf td:nth-child(12){text-align:right;} -
table.awrredmax td:nth-child(4){text-align:right;} -
div.header{display: block;-
border-bottom: 1px solid #3D6679;margin-bottom: 20px;}-
div.eventbegin{background-color:#0066CC;color: white;}-	
table.awrdbcpu td:last-child{text-align:right;} -  
p.pt {font: bold 11pt Arial,Helvetica,sans-serif;color:#684A2D;vertical-align: top;margin-top: 8pt;margin-bottom: 5pt;}- 
</STYLE>" -
BODY  "border='0'   summary='Script output'" -
TABLE "class='awr'"
SET ECHO OFF
--SET FEEDBACK OFF
SET PAGESIZE 1400
SET termout off
set verify off
spool &report_dir/DG_Report_&dbname\_&today_file..html
PRO <div class='header'><H4>Author : &Author</h4> <h4>Date : &time</h4></div>

@@script/tag/H1_title "Active DataGuard Monitor"

@@script/tag/P "DG basic status: Primary"

@@script/dg_status.sql

@@script/tag/P "DG basic status: Standby"

conn sys/&passwd@&standby_tns as sysdba

@@script/dg_status.sql

conn / as sysdba

@@script/tag/P "FSFO status"

@@script/fsfo.sql

@@script/tag/P "redo log apply and transfer status:P"

@@script/managed_standby.sql

conn sys/&passwd@&standby_tns as sysdba

@@script/tag/P "redo log apply and transfer status:S"

@@script/managed_standby.sql

conn / as sysdba

@@script/tag/P "max archived log"

@@script/max_archived.sql

conn sys/&passwd@&standby_tns as sysdba

@@script/tag/P "the last 10 logs of standby received"

@@script/standby_recently.sql

conn / as sysdba

@@script/tag/P "Archive destination status"

@@script/archive_dest_status.sql

conn sys/&passwd@&standby_tns as sysdba

@@script/tag/P "Log transmission interval"

@@script/archive_gap.sql

conn / as sysdba

@@script/tag/P "Primary message of today"

@@script/message.sql

conn sys/&passwd@&standby_tns as sysdba

@@script/tag/P "Standby message of today"

@@script/message.sql

conn / as sysdba

@@script/tag/P "the last SCN of standby applied"

@@script/standby_lastapplied_scn.sql

conn sys/&passwd@&standby_tns as sysdba

@@script/tag/P "DG transfer and apply lag"

@@script/transfer_apply_lag.sql

@@script/tag/P "standby apply lag histogram"

@@script/apply_histogram.sql

conn / as sysdba

@@script/tag/P "primary transfer lag histogram"

@@script/trans_histogram.sql

@@script/tag/P "End of Report"
SET ECHO ON
SET FEEDBACK ON
spool off
exit
