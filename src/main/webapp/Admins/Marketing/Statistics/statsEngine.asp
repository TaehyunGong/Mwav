<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- shopConfig Start -->
	<!--#include File = "../../Config/Config.asp" -->
<!-- shopConfig End -->

<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- Function Start -->
<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
<!--#include File="../../Include_asp/Functions.asp"-->
<!-- Function End -->

<!-- stats_function -Start -->
<!--#include File="statsFunction.asp"-->
<!-- stats_function -End -->

<%
	Response.Buffer=True

	'������ ���� ĳ�̹���
	'������ �����ϴ� ���Ͻ÷� ���� �������� ���� ĳ������ ���ϰ� ��.
	Response.Expires = -1
	Response.Expiresabsolute = Now()
	Response.CacheControl = "private"
	Response.AddHeader "pragma", "no-cache"
	Response.AddHeader "cache-control", "private"
	Server.ScriptTimeout = 1000000000

'On Error Resume Next


'������Ʈ ���ӽ� ���� ���� ���
HTTP_REFERER = Request.ServerVariables("HTTP_REFERER")
'HTTPS = Request.ServerVariables("HTTPS")
'LOCAL_ADDR = Request.ServerVariables("LOCAL_ADDR")
PATH_INFO = Request.ServerVariables("PATH_INFO")
REMOTE_ADDR = Request.ServerVariables("REMOTE_ADDR")
REMOTE_HOST = Request.ServerVariables("REMOTE_HOST")
SERVER_NAME = Request.ServerVariables("SERVER_NAME")
SERVER_PORT = Request.ServerVariables("SERVER_PORT")
URL = Request.ServerVariables("URL")
HTTP_HOST = Request.ServerVariables("HTTP_HOST")
HTTP_USER_AGENT = Request.ServerVariables("HTTP_USER_AGENT")
'HTTP_COOKIE = Request.ServerVariables("HTTP_COOKIE")
'Session.SessionID

HTTP_REFERER=replace(HTTP_REFERER,"http://","")
HTTP_REFERER=replace(HTTP_REFERER,"www.","")


''''''''''''''''''''
'Get������ ���� ����'
''''''''''''''''''''

pcw = Trim(Request("pcw"))	'	?pcw=���̵�;200;10002

    'pageName�� ���Ѵ�.
    'session("PageTitleName") = "����������"

CameToThePage = session("PageTitleName")            '�� ���������� �Ѱ� ��� �� ��
session("PageTitleName") = ""                       '�ٽ� �ʱ�ȭ



''''''''''''''''''''''' ���� �������� ����  '''''''''''''''
if pcw <> "" then
	PCWvalue = GetPCWvalue(pcw)
	PmoterID = PCWvalue(0)
	stat_Pname = PCWvalue(1)
	CameFromPage = PCWvalue(2)
	WhatsAbout = PCWvalue(3)

	Session("Pname") = stat_Pname
else
	PmoterID = "SiteURL"
	stat_Pname = Application("shopName")
	CameFromPage = "������������"
	WhatsAbout = "������������"
end if
''''''''''''''''''''''' ���� �������� ����  '''''''''''''''



'''''''''''''''''''''
'  ����׽�Ʈ        '
'''''''''''''''''''''
'Response.write(HTTP_REFERER & "<br>")
'Response.write(PATH_INFO & "<br>")
'Response.write(REMOTE_ADDR & "<br>")
'Response.write(REMOTE_HOST & "<br>")
'Response.write(SERVER_NAME & "<br>")
'Response.write(SERVER_PORT & "<br>")
'Response.write(HTTP_HOST & "<br>")
'Response.write(HTTP_USER_AGENT & "<br>")
'Response.write(HTTP_COOKIE & "<br>")
'Response.write(Session.SessionID & "<br>")
'Response.write(PmoterID & "<br>")
'Response.write(stat_Pname & "<br>")
'Response.write(CameFromPage & "<br>")
'Response.write(WhatsAbout & "<br>")
'Response.write(pcw & "<br>")
'Response.write("�ѽð� ���� �ð� : " & DateAdd("h", 1, now) & "<br>")



%>

<!-- a href="http://192.168.1.100?p=rocktry&c=100&w=10000"> ������ �̵� </a -->
<script language="JavaScript" type="text/JavaScript">
<!--
    document.title += " - [<%= CameToThePage %>]";
     cpu = navigator.cpuClass;
    if( window.screen ){
        scr = window.screen.width+'*'+window.screen.height;
    }
-->
</script>

<%

