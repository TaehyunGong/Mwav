using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using JinsLibrary;
using JinsLibrary.LIST;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;
using App_Code.Partners.Staff; //������ �ƴ�
using App_Code.CompanyMgr.Staff;


namespace PARTNER
{
    public partial class Adminp_Partners_PtnList : System.Web.UI.Page
    {
        private string tableName = "t_Staff", whereClause;
        private string orderBy, subQryOrderBy, whichSRD;

        //public static int SelMenuValue = 3;
        //protected System.Web.UI.WebControls.Panel pnModifyDelete;



        protected void Page_Load(object sender, EventArgs e)
        {
            //�α��εǾ����� Ȯ��
            App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();

            //������Ÿ��Ʋ����
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("_ptl");

            if (!Page.IsPostBack)
            {
                //���� �������� �����մϴ�.      -1
                Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
                //�����ʱ�ȭ
                InitializeSetting();
                //���ǹ� ���� //Order By����
                SetCondition();
                //�����͹��̵�
                this.StaffListBind();
            }
        }

        public string SearchResultDisplay(string srdMsg)
        {
            if (srdMsg != "")
                srdMsg = "�˻���� : '<b>" + srdMsg + "</b>'�� �˻��� ����Դϴ�.<br>";
            srdMsg += "���ı��� : '<b>" + ddlSearch.SelectedItem.Text + "</b>'������ ���ĵǾ����ϴ�.";
            return srdMsg;
        }

        private void InitializeSetting()
        {
            //�޴�������
            SelMenuBind();
            //�����Է� ��ũ���ε�
            URLQuery.Self["mode"] = "i";
            this.hlInsert.NavigateUrl = "PtnForm.aspx?" + URLQuery.Self.GetQueryString();
            //���� ����� �ٽ� ä���־�~
            URLQuery.Self.Remove("mode");
            URLQuery.Self.Remove("sfID");
            //�ʱ� �޸� ���� ������ ����(���������� ����)
            GetQueryString();
            //print area
            this.hlPrint.NavigateUrl = "javascript:GetPrint('print_area');";
        }
        private void SetQueryString()
        {
            URLQuery.Self["cp"] = Paging.Self.CP;
            URLQuery.Self["smv"] = this.ddlSelMenu.SelectedValue;
            URLQuery.Self["srch"] = this.ddlSearch.SelectedValue;
            URLQuery.Self["sval"] = this.tbSearchString.Text;
        }
        private void GetQueryString()
        {
            //whichSRD
            if (Request.QueryString["srd"] != null)
                this.whichSRD = Request.QueryString["srd"];
            //���Լ��ø޴�
            if (Request.QueryString["smv"] != null)
                this.ddlSelMenu.SelectedValue = Request.QueryString["smv"];
            //ddlSearch���ø޴�
            if (Request.QueryString["srch"] != null)
                this.ddlSearch.SelectedValue = Request.QueryString["srch"];
            //tbSearchString �� ����
            this.tbSearchString.Text = Request.QueryString["sval"];
        }

        //�޴����ø���Ʈ ���ε�
        protected void SelMenuBind()
        {
            if (Session["DeptName"].ToString() == "����")
            {
                JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, "�������", "0");
            }
        }

