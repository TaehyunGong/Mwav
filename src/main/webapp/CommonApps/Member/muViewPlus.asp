<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%

		'�������� ��������
		SSN = SSN1 & "-" & SSN2
		if findingID <> "" then
			Question = PickUpValue("vFindingUserInfo", "Question", "findingID = " & findingID )
		else
			Question = "-"
		end if
		if mailing = "1" then mailing = "���Ž�û"
		if mailing = "0" then mailing = "���Űź�"
		if SalaryID <> "" then
			Salary = PickUpValue("vSalary", "sRange", "SalaryID = " & SalaryID )
		else
			Salary = "-"
		end if

'Response.end

	elseif sMode = "u" then
		TopMsg =  MbrID & "�� ���� ��������� �Է��ϼ���."
		submitMSG = "��������� ���� �Ͻðڽ��ϱ�?"

		MbrID =trim(Request.Form("MbrID"))
		if MbrID <> "" then
			SQL = "SELECT * FROM vMemberValues "
			SQL = SQL + " WHERE MbrID='" & MbrID & "'"
			RSresult = OpenRS(rs,SQL,1)
			'Response.Write("RSresult=" + RSresult)
			if RSresult = "Empty" then
				Call ShowAlertMsg("�ش����ڴ� �����ϴ�.")
			end if
			'set rs = db.Execute(sql)
		else
			Call ShowAlertMsg("���̵� �Է��ϼ���")
		end if

		MbrID = trim(rs("MbrID"))
		MbrPW = trim(rs("MbrPW"))
		MbrName = trim(rs("MbrName"))
		phone = trim(rs("phone"))
		cellularP = trim(rs("cellularP"))
		MbrEmail = trim(rs("MbrEmail"))
		sex = trim(rs("sex"))
		AddrZip = trim(rs("AddrZip"))
		AddrCity = trim(rs("AddrCity"))
		AddrStt = trim(rs("AddrStt"))
		findingID = trim(rs("findingID"))
		'Question = trim(rs("Question"))
		findingA = trim(rs("findingA"))
		SSN1 = trim(rs("SSN1"))
		SSN2 = trim(rs("SSN2"))
		birthSL = trim(rs("birthSL"))
		birthDate = trim(rs("birthDate"))
		wedSL = trim(rs("wedSL"))
		wedDate = trim(rs("wedDate"))
		buyable = trim(rs("buyable"))
		hobbies = trim(rs("hobbies"))
		homepage = trim(rs("homepage"))
		mark = trim(rs("mark"))
		avataImage = trim(rs("avataImage"))
		rcmderID = trim(rs("rcmderID"))
		mailing = trim(rs("mailing"))
		level4 = trim(rs("level4"))
		HowMuch = trim(rs("HowMuch"))
		HowMany = trim(rs("HowMany"))
		RFund = trim(rs("RFund"))
		RFundAC = trim(rs("RFundAC"))
		unpaid = trim(rs("unpaid"))
		unpaidAC = trim(rs("unpaidAC"))
		joinDT = trim(rs("joinDT"))
		recentLogin = trim(rs("recentLogin"))
		missYouDT = trim(rs("missYouDT"))
		IPaddress = trim(rs("IPaddress"))
		'��������
		company = trim(rs("company"))
		DeptName = trim(rs("DeptName"))
		MbrClass = trim(rs("MbrClass"))
		jobID = trim(rs("jobID"))
		officeP = trim(rs("officeP"))
		faxNbr = trim(rs("faxNbr"))
		officeZip = trim(rs("officeZip"))
		officeCity = trim(rs("officeCity"))
		officeStt = trim(rs("officeStt"))
		salaryID = trim(rs("salaryID"))
		Call CloseRS(rs)
		if SalaryID <> "" then
			Salary = PickUpValue("vSalary", "sRange", "SalaryID = " & SalaryID )
		else
			Salary = "-"
		end if



		if IsNumeric(SSN1) then
			if CInt(Left(SSN1, 2)) <= 99 then
				age = Year(now) - CInt(19&Left(SSN1, 2)) + 1
			else
				age = Year(now) - CInt(20&Left(SSN1, 2)) + 1
			end if
		else
			age = "?"
		end if
	end if 		'if sMode = "i" then

%>

<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - ȸ������</title>
<meta name="keywords" content="ķ�ڴ� ī�޶� �޸�">
<meta name="description" content="�ְ��� ķ�ڴ� ��������Ʈ">
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
<meta http-equiv="refresh" content="<%= refl %>">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>" target="_self">
<link href="Include_css/Style.css" rel="stylesheet" type="text/css">
<link href="Include_css/Object.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="Include_js/Function.js"></script>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <!-- FrontHeader Start -->
      <!--#include File = "../../SiteHeader/FrontHeader.asp" -->
      <!-- FrontHeader End --> </td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td> <!-- FrontHeader Start -->
            <!--#include File = "../../ShopComponents/MainMenu/MainMenuBar.asp" -->
            <!-- FrontHeader End --> </td>
        </tr>
        <tr>
          <td>
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self">
	<!-- MemberUserDisplay Start -->
	        <TABLE cellSpacing=0 cellPadding=0 width=100% align=center bgColor=#616e5b border=0>
              <TR>
                <TD width=160><IMG height=45 src="Images/muDisplay.gif" width=160></TD>
                <TD class=locationnav>&nbsp;</TD>
              </TR>
            </TABLE>
    <!-- MemberUserDisplay End --> </td>
        </tr>
        <tr>
          <td height="300" align="center">
