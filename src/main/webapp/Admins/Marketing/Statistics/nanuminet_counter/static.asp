<!--#include file="inc_static.asp" -->
<%
   
   '�⵵�� ���� �����´�.
   s_year = Trim(request.QueryString("s_year"))
   s_month = Trim(request.QueryString("s_month"))
   
   '���ٸ� ���� �⵵ �� ���� ����
   If s_year = "" Then s_year = year(now)
   If s_month = "" Then  s_month  = month(now)
   
   dim rs  

   Set rs = server.CreateObject("ADODB.Recordset")

   '���ü��� �����´�.
   SQL = "SELECT sum(s_count) FROM "&static_table 

   rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
   
  
   
      totalHit = rs(0) 
      totalHit = Formatcurrency(totalHit)
	  totalHit = mid(totalHit,2)


   rs.close

   '����������̺���  ���� ���� �� ���Ӽ��� �����´�.
   '

   SQL = "SELECT sum(s_count) FROM "&static_table&" WHERE s_year="&s_year&" AND s_month="&s_month

   rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
   
   if isnull(rs(0)) Then 

   Else 
   
      monthtotal = clng(rs(0)) 
      monthtotal = Formatcurrency(monthtotal)
	  monthtotal = mid(monthtotal,2)
   end If

   rs.close

  


%>


<html>
<head>
<title>���ü����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<Script language="javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<link rel="stylesheet" href="css.css" type="text/css">
</head>

<body bgcolor="#FFFFFF" text="#000000" >

<table width="765" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><img src="air_text02.gif" width="20" height="20" align="absmiddle"> <font face="����ü"><b><font face="����ü"><b><%=title%></b></font><b> 
      �м� Page</b></b></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td> 
      <form name="sendform" method="get" action="static.asp">
        <table width="396" border="0" cellspacing="0" cellpadding="2">
          <tr > 
            <td height="26"> 
              <select name="s_year">
                <%
	
		For i = 2001 To  year(now)
		
			response.write "<option value="&i
			if i = cLng(s_year) Then 
    			response.write " Selected>"
    		Else 
				response.write " >"
			end If 
				response.write i & "</option>"&chr(13)	
		Next 


%>
              </select>
              �� 
              <select name="s_month" onChange="sendform.submit()">
                <%
	
		For i = 1 To 12
		
			response.write "<option value="&i

			if i = cLng(s_month) Then 

				response.write " Selected>"

			Else 

				response.write " >"

			end If 

				response.write i & "</option>"&chr(13)	

		

		Next 


			


%>
              </select>
              �� <font color="#333366">�п��Ͻô� �⵵ �� ���� �����Ͻʽÿ�.</font><font color="#666699">&nbsp;</font><font color="#C5CEDE">&nbsp;</font></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
  <tr> 
    <td height="2">&nbsp;</td>
  </tr>
  <tr> 
    <td><font color="#7787AB">��</font> <b>���� ��Ȳ</b></td>
  </tr>
  <tr> 
    <td height="69"> 
      <table width="244" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5CEDE">
        <tr bgcolor="#FFFFFF"> 
          <td width="103" bgcolor="#EDF0F5">���� �湮�� ��</td>
          <td width="122" bgcolor="#FFFFFF"><b><%=application.contents("current_user")%></b> 
            ��</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="103" bgcolor="#EDF0F5">�� ���� ��Ȳ</td>
          <td width="122"><b><%=totalHit%></b> ȸ</td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="103" bgcolor="#EDF0F5"><b><font color="#333333"><%=s_month%></font></b>�� 
            �� ���� ��Ȳ</td>
          <td width="122"><b><%=monthtotal%></b> ȸ </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><font color="#7787AB">��</font> <b><%=s_year%>�� <%=s_month%>�� ����������Ȳ</b></td>
  </tr>
  <tr> 
    <td> 
      <%
	'�Ϻ� ������Ȳ�� �����´�.
	'���ں� �ð� ������ ���´�.
	'�ְ� ���ü� ���ڵ带 �����´�.
    
	SQL = " SELECT top 1 s_year,s_month ,s_day ,sum(s_count) as maxcount "
	SQL = SQL &" FROM "&static_table 
	SQL = SQL &" GROUP BY s_day,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month 
	SQL = SQL &" ORDER BY sum(s_count) desc "
	
	rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
	
	IF rs.Eof OR rs.Bof Then
			
	Else
		Max_day = rs("s_day")
		Max_dayCount = rs("maxcount")
	End IF
	rs.close
	
	'�Ϻ� ������Ȳ�� �����´�.
	'���ں� �ð� ������ ���´�.
	SQL = "SELECT sum(s_count) as daycount,s_year,s_month,s_day FROM "&static_table 
	SQL = SQL & " GROUP BY s_day,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month 
    SQL = SQL & " ORDER BY s_year,s_month,s_day"
      
    rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText




