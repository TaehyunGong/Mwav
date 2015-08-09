using System;
using System.Web;
using System.Collections;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;

using MiddleTier.Member.Basic;
using MiddleTier.Member.Option;
using MiddleTier.Member.Value;

namespace KistelSite.CommonApps.MemberShip
{
	
	/// <summary>
	/// MbrBaseLib�� ���� ��� �����Դϴ�.      /// ���μ����� ���ٸ� �̰� �ʿ��Ѱ�?
	/// </summary>
	public class MbrShipBaseLib 
	{
		private MbrBasicBiz mbb;
		private MbrOptionBiz mob;
		private MbrValueBiz mvb;
/*		
		
		/// <summary>
		/// Member update to the status of deletion.
		/// </summary>
		/// <param name="member_id">member_id pk</param>
		public void DeleteMember(string member_id)
		{
			mbb.DeleteMember(member_id);
		}

		/// <summary>
		/// Delete a member data for good.
		/// </summary>
		/// <param name="member_id">member_id pk</param>
		public void EliminateMember(string member_id)
		{
			//avataImage image moving, delete all related tables.
			mob.MbrAvataImageMoveTo(member_id);
			mbb.EliminateMember(member_id);
			//HttpContext.Current.Response.Redirect(whichList + "?" + URLQuery.Self.GetQueryString());
		}


		











		private static DBLib dbUtil;
		private static string whichList = "";

		
		//ȸ�������� ����
		public static void DeleteMember(string mode, string member_id)
		{
			dbUtil = new DBLib();
			//(������ ������Ʈ)
			if(mode == "d") 
			{
				string[] setNameValue = new string[2] 
				{ "leaveDT=GetDate()", "IPaddress = '" + WebUtil.CurrentRequest.UserHostAddress  + "_" + Cookie.Self["sLoginID"] + "'" };
				dbUtil.Update_EN("t_MemberValue", setNameValue , "member_id = " + member_id);
			} else if(mode == "dd") //�Խù� ��������(��������)
			{				
				//MbrFilesMoveTo(member_id, dbUtil.Select_DR("avataImage","t_MemberOption","member_id=" + member_id));
				dbUtil.Delete_EN("t_MemberJob", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberOption", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberValue", "member_id = " + member_id);
				dbUtil.Delete_EN("t_Members", "member_id = " + member_id);
			}
			dbUtil.SqlConnection.Close();
			URLQuery.Self.Remove("mode");
			HttpContext.Current.Response.Redirect(whichList + "?" + URLQuery.Self.GetQueryString());
		}

*/


























