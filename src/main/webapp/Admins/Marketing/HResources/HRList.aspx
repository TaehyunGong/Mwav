<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HRList.aspx.cs" Inherits="ADMIN.Admins_Marketing_HResources_HRList" %>

<%@ Register Src="~/MessageView/AdminMessage.ascx" TagName="AdminMessage" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" />

    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>

    <title>The Human Resources Management</title>
</head>
<body>
    <form id="frmHRList" runat="server">
    <table cellspacing="0" cellpadding="0" width="815" border="0">
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td width="26"><img height="27" src="../../zImages/admin_top009.gif" width="26" /></td>
                        <td bgcolor="#f4f4f4">������ġ : 
                      <asp:Literal ID="litPageTitle" runat="server" /></td>
                        <td width="10"><img height="27" src="../../zImages/admin_top010.gif" width="10" /></td>
                    </tr>
              </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="20">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                
            </td>
            <td>
                <table id="Table5" cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff"
                    border="0">
                    <tr>
                        <td valign="top" align="center" height="300">
                            <table height="49" cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td width="204"><img height="49" src="Images/HResource_001.gif" width="204" /></td>
                                    <td background="Images/HResource_002.gif">
                                        <table id="Table1" cellspacing="0" cellpadding="0" width="98%" border="0">
                                            <tr>
                                                <td valign="bottom" align="right" colspan="3" height="25">
                                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlSearch" runat="server" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                                                    <asp:ListItem Value="bcCompany" Selected="True">ȸ���</asp:ListItem>
                                                                    <asp:ListItem Value="bcDept">�μ���</asp:ListItem>
                                                                    <asp:ListItem Value="bcClass">���޸�</asp:ListItem>
                                                                    <asp:ListItem Value="bcName">�̸�</asp:ListItem>
                                                                    <asp:ListItem Value="bcCellP">�ڵ�����ȣ</asp:ListItem>
                                                                    <asp:ListItem Value="bcPhone">������ȣ</asp:ListItem>
                                                                    <asp:ListItem Value="bcHomepage">Ȩ������</asp:ListItem>
                                                                    <asp:ListItem Value="bcEmail">�̸���</asp:ListItem>
                                                                    <asp:ListItem Value="bcGroup">�����׷�</asp:ListItem>
                                                                    <asp:ListItem Value="sName">�����̸�</asp:ListItem>
                                                                    <asp:ListItem Value="bcAGroup">�����׷�</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:TextBox ID="tbSearchString" runat="server" Height="20px" ToolTip="�˻� Ű���带 ��������."
                                                                    MaxLength="8" Width="100px" OnTextChanged="tbSearchString_TextChanged"></asp:TextBox>
                                                                <asp:Button ID="btnSearch" runat="server" Height="23px" Text="�˻�" EnableViewState="False">                                                                </asp:Button>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableViewState="False"
                                                                    Display="Dynamic" ValidationExpression="[0-9A-Za-z\uac00-\ud7a3]{2,10}" ErrorMessage="*"
                                                                    ControlToValidate="tbSearchString">*����,Ư�����ڸ� ������ �α��� �̻��� �Է��ϼ���.</asp:RegularExpressionValidator>
                                                            </td>
                                                            <td align="right">
                                                                <asp:DropDownList ID="ddlSelMenu" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSelMenu_SelectedIndexChanged">
                                                                    <asp:ListItem Value="all" Selected="True">��ü�����ڷ�</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="8"><img height="49" src="Images/HResource_003.gif" width="8" /></td>
                                </tr>
                          </table>
                            <asp:DataList ID="dataList" runat="server" OnItemDataBound="dataList_ItemDataBound"
                                OnItemCommand="dataList_ItemCommand">
                                <HeaderTemplate>
                                    <table cellspacing="0" cellpadding="0" width="800" height="30" border="0">
                                        <tr>
                                            <td height="20">
                                            </td>
                                            <td valign="bottom" align="left">
                                                <asp:Literal ID="litSearchResult" runat="server"></asp:Literal>
                                                &nbsp;
                                            </td>
                                            <td valign="bottom" align="right">
                                                <asp:Literal ID="litListBrief" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellspacing="1" cellpadding="2" width="800" border="0" bgcolor="#eeeeee">
                                        <tr align="center" bgcolor="#3a8bb1">
                                            <td width="65" height="25" bgcolor="#3a8bb1" class="Bwhite">
                                                ����ID
                                            </td>
                                            <td width="100" class="Bwhite">
                                                �������б׷�
                                            </td>
                                            <td width="70" class="Bwhite">
                                                �������
                                            </td>
                                            <td class="Bwhite">
                                                ȸ���
                                            </td>
                                            <td width="90" class="Bwhite">
                                                �μ���
                                            </td>
                                            <td width="90" class="Bwhite">
                                                �̸�/����
                                            </td>
                                            <td width="120" class="Bwhite">
                                                ������ȣ
                                            </td>
                                            <td width="100" class="Bwhite">
                                                �����޴�
                                            </td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table width="800" cellpadding="2" cellspacing="1" border="0">
                                        <tr align="center">
                                            <td width="65" height="40" align="center">
                                                <%# DataBinder.Eval(Container.DataItem, "bc_id") %>
                                            </td>
                                            <td width="100" align="center">
                                                <asp:Label ID="lbGroup" runat="server"></asp:Label>
                                            </td>
                                            <td width="70" align="center">
                                                <asp:Label ID="lbSManager" runat="server"></asp:Label>
                                            </td>
                                            <td align="center">
                                                <asp:HyperLink ID="hlComp_url" runat="server" />
                                            </td>
                                            <td width="90">
                                                <%# DataBinder.Eval(Container.DataItem, "bcDept") %>
                                            </td>
                                            <td width="90" align="center">
                                                <asp:Label ID="lbManager" runat="server"></asp:Label>
                                            </td>
                                            <td width="120">
                                                <%# DataBinder.Eval(Container.DataItem, "bcPhone") %>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "bcCellP") %>
                                            </td>
                                            <td width="100" align="center">
                                                <asp:ImageButton ID="ibSendOneMail" runat="server" ImageUrl="../../zImages/btn_admin_mail.gif" />
                                                <asp:HyperLink ID="hlView" runat="server" ToolTip="���뺸��" ImageUrl="../../zImages/btn_admin_view.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="800" cellpadding="0" cellspacing="0" bgcolor="#cccccc">
                                        <tr>
                                            <td height="1">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <AlternatingItemStyle BackColor="#e9e9e9"></AlternatingItemStyle>
                            </asp:DataList>
                            <uc1:AdminMessage ID="ucMessage" runat="server" />
                            <table cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td align="center" height="50">&nbsp;
                                        
                                  </td>
                                    <td align="center" height="50">
                                        <asp:Literal ID="litPaging" runat="server"></asp:Literal>
                                    </td>
                                    <td align="center" height="50">
                                        <asp:HyperLink ID="hlAllList" runat="server" NavigateUrl="HRList.aspx" ImageUrl="../../zImages/btn_view_list.gif"></asp:HyperLink>
                                        <asp:ImageButton ID="ibSendMail" runat="server" AlternateText="���Ϲ߼�" ImageUrl="../../zImages/btn_send_mail.gif"
                                            OnClick="ibSendMail_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                
            </td>
            <td>&nbsp;
                
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
