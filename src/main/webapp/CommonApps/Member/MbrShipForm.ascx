<%@ Register TagPrefix="uc1" TagName="DateSelector" Src="/CommonApps/Calendar/DateSelector/DateSelector.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MbrShipForm.ascx.cs" Inherits="KistelSite.CommonApps.MemberShip.MbrShipForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>


<LINK href="/CommonApps/Calendar/DateSelector/popcalendar.css" type=text/css rel=stylesheet >
<script language=JavaScript src="/CommonLibrary/Function.js"></script>

<script language=JavaScript src="/CommonApps/MemberShip/MemberShip.js"></script>

<script language=JavaScript src="/CommonLibrary/Objects/radio.js"></script>

<script language=javascript 
src="/CommonApps/Calendar/DateSelector/popcalendar.js"></script>
<base href='<%= Application["BaseHref"] %>CommonApps/MemberShip/' target=_self>
<P></P><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face=����></FONT><FONT 
face=����></FONT><FONT face=����></FONT><FONT face="����"></FONT>
<table cellSpacing=0 cellPadding=0 width=700 border=0>
  <tr>
    <td>
      <P>member_id <asp:label id=member_id runat="server"></asp:label><BR 
      >loginID <asp:textbox id=loginID runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><INPUT class=box003 id=bnLoginID type=button value=�˻� name=Button1 runat="server"> 
<asp:requiredfieldvalidator id=RequiredFieldValidator11 runat="server" ErrorMessage="���̵� ��������." ControlToValidate="loginID" Display="Dynamic">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=revLoginID runat="server" ErrorMessage="���̵�� �����ڷ� �����Ͽ� 3�� �̻� 15�� �����Դϴ�." ControlToValidate="loginID" ValidationExpression="[A-z]\w{2,15}">*</asp:regularexpressionvalidator></P>
      <P>
      <MARQUEE id=marqeeIdCheckWaitMag 
      style="BORDER-TOP-WIDTH: 0px; DISPLAY: none" scrollAmount=5 
      behavior=alternate width=50><FONT color=blue 
      >������..</FONT></MARQUEE></P>
      <P><BR 
      >loginPW <asp:textbox id=loginPW runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator12 runat="server" ErrorMessage="�н����带 ��������." ControlToValidate="loginPW">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=Regularexpressionvalidator4 runat="server" ErrorMessage="��ȣ�� ������� 4�� �̻� �Է��ϼ���." ControlToValidate="loginPW" ValidationExpression="\w{4,14}">*</asp:regularexpressionvalidator><BR 
      >MbrName <asp:textbox id=MbrName runat="server" CssClass="box003" MaxLength="20" Columns="12"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator2 runat="server" ErrorMessage="�̸��� �Է��ϼ���." ControlToValidate="MbrName">*</asp:requiredfieldvalidator><BR 
      >MbrEmail <asp:textbox id=MbrEmail runat="server" CssClass="box003" MaxLength="50" Width="200px"></asp:textbox><asp:requiredfieldvalidator id=Requiredfieldvalidator4 runat="server" ErrorMessage="�̸����� �Է��ϼ���." ControlToValidate="MbrEmail">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=RegularExpressionValidator3 runat="server" ErrorMessage="�̸����� ��Ȯ�� �Է��ϼ���." ControlToValidate="MbrEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:regularexpressionvalidator><BR 
      >phone <asp:textbox id=phone runat="server" Columns="50" Width="140px"></asp:textbox><BR 
      >cellularP <asp:dropdownlist id=cellularP1 runat="server" CssClass="box003">
													<asp:ListItem Selected="True" Value="">����</asp:ListItem>
												</asp:dropdownlist>- <asp:textbox id=cellularP2 runat="server" CssClass="box003" MaxLength="4" Width="50px"></asp:textbox>- 
<asp:textbox id=cellularP3 runat="server" CssClass="box003" MaxLength="12" Width="70px"></asp:textbox><BR 
      >zipcode <asp:textbox id=mZipcode runat="server" Columns="6" ReadOnly="True"></asp:textbox><asp:hyperlink id=hlSeekAddr runat="server">�ּ�ã��</asp:hyperlink><BR 
      >address <asp:textbox id=mAddress1 runat="server" CssClass="box003" MaxLength="200" Width="300px" ReadOnly="True"></asp:textbox><asp:textbox id=mAddress2 runat="server" CssClass="box003" MaxLength="200" Width="300px"></asp:textbox><BR 
      >findingID <asp:dropdownlist id=findingID runat="server">
														<asp:ListItem Value="0" Selected="True">8~�����ϼ���~8</asp:ListItem>
													</asp:dropdownlist><BR>findingA <asp:textbox id=findingA runat="server"></asp:textbox><BR 
      >SSN <asp:textbox id=SSN1 runat="server" CssClass="box003" MaxLength="6" Columns="6"></asp:textbox>- 
<asp:textbox id=SSN2 runat="server" CssClass="box003" MaxLength="7" Columns="7"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator5 runat="server" ErrorMessage="���ڸ� �ֹι�ȣ�� �Է��ϼ���." ControlToValidate="SSN1" Display="None">*</asp:requiredfieldvalidator><asp:requiredfieldvalidator id=RequiredFieldValidator6 runat="server" ErrorMessage="���ڸ� �ֹι�ȣ�� �Է��ϼ���." ControlToValidate="SSN2" Display="Dynamic">*</asp:requiredfieldvalidator>&nbsp;<INPUT class=box003 id=btnSSN style="WIDTH: 86px; HEIGHT: 17px" type=button value=�ֹι�ȣȮ�� name=Button1 runat="server"><BR 
      >newsLetter <asp:checkbox id=newsLetter runat="server" Text="���������� ��û�մϴ�." Checked="True"></asp:checkbox><BR 
      ><FONT face=����>- - - - - - - - - 
      - - - - - - - - - -</FONT><BR><FONT face=���� 
      >rcmderID <asp:textbox id=rcmderID runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><INPUT class=box003 id=bnRcmderID type=button value=�˻� name=bnRcmderID runat="server"><asp:regularexpressionvalidator id=revRcmderID runat="server" ErrorMessage="���̵�� �����ڷ� �����Ͽ� 3�� �̻� 15�� �����Դϴ�." ControlToValidate="rcmderID" ValidationExpression="[A-z]\w{2,15}">*</asp:regularexpressionvalidator> 
      </P>
      <P> 

      <MARQUEE id=marqeeIdCheckWaitMag1 
      style="BORDER-TOP-WIDTH: 0px; DISPLAY: none" scrollAmount=5 
      behavior=alternate width=70><FONT color=blue 
      >������..</FONT></MARQUEE></P></FONT>
      <P><BR 
      ><FONT face=����>- - - - - - - - - 
      - - - - - - - - - -<BR></FONT>homepage <asp:textbox id=homepage runat="server" CssClass="box003" MaxLength="50" Width="176px"></asp:textbox><BR 
      >messenger <asp:textbox id=MsgName runat="server" CssClass="box003" MaxLength="50" Columns="20"></asp:textbox><asp:textbox id=MsgID runat="server" CssClass="box003" MaxLength="50" Columns="20"></asp:textbox><BR 
      >hobbies </P>
      <P> <asp:checkboxlist id=hobbies runat="server" Width="400" RepeatColumns="4"></asp:checkboxlist></P>
      <P><BR 
      >carInfo <asp:dropdownlist id=carInfo runat="server">
																					<asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
																				</asp:dropdownlist><BR>children <asp:textbox id=children runat="server" CssClass="box003" MaxLength="3" Columns="3"></asp:textbox><asp:rangevalidator id=RangeValidator1 runat="server" ErrorMessage="0~99 ���� �ȿ��� �Է��ϼ���." ControlToValidate="children" Type="Integer" MaximumValue="99" MinimumValue="0">*</asp:rangevalidator><BR 
      >avataImage <asp:image id=avataImage runat="server" ImageUrl="../../xUpload/MbrData/Avata/AvaPic_default.gif"></asp:image><INPUT 
      language=C# class=box003 id=bnAvataImage type=file size=22 name=file 
       runat="server"> <asp:checkbox id=cbDeleteAI runat="server" Text="���ϻ���" Visible="False"></asp:checkbox><BR 
      >monthlyPay <asp:dropdownlist id=monthlyPay runat="server">
																					<asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
																				</asp:dropdownlist><BR>mark <asp:textbox id=mark runat="server"></asp:textbox><BR 
      ><FONT face=����>birthday </FONT><asp:radiobuttonlist id=rblSLBirth runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
																				<asp:ListItem Value="��">���</asp:ListItem>
																				<asp:ListItem Value="��">����</asp:ListItem>
																			</asp:radiobuttonlist><asp:textbox id=tbBirthDay runat="server" CssClass="box003" MaxLength="10" Columns="9" ReadOnly="True"></asp:textbox><uc1:dateselector id=DateSelector1 runat="server"></uc1:dateselector><FONT 
      face=����><BR>aniversity <asp:radiobuttonlist id=rblMarried runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
																				<asp:ListItem Value="��">��ȥ</asp:ListItem>
																				<asp:ListItem Value="��">��ȥ</asp:ListItem>
																			</asp:radiobuttonlist><asp:textbox id=tbWeddingDay runat="server" CssClass="box003" MaxLength="10" Columns="9" ReadOnly="True"></asp:textbox><uc1:dateselector id=DateSelector2 runat="server"></uc1:dateselector></FONT><BR 
      ><FONT face=����>- - - - - - - - - 
      - - - - - - - - - -<BR></FONT>company <asp:textbox id=company runat="server"></asp:textbox><BR 
      >jobType <asp:dropdownlist id=jobType runat="server">
																				<asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
																			</asp:dropdownlist><BR>officeP <asp:textbox id=officeP runat="server"></asp:textbox><BR 
      >jobZipcode <asp:textbox id=oZipcode runat="server" Columns="6" ReadOnly="True"></asp:textbox><asp:hyperlink id=hlSeekOAddr runat="server">�ּ�ã��</asp:hyperlink><BR 
      >jobAddress <asp:textbox id=oAddress1 runat="server" MaxLength="200" Width="300px" ReadOnly="True"></asp:textbox><asp:textbox id=oAddress2 runat="server" MaxLength="200" Width="300px"></asp:textbox><BR><FONT 
      face="����">- - - - - - - - - - - - - - - - - - -Member 
      values<BR></FONT>mLevel <asp:literal id="mLevel" runat="server"></asp:literal><BR>howMuch / howMany&nbsp;<asp:literal id="howMuch" runat="server"></asp:literal>&nbsp;/ <asp:literal id="howMany" runat="server"></asp:literal><BR>RFund&nbsp;/ 
      RFundAC&nbsp;&nbsp;<asp:literal id="RFund" runat="server"></asp:literal>&nbsp;/ <asp:literal id="RFundAC" runat="server"></asp:literal><BR>point / pointAC&nbsp;<asp:literal id="point" runat="server"></asp:literal>&nbsp;/ <asp:literal id="pointAC" runat="server"></asp:literal><BR>&nbsp;unpaid&nbsp; <asp:literal id="unpaid" runat="server"></asp:literal><BR>unpaidAC <asp:literal id="unpaidAC" runat="server"></asp:literal><BR>joinDT <asp:literal id="joinDT" runat="server"></asp:literal><BR>modifyDT <asp:literal id="modifyDT" runat="server"></asp:literal><FONT 
      face="����"><BR></FONT>leaveDT&nbsp;<asp:literal id="leaveDT" runat="server"></asp:literal><BR><FONT 
      face="����">IPaddress&nbsp;</FONT><asp:literal id="IPaddress" runat="server"></asp:literal><FONT face="����"><BR></FONT>recentLogin 
      <asp:literal id="recentLogin" runat="server"></asp:literal></P>
      <P><FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����"></FONT><FONT 
      face="����"></FONT><BR><BR>&nbsp;</P><FONT face="����"></FONT><FONT 
    face="����"></FONT></td></tr></table>
<table cellSpacing=0 cellPadding=0 width=700 border=0>
  <tr>
    <td align=center height=50>&nbsp; <asp:hyperlink id=hlList runat="server">���</asp:hyperlink><FONT 
      face=����>&nbsp;</FONT><asp:hyperlink id=hlBack runat="server">�ڷ�</asp:hyperlink><FONT 
      face=����>&nbsp;</FONT><asp:imagebutton id=ibInsert runat="server"></asp:imagebutton><FONT 
      face=����>&nbsp;</FONT><asp:imagebutton id=ibUpdate runat="server"></asp:imagebutton></td></tr></table>
