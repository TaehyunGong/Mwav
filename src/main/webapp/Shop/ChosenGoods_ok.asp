<!-- ShopSetting Start -->
	<!--#include File = "../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File = "../Include_asp/fsShop_inc.asp" -->
<!-- fsShop_inc End -->

<%
	'��ǰ�ڵ�
	c = Request.QueryString("c")
	g = Request.QueryString("g")
	'c,g ���� �ȳѾ� ����
	if c = "" or g = "" then
		Call GotoThePage("���������� �����Դϴ�!!", UrlRootDir)
	end if
	'����ī�װ��� ��ǰ�̸��� �������� ������ ����
	gName = PickUpValue("vGoodsList_c", "gName", "gCode = '" & g & "'")
	if gName = "NoPickUp" then
		Call GotoThePage("�ش� ����ī�װ��� �������� �ʽ��ϴ�!!", UrlRootDir)
	end if

	if Session("MbrID") <> "" then 		'�α��εǾ� ������
		'vPopularity�� clicksFigure�� 1����.
		PopGoods = gPopularity(g, "choiceFigure")

		'5�� �̻��̸� ���̻� �߰��ȵ�.
		SQL = "SELECT COUNT(gCode) AS Cnt FROM vChosenGoods "
		SQL = SQL & " Where MbrID = '" & Session("MbrID") & "'"
		RSresult = OpenSimpleRS(rsCnt, SQL)
		if RSresult <> "Empty" then
			if rsCnt(0) > 5 then
				Call CloseRS(rsCnt)
				Call GotoThePage("5�������� ��ǰ�� ��⺸���Ͻ� �� �ֽ��ϴ�.", "GoodsDetailBody.asp?c=" & c & "&g=" & g)
			end if
		end if
		''''''''''''''''''''''''End''''''''''''''''''''''''


		'���� ��ǰ DB�Է�
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			dbConn.BeginTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText

			SQL = "DELETE FROM vChosenGoods"
			SQL = SQL & " WHERE MbrID = ? and gCode = ?"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Execute ,,adExecuteNoRecords
			.Parameters.Delete("@MbrID")
			.Parameters.Delete("@gCode")

			SQL = "INSERT INTO vChosenGoods(MbrID,cCode,gCode)"
			SQL = SQL & " VALUES(?,?,?)"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			.Parameters.Append Cmd.CreateParameter("@cCode", adUnsignedTinyInt, adParamInput, 1, c)
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Execute ,,adExecuteNoRecords
			dbConn.CommitTrans

		end With
		Set Cmd = nothing
		Call GotoThePage(gName & "��(��) ���ϼ̽��ϴ�.", "GoodsDetailBody.asp?c=" & c & "&g=" & g)
	else

		tempURL = "../CommonAccessories/MbrUsers/muLoginDisplay.asp?gtu="
		tempURL = tempURL & Application("SiteRoot") & "ShopBody/ChosenGoods_ok.asp?c=" & c & "%26g=" & g
		Response.Redirect(tempURL)	'Server.URLEncode(
	end if
%>


<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