        #region ��������Ʈ ���ε�
        protected void StaffListBind()
        {
            DBLib dbUtil = new DBLib();
            //�������������ʱ�ȭ
            int topCnt;
            topCnt = Paging.Self.PageSize(20);
            string fieldNames, whereClause;
            fieldNames = "staff_id,sLoginID,staffNbr,sName,DeptName,sClass,phone,cellularP,sEmail,sBusinessPic,sLevel";
            whereClause = this.whereClause;

            //Response.Write("whereClause :" + whereClause + "<br>");
            //�ѷ��ڵ�� ����
            Paging.Self.TotRecordCount = dbUtil.GetRecordCount(this.tableName, whereClause);

            //������� ����, AbsolutePage�� ���� ��Ȱ�� �Ѵ�. �� �������� ������ �����ؾ� �Ѵ�//Paging.Self.SetPagePortion();
            //������������
            SqlDataReader drStaff = dbUtil.Select_DR(topCnt, fieldNames, this.tableName, whereClause, this.orderBy, Paging.Self.SetPagePortion(), this.subQryOrderBy);

            if (drStaff.HasRows)
            {
                this.dataList.DataSource = drStaff;
                this.dataList.DataBind();		//���ε��ϱ� ���� drStaff.Read();���� ����.

                //������� ������� �־����� �־�����
                dataList.Visible = true;
                litPaging.Visible = true;
                ucMessage.Visible = false;
                ibSendMail.Visible = true;
                hlPrint.Visible = true;
            }
            else
            {
                //������� ������� �־����� �־�����
                dataList.Visible = false;
                litPaging.Visible = false;
                ibSendMail.Visible = false;
                hlPrint.Visible = false;
                //����������Ʈ�� ���ε�
                Literal lit = (Literal)ucMessage.FindControl("litMsg");
                Literal litDetails = (Literal)ucMessage.FindControl("litDetails");
                lit.Text = "�ڷᰡ �����ϴ�.";
                if (Page.IsPostBack)
                {
                    litDetails.Text = ddlSelMenu.SelectedItem.Text + "�� ";
                    if (this.tbSearchString.Text != "")
                        litDetails.Text += "'" + this.ddlSearch.SelectedItem.Text + "'���� '<b>"
                            + this.tbSearchString.Text + "</b>'���� ";
                    litDetails.Text += "�˻�����Դϴ�.";
                }
                ucMessage.Visible = true;
            }
            drStaff.Close();
            dbUtil.SqlConnection.Close();
        }
        #endregion
        private void SetCondition()
        {
            this.whereClause = "(retireDT Is Null OR retireDT = '') AND position=" + Cookie.Self["position"]; // StfBaseLib.Self.GetSelMenuQuery(ddlSelMenu.SelectedValue);
            if (tbSearchString.Text != "")
            {
                string search = "";
                tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);
                switch (ddlSearch.SelectedItem.Value)
                {
                    case "sName":
                    case "sClass":
                        search = " LIKE '" + tbSearchString.Text + "%'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "sLoginID":
                    case "staffNbr":
                        search = "='" + tbSearchString.Text + "'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "DeptName":
                        search = " LIKE '%" + tbSearchString.Text + "%'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    //case "DeptName":
                    //	search = "=" + tbSearchString.Text;
                    //	break;
                    //	case "DeptID":
                    //	string deptID = StfBaseLib.GetDeptID(tbSearchString.Text);
                    //	if(deptID != null)
                    //	search = " = " + deptID;
                    //	else
                    //	search = " Is Null";
                    //	this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                    //	JinsLibrary.WebUtil.CurrentResponse.Write("������= " +this.whereClause + "<br>");
                    //	JinsLibrary.CommonLib.WebUtil.CurrentResponse.End();
                    //	break;
                    default:
                        Response.Write("chaos:" + ddlSearch.SelectedItem.Value);
                        break;
                }
                this.whichSRD = "w";
            }
            else
            {
                this.whichSRD = "o";
            }
            this.SetOrderBy();
            //SearchResultDisplay();
            //���Ϸ� ������ ���� ����
            ViewState["whereClause"] = this.whereClause;
        }
        //���ı����̴�.
        private void SetOrderBy()
        {
            switch (ddlSearch.SelectedItem.Value)
            {
                case "sName":
                    this.orderBy = "sName ASC, staff_id ASC";
                    this.subQryOrderBy = "sName DESC, staff_id DESC";		//orderBy�� �ݴ�
                    break;
                case "sClass":
                    this.orderBy = "sLevel DESC, staff_id ASC";
                    this.subQryOrderBy = "sLevel ASC, staff_id DESC";		//orderBy�� �ݴ�
                    break;
                case "sLoginID":
                    this.orderBy = "sLoginID ASC, staff_id ASC";
                    this.subQryOrderBy = "sLoginID DESC, staff_id DESC";		//orderBy�� �ݴ�
                    break;
                case "staffNbr":
                    this.orderBy = "staffNbr ASC, staff_id ASC";
                    this.subQryOrderBy = "staffNbr DESC, staff_id DESC";		//orderBy�� �ݴ�
                    break;
                case "DeptName":
                    this.orderBy = "DeptName ASC, staff_id ASC";
                    this.subQryOrderBy = "DeptName DESC, staff_id DESC";		//orderBy�� �ݴ�
                    break;
                default:
                    goto case "sName";
            }
        }

        protected void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //������ ��ȣ�� �����ؾ� ������ �ȳ�.
            URLQuery.Self.Remove("cp");
            URLQuery.Self["cp"] = "1";
            Paging.Self.SetCurrentPage(1);

            //�޴����� ����ƽ����
            //SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);

            SetCondition();
            StaffListBind();
            //������ �̺�Ʈ����Ǹ� ȥ��
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void tbSearchString_TextChanged(object sender, System.EventArgs e)
        {
            //������ ��ȣ�� �����ؾ� ������ �ȳ�.
            Paging.Self.SetCurrentPage(1);

            SetCondition();
            StaffListBind();
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void btnSearch_Click(object sender, System.EventArgs e)
        {
            //������ ��ȣ�� �����ؾ� ������ �ȳ�.
            Paging.Self.SetCurrentPage(1);

            SetCondition();
            StaffListBind();
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
        }

        protected string ZoomWindowOpen(object sBusinessPic)
        {
            if (sBusinessPic.ToString() != "")
                return "javascript:ZoomWindowOpen(\"" + SystemConfig.GetValue("StaffUploadDir") + sBusinessPic + "\",\"��������\",\"\");";
            else
                return "javascript:";
        }
        private void ibSendMail_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            //Response.Write("where = " + tableName + ";" + ViewState["whereClause"] );
            Session.Add("whereClause", ViewState["whereClause"]);
            Response.Redirect("../../Mine/Mail/MailForm.aspx?t=stf");
        }

        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //((Literal)e.Item.FindControl("litIDX")).Text = e.Item.ItemIndex.ToString();
                //���ϸ�ũ
                HyperLink hlEmail = (HyperLink)e.Item.FindControl("hlEmail");
                string strSendonemail = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(3) + " <" + hlEmail.Text + ">;";
                hlEmail.NavigateUrl = "../../Mine/Mail/MailForm.aspx?s=" + strSendonemail;

                //����ǥ��
                Literal displayNone = (Literal)e.Item.FindControl("displayNone");

                URLQuery.Self["sfID"] = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(0).ToString();
                if (PtnBaseLib.Self.Modify(URLQuery.Self["sfID"]))
                {
                    //�����ư
                    //HyperLink hlView = (HyperLink)e.Item.FindControl("hlView");
                    //hlView.NavigateUrl = "StfView.aspx?" + URLQuery.Self.GetQueryString();
                    //hlView.Visible = true;
                    //������ư
                    ImageButton ibUpdate = (ImageButton)e.Item.FindControl("ibUpdate");
                    //�̷��� ���ʿ� ����???ibUpdate.Attributes["onClick"] = "return ConfirmJ('�����Ͻðڽ��ϱ�?');";
                    ibUpdate.ToolTip = "�����ϱ�";
                    ibUpdate.Visible = true;

                    displayNone.Visible = false;
                }
                else
                {
                    displayNone.Visible = true;
                }


            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                Literal litSearchResult = (Literal)e.Item.FindControl("litSearchResult");
                Literal litListBrief = (Literal)e.Item.FindControl("litListBrief");

                litSearchResult.Text = 
                    this.SearchResultDisplay(this.tbSearchString.Text);
                litListBrief.Text = Paging.Self.ListSummary;
                //���� ���°� �޸𸮷� �ø�(���������� ����)
                SetQueryString();
                #region ����¡��ɱ���
                Paging.Self.Init_Violet();
                this.litPaging.Text = Paging.Self.GeneratePaging();
                #endregion
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                //����¡����� ���⿡ �����Ǿ�� �ϳ� �������̽��� �����Ƿ� ������� ����
                //Literal litPaging = (Literal)e.Item.FindControl("litPaging");
            }
        }

        protected void dataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                //dlFiles.EditItemIndex = -1;
                //dlFiles.SelectedIndex = e.Item.ItemIndex;
                if (PtnBaseLib.Self.Modify(e.CommandArgument.ToString()))
                {
                    URLQuery.Self["mode"] = "u";
                    URLQuery.Self["sfID"] = e.CommandArgument.ToString();
                    Response.Redirect("PtnForm.aspx?" + URLQuery.Self.GetQueryString());
                }
                else
                    Response.Redirect(PtnBaseLib.Self.baseDirPath + "PtnfList.aspx");
            }
        }
    }
}