<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'���̵��� ������ �������� ���Է����� Ȯ��
	sMode =trim(Request("sMode"))
	if sMode = ""  then Call ShowAlertMsg("����� ���� �Ӵ�.")

	if sMode = "i" then
		TopMsg = "ȸ������ �����մϴ�."
		submitMSG = "���ο� ȸ������ �����Ͻðڽ��ϱ�?"
		'������� Ȯ��
		if Request.Form("agreement") <> "Y" then Call GotoThePage("����� �����ϼ���.", "muAgreement.asp")

	elseif sMode = "u" then
		TopMsg =  MbrID & "�� ���� ��������� �Է��ϼ���."
		submitMSG = "ȸ�������� �����Ͻðڽ��ϱ�?"
	
		SQL = "SELECT MbrID,MbrPW,MbrName,phone,cellularP,MbrEmail,sex,AddrZip,AddrCity,AddrStt,findingID,findingA,SSN1,SSN2 "
		SQL = SQL + " FROM vMember "
		SQL = SQL + " WHERE MbrID='" & Session("MbrID") & "'"
		RSresult = OpenRS(rs,SQL,1)
		'Response.Write("RSresult=" + RSresult)
												'set rs = db.Execute(sql)
		if RSresult <> "Empty" then
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
			Call CloseRS(rs)
			'�������� ��������
			phoneArray = Split(phone, "-")
			HTEL1 = phoneArray(0)
			HTEL2 = phoneArray(1)
			HTEL3 = phoneArray(2)
			cellularPArray = Split(cellularP, "-")
			MTEL1 = cellularPArray(0)
			MTEL2 = cellularPArray(1)
			MTEL3 = cellularPArray(2)
			'SSN = SSN1 & "-" & SSN2
			if findingID <> "" then
				Question = PickUpValue("vFindingUserInfo", "Question", "findingID = " & findingID )
			else
				Question = "-"
			end if
		else
			Response.Redirect(UrlRootDir)
		end if	'if RSresult <> "Empty" then
	
		'''''''''vMbrHiddenValue
		SQL = "SELECT level4,mailing,IPaddress "
		SQL = SQL + " FROM vMbrHiddenValue "
		SQL = SQL + " WHERE MbrID='" & Session("MbrID") & "'"
		RSresult = OpenRS(rs,SQL,1)
		if RSresult <> "Empty" then
			level4 = trim(rs("level4"))
			mailing = trim(rs("mailing"))
			IPaddress = trim(rs("IPaddress"))
			'�������� ��������
			if mailing = "True" then 
				'mailing = "���Ž�û"
			else
				'mailing = "���Űź�"
			end if
		else
			Response.Redirect(UrlRootDir)
		end if	'if RSresult = "Empty" then

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
          <td> <base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 
		  <!-- FrontHeader Start --> 
          <img src="Images/JoinDisplay.gif" width="800" height="125"><!-- FrontHeader End --> </td> 
        </tr> 
        <tr> 
          <td> 
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 		  
	<!-- MemberUserDisplay Start --> 
	        <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="170"><img src="Images/JoinNametag.gif" width="171" height="31"></td>
                <td><%
						secondLevel =" > ȸ������"
					%>
                    <!-- LocationBar Start -->
                    <!--#include File = "../../ShopComponents/LocationBar/LocationBar.asp" -->
                    <!-- LocationBar End -->
                </td>
              </tr>
            </table>
	        <!-- MemberUserDisplay End --> </td> 
        </tr> 
        <tr> 
          <td height="300" align="center"> 
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 	
<script language="JavaScript" src="mu_inc.js"></script>
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
<form method="post" name="frmMbr" onSubmit="return SubmitMbr(this)" action="muInput_ok.asp">
	<input name="sMode" type="hidden" id="sMode" value="<%= sMode %>">
	<input name="MbrInfo" type="hidden" id="MbrInfo" value="basic"> 
                <tr> 
                  <td align="center"> <table width="100%" border="0" cellpadding="1" cellspacing="0">
                      <tr> 
                        <td height="25" colspan="4"></td>
                      </tr>
                      <tr> 
                        <td height="50" colspan="4"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"><img src="Images/muBasicInfo.gif" width="114" height="18" align="absmiddle"> 
                          | <img src="Images/muBasicStar.gif" width="12" height="12"> 
                          <font size="1">ǥ�ô� �ʼ��Է� �׸��Դϴ�. ȸ�������� ���� �ݵ�� ������ �ֽʽÿ�. 
                          </font></td>
                      </tr>
                      <!--  ���Ⱑ ���� ���� �� -->
                      <% if session("level4") >= 2 then %>
                      <% end if %>
                    </table>
                    <table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="#dfdfdf">
                      <tr> 
                        <td> 
                          <table width="100%" border="0" cellpadding="1" cellspacing="1">
                            <tr> 
                              <th width="120" height="35" align="left" bgcolor="#f2f2f2">
							  <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
							  ���̵�<IMG src="Images/muBasicStar.gif"></th>
                              <td width="260" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"> 
                        <% if sMode = "i" then %>
								<input name="MbrID" type="text" id="MbrID" size="15" maxlength="15"> 
								<a href="javascript:whereToGo('IDSeek');"><img src="Images/IdentifyID.gif" alt="�ߺ����̵�ã��" border="0" align="absmiddle"></a> 
						<% else %> <%= MbrID %>	<input name="MbrID" type=hidden id="MbrID" value="<%= MbrID %>">
						<% end if %>                                
                              </td>
                              <th width="120" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">�̸�(����)<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td width="200" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrName" type="text" id="MbrName" style="ime-mode:active" value="<%= MbrName %>" size="8" maxlength="8"> 
                                <img src="../../Images/TransparentImage.gif" width="10" height="10">( 
                                <select name="sex" id="sex">
                                  <option value="��" <%= WriteSelected(sex, "��") %>>��</option>
                                  <option value="��" <%= WriteSelected(sex, "��") %>>��</option>
                                </select>
                                ) </td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">�Ϲ���ȭ��ȣ<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <INPUT name="HTEL1" value="<%= HTEL1 %>" size="4" maxlength="4">
                                - 
                                <INPUT name="HTEL2" value="<%= HTEL2 %>" size="4" maxlength="4">
                                - 
                                <INPUT name="HTEL3" value="<%= HTEL3 %>" size="4" maxlength="4"> </td>
                              <th align="left" bgcolor="#f2f2f2"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">�ڵ���</th>
                              <td bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <INPUT name="MTEL1" value="<%= MTEL1 %>"size="4" maxlength="4">
                                - 
                                <INPUT name="MTEL2" value="<%= MTEL2 %>" size="4" maxlength="4">
                                - 
                                <INPUT name="MTEL3" value="<%= MTEL3 %>" size="4" maxlength="4"></td>
                            </tr>
                            <tr> 
                              <th rowspan="3" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">�����ּ�<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"> 
                                <input name="AddrZip" type="text" id="AddrZip" style="CURSOR: default;" value="<%= AddrZip %>" size="7" maxlength="7" readonly> 
                                <a href="javascript:whereToGo('zipCode');"> <img src="Images/muPostSeek.gif" alt="�����ȣã��" width="94" height="19" border=0 align="absmiddle" usemap="#zipCode"> 
                                </a> </td>
                            </tr>
                            <tr> 
                              <td height="30" colspan="3" bgcolor="#FFFFFF"><a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.AddrZip, 426, 400);"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"></a> 
                                <input name="AddrCity" type="text" id="AddrCity" value="<%= AddrCity %>" size="50" maxlength="50" readonly></td>
                            </tr>
                            <tr> 
                              <td height="30" colspan="3" bgcolor="#FFFFFF"><a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.AddrZip, 426, 400);"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"></a> 
                                <input name="AddrStt" type="text" id="AddrStt" value="<%= AddrStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">��й�ȣ<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrPW" type="text" id="MbrPW3" style="ime-mode:inactive" value="<%= MbrPW %>" size="12" maxlength="12"> 
                              </td>
                              <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">Ȯ�����Է�<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrPW1" type="text" id="MbrPW4" size="12" maxlength="12" style="ime-mode:inactive"></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">��й�ȣ��Ʈ<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <select name="findingID" id="findingID">
                                  <% Call SelectOption("vFindingUserInfo", "findingID", findingID) %>
                                </select></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">��й�ȣ�亯<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="findingA" type="text" id="findingA" value="<%= findingA %>" size="20" maxlength="20" style="ime-mode:active"></td>
                              <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">���ϸ�����<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                ��û 
                                <input name="mailing" type="checkbox" id="mailing" value="1" checked <%= WriteRadioChecked(mailing, "True") %>></td>
                            </tr>
                            <tr> 
                              <th height="70" rowspan="2" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">�̸����ּ�<IMG height=12 
                        src="Images/muBasicStar.gif" width=12> </th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <% if sMode = "i" then %>
                                <input name="MbrEmail" type=hidden id="MbrEmail">                                
                                <INPUT name="MbrEmail1" size=25 maxlength="50" onblur="mailAddr(this.form);">
                                @ 
                                <SELECT name="MbrEmail2" onchange="mailAddr(this.form);">
                                  <OPTION value="" selected>�����ϼ���</OPTION>
                                  <OPTION value=etc>�����Է�</OPTION>
                                  <OPTION value=dreamwiz.com>dreamwiz.com</OPTION>
                                  <OPTION value=empal.com>empal.com</OPTION>
                                  <OPTION value=hanmail.net>hanmail.net</OPTION>
                                  <OPTION value=hanmir.com>hanmir.com</OPTION>
                                  <OPTION value=hanafos.com>hanafos.com</OPTION>
                                  <OPTION value=hotmail.com>hotmail.com</OPTION>
                                  <OPTION value=lycos.co.kr>lycos.co.kr</OPTION>
                                  <OPTION value=nate.com>nate.com</OPTION>
                                  <OPTION value=naver.com>naver.com</OPTION>
                                  <OPTION value=netian.com>netian.com</OPTION>
                                  <OPTION value=yahoo.co.kr>yahoo.co.kr</OPTION>
                                </SELECT>
                                <% else %>
                                <INPUT name="MbrEmail" id="MbrEmail" onblur="mailAddr(this.form);" value="<%= MbrEmail %>" size=25 maxlength="50">
                                
                                <% end if %> <SPAN class=text>(������ ��Ȯ�� �̸���) </SPAN> 
                              </td>
                            </tr>
                            <tr> 
                              <td colspan="3" bgcolor="#FFFFFF"><SPAN class=text><img src="../../Images/TransparentImage.gif" width="10" height="10">���ο� 
                                �̸��� ������ �Ʒ��� ����Ʈ���� ���� �� �ֽ��ϴ�.<BR>
                                <img src="../../Images/TransparentImage.gif" width="10" height="10"><A 
                        href="http://id.naver.com/newid/register/inputNameSocno.php" 
                        target=_blank>���̹�</A> / <A 
                        href="http://member.nate.com/sccustomer/join/nate/index.jsp" 
                        target=_blank>����Ʈ</A> / <A 
                        href="http://www.dreamwiz.com/re/agreement.html" 
                        target=_blank>�帲����</A> / <A 
                        href="http://mail.yahoo.co.kr/" target=_blank>����</A> / 
                                <A 
                        href="http://login.empas.com/join/join_agr.html?es=http://empal.empas.com" 
                        target=_blank>���Ľ�</A> </SPAN></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">�ֹε�Ϲ�ȣ</th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="SSN1" type="text" id="SSN1" value="<%= SSN1 %>" size="6" maxlength="6">
                                - 
                                <input name="SSN2" type="text" id="SSN2" value="<%= SSN2 %>" size="7" maxlength="7">
                                (������ �ֹε�Ϲ�ȣ�� �ܱ��ε�Ϲ�ȣ ����)</td>
                            </tr>
                            <!--  ���Ⱑ ���� ���� �� -->
                          </table></td>
                </tr>
              </table>
			<TABLE height=120 cellSpacing=0 cellPadding=10 width="100%" border=0>
			<TR> 
			  <TD width="50%" align="right">
			  <% if sMode = "i" then %>
			  <INPUT name="image" type=image src="Images/muJoin.gif" width=76 height=19>
			  <% end if %>
			  <% if sMode = "u" then %>
              <input name="btnUpdate" type="button" id="btnUpdate" onClick="JavaScript:if(SubmitMbr(frmMbr)){SubmitJ('<%= submitMSG %>', this.form, 'muInput_ok.asp?sMode=u')}" value="����Ȯ��">
              <% end if %></TD>
			  <TD width="50%">
			  <A href="javascript:history.back();"><IMG src="Images/mu_cancel.gif" width=110 border=0></A>
			  </TD>
			</TR>
		</TABLE>
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