<SCRIPT language=JavaScript>
<!--
function whereToGo(flag) {
	if( flag == "IDSeek") {
		if (CheckID(document.frmMbr.MbrID, 4, 15, 'ȸ�����̵�')) {
			NewWindow('../../CommonAccessories/IDSeek/IDSeek.asp',  document.frmMbr, frmMbr.MbrID, 418, 300);
			return;
		}
	}
	if( flag == "zipCode") {
		NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', document.frmMbr, frmMbr.AddrZip, 426, 400);
		return;
	}
	return;
}

-->
</SCRIPT>
<table width="750" border="0" cellspacing="0" cellpadding="0">
<form method="post" name="frmMbr" onSubmit="return SubmitMbr(this)">
<input name="sMode" type="hidden" id="sMode" value="<%= sMode %>">
  <tr>
   <td align="center"> <table width="100%" border="0" cellpadding="1" cellspacing="0">
       <tr>
         <td height="25" colspan="4">&nbsp; </td>
       </tr>
       <tr>
         <td height="50" colspan="4"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"><img src="Images/muBasicInfo.gif" width="114" height="18" align="absmiddle">
           | �Ʒ��� ���� ȸ������ ��ϵǾ����ϴ�. �����մϴ�.</td>
       </tr>
       <% if sMode = "i" or company <> "" then %>
       <% end if %>
       <!--  ���Ⱑ ���� ���� �� -->
       <% if session("level4") >= 2 then %>
       <% end if %>
     </table>
     <table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="#dfdfdf">
       <tr>
         <td>
           <table width="100%" border="0" cellpadding="1" cellspacing="1">
             <tr>
               <th width="120" height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               ���̵�<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td width="260" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                 <%= MbrID %> </td>
               <th width="120" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               �̸�(����)<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td width="200" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               <%= MbrName %> <img src="../../Images/TransparentImage.gif" width="10" height="10">(<%= sex %> )</td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               �Ϲ���ȭ��ȣ<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= phone %></td>
               <th align="left" bgcolor="#f2f2f2"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               �ڵ���</th>
               <td bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= cellularP %> </td>
             </tr>
             <tr>
               <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               �����ּ�<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                 <%= AddrZip %> <%= AddrCity %> <%= AddrStt %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               ��й�ȣ<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= MbrPW %> </td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               ��й�ȣ��Ʈ<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= Question %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               ��й�ȣ�亯<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= findingA %></td>
               <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               ���ϸ�����<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"><%= mailing %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               �̸����ּ�<IMG height="12" src="Images/muBasicStar.gif" width=12> </th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= MbrEmail %> </td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">�ֹε�Ϲ�ȣ</th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= SSN %> </td>
             </tr>
             <% if sMode = "i" or company <> "" then %>
             <% end if %>
             <!--  ���Ⱑ ���� ���� �� -->
             <% if session("level4") >= 2 then %>
             <% end if %>
           </table></td>
 </tr>
              </table>
                    <TABLE height="12"0 cellSpacing=0 cellPadding=10 width="100%" border=0>
                      <TR>
                        <TD width="50%" align="right"> <a href="<%= Application("SiteURLDir") %>"><img src="Images/mu_ok.gif" border="0"></a>
                        </TD>
                        <TD width="50%"><input name="btnUpdate2" type="button" id="btnUpdate2" onClick="JavaScript:SubmitJ('������ �����մϱ�?', this.form, 'MbrInput_ok.asp?sMode=u')" value="�ΰ������Է�"></TD>
                      </TR>
                    </TABLE>
                    <p>
                      <% if sMode = "i" then %>
                      <input name="btnMbrJoin" type="button" id="btnMbrJoin" onClick="SubmitJ('<%= submitMSG %>',this.form, 'MbrInput_ok.asp?sMode=i');" value="Ȩ����">
                      <% end if %>
                      <% if sMode = "u" then %>
                      <input name="btnUpdate" type="button" id="btnUpdate" onClick="JavaScript:SubmitJ('������ �����մϱ�?', this.form, 'MbrInput_ok.asp?sMode=u')" value="�ΰ������Է�">
                      <% end if %>
                    </p>

                  </td>
  </tr>
</form>
</table>




          </td>
        </tr>
        <tr>
          <td width="100" valign="top"> </td>
        </tr>
        <tr>
          <td> <!-- FrontFooter Start -->
            <!--#include File = "../../SiteFooter/FrontFooter.asp" -->
            <!-- FrontFooter End --> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
