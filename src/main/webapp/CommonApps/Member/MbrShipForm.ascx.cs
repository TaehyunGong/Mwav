namespace KistelSite.CommonApps.MemberShip
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Collections;

	using JinsLibrary;
	using JinsLibrary.CONFIG;
	using JinsLibrary.CONTROL;	
	using JinsLibrary.STATEMANAGE;

	using MiddleTier.Member;


	/// <summary>
	///		MbrShipForm�� ���� ��� �����Դϴ�.
	/// </summary>
	public class MbrShipForm : System.Web.UI.UserControl
	{
		private MbrBaseLib mbl;
		private DBLib dbUtil;
		private string mId; 
		protected System.Web.UI.UserControl	DateSelector1;
		protected System.Web.UI.UserControl	DateSelector2;

		protected System.Web.UI.WebControls.TextBox phone;
		protected System.Web.UI.WebControls.TextBox findingA;
		protected System.Web.UI.WebControls.TextBox mark;
		protected System.Web.UI.WebControls.TextBox company;
		protected System.Web.UI.WebControls.TextBox officeP;
		protected System.Web.UI.WebControls.ImageButton ibInsert;
		protected System.Web.UI.WebControls.ImageButton ibUpdate;
		protected System.Web.UI.WebControls.HyperLink hlList;
		protected System.Web.UI.WebControls.HyperLink hlBack;
		protected System.Web.UI.WebControls.Label member_id;
		protected System.Web.UI.WebControls.HyperLink hlSeekAddr;
		protected System.Web.UI.WebControls.DropDownList findingID;
		protected System.Web.UI.WebControls.RegularExpressionValidator revLoginID;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator11;
		protected System.Web.UI.HtmlControls.HtmlInputButton bnLoginID;
		protected System.Web.UI.WebControls.TextBox loginID;
		protected System.Web.UI.WebControls.RegularExpressionValidator Regularexpressionvalidator4;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator12;
		protected System.Web.UI.WebControls.TextBox loginPW;
		protected System.Web.UI.WebControls.TextBox MbrName;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator4;
		protected System.Web.UI.WebControls.TextBox MbrEmail;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator6;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.TextBox SSN2;
		protected System.Web.UI.WebControls.TextBox SSN1;
		protected System.Web.UI.HtmlControls.HtmlInputButton btnSSN;
		protected System.Web.UI.WebControls.CheckBox newsLetter;
		protected System.Web.UI.WebControls.TextBox homepage;
		protected System.Web.UI.WebControls.TextBox MsgName;
		protected System.Web.UI.WebControls.CheckBoxList hobbies;
		protected System.Web.UI.WebControls.DropDownList carInfo;
		protected System.Web.UI.WebControls.TextBox children;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.CheckBox cbDeleteAI;
		protected System.Web.UI.HtmlControls.HtmlInputFile bnAvataImage;
		protected System.Web.UI.WebControls.DropDownList monthlyPay;
		protected System.Web.UI.WebControls.TextBox MsgID;
		protected System.Web.UI.WebControls.TextBox rcmderID;
		protected System.Web.UI.WebControls.RegularExpressionValidator revRcmderID;
		protected System.Web.UI.HtmlControls.HtmlInputButton bnRcmderID;
		protected System.Web.UI.WebControls.HyperLink hlSeekOAddr;
		protected System.Web.UI.WebControls.TextBox mZipcode;
		protected System.Web.UI.WebControls.TextBox mAddress1;
		protected System.Web.UI.WebControls.TextBox mAddress2;
		protected System.Web.UI.WebControls.TextBox oAddress1;
		protected System.Web.UI.WebControls.TextBox oAddress2;
		protected System.Web.UI.WebControls.TextBox oZipcode;
		protected System.Web.UI.WebControls.Image avataImage;
		protected System.Web.UI.WebControls.TextBox tbBirthDay;
		protected System.Web.UI.WebControls.RadioButtonList rblSLBirth;
		protected System.Web.UI.WebControls.RadioButtonList rblMarried;
		protected System.Web.UI.WebControls.TextBox tbWeddingDay;
		protected System.Web.UI.WebControls.DropDownList jobType;
		protected System.Web.UI.WebControls.TextBox cellularP3;
		protected System.Web.UI.WebControls.TextBox cellularP2;
		protected System.Web.UI.WebControls.DropDownList cellularP1;
		protected System.Web.UI.WebControls.Literal mLevel;
		protected System.Web.UI.WebControls.Literal howMany;
		protected System.Web.UI.WebControls.Literal howMuch;
		protected System.Web.UI.WebControls.Literal RFundAC;
		protected System.Web.UI.WebControls.Literal RFund;
		protected System.Web.UI.WebControls.Literal pointAC;
		protected System.Web.UI.WebControls.Literal point;
		protected System.Web.UI.WebControls.Literal unpaid;
		protected System.Web.UI.WebControls.Literal unpaidAC;
		protected System.Web.UI.WebControls.Literal joinDT;
		protected System.Web.UI.WebControls.Literal recentLogin;
		protected System.Web.UI.WebControls.Literal IPaddress;
		protected System.Web.UI.WebControls.Literal leaveDT;
		protected System.Web.UI.WebControls.Literal modifyDT;
		

		#region �ڹٽ�ũ��Ʈ
		private string joiningWebServiceBehaviorScript = @"
<script language=""javascript"">
	<!--
		var iCallID;
		var processedID, processedDong;
		var dongInputEntered = false;

		function _joiningWebServiceInit()
		{{
			joiningWebService.useService(""../../CommonLibrary/WebServices/WebService.asmx?WSDL"",""wService"");
		}}


		function _CallIDDupCheck(inputID)
		{{
			//alert(document.getElementById('{1}').value);
			if (document.getElementById('{1}').value.length < 3)
			{{
				alert(""�˻��ϱ� ���ϴ� ID�� 3���̻� �Է��ϼ���."");
				return;
			}}
			if(Tcheck(document.getElementById('{1}'), ""ȸ�����̵�""))
				return;

			document.getElementById('marqeeIdCheckWaitMag').style.display = """";
			iCallID = joiningWebService.wService.callService(_UserIDCheckResults, ""MbrIDDuplicationCheck"", inputID);
			processedID = inputID;
		}}

		function _UserIDCheckResults(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""����! : "" + xfaultcode + "" : "" + xfaultstring);
			}}
			else
			{{
				//alert(result.error);
				document.getElementById('marqeeIdCheckWaitMag').style.display = ""none"";
				if (result.value)
				{{
					alert(""�̹� ������� ID �Դϴ�."");
					var comObj = document.getElementById('{0}');
					comObj.valuetocompare = processedID;
				}}
				else
				{{
					alert(""��밡���� ID�Դϴ�."");
					var comObj = document.getElementById('{0}');
					comObj.valuetocompare = """";
				}}
			}}
		}}


		function _CallIDDupCheck1(inputID)
		{{
			//alert(document.getElementById('{3}').value);
			if (document.getElementById('{3}').value.length < 3)
			{{
				alert(""�˻��ϱ� ���ϴ� ID�� 3���̻� �Է��ϼ���."");
				return;
			}}
			if(Tcheck(document.getElementById('{3}'), ""ȸ�����̵�""))
				return;

			document.getElementById('marqeeIdCheckWaitMag1').style.display = """";
			iCallID = joiningWebService.wService.callService(_UserIDCheckResults1, ""MbrIDDuplicationCheck"", inputID);
			processedID = inputID;
		}}

		function _UserIDCheckResults1(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""����! : "" + xfaultcode + "" : "" + xfaultstring);
			}}
			else
			{{
				//alert(result.error);
				document.getElementById('marqeeIdCheckWaitMag1').style.display = ""none"";
				if (result.value)
				{{
					alert(""��õ�� ���̵� �����մϴ�."");
					var comObj = document.getElementById('{2}');
					comObj.valuetocompare = processedID;
				}}
				else
				{{
					alert(""��õ�� ���̵� �������� �ʽ��ϴ�. �ٽ� �Է��ϼ���."");
					var comObj = document.getElementById('{2}');
					comObj.valuetocompare = """";
				}}
			}}
		}}