if session("stat_Key") = "" and Request.Cookies("stat_Key") = "" then        'ó������ ����Ʈ�� �����Ѱ�.
    'ī���� �ۼ� - �ִ� stat_Key ���� ���� �´�.
	stat_Key = NextNumber("vStatistics", "stat_Key", "", 0)

    'stat_Key�� PK�� vStatistics�� ù ����Ÿ�� ����Ѵ�.
    SQL = "INSERT INTO vStatistics(stat_Key,stat_sNAME,stat_hHOST,stat_sPORT,stat_pINFO,stat_ADDR,stat_HOST,stat_uAGENT,stat_hREFERER,stat_PmoterID,stat_Pname,stat_CameFromPage,stat_CameToThePage,stat_WhatsAbout,stat_SessionID,stat_date) VALUES"
    SQL = SQL & "(" & stat_Key
    SQL = SQL & ",'" & SERVER_NAME & "'"
    SQL = SQL & ",'" & HTTP_HOST & "'"
    SQL = SQL & ",'" & SERVER_PORT & "'"
    SQL = SQL & ",'" & PATH_INFO & "'"
    SQL = SQL & ",'" & REMOTE_ADDR & "'"
    SQL = SQL & ",'" & REMOTE_HOST & "'"
    SQL = SQL & ",'" & HTTP_USER_AGENT & "'"
    SQL = SQL & ",'" & HTTP_REFERER & "'"
    SQL = SQL & ",'" & PmoterID & "'"
    SQL = SQL & ",'" & stat_Pname & "'"
    SQL = SQL & ",'" & CameFromPage & "'"
    SQL = SQL & ",'" & CameToThePage & "'"
    SQL = SQL & ",'" & WhatsAbout & "'"
    SQL = SQL & ",'" & Session.SessionID & "'"
    SQL = SQL &",getdate())"
    dbConn.Execute SQL

    session("stat_Key") = stat_Key
    Response.Cookies("stat_Key") = stat_Key
    Response.Cookies("stat_Key").Expires  = DateAdd("h", 1, now)        '1�ð��� ��Ű����

else

    '�̹� �����̳� ��Ű���� ������ stat_Key�� ����
    if session("stat_Key") <> "" then
        stat_Key = session("stat_Key")
    elseif Request.Cookies("stat_Key") <> "" then
        stat_Key = Request.Cookies("stat_Key")
    else
        Response.write("stat_Key�� �����Դϴ�")
        Response.end
    end if

end if

if Request.Cookies("DetailLog") = "Yes" then        '���ηαױ��
    '������ �ٷ� ����� log_hREFERER ���� �����´�.
    SQL = "SELECT TOP 1 log_pINFO FROM vStat_Log "
    SQL = SQL & " ORDER BY log_date DESC "
    Set rsLog = Server.CreateObject("ADODB.Recordset")
    rsLog.Open SQL,db,1
    if not rsLog.EOF or not rsLog.BOF then
        log_pINFO = Trim(rsLog("log_pINFO"))      '�ٷ� ������
    end if
    rsLog.Close
    Set rsLog = Nothing
    '�� �α׿� �ٷ� ���� log_hREFERER ���Ͽ� �ٸ��� �α׸� �ۼ��Ѵ�.
    if PATH_INFO <> log_pINFO then
        'log_Key��  PK�� vStatistics�� ù ����Ÿ�� ����Ѵ�.
        SQL = "INSERT INTO vStat_Log(log_Key,log_date,log_CameToThePage,log_SessionID,log_hREFERER,log_pINFO) VALUES"
        SQL = SQL & "(" & stat_Key
        SQL = SQL & ",getdate()"
        SQL = SQL & ",'" & CameToThePage & "'"
        SQL = SQL & ",'" & Session.SessionID & "'"
        SQL = SQL & ",'" & HTTP_REFERER & "'"
        SQL = SQL & ",'" & PATH_INFO & "')"
        db.Execute(SQL)
    end if
end if	'if Request.Cookies("DetailLog") = "Yes" then        '���ηαױ��


    'ȸ�����̵� �α��� �Ǿ����� Ȯ���ؼ� ��迡 ������Ʈ�Ѵ�.
    if session("MbrID") <> "" then
        SQL = "Update vStatistics set stat_MbrID = '" & session("MbrID") & "'"
        SQL = SQL & " where stat_Key = " & stat_Key
        SQL = SQL & " and stat_MbrID is Null"
        dbConn.Execute SQL
    end if


    '�������̸��� ��������� ������ ����Ÿ�� ������Ʈ�Ѵ�.(Ʈ������ ������ ���Ѵ�.)
    'Call UpdatePageName(PATH_INFO,CameToThePage)

%>


<!-- PowerCGI ī���� �����׽�Ʈ -->
<!-- A HREF="/admin/Statistics/statics.php?db=rocktry"><IMG SRC="http://counter.powercgi.net/Counter.php?db=rocktry" width="1" height="1" BORDER=0></A -->
<!-- PowerCGI ī���� �� -->


<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		'Response.Write "<P><B>������Ʈ�� ���������� �̷�������ϴ�</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
		Response.Write "<P><B>������Ʈ�� ����� �̷������ �ʾҽ��ϴ�</B>."
    End Sub
%>