		/*
		//ȸ�������� �������� ����(�����̵�) 
		public static void MbrFilesMoveTo(string member_id, SqlDataReader dr)
		{
			string avataImage = dr[0].ToString();
			//�����̹��� �̵�
			if(avataImage != "")
				FileLib.Self.FileMoveTo(SystemConfig.GetValue("MemberPicUploadDir") + avataImage, SystemConfig.GetValue("MemberPicUploadDir") + "Avata.bak/" + avataImage);
		}
		//���̵� �ߺ�Ȯ��
		public static bool LoginID_Exist(string loginID)
		{
			string member_id = GetMember_id(loginID);
			if(member_id == null)
				return false;		//�⺻������ �α��� ���̵� ����.
			else
			{
				if(IsMemberLeaved(member_id))
					return false;		//ȸ���� �������Ƿ� ���̵� ��밡��
				else
					return true;		//���̵����ϴ� ȸ�� ����.
			}
		}
		*/
		//Ż��ȸ���ΰ� Ȯ��
//		public static bool IsMemberLeaved(string member_id)
//		{
//			dbUtil = new DBLib();
//			if(dbUtil.GetRecordCount("t_MemberValue", "member_id='" + HTML.ReplaceToDB(member_id) + "' AND leaveDT IS NULL") > 0)
//			{
//				//DB�ݱ�
//				dbUtil.SqlConnection.Close();
//				return false;
//			}
//			else
//				return true;
//		}
		/*
		//member_id �޾Ƽ� ȸ�����̵� ����
		public static string GetLoginID(object member_id)
		{
			string loginID = "NoData";
		//HttpContext.Current.Response.Write(member_id + "<br>");
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("loginID","t_Members", "member_id= "+ member_id ); //System.Convert.ToInt16
			if(dr.Read()) 
			{
				loginID = dr["loginID"].ToString(); 				
			}
			dr.Close();
			return loginID;
		}
		//member_id �޾Ƽ� ȸ���̸� ����
		public static string GetMbrName(object member_id)
		{
			string MbrName = "";
			//HttpContext.Current.Response.Write(member_id + "<br>");
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("sName", "t_Members", "member_id="+ member_id );
			if(dr.Read()) 
			{
				MbrName = dr["sName"].ToString(); 				
			}
			dr.Close();
			return MbrName;
		}
		
		//LoginID �޾Ƽ� member_id ����
		public static string GetMember_id(object loginID)
		{
			string member_id = null;
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", "loginID= '" + loginID + "'"); //System.Convert.ToInt16
			while(dr.Read()) 
			{	
				//����� ���� ����.
				member_id += dr["member_id"].ToString() + "\n";
			}
			//DataReader�� DBConnection�ݱ�
			dr.Close();			
			dbUtil.SqlConnection.Close();
			if(member_id != null)
				member_id = member_id.Substring(0,member_id.Length-1);
	//HttpContext.Current.Response.Write("member_id = " + member_id + "<br>");
			return member_id;
		}
		public static SqlDataReader GetMember_idFromLoginID(string loginID, bool isActiveMbr)
		{
			string whereClause = "loginID LIKE '%" + loginID + "%'";
			if(isActiveMbr)
				whereClause += " AND (retireDT Is Null OR retireDT = '')";
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", whereClause); 
			//�������� ���ɼ� ������ dr�� �ѱ�.
			return dr; //�޴� �ʿ��� �ݾ� ��� ��.
		}	
		public static SqlDataReader GetMember_idFromName(string MbrName, bool isActiveMbr)
		{
			string whereClause = "MbrName LIKE '%" + MbrName + "%'";
			if(isActiveMbr)
				whereClause += " AND (retireDT Is Null OR retireDT = '')";
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", whereClause); 
			//�������� ���ɼ� ������ dr�� �ѱ�.
			return dr; //�޴� �ʿ��� �ݾ� ��� ��.
		}
	
		//���� ȸ������
		public static string GetTotalMemberInfo()
		{
			return Cookie.Self["sName"] + "(" + Cookie.Self["loginID"] + ")";
		}

		public static string GetTotalMemberInfo(object member_id)
		{
			return GetMbrName(member_id) + "(" + GetLoginID(member_id) + ")";
		}


		//ddlSelMenu ���ÿ� ���� where ������ ����
		public static string GetSelMenuQuery(string selMenuValue)
		{
			string selMenuQuery = "";
			switch(selMenuValue)
			{ 
				case "255" :	//��ȸ��
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '')";
					break;
				case "101" :	//����
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=101";
					break;				
				case "5" :		//�ֿ��(�÷�Ƽ��)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=5";
					break;
				case "4" :		//�ֿ��(���)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=4";
					break;
				case "3" :		//�ֿ��(�ǹ�)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=3";
					break;
				case "2" :		//���ȸ��
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=2";
					break;	
				case "1" :		//��ȸ��
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=1";
					break;
				case "0" :		//�ҷ�ȸ��
					selMenuQuery = "mLevel=0";
					break;
				case "-1" :		//���ȸ��
					selMenuQuery = "(leaveDT Is NOT Null)";
					break;
				default:
					goto case "255";
			}
			return selMenuQuery;
		}
		//ddlSelMenu ���°� ���̺�
		public string GetStatusText(object ddlValue)
		{
			string returnValue = "";
			switch(ddlValue.ToString())
			{ 
				case "255" :	//��ȸ��
					returnValue = "��ȸ��";
					break;
				case "101" :	//����
					returnValue = "����";
					break;				
				case "5" :		//�ֿ��(�÷�Ƽ��)
					returnValue = "�ֿ��(�÷�Ƽ��)";
					break;
				case "4" :		//�ֿ��(���)
					returnValue = "�ֿ��(���)";
					break;
				case "3" :		//�ֿ��(�ǹ�)
					returnValue = "�ֿ��(�ǹ�)";
					break;
				case "2" :		//���ȸ��
					returnValue = "���ȸ��";
					break;	
				case "1" :		//��ȸ��
					returnValue = "��ȸ��";
					break;
				case "0" :		//�ҷ�ȸ��
					returnValue = "�ҷ�ȸ��";
					break;
				case "-1" :		//���ȸ��
					returnValue = "���ȸ��";
					break;
				default:
					returnValue = "Error";
					break;
			}
			return returnValue;			
		}

		public string GetNewsLetterText(object newsLetter)
		{
			return JinsLibrary.Text.BoolToYesNo(newsLetter);
		}

		public string GetMonthlyPayText(object monthlyPay)
		{
			if(monthlyPay.ToString() != "")
			{
				SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList("MonthlyPay.resx");
				//if(mySL.ContainsKey(drMember["monthlyPay"]))
				return mySL[ Convert.ToInt16(monthlyPay) ].ToString();
			}
			else
				return "";
		}
		public string GetCarInfoText(object carInfo)
		{
			if(carInfo.ToString() != "")
			{
				SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList("CarInfo.resx");
				//if(mySL.ContainsKey(drMember["monthlyPay"]))
				return mySL[ Convert.ToInt16(carInfo) ].ToString();
			}
			else
				return "";
		}
		public string GetWhichList(string ml)
		{
			whichList = "";
			switch(ml)
			{
				case ""	   :		//ȸ���⺻����Ʈ
				case "bsc" :	
					whichList = "MbrList.aspx";
					break;
				case "opt" :		//ȸ���ΰ�����Ʈ
					whichList = "MbrOptList.aspx";
					break;
				case "val" :		//ȸ���򰡸���Ʈ
					whichList = "MbrValList.aspx";
					break;
				default:
					goto case "bsc";
			}
			URLQuery.Self.Remove("ml");
			return whichList;	
		}

		public static void Modify(string member_id)
		{
			URLQuery.Self["mode"] = "u";
			URLQuery.Self["mbID"] = member_id;
			WebUtil.CurrentResponse.Redirect("MbrForm.aspx?"+ URLQuery.Self.GetQueryString());
		}
		public static void Delete(string member_id)
		{
			DeleteMember("d", member_id);
		}
		public static void Eliminate(string member_id)
		{
			DeleteMember("dd", member_id);
		}

		//CanView + CanModify = CanAccess;	CanView + CanModify + CanDelete = CanAllAccess
		public static Boolean CanAccess(string leaveDT)
		{
			if(Cookie.Self["DeptName"] == "��ȹ/����" && leaveDT == "")
				return true;
			else
				return false;
		}		
		public static Boolean CanDelete(string member_id)
		{
			if(CanAccess(string.Empty) && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30)
				return true;
			else
				return false;
		}
		//������Ʈ�ѿ� "����"�� ǥ���Ҷ�
		public bool DisplayNone(bool hlView, bool ibModfy)
		{
			if(hlView || ibModfy)
			{
				return false;
			}
			else
				return true;
		}

		*/
		public MbrShipBaseLib()
		{
			mbb = new MbrBasicBiz();
			mob = new MbrOptionBiz();
			mvb = new MbrValueBiz();		
		}
		
	}
}