/*
		function _CallIZipAddrs(inputDong)
		{{
			//alert(inputDong);
			inputDong = inputDong + '';
			if (document.getElementById('txtInputDong').value == """")
			{{
				alert(""�˻��ϱ� ���ϴ� ��,��,�� �̸��� �Է��ϼ���~~"");
				return;
			}}
			document.getElementById('searchedAddrsTR').style.display = """";
			document.getElementById('marqeeWaitMag').style.display = """";
			iCallID = joiningWebService.wService.callService(_ZipAddrsResults, ""GetZipAddrs"", inputDong);
			processedDong = inputDong;
		}}



		function _ZipAddrsResults(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""����! : "" + xfaultcode + ""  "" + xfaultstring);
			}}
			else
			{{
				//alert(result.value.length);

				var oSel = document.getElementById('selSearchedAddrs');
				//for (i=1; i<=oSel.options.length; i++)
				for (i=oSel.options.length; i>=1; i--)
				{{
					oSel.options[i] = null;
				}}

				if (result.value.length > 0)
				{{
					oSel.options[0] = new Option('------�ּҸ� �����ϼ���------','');
					var aTemp;
					for (i=1; i<=result.value.length; i++)
					{{
						aTemp = result.value[i-1].split(""$"");
						oSel.options[i] = new Option(aTemp[1],aTemp[0]);
					}}
					oSel.disabled = false;
				}}
				else
				{{
					oSel.options[0] = new Option('------�˻��� �ּҰ� �����ϴ�.------','');
					alert('�˻��� �ּҰ� �����ϴ�.');
					oSel.disabled = true;
				}}

				oSel.style.display = """";
				document.getElementById('marqeeWaitMag').style.display = ""none"";
			}}
		}}

		function _selectSearchedAddrs()
		{{
			var oSel = document.getElementById('selSearchedAddrs');
			if (oSel.selectedIndex < 1) 
				return;
			var val = oSel.options[oSel.selectedIndex].value;
			var address = oSel.options[oSel.selectedIndex].text;
			var aZip = val.split(""-"");
			document.getElementById('{2}').value = address;
			document.getElementById('{3}').value = aZip[0];
			document.getElementById('{4}').value = aZip[1];
			document.getElementById('{5}').focus();
		}}
	//-->
</script>
";
		#endregion

		
		private void Page_Load(object sender, System.EventArgs e)
		{
			this.mId = Request.QueryString["mId"];
			if(Text.IsNullOrEmpty(this.mId))	// Insert Case
			{

				Response.Write("There is an input!! " + "<br>");
	
			}
			else				// Update Case
			{
				if(!Page.IsPostBack) 
				{					
					//Login check
					//MiddleTier.Member.MbrBaseBiz.MbrLoginOK();

					//Remove an input button
					ibInsert.Visible = false;
					
					//Initializing
					this.SettingInitialize();
					
					
					//Fill out an element of dropdownlist
					DDLElementsInitialize();
					//���ε�
					if(!this.MemberFormBind("basic"))
					{
						ClientAction.ShowMsgBack("�ش� �����Ͱ� �����ϴ�.");
					}
				}	
			}

			//else
			//	ClientAction.ShowMsgBack("�������� ������ �ƴմϴ�");
/*
			if(Request.QueryString["mode"] != "u") 
			{
				//�ڹٽ�ũ��Ʈ �� ������
				JinsLibrary.ClientAction.RegisterOnloadFunction(Page, "_joiningWebServiceInit()");
				joiningWebServiceBehaviorScript = String.Format(joiningWebServiceBehaviorScript, new String[] { revLoginID.ClientID, loginID.ClientID, revRcmderID.ClientID, rcmderID.ClientID, "0","0" });
				Page.RegisterClientScriptBlock("_joiningWebServiceBehaviorScript", joiningWebServiceBehaviorScript);
				if(!Page.IsPostBack) 
				{	
					//��ư����
					ibUpdate.Visible = false;
					//this.ddlMLevel.Visible = false;
					//�ʱ�ȭ
					//this.SettingInitialize();
					this.DDLElementsInitialize();
					//ȸ��
					bnLoginID.Attributes["OnClick"] = "_CallIDDupCheck(document.getElementById('" + loginID.ClientID + "').value)";
					//��õ��
					bnRcmderID.Attributes["OnClick"] = "_CallIDDupCheck1(document.getElementById('" + rcmderID.ClientID + "').value)";
				}
			}
			else	//�����ΰ��
			{	
				//����üũ
				//if(!MbrBaseLib.CanAccess(string.Empty))
				//	ClientAction.ShowMsgBack("�ش� ������ �����ϴ�.");
				this.mId = Request.QueryString["mbID"];
				if(this.mId != "")
				{
					if(!Page.IsPostBack) 
					{					
						//�Է¹�ư����
						ibInsert.Visible = false;
					
						//�ʱ�ȭ
						//this.SettingInitialize();
						//����ٿ��Ʈ ������Ʈä���
						DDLElementsInitialize();
						//���ε�
						//if(!this.MemberFormBind())
						//{
						//	ClientAction.ShowMsgBack("�ش� �����Ͱ� �����ϴ�.");
						//}
					}	
				}
				else
					ClientAction.ShowMsgBack("�������� ������ �ƴմϴ�");
			}
			
*/
		}
		//�����ʱ�ȭ
		private void SettingInitialize()
		{
			URLQuery.Self.SetQueryString();
//URLQuery.Self.Remove("mode");
		
//����Ʈ�� ���� �����ΰ�
//hlList.NavigateUrl =  base.GetWhichList(Request.QueryString["ml"]);
			
			//�ּ�ã���ư (us->����ڻ���Ʈ)
			hlSeekAddr.Attributes["OnClick"] = "WindowOpen('/CommonApps/PostSeek/PostSeek.aspx','usMemberZip','scrollbars=yes,resizable=yes')";
			hlSeekAddr.Style.Add("CURSOR", "hand");
			hlSeekOAddr.Attributes["OnClick"] = "WindowOpen('/CommonApps/PostSeek/PostSeek.aspx','usOfficeZip','scrollbars=yes,resizable=yes')";
			hlSeekOAddr.Style.Add("CURSOR", "hand");
			
			//�ƹ�Ÿ�̹��� �̸�����
			bnAvataImage.Attributes["onChange"] = "javascript:ImagePreview(this, '"+ avataImage.ClientID +"',260,300);";


//���������Է� ����
//if(Cookie.Self["DeptName"] == "��ȹ/����" && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30) 
//findingA.Visible = true;

			//DateTimePicker1
			KistelSite.CommonApps.Calendar.DateSelector.DateSelector dSelector = (KistelSite.CommonApps.Calendar.DateSelector.DateSelector)DateSelector1;
			string scriptStr = "javascript:return popUpCalendar(this," + tbBirthDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbBirthDay.ClientID + @"\')')";
			dSelector.imgCalendar.Attributes["OnClick"] = scriptStr;
			dSelector.imgReset.Attributes["OnClick"] = "javascript:" + tbBirthDay.ClientID + ".value = '';ResetRadioBox(" + rblSLBirth.ClientID + ");";
			//DateTimePicker2
			dSelector = (KistelSite.CommonApps.Calendar.DateSelector.DateSelector)DateSelector2;
			scriptStr = "javascript:return popUpCalendar(this," + tbWeddingDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbWeddingDay.ClientID + @"\')')";
			dSelector.imgCalendar.Attributes["OnClick"] = scriptStr;
			dSelector.imgReset.Attributes["OnClick"] = "javascript:" + tbWeddingDay.ClientID + ".value = '';ResetRadioBox(" + rblMarried.ClientID + ");";
			
////////////////////rblMarried.Attributes["onClick"] =  "javascript:if(rblMarried_1.checked){pnWA.style.display='block' ;}else{pnWA.style.display='none';}";
			
			//ibUpdate.Attributes["onClick"] = "return ConfirmJ('�����Ͻðڽ��ϱ�?');";�����غ���....
			btnSSN.Attributes["onClick"] = "if(CheckNumbers(this.form)) alert('�ٸ� �ֹε�Ϲ�ȣ�Դϴ�.');";
		}
	

		//����ٿ��Ʈ ������Ʈä���
		private void DDLElementsInitialize()
		{
			string mbrDirPath = "/Admins/Members/";
			//����ϼ��񽺳ѹ�
			JinsLibrary.CONTROL.Util.GetMobileNo(ref cellularP1);
			//���̵�/�н����� ��Ʈ����
			SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "FindingMbrInfo.resx");
			JinsLibrary.CONTROL.Util.DDLAddItem(ref findingID, mySL);
			//���
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "Hobbies.resx");
			Util.CBLAddItem(ref hobbies, mySL);
			//����
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "MonthlyPay.resx");
			Util.DDLAddItem(ref monthlyPay, mySL);
			//�ڵ�������
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "CarInfo.resx");
			Util.DDLAddItem(ref carInfo, mySL);
			//��������
			ArrayList arrayList = TableConfig.GetOnlyValues("Jobs_root");
			this.jobType.Items.AddRange(JinsLibrary.CONTROL.Util.GetListItems(arrayList));
		}		


		#region �⺻ȸ�������� ���ε�
		private Boolean MemberFormBind(string tableName)
		{			
			DataSet dsMbr;
			DataRow dRow;
			string [] arrTemp;
			mbl = new  MbrBaseLib();
			
			
			////Basic Information.
			dsMbr =	mbl.GetMbrBasicInfo( Convert.ToInt32(mId) );

	Response.Write(dsMbr.Tables[0].DesignMode + "<br>");
	Response.Write(dsMbr.ToString() + "<br>");
	Response.Write(dsMbr.HasErrors.ToString() + "<br>");
	Response.Write(dsMbr.Tables[0].Rows[0]["MbrName"] + "<br>");
			
			dRow = dsMbr.Tables[0].Rows[0];
			this.member_id.Text		= dRow["member_id"].ToString();
			this.loginID.Text		= dRow["loginID"].ToString();
			loginID.ReadOnly = true;
			loginID.BorderStyle = BorderStyle.None;
			bnLoginID.Visible = false;
			this.loginPW.Text		= dRow["loginPW"].ToString();
			this.MbrName.Text		= dRow["MbrName"].ToString();
			this.MbrEmail.Text		= dRow["MbrEmail"].ToString();
			this.phone.Text			= dRow["phone"].ToString();
			arrTemp	= dRow["cellularP"].ToString().Split('-');
			if(arrTemp.Length>0)
			{
				Util.DDLFindByText(ref cellularP1, arrTemp[0]);
				this.cellularP2.Text = arrTemp[1];
				this.cellularP3.Text = arrTemp[2];
				if(arrTemp[0] != "")
					cellularP1.Items.RemoveAt(0);
				arrTemp =null;
			}
			this.mZipcode.Text		= dRow["zipcode"].ToString();
			arrTemp = dRow["address"].ToString().Split('|');
			if(arrTemp.Length>1)
			{
				this.mAddress1.Text = arrTemp[0];
				this.mAddress2.Text = arrTemp[1];
				arrTemp =null;
			}
			arrTemp = dRow["SSN"].ToString().Split('-');
			if(arrTemp.Length>0)
			{
				this.SSN1.Text = arrTemp[0];
				this.SSN2.Text = arrTemp[1];
				arrTemp =null;
			}
			if(Convert.ToBoolean(dRow["newsLetter"]))
				this.newsLetter.Checked = true;
			else
				this.newsLetter.Checked = false;;
			//When you lost your id and pw; QnA.
			Util.DDLFindByValue(ref findingID, dRow["findingID"].ToString());
			if(dRow["findingID"].ToString() != "")
				findingID.Items.RemoveAt(0);			
			this.findingA.Text = dRow["findingA"].ToString();



			////Member Value Information.
			dsMbr =	mbl.GetMbrValueInfo( Convert.ToInt32(mId) );
			dRow = dsMbr.Tables[1].Rows[0];

			this.rcmderID.Text = dRow["rcmderID"].ToString();
			rcmderID.ReadOnly = true;
			rcmderID.BorderStyle = BorderStyle.None;
			rcmderID.ToolTip = "������ �� �����ϴ�.";
			bnRcmderID.Visible = false;
			
			//Util.DDLFindByValue(ref ddlMLevel, dRow["mLevel"].ToString());
			this.mLevel.Text = MathLib.GetComma(dRow["mLevel"]);
			this.howMuch.Text = MathLib.GetComma(dRow["howMuch"]);
			this.howMany.Text = MathLib.GetComma(dRow["howMany"]);
			this.RFund.Text = MathLib.GetComma(dRow["RFund"]);
			this.RFundAC.Text = MathLib.GetComma(dRow["RFundAC"]);
			this.point.Text = MathLib.GetComma(dRow["point"]);
			this.pointAC.Text = MathLib.GetComma(dRow["pointAC"]);
			this.unpaid.Text = MathLib.GetComma(dRow["unpaid"]);
			this.unpaidAC.Text = MathLib.GetComma(dRow["unpaidAC"]);
			this.joinDT.Text = dRow["joinDT"].ToString();
			this.recentLogin.Text = dRow["recentLogin"].ToString();
			this.IPaddress.Text = dRow["IPaddress"].ToString();
			this.leaveDT.Text = dRow["leaveDT"].ToString();	


			////Member's additional Information
			dsMbr =	mbl.GetMbrOptionInfo( Convert.ToInt32(mId) );
			if(dsMbr.Tables[2].Rows.Count>0)
			{
				dRow = dsMbr.Tables[2].Rows[0];
				//���� ���� üũ�ڽ�ó��
				if(dRow["avataImage"].ToString() != "")
				{
					cbDeleteAI.Visible = true;
					cbDeleteAI.ToolTip = dRow["avataImage"].ToString();	
							
					this.avataImage.ImageUrl = SystemConfig.GetValue("MemberPicUploadDir") + dRow["avataImage"].ToString();
					this.avataImage.Style["cursor"] = "hand";
					this.avataImage.Attributes["OnClick"] = "javascript:ZoomWindowOpen('" + this.avataImage.ImageUrl + "','avaPic','');";
							
					//�̹��� ��������
					JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref avataImage, 260, 300);
				}
				this.homepage.Text = dRow["homepage"].ToString();
				arrTemp = dRow["messenger"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.MsgName.Text = arrTemp[0];
					this.MsgID.Text =	arrTemp[1];
				}
				Util.CBLFindByText(ref hobbies, dRow["hobbies"].ToString().Split(';'));
				Util.DDLFindByValue(ref monthlyPay, dRow["monthlyPay"].ToString());
				if(dRow["monthlyPay"].ToString() != "")
					monthlyPay.Items.RemoveAt(0);
				Util.DDLFindByValue(ref carInfo, dRow["carInfo"].ToString());
				if(dRow["carInfo"].ToString() != "")
					carInfo.Items.RemoveAt(0);
				this.children.Text = dRow["children"].ToString();	
				this.mark.Text = dRow["mark"].ToString();
			}

				//// Company Information
			dsMbr =	mbl.GetMbrOptionInfo( Convert.ToInt32(mId) );
			if(dsMbr.Tables[3].Rows.Count>0)
			{
				dRow = dsMbr.Tables[3].Rows[0];
				this.company.Text = dRow["company"].ToString();				
				Util.DDLFindByText(ref jobType, dRow["jobType"].ToString());
				if(dRow["jobType"].ToString() != "")
					jobType.Items.RemoveAt(0);
				arrTemp = dRow["officeP"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					//Util.DDLFindByText(ref cellularP1, arrTemp[0].ToString());
					
					//this.officeP1.Text = dRow[0];
					//this.officeP2.Text = dRow[1];
					//this.officeP3.Text = dRow[2];
					arrTemp =null;
				}	
				this.oZipcode.Text = dRow["zipcode"].ToString();
				arrTemp = dRow["address"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.oAddress1.Text = arrTemp[0];
					this.oAddress2.Text = arrTemp[1];
					arrTemp =null;
				}
			}


			return true;
			
			/*
			dbUtil = new DBLib();
			string qryString = "Select member_id,loginID,loginPW,MbrName,MbrEmail,phone,cellularP,zipcode,address,findingID,findingA,SSN,newsLetter"
				+ " FROM t_Members WHERE member_id=" + mId;
			qryString += ";Select mLevel,howMuch,howMany,RFund,RFundAC,point,pointAC,unpaid,unpaidAC,rcmderID,joinDT,recentLogin,IPaddress,leaveDT"
				+ " FROM t_MemberValue WHERE member_id=" + mId;
			qryString += ";Select homepage,messenger,hobbies,carInfo,children,avataImage,monthlyPay,mark"				
				+ " FROM t_MemberOption WHERE member_id=" + mId;
			qryString += ";Select company,jobType,officeP,zipcode,address"				
				+ " FROM t_MemberJob WHERE member_id=" + mId;
			qryString += ";Select annGroup,itemFlag,annDate FROM t_Anniversary WHERE (annGroup BETWEEN 200 AND 220) AND item_id=" + mId;
	
			SqlDataReader drMember;
			drMember = dbUtil.MyExecuteReader(qryString);
			if (drMember.Read())			//�⺻����
			{
				string [] arrTemp;
				this.member_id.Text = drMember["member_id"].ToString();
				if(Convert.ToInt32(this.member_id.Text) > 0)
					cbProMbr.Checked = false;
				else
					cbProMbr.Checked = true;
				cbProMbr.Enabled = false;//�����ȵ�.
				this.loginID.Text = drMember["loginID"].ToString();
				loginID.ReadOnly = true;
				loginID.BorderStyle = BorderStyle.None;
				bnLoginID.Visible = false;
				this.loginPW.Text = drMember["loginPW"].ToString();
				this.MbrName.Text = drMember["MbrName"].ToString();
				arrTemp = drMember["phone"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					this.phone1.Text = arrTemp[0];
					this.phone2.Text = arrTemp[1];
					this.phone3.Text = arrTemp[2];
					arrTemp =null;
				}
				arrTemp = drMember["cellularP"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					Util.DDLFindByText(ref cellularP1, arrTemp[0]);
					this.cellularP2.Text = arrTemp[1];
					this.cellularP3.Text = arrTemp[2];
					if(arrTemp[0] != "")
						cellularP1.Items.RemoveAt(0);
					arrTemp =null;
				}
				this.MbrEmail.Text = drMember["MbrEmail"].ToString();
				arrTemp = drMember["SSN"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					this.SSN1.Text = arrTemp[0];
					this.SSN2.Text = arrTemp[1];
					arrTemp =null;
				}
				this.zipcode.Text = drMember["zipcode"].ToString();
				arrTemp = drMember["address"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.mAddress1.Text = arrTemp[0];
					this.mAddress2.Text = arrTemp[1];
					arrTemp =null;
				}
				if(Convert.ToBoolean(drMember["newsLetter"]))
					this.newsLetter.Checked = true;
				else
					this.newsLetter.Checked = false;;
				
				//���̵�/�н����� �ؾ� ������ �� QnA.
				Util.DDLFindByValue(ref findingID, drMember["findingID"].ToString());
				if(drMember["findingID"].ToString() != "")
					findingID.Items.RemoveAt(0);			
				this.findingA.Text = drMember["findingA"].ToString();

				if(drMember.NextResult())	//��ġ
				{
					drMember.Read();
					this.rcmderID.Text = drMember["rcmderID"].ToString();
					rcmderID.ReadOnly = true;
					rcmderID.BorderStyle = BorderStyle.None;
					rcmderID.ToolTip = "������ �� �����ϴ�.";
					bnRcmderID.Visible = false;
					Util.DDLFindByValue(ref ddlMLevel, drMember["mLevel"].ToString());
										
										this.howMuch.Text = MathLib.GetComma(drMember["howMuch"]);
										this.howMany.Text = MathLib.GetComma(drMember["howMany"]);
										this.RFund.Text = MathLib.GetComma(drMember["RFund"]);
										this.RFundAC.Text = MathLib.GetComma(drMember["RFundAC"]);
										this.point.Text = MathLib.GetComma(drMember["point"]);
										this.pointAC.Text = MathLib.GetComma(drMember["pointAC"]);
										this.unpaid.Text = MathLib.GetComma(drMember["unpaid"]);
										this.unpaidAC.Text = MathLib.GetComma(drMember["unpaidAC"]);
										this.joinDT.Text = drMember["joinDT"].ToString();
										this.recentLogin.Text = drMember["recentLogin"].ToString();
										this.IPaddress.Text = drMember["IPaddress"].ToString();
										this.leaveDT.Text = drMember["leaveDT"].ToString();	
										
				}
				
				if(drMember.NextResult())	//�ΰ�����
				{
					if(drMember.Read())
					{
						//���� ���� üũ�ڽ�ó��
						if(drMember["avataImage"].ToString() != "")
						{
							cbDeleteAI.Visible = true;
							cbDeleteAI.ToolTip = drMember["avataImage"].ToString();	
							
							this.avataImage.ImageUrl = SystemConfig.GetValue("MemberPicUploadDir") + drMember["avataImage"].ToString();
							this.avataImage.Style["cursor"] = "hand";
							this.avataImage.Attributes["OnClick"] = "javascript:ZoomWindowOpen('" + this.avataImage.ImageUrl + "','avaPic','');";
							
							//�̹��� ��������
							JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref avataImage, 260, 300);
						}
						this.homepage.Text = drMember["homepage"].ToString();
						arrTemp = drMember["messenger"].ToString().Split('|');
						if(arrTemp.Length>1)
						{
							this.MsgName.Text = arrTemp[0];
							this.MsgID.Text =	arrTemp[1];
						}
						Util.CBLFindByText(ref hobbies, drMember["hobbies"].ToString().Split(';'));
						Util.DDLFindByValue(ref monthlyPay, drMember["monthlyPay"].ToString());
						if(drMember["monthlyPay"].ToString() != "")
							monthlyPay.Items.RemoveAt(0);
						Util.DDLFindByValue(ref carInfo, drMember["carInfo"].ToString());
						if(drMember["carInfo"].ToString() != "")
							carInfo.Items.RemoveAt(0);
						this.children.Text = drMember["children"].ToString();	
						this.mark.Text = drMember["mark"].ToString();
					}
				}
				if(drMember.NextResult())	//ȸ������
				{
					if(drMember.Read())
					{
						this.company.Text = drMember["company"].ToString();				
						Util.DDLFindByText(ref jobType, drMember["jobType"].ToString());
						if(drMember["jobType"].ToString() != "")
							jobType.Items.RemoveAt(0);
						arrTemp = drMember["officeP"].ToString().Split('-');
						if(arrTemp.Length>0)
						{
							//Util.DDLFindByText(ref cellularP1, arrTemp[0].ToString());
							this.officeP1.Text = arrTemp[0];
							this.officeP2.Text = arrTemp[1];
							this.officeP3.Text = arrTemp[2];
							arrTemp =null;
						}	
						this.oZipcode.Text = drMember["zipcode"].ToString();
						arrTemp = drMember["address"].ToString().Split('|');
						if(arrTemp.Length>1)
						{
							this.oAddress1.Text = arrTemp[0];
							this.oAddress2.Text = arrTemp[1];
							arrTemp =null;
						}
					}
				}

				if(drMember.NextResult())	//����� ����
				{
					while(drMember.Read())
					{
						//Response.Write( drMember["itemFlag"].ToString());
						switch(Convert.ToInt32(drMember["annGroup"]))
						{
							case 200 :		//����
								Util.RBLFindByValue(ref rblSLBirth, drMember["itemFlag"].ToString());
								if(drMember["annDate"].ToString() != "")
									this.tbBirthDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
								break;
							case 210 :		//��ȥ�����(��¾���)	-->��ȥ ��ȥ ����
								Util.RBLFindByValue(ref rblMarried, drMember["itemFlag"].ToString());
								if(rblMarried.SelectedValue == "��")
								{
									if(drMember["annDate"].ToString() != "")
										this.tbWeddingDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
								}
								break;
						}	
					}
				}
				//DR,DB�ݱ�
				drMember.Close();
				dbUtil.SqlConnection.Close();
				return true;
			}
			else
				return false;
				*/
		}
		#endregion
