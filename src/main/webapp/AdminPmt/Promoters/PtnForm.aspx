<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PtnForm.aspx.cs" Inherits="PARTNER.Adminp_Partners_StfForm" Trace="false" %>
<%@ Register src="~/CommonApps/PostCalls/IDButton.ascx" tagname="IDButton" tagprefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="DateSelector" Src="~/CommonApps/Calendar/DateSelector/DateSelector.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="robots" content="noindex,nofollow"/>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script> 
    <title>The Partner Management</title>
</head>
<body>
    <form id="frmPartner" runat="server">
  <table id="Table5" cellSpacing="0" cellPadding="0" width="815" border="0">
    <tr>
      <td bgColor="#ffffff"><table cellSpacing="0" cellPadding="0" width="100%" border="0">
          <tr>
            <td width="26"><IMG height="27" src="../zImages/admin_top009.gif" width="26"></td>
            <td bgColor="#f4f4f4">������ġ: 
              <asp:Literal ID="litPageTitle" runat="server"></asp:Literal>
            </td>
            <td width="10"><IMG height="27" src="../zImages/admin_top010.gif" width="10"></td>
          </tr>
        </table></td>
    </tr>
    <tr vAlign="top" align="center" bgColor="#ffffff">
      <td height="20">&nbsp;</td>
    </tr>
    <tr vAlign="top" align="center" bgColor="#ffffff">
      <td height="150"><table cellSpacing="0" cellPadding="0" width="800" border="0">
          <tr>
            <td width="149"><IMG height="53" src="Images/staff_004.gif" width="176"></td>
            <td background="Images/staff_008.gif">&nbsp;</td>
          </tr>
        </table>
        <br>
        <table cellSpacing="0" cellPadding="0" width="780" border="0">
          <tr>
            <td vAlign="top" align="center" width="150" height="200">&nbsp;
              <asp:image id="sBusinessPic" runat="server" ImageUrl="~/zUpload/stfData/MyPic_default.gif" Width="70px" Height="90px"></asp:image>
                </td>
            <td vAlign="top" align="center" width="1" bgColor="#999999" rowSpan="2"></td>
            <td vAlign="top" align="center" rowSpan="2"><table cellSpacing="1" cellPadding="0" width="600" border="0">
                <tr>
                  <td class="Bwhite" align="center" width="115" bgColor="#3a8bb1">���̵�</td>
                  <td width="482" align="left">&nbsp;
                    <asp:textbox id="sLoginID" runat="server" Width="80px" MaxLength="15" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator11" runat="server" 
                          ErrorMessage="���̵� ��������." ControlToValidate="sLoginID" Display="Dynamic">*</asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="revLoginID" runat="server" 
                          ErrorMessage="���̵�� �����ڷ� �����Ͽ� 3�� �̻� 15�� �����Դϴ�." ControlToValidate="sLoginID" 
                          ValidationExpression="[A-z]\w{2,15}" Display="Dynamic" 
                          SetFocusOnError="True">*</asp:regularexpressionvalidator>
                    <script type="text/javascript">
                        <!--
                        function ValidateLoginID()
	                    {       
		                    if (document.getElementById("<%= sLoginID.ClientID %>").value.length < 3)
		                    {
			                    alert("�˻��ϱ� ���ϴ� ID�� 3���̻� �Է��ϼ���.");
			                    return false;			                    
		                    }
		                    
		                    if(Tcheck(document.getElementById("<%= sLoginID.ClientID %>"), "�������̵�"))
			                    return false;
			                
			                return true;
	                    }    
	                    -->
                      </script><uc2:IDButton ID="ucLoginID" runat="server" /></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">��й�ȣ</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sLoginPW" runat="server" Width="80px" MaxLength="15" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator12" runat="server" ErrorMessage="�н����带 ��������." ControlToValidate="sLoginPW">*</asp:requiredfieldvalidator>
                    <asp:RegularExpressionValidator id="Regularexpressionvalidator4" runat="server" ErrorMessage="��ȣ�� ������� 4�� �̻� �Է��ϼ���."
											ControlToValidate="sLoginPW" ValidationExpression="\w{4,14}">*</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�Ҽ�</td>
                  <td style="HEIGHT: 29px" align="left">&nbsp;
                    <asp:dropdownlist id="position1" runat="server" Visible="False">
                      <asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
                    </asp:dropdownlist>                    
                    <asp:Literal ID="position" runat="server"></asp:Literal>
                      
                </tr>                    
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">���</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="staffNbr" runat="server" Width="80px" MaxLength="14" 
                          CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�μ�</td>
                  <td style="HEIGHT: 29px" align="left">&nbsp;
                    <asp:dropdownlist id="DeptName" runat="server">
                      <asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator10" runat="server" ErrorMessage="�μ��� �����ϼ���." ControlToValidate="DeptName">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" style="HEIGHT: 19px" align="center" bgColor="#3a8bb1">����/����</td>
                  <td style="HEIGHT: 19px" align="left">&nbsp;
                    <asp:dropdownlist id="sClass" runat="server">
                      <asp:ListItem Selected="True" Value="">8~�����ϼ���~8</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator9" runat="server" ErrorMessage="������ �����ϼ���." ControlToValidate="sClass">*</asp:requiredfieldvalidator>
                    /
                    <asp:textbox id="sLevel" runat="server" MaxLength="3" CssClass="box003" Visible="False" Columns="3"></asp:textbox>
                    <asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="0~250 ���� �ȿ��� �Է��ϼ���." ControlToValidate="sLevel"
											Type="Integer" MaximumValue="255" MinimumValue="0">*</asp:RangeValidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">������</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sName" runat="server" Width="80px" MaxLength="20" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="�̸��� �Է��ϼ���." ControlToValidate="sName">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">Ext # </td>
                  <td align="left">&nbsp;
                    <asp:textbox id="ExtNbr" runat="server" Width="50px" MaxLength="5" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" width="115" bgColor="#3a8bb1">������ȭ</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="phone1" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="phone2" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="phone3" runat="server" Width="70px" MaxLength="12" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�ڵ���</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="cellularP1" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="cellularP2" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="cellularP3" runat="server" Width="70px" MaxLength="12" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�����ּ�</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sEmail" runat="server" Width="184px" MaxLength="50" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="�̸����� �Է��ϼ���." ControlToValidate="sEmail">*</asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator3" runat="server" ErrorMessage="�̸����� ��Ȯ�� �Է��ϼ���." ControlToValidate="sEmail"
											ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:regularexpressionvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">Ȩ������</td>
                  <td align="left">&nbsp; http://
                    <asp:textbox id="homepage" runat="server" Width="176px" MaxLength="50" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�ֹι�ȣ</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="SSN1" runat="server" Width="98px" MaxLength="6" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="SSN2" runat="server" Width="104px" MaxLength="7" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="�ֹι�ȣ�� �Է��ϼ���." ControlToValidate="SSN1">*</asp:requiredfieldvalidator>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" ErrorMessage="�ֹι�ȣ�� �Է��ϼ���." ControlToValidate="SSN2">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">����</td>
                  <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="100"><asp:RadioButtonList ID="rblSLBirth" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem Value="��">���</asp:ListItem>
                            <asp:ListItem Value="��">����</asp:ListItem>
                          </asp:RadioButtonList></td>
                        <td><asp:TextBox ID="tbBirthDay" runat="server" CssClass="box003" MaxLength="10" 
                                Columns="9" ReadOnly="True"></asp:TextBox>
                            <uc1:dateselector id="dSelectorBirth" runat="server"></uc1:dateselector></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td class="Bwhite" style="HEIGHT: 19px" align="center" bgColor="#3a8bb1">��ȥ�����</td>
                  <td style="HEIGHT: 19px" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="100"><asp:radiobuttonlist id="rblMarried" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="��">��ȥ</asp:ListItem>
                            <asp:ListItem Value="��">��ȥ</asp:ListItem>
                          </asp:radiobuttonlist></td>
                        <td><asp:Panel id="pnWA" Runat="server">
                            <asp:textbox id="tbWeddingDay" runat="server" CssClass="box003" MaxLength="10" 
                                Columns="9" ReadOnly="True"></asp:textbox>
                            <uc1:dateselector id="dSelectorWedding" runat="server"></uc1:dateselector>
                            </asp:Panel></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�����(�Ի���)</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="joinDT" runat="server" MaxLength="10" CssClass="box003" Columns="9" ReadOnly="True"></asp:textbox>
                    <uc1:dateselector id="dSelectorJoinDay" runat="server"></uc1:dateselector></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�ξ���</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="subJobs" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�����ȣ</td>
                  <td align="left">&nbsp;
                    <asp:TextBox id="zipcode" runat="server" Width="60px" MaxLength="10" CssClass="box003" />
                      &nbsp;
                    <asp:hyperlink id="hlSeekAddr" runat="server" ImageUrl="/Admins/zImages/btn_post_search.gif" ToolTip="�����ȣã��" CssClass="ImgBtnAbsMiddle"/>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" ErrorMessage="�����ȣ�� ã������." ControlToValidate="zipcode">*</asp:requiredfieldvalidator>
                </td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">�ּ�           <td align="left">&nbsp;
                    <asp:textbox id="address1" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox>
                    <BR>
                    &nbsp;
                    <asp:textbox id="address2" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" ErrorMessage="�ּҸ� ��Ȯ�� �Է��ϼ���." ControlToValidate="address2">*</asp:requiredfieldvalidator></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td align="center">&nbsp;
              <asp:image id="sAvataImage" runat="server" Visible="False"></asp:image></td>
          </tr>
          <tr>
            <td colSpan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="Bbluetitle" align="center" bgColor="#eeeeee" height="30">�����̹���</td>
            <td colSpan="2" align="left">&nbsp;
            
              <input class="box003" id="btnBusinessPic" type="file" size="30" runat="server">
              <asp:checkbox id="cbKeepBP" runat="server" Visible="False" Text="���Ϻ���"></asp:checkbox>
              &nbsp;(70px*90px)</td>
          </tr>
          <asp:panel id="pnAvata" runat="server" Visible="False">
            <TR bgColor="#cccccc">
              <TD class="Bbluetitle" align="center" bgColor="#cccccc" height="30">�ƹ�Ÿ </TD>
              <TD colSpan="2">&nbsp;
                <INPUT language="C#" class="box003" id="btnAvataImage" type="file" size="30" runat="server">
                <asp:checkbox id="cbKeepAI" runat="server" Visible="False" Text="���Ϻ���"></asp:checkbox></TD>
            </TR>
            </asp:panel>
          <tr>
            <td class="Bbluetitle" align="center" bgColor="#eeeeee" height="30">������</td>
            <td colSpan="2" align="left">&nbsp;
              <INPUT language="C#" class="box003" id="btnData" type="file" size="30" runat="server">
              <asp:checkbox id="cbKeepData" runat="server" Visible="False" Text="���Ϻ���"></asp:checkbox></td>
          </tr>
          <tr vAlign="top">
            <td align="center" colSpan="3"><table cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr>
                  <td class="Bbluetitle">&nbsp;</td>
                </tr>
                <tr>
                  <td class="Bbluetitle" bgColor="#eeeeee" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� Ÿ</td>
                </tr>
                <tr>
                  <td vAlign="top" align="center" height="200"><div class="ContentBreak">
                      <asp:textbox id="mark" runat="server" Width="500px" MaxLength="2000" CssClass="box004" Rows="15" TextMode="MultiLine"></asp:textbox>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td align="center" bgColor="#ffffff" height="30">
        <asp:hyperlink id="hlList" runat="server" ImageUrl="/Adminp/zImages/btn_admin_list.gif" NavigateUrl="PtnList.aspx"/>
        <asp:hyperlink id="hlBack" runat="server" ImageUrl="/Adminp/zImages/btn_admin_back.gif" NavigateUrl="javascript:history.back();"/>
        <asp:ImageButton id="ibInsert" runat="server" ImageUrl="/Adminp/zImages/btn_admin_insert.gif" onclick="ibInsert_Click"/>
        <asp:ImageButton id="ibUpdate" runat="server" ImageUrl="/Adminp/zImages/btn_admin_update.gif" onclick="ibUpdate_Click"/>
        </td>
    </tr>
  </table>
  
   <asp:validationsummary id="ValidationSummary1" runat="server" Width="163px" Height="17px" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary>
    </form>
    <!--div id="joiningWebService" style="BEHAVIOR--: url(/CommonLibrary/WebServices/webservice.htc)"></div-->
</body>
</html>