%>
      <!--����������Ȳ ���̺�-->
      <table width="763" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5CEDE">
        <%
 		If rs.Eof OR rs.Bof Then
 %>
        <tr bgcolor="#FFFFFF" align="center"> 
          <td colspan="2">���� ���������� �������� �ʽ��ϴ�.</td>
        </tr>
        <%

    Else

	  Do Until rs.eof 

          '��¥
		  s_day = rs("s_day")
		  '�ش糯¥�� �ð��� ���ü� �հ�
		  daycount = rs("daycount")
		  
		 '������ ������ ������ �ʺ� �����մϴ�.
		'�ʺ�� ������ ī��Ʈ/�ְ�ī��Ʈ �� 3 pixel�� ���ؼ� �����Ͽ����ϴ�.
		'�� �ʺ�� �������� ������ �����ص� ���� ���Դϴ�.
		width_len = ((daycount/Max_dayCount)*100) *3
		'����, �� ���� wid�� 1���� ���� ����� �ּҰ����� 1�� �����մϴ�.
		if width_len < 1 then
			width_len = 1
		End if   
		
		  width_len = (cLng(daycount)/12) + 10

          if width_len > 600 then 

		     width_len = 600

          End if
          
          labeldate = s_year&"-"&s_month&"-"&rs("s_day")
		  labeldate = formatdatetime(labeldate,1)

%>
        <tr bgcolor="#FFFFFF"> 
          <td width="144" bgcolor="#EDF0F5"><a href="javascript:MM_openBrWindow('daystatic.asp?s_year=<%=s_year%>&s_month=<%=s_month%>&s_day=<%=s_day%>','','width=383,height=535');"><font color="#333333"><%=labeldate%></font></a></td>
          <td width="600"> 
            <%If cLng(Max_day) =  cLng(s_day) Then %>
            <img src="max_bar.gif" width="<%=width_len%>" height="9"><font color="#CC0000"><b><%=daycount%></b></font> 
            <%Else%>
            <img src="bar.gif" width="<%=width_len%>" height="9"><%=daycount%> 
            <%End If%>
            <% if (cLng(s_day) = day(now) ) AND  (cLng(s_year) = year(now)) AND (cLng(s_month) = month(now) ) Then%>
            <b><font color="#CC0000">now !!</font></b> 
            <% End If%>
          </td>
        </tr>
        <%
	      rs.movenext
		  
     Loop

    End If

    rs.close

   
%>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><font color="#7787AB">��</font> <b><%=s_year%>�� <%=s_month%>�� �ð��뺰������Ȳ 
      �ð���</b><b></b><font color="#FFFFFF"><b>��������Ȳ</b></font></td>
  </tr>
  <tr> 
    <td> 
      <%
   '�ð��� ������Ȳ �հ�
	'�ְ� ���ü� ���ڵ带 �����´�.
    
	SQL = "SELECT Top 1 sum(s_count) as maxcount,s_year,s_month,s_time "
	SQL = SQL &" FROM "&static_table 
	SQL = SQL & " GROUP BY s_time,s_year,s_month "
	SQL = SQL &" HAVING s_year="&s_year&" AND s_month="&s_month 
	SQL = SQL &" ORDER BY sum(s_count) DESC "
	
	rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
	
	IF rs.Eof or rs.Bof Then
	
	Else 
	
		
		Max_time = rs("s_time")
		Max_timeCount = rs("maxcount")
	
	End if
	rs.close
	
	'�ð��� ������Ȳ �հ�
	
	SQL = "SELECT sum(s_count) as hourcount,s_year,s_month,s_time FROM "&static_table 
	SQL = SQL & " GROUP BY s_time,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month 
	SQL = SQL & " ORDER BY s_time "

      
   rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText




%>
      <table width="681" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5CEDE">
        <%
 
 		If rs.Eof Or rs.Bof Then
 %>
        <tr bgcolor="#FFFFFF" align="center"> 
          <td colspan="2">���� ���������� �������� �ʽ��ϴ�.</td>
        </tr>
        <%

    Else

	  Do Until rs.eof 

          
		  s_time = rs("s_time")
		  hourcount = rs("hourcount")
		 

		'�׷����� ������ ������ �ʺ� �����մϴ�.
		'�ʺ�� ������ ī��Ʈ/�ְ�ī��Ʈ �� 3 pixel�� ���ؼ� �����Ͽ����ϴ�.
		'�� �ʺ�� �������� ������ �����ص� ���� ���Դϴ�.
		width_len = ((hourcount/Max_timeCount)*100) *3
		'����, �� ���� wid�� 1���� ���� ����� �ּҰ����� 1�� �����մϴ�.
		if width_len < 1 then
			width_len = 1
		End if   
		
		  width_len = (cLng(daycount)/12) + 10

          if width_len > 600 then 

		     width_len = 600

          End if
		  width_len = ((cLng(hourcount)/1000)*100)

          if width_len > 500 then 

		     width_len = 500

          End if
         

%>
        <tr bgcolor="#FFFFFF"> 
          <td width="70" bgcolor="#EDF0F5" align="center"><font color="#333333"><%=s_time%>��</font></td>
          <td width="592"> 
            <%If cLng(Max_time) =  cLng(s_time) Then %>
            <img src="max_bar.gif" width="<%=width_len%>" height="9"> &nbsp;<font color="#CC0000"><b><%=hourcount%></b></font> 
            <%Else%>
            <img src="bar.gif" width="<%=width_len%>" height="9"> &nbsp;<%=hourcount%> 
            <%End If%>
          </td>
        </tr>
        <%
	      rs.movenext
		  
     Loop

    End If

    rs.close

	


%>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><font color="#7787AB">��</font> <b><%=s_year%>�� <%=s_month%>�� ���Ϻ�������Ȳ</b></td>
  </tr>
  <tr> 
    <td> 
      <%
    
	'���Ϻ� ������Ȳ �հ�
	'�ְ� ���ü� ���ڵ带 �����´�.
    
	SQL = "SELECT Top 1 sum(s_count) as maxweek,s_year,s_month,s_week FROM "&static_table 
	SQL = SQL & " GROUP BY s_week,s_year,s_month "
	SQL = SQL &" HAVING s_year="&s_year&" AND s_month="&s_month 
	SQL = SQL &" ORDER BY sum(s_count) DESC "
	
	rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
	
	If rs.Eof Or rs.Bof Then
	Else
	
		Max_week = rs("s_week")
		Max_weekCount = rs("maxweek")
	End If		
	rs.close
	
	SQL = "SELECT sum(s_count) as weekcount,s_year,s_month,s_week FROM "&static_table 
	SQL = SQL & " GROUP BY s_week,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month 
    SQL = SQL & " ORDER BY s_week "
      
    rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText




%>
      <!--���ϴ뺰 ������Ȳ �׷��� -->
      <table width="681" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5CEDE">
        <%
  		If rs.Eof or rs.Bof Then
  %>
        <tr bgcolor="#FFFFFF"> 
          <td align="center" colspan="2" height="22">���� ���������� �������� �ʽ��ϴ�.</td>
        </tr>
        <%

    Else

	  Do Until rs.eof 

          
		 weekcount = rs("weekcount")
		 
		  
		
		 width_len = ((weekcount/Max_weekCount)*100) *3
		'����, �� ���� wid�� 1���� ���� ����� �ּҰ����� 1�� �����մϴ�.
		if width_len < 1 then
			width_len = 1
		End if   
		
		
         
        
	     weeknum = rs("s_week")
		 labelweek = weekdayname(weeknum)


%>
        <tr bgcolor="#FFFFFF"> 
          <td align="center" width="71" bgcolor="#EDF0F5"><font color="#333333"><%=labelweek%></font></td>
          <td width="591"> 
            <%If cLng(Max_week) =  cLng(weeknum) Then %>
            <img src="max_bar.gif" width="9" height="15"><font color="#CC0000"><b><%=weekcount%></b></font> 
            <%Else%>
            <img src="bar.gif" width="14" height="15"><%=weekcount%> 
            <%End If%>
          </td>
        </tr>
        <%
	      rs.movenext
		  
     Loop

    End If

	rs.close
	
	Set rs = nothing

%>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<!--#include file="inc_close.asp" -->