/*
		private void CommonInsertUpdate()
		{
			Page.Validate();
			if(!Page.IsValid)
				ClientAction.ShowMsgBack("��Ȯ�� �Է��ϼ���.");

			mbr = new MbrBase();
			mbr.loginPW			= HTML.ReplaceToDB(loginPW.Text);
			mbr.MbrName			= HTML.ReplaceToDB(MbrName.Text);
			mbr.phone			= HTML.ReplaceToDB(phone1.Text) + "-" + HTML.ReplaceToDB(phone2.Text) + "-" + HTML.ReplaceToDB(phone3.Text);
			mbr.cellularP		= cellularP1.SelectedItem.Text + "-" + HTML.ReplaceToDB(cellularP2.Text) + "-" + HTML.ReplaceToDB(cellularP3.Text);
			mbr.MbrEmail		= HTML.ReplaceToDB(MbrEmail.Text);
			mbr.SSN				= HTML.ReplaceToDB(SSN1.Text) + "-" + HTML.ReplaceToDB(SSN2.Text);
			mbr.zipcode			= HTML.ReplaceToDB(zipcode.Text);
			mbr.address			= HTML.ReplaceToDB(mAddress1.Text) + "|" + HTML.ReplaceToDB(mAddress2.Text);
			mbr.newsLetter		= Text.BoolToOneZero(newsLetter.Checked);
			mbr.findingID		= findingID.SelectedValue; 
			mbr.findingA		= HTML.ReplaceToDB(findingA.Text); 
			mbr.rcmderID		= HTML.ReplaceToDB(rcmderID.Text);
			if(pnAdditionalInfo.Visible)
			{
				mbr.homepage		= HTML.ReplaceToDB(homepage.Text);
				mbr.monthlyPay		= monthlyPay.SelectedValue;
				mbr.carInfo			= carInfo.SelectedValue;
				mbr.SLBirth			= rblSLBirth.SelectedValue; 
				mbr.BirthDay		= tbBirthDay.Text;
				mbr.Married			= rblMarried.SelectedValue;	//���°�ȥ�̶�....
				mbr.WeddingDay		= tbWeddingDay.Text;
				//Response.Write("tbWeddingDay.Text= " + tbWeddingDay.Text +"<br>");
				mbr.children		= HTML.ReplaceToDB(children.Text);
				mbr.messenger		= MsgName.Text + "|"+ MsgID.Text;
				mbr.hobbies			= Util.CBLSelectedValues(ref hobbies, ";");
				mbr.mark			= HTML.ReplaceToDB(mark.Text);
				mbr.company			= HTML.ReplaceToDB(company.Text);
				mbr.jobType			= jobType.SelectedValue;
				mbr.officeP			= HTML.ReplaceToDB(officeP1.Text) + "-" + HTML.ReplaceToDB(officeP2.Text) + "-" + HTML.ReplaceToDB(officeP3.Text);
				mbr.oZipcode		= oZipcode.Text;
				mbr.oAddress		= oAddress1.Text + "|" + HTML.ReplaceToDB(oAddress2.Text);
				//mbr.mLevel			= 2;		//���ȸ��
			}
			else
			{
				//mbr.mLevel			= 1;		//��ȸ��
			}
			mbr.IPaddress		= Request.UserHostAddress;			
		}
		private void ibInsert_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			//Response.Write(Text.BoolToOneZero(cbProMbr.Checked));
			ibInsert.Enabled = false;
			//�Ƶ�� �ߺ��ǳ� ����Ȯ��
			if(MbrBaseLib.LoginID_Exist(loginID.Text))
				ClientAction.ShowMsgBack("�Է��Ͻ� ���̵�� �����մϴ�. �ߺ�Ȯ���� �ϼ���.");

			//����Ÿ ����
			//����κ�///////////
			CommonInsertUpdate();
			/////////////////////
			mbr.member_id		= -1; //����ȵ�//dbUtil.GetNextNumber("t_Members", "member_id", 100);
			mbr.loginID			= HTML.ReplaceToDB(loginID.Text);
			mbr.rcmderID		= HTML.ReplaceToDB(rcmderID.Text);
			mbr.cbProMbr		= Text.BoolToOneZero(cbProMbr.Checked);
						
			//DB������Ʈ
			bool up_result = true; //���Ͼ��ε� ���
			int sp_result = mbr.member_id = mbr.Insert();
			//�ΰ�����.
			if(pnAdditionalInfo.Visible)
			{
				if(bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
				{
					mbr.avataImage	= "AvaPic_" + mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);				
					cbDeleteAI.ToolTip = "ok";
				}
				else
					mbr.avataImage		= "";
				//�ΰ���������.
				sp_result = mbr.Insert_OptionJob();
				//���Ͼ��ε�
				up_result = this.UploadFiles();
			}
			if(sp_result != 0)
			{
				//ȸ������ ������Ʈ�Ѵ�.
				this.UpdateAllMembersNumber();
				if( up_result==false )
				{
					ClientAction.ShowMsgAndGoUrl("�̹��������� �ƴմϴ�!! �ٽ� �������ε��ϼ���. \\n[������ Ȯ���� : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?"+ URLQuery.Self.GetQueryString());
				}
				ClientAction.ShowMsgAndGoUrl("���������� �ԷµǾ����ϴ�."," MbrList.aspx?"+ URLQuery.Self.GetQueryString());
			}
			else
				ClientAction.ShowMsgAndGoUrl("�Է��۾��� �����߽��ϴ�." + "Code:" + sp_result,"MbrView.aspx?"+ URLQuery.Self.GetQueryString());
		}
		private void ibUpdate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			ibUpdate.Enabled = false;
			//����Ÿ ����
			//����κ�///////////
			CommonInsertUpdate();
			/////////////////////
			mbr.member_id		= Convert.ToInt32(member_id.Text);	
			mbr.loginID			= "";		//�ش���׾���

			//DB������Ʈ
			bool up_result = true; //���Ͼ��ε� ���
			int sp_result = mbr.Update();
			//�ΰ�����.
			if(pnAdditionalInfo.Visible)
			{
				if(cbDeleteAI.Checked)
				{
					mbr.avataImage	= "";
				}
				else if(bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
				{
					mbr.avataImage	= "AvaPic_" + mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);
					cbDeleteAI.ToolTip = "ok";
				}
				else
				{
					mbr.avataImage = cbDeleteAI.ToolTip;
				}
				//�ΰ���������.
				sp_result = mbr.Insert_OptionJob();
				//���Ͼ��ε�
				up_result = this.UploadFiles();
			}
			if(sp_result != 0)
			{
				//ȸ������ ������Ʈ�Ѵ�.
				this.UpdateAllMembersNumber();
				if( !up_result )
				{
					ClientAction.ShowMsgAndGoUrl("�̹��������� �ƴմϴ�!! �ٽ� �������ε��ϼ���. \\n[������ Ȯ���� : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?"+ URLQuery.Self.GetQueryString());
				}
				ClientAction.ShowMsgAndGoUrl("���������� �����Ǿ����ϴ�.", base.GetWhichList(Request.QueryString["ml"]) + "?"+ URLQuery.Self.GetQueryString());
			}
			else
				ClientAction.ShowMsgAndGoUrl("�����۾��� �����߽��ϴ�." + "Code:" + sp_result,"MbrView.aspx?"+ URLQuery.Self.GetQueryString());
		}
		//���ϰ��� ���ε�
		private bool UploadFiles()
		{
			string memberPicUploadDir = SystemConfig.GetValue("MemberPicUploadDir");
			if(cbDeleteAI.Checked)		//����üũ�ڽ��� ���õ� ���̽�
			{
				//�����̹��� �̵�(�̹� �����Ǿ��� ������ ���ϼ��̺�)
				FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
			}
			else if(cbDeleteAI.ToolTip == "ok")
			{
				//���� �̹��� �����ΰ��� Ȯ���Ѵ�.
				if(!FileLib.Self.IsImageFileExts(bnAvataImage))
					return false;
				//�����̹��� �̵�(�̹� �����Ǿ��� ������ ���ϼ��̺�)
				FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
				//����
				FileLib.Self.FileSave(bnAvataImage, memberPicUploadDir, FileLib.Self.GetFileNameWithoutExtension(mbr.avataImage));
			}
			else	//���ε������ ������� ����.... �뷮�� ���ų� ó���� �ʿ䰡 ���� ��.
			{
				if(bnAvataImage.PostedFile.ContentLength >= 255000)
					ClientAction.ShowInfoMsg("�̹��� �뷮�� 256K �̻��̹Ƿ� ���ε���� �ʾҽ��ϴ�.");
			}
			return true;
		}		
		//ȸ������ ������Ʈ�Ѵ�.
		private void UpdateAllMembersNumber()
		{
			dbUtil = new DBLib();
			AppVariable.Self["AllMembersNumber"] = dbUtil.GetRecordCount("t_MemberValue", "leaveDT IS  null Or leaveDT = ''").ToString();
			dbUtil.SqlConnection.Close();
			//ClientAction.ShowInfoMsg(AppVariable.Self["AllMembersNumber"].ToString());
		}		
		private void ibAdditionalInfo_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(pnAdditionalInfo.Visible)
				pnAdditionalInfo.Visible = false;
			else
			{
				pnAdditionalInfo.Visible = true;
				if(rblMarried.SelectedValue == "��")
					ClientAction.WriteJavascript(this, "pnWA", "pnWA.style.display='none';");
			}
		}
*/			
	

		#region Web Form �����̳ʿ��� ������ �ڵ�
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �� ȣ���� ASP.NET Web Form �����̳ʿ� �ʿ��մϴ�.
			//
			InitializeComponent();
			base.OnInit(e);
		}		
		/// <summary>
		/// �����̳� ������ �ʿ��� �޼����Դϴ�.
		/// �� �޼����� ������ �ڵ� ������� �������� ���ʽÿ�.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	}
	
}