<%
	
	Response.Buffer = false


	

	'DB������� ����
	bln_DbOk = True
	
	'������ �޾ƿ´�.
	title = Trim(Request.Form("title"))'����Ʈ����
	table_name = Trim(Request.Form("table_name"))'����Ʈ�̸�(���̺�տ��ٴ´�.)
	db_server  = Trim(Request.Form("db_server"))'DB���� 
	db_name = Trim(Request.Form("db_name"))'�ش�DB����
	db_user = Trim(Request.Form("db_user"))'�α��ΰ���
	db_pass = Trim(Request.Form("db_pass"))'�α��� ��й�ȣ
	
	
	On Error Resume Next
	
	Set db = Server.CreateObject("ADODB.Connection")

	'str_con = "Persist Security Info=False;User ID="&db_user&";"
	'str_con = str_con &"password="&db_pass&";"
	'str_con = str_con &"Data Source="&db_server
	'db.provider = "SQLOLEDB.1" 'SQL������ ���ٸ� ���� �̷��� ����.
    'db.Open  str_con
    str="uid="& db_user &";pwd="& db_pass &";driver={SQL Server};server="& db_server &";database="& db_name
    'Response.Write str

      
     db.Open str
  
	'db.defaultDatabase = db_name
	 
	If Err.Number <> 0 Then 
    'Response.Write "�����߻�1"
				bln_DbOk = False	
	Else
	
				'Response.Write "�����߻�2"
	
				bln_DbOk = True	
	
				
				'���̺��̸��� ¢�´�.
				static_table = table_name&"_static"
				
				
				'#### ���м��� �ʿ��� DBinclude ȭ�� ����(inc_static.asp)
				
				'static�̶������� �������н��� ��ȯ��Ŵ
				str_path = Server.mappath(".")
				'Response.Write str_path
				'���������� �����屸���� ����ִ� �ҽ��ؽ�Ʈ ��θ� ����
				str_source = str_path&"\count_setup\static.txt"
				
				dim fs 
				
				Set fs = Server.CreateObject("Scripting.FileSystemObject")
				'������ ������ �о ������ ����
				Set objfile = fs.GetFile(str_source)
				Set text_stream  = objfile.OpenAstextStream
			 
				'�ҽ��ؽ�Ʈ�� �о�´�.
				str_inc = text_stream.readAll()
				
				'����ڰ� �Է��� �������� ��ü��Ų��.
				str_inc  = replace(str_inc,"<title>",title)
				str_inc  = replace(str_inc,"<hit_table>",hit_table)
				str_inc  = replace(str_inc,"<static_table>",static_table)
				str_inc  = replace(str_inc,"<db_server>",db_server)
				str_inc  = replace(str_inc,"<db_name>",db_name)
				str_inc  = replace(str_inc,"<db_user>",db_user)
				str_inc  = replace(str_inc,"<db_pass>",db_pass)
				
				
				Set  text_stream = nothing
				Set objfile = nothing
			   
				'������ȭ�ϻ����� ���� ��μ���
				str_target = str_path&"\static\inc_static.asp"
				Set f1 = fs.CreateTextFile(str_target,1,0)
				
				'��ȯ�� �ؽ�Ʈ�� ����
				f1.write(str_inc) 
				
				if fs.FileExists(str_target) then
				Response.Write "str_target"&str_target
                Response.write "inc_static.asp�� ����� ����"
				end if
				
				Set f1 = nothing

				
				'####  SQL��ũ��Ʈ ȭ�� ó��
				'���̺���� SQL��ũ��Ʈ ȭ�ϰ�� 
				path_sql = str_path&"\count_setup\count.sql"
				
				
				Set f1 = fs.OpenTextFile(path_sql)
				
				'SQL��ũ��Ʈ�� ����ڰ� �Է��� ���̺� ������ ��ü
				SQL = f1.ReadAll()
				SQL = replace(SQL,"static_table",static_table)
				
				set f1 = nothing

			   '���̺� ����
			   '#### ���ᰴü�� �̿��� ��������(���������� ���� ���ڵ�°�ü�� ������ ����)
				dbConn.Execute SQL ,,AdCmdText + adExecuteNoRecords
	            
				'#### global.asaȭ�Ͽ� �� ������ ����� ��
				
				global_path = str_path&"\count_setup\global.txt"

				Set objfile = fs.GetFile(global_path)
				Set text_stream  = objfile.OpenAstextStream
				
				str_global = text_stream.ReadAll() 

				str_global = replace(str_global,"<hit_table>",hit_table)
				str_global = replace(str_global,"<static_table>",static_table)
				str_global = replace(str_global,"<db_server>",db_server)
				str_global = replace(str_global,"<db_name>",db_name)
				str_global = replace(str_global,"<db_user>",db_user)
				str_global = replace(str_global,"<db_pass>",db_pass)
				'str_global = replace(str_global,chr(13),"<br>")
				'str_global = replace(str_global,chr(10),"&nbsp;")
				
				Set  text_stream = nothing
				Set objfile = nothing

				global_path = str_path&"\global.asa"
				Set f1 = fs.CreateTextFile(global_path,1)
				'��ȯ�� �ؽ�Ʈ�� ����
				f1.write(str_global) 

				Set f1 = nothing
	  End If

%>


<html>
<head>
<title>:::::������� �ϼ� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.height {  font-family: "����"; font-size: 9pt; color: #5e5e5e; text-decoration: none; line-height: 18px}
.lesson {  font-family: "����"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
.column {  font-family: "����"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
.board {  font-family: "����"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
a.column:hover {  font-family: "����"; font-size: 9pt; color: #2D756D; text-decoration: none}
a.lesson:hover {  font-family: "����"; font-size: 9pt; color: #609F5C; text-decoration: none}
a.board:hover {  font-family: "����"; font-size: 9pt; color: #2D4875; text-decoration: none}
.border_daily {  border: 1px solid; background-color: #E7DBBD; font-family: "����ü"; font-size: 12px; color: #333333; text-decoration: none; text-align: center; border-color: #999999 #9C9A9C #9C9A9C}
.text07 {  font-family: "����ü"; font-size: 9pt; color: #CC3300; text-decoration: none}
a.text07:hover {  font-family: "����ü"; font-size: 9pt; color: #FF6600; text-decoration: none}
td { font-family: "����"; font-size: 9pt; color: ##414141; text-decoration: none} 
.left { font-family: "����"; font-size: 9pt; color: #FFFFFF; text-decoration: none} 
a.left:hover { font-family: "����"; font-size: 9pt; color: #6699FF; text-decoration: 
none} a.left:active { font-family: "����"; font-size: 9pt; color: #000000; text-decoration: 
none} .top { font-family: "����"; font-size: 9pt; color: #FFFFFF; text-decoration: 
none} a.top:hover { font-family: "����"; font-size: 9pt; color: #FFFFFF; text-decoration: 
none} .border { border: 1px #E7DBBD solid; font-size: 9pt; color: #CC0000; text-decoration: 
none; font-family: "����"; background-color: #FFFFFF} .link { font-family: "����"; 
font-size: 9pt; color: #000000; text-decoration: none} a.link:hover { font-family: 
"����"; font-size: 9pt; color: #006633; text-decoration: none} 
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<%
If Err.Number =0 Then '����Ÿ ���̽� ���� ������� 
					' �����޽����� ����Ѵ�.
'Response.Write err.number 
'Response.Write db.Errors.Count
%>

<table width="666" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D" align="center">
  <tr bgcolor="#E0DABA"> 
    <td  align="center" height="25"><b><font color="#990000">DB���� ����</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="149"><font color="#CC3300">�˼��մϴ�.<br>
      �ش� DB������ �����Ҽ� �����ϴ�.<br>
      ������ �Ʒ� ������ ���� �Ͻʽÿ�.</font> <br>
      <br>
      <font color="#CC3300"><br>
      <b><font color="#333333">&nbsp;����(</font></b><font color="#CE0000">Table�̸�</font><font color="#333333"></font><b><font color="#333333">)</font></b><font color="#333333"> 
      : <%=table_name%><br>
      </font><b><font color="#333333">&nbsp;DB�����̸�(</font></b><font color="#333333"><font color="#CE0000">��ǻ�;��̵� 
      �������ּ�</font></font><b><font color="#333333">)</font></b><font color="#333333"> 
      : </font><font color="#333333"><%=db_server%></font><br>
      <b><font color="#333333">DB�̸�(</font></b><font color="#333333"><font color="#CE0000">�ش� 
      DB</font></font><b><font color="#333333">) </font></b><font color="#333333"> 
      : </font><font color="#333333"><%=db_name%></font><br>
      <b><font color="#333333">&nbsp;DB�α�������(</font></b><font color="#CE0000">�ش� 
      DB��������</font><b><font color="#333333">)</font></b><font color="#CC3300"><font color="#333333"> 
      : </font></font><font color="#CC3300"><font color="#333333"><%=db_user%></font></font><font color="#333333"><br>
      <b><font color="#333333">&nbsp;DB�α��κ�й�ȣ(</font></b><font color="#CE0000">�ش����� 
      password</font><font color="#CC3300"><b><font color="#333333">)</font></b></font></font></font><font color="#CC3300"><font color="#333333"> 
      : </font></font><font color="#CC3300"><font color="#333333"><%=db_pass%></font></font><br>
      <br>
      �����߻��Ǽ� : <b><%=db.Errors.Count%></b> ȸ<br>
        <br>
      
	  <table width="433" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D">
  <%
  		For i = 0 to db.Errors.Count +1
  
				Set objError = db.Errors.item(i)


  %>
        <tr>
          <td bgcolor="#FFFFFF">���γ��� <br>
            ������ȣ : <%=objError.number%><br>
            ������ó : <%=objError.Source%><br>
            OLE ���� ��ȣ : <%=objError.NativeError%><br>
            ���� �޽��� : <%=objError.description%>
          </td>
        </tr>
   <%
			Next   
   %>
      </table>

	  <br>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td align="center"><a href="setup.htm" class="link">�е��ư���</a></td>
  </tr>
</table>
<%
	Else
%>

<br>
<br>
  <div align="center">
    
  <table width="666" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D" align="center">
    <tr bgcolor="#E0DABA"> 
      <td  align="center" height="25"><b><font color="#990000">���� �Ϸ� </font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25"><font color="#CC3300"></font>&nbsp; 
        <p><font color="#CC3300"><br>
          ��� �۾��� �Ϸ� �Ǿ����ϴ�.<br>
          <br>
          <b>global.asa</b> ȭ���� �����Ǿ����ϴ�.<br>
          <b>global.asa</b> �ش������� ����Ʈ ��Ʈ�� �̵���Ű�ʽÿ�.<b><br>
          <br>
          static</b>������ �̵��Ͻð� ������ ���丮�� �̵���Ű�ø� �˴ϴ�.<br>
          ��ũ�� <b>static</b>������ <b>static.asp</b> �����Դϴ�.<br>
          <br>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td align="center">&nbsp; </td>
    </tr>
  </table>
    <br>
  </div>
</body>
</html>
<%

 End If
%>