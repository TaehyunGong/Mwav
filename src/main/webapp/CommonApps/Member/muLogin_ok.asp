<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	MbrID = trim(request("MbrID"))
	MbrPW = trim(request("MbrPW"))
	GotoURL = trim(request("GotoURL"))
	if Len(MbrID) < 3 Or Len(MbrPW) < 4 then Call ShowAlertMsg("���̵�� �н����带 Ȯ���ϼ���")

	SQL = "select MbrID,MbrPW,MbrName,MbrEmail FROM vMember "
	SQL = SQL & " WHERE MbrID='" & MbrID & "'"
	RSresult = OpenRS(logRS,SQL,1)

	if RSresult = "Empty" then
		Call ShowAlertMsg("��ϵ��� ���� ���̵��Դϴ�.")
	else

		if Trim(logRS("MbrPW")) <> Trim(request("MbrPW")) then
			Call ShowAlertMsg("- ��й�ȣ�� ��ġ���� �ʽ��ϴ�.\n  Ȯ�� �� �ٽ� �õ��� �ֽʽÿ�")
  		else

			'MbrHiddenValue ��������
			SQL = "select level4,joinDT,recentLogin,missYouDT FROM vMbrHiddenValue "
			SQL = SQL & " where MbrID='" & MbrID & "'"
			'SQL = SQL & " and missYouDT not is null "
			RSresult = OpenRS(valRS,SQL,1)

			if RSresult = "Empty" then Call ShowAlertMsg("����Ʈ���߻翡 �����ϼ���.")
			if valRS("missYouDT") <> "" then Call ShowAlertMsg(Left(valRS("missYouDT"),12) & "�Ͽ� Ż���ϼ̽��ϴ�.")

			'ȸ������ ���̺�
			level4 = valRS("level4")

			Select Case level4
			 Case 0
				'levelLabel = "�ҷ�ȸ��"
				Call ShowAlertMsg("ȸ�������� ó���Ǿ����ϴ�.")
			 Case 1
				levelLabel = "��ȸ��"
			 Case 2
				levelLabel = "���ȸ��"
			 Case 3
				levelLabel = "�ֿ��ȸ��"
			 Case 4
				levelLabel = "����"
			 Case 5
				levelLabel = "������"
			 Case Else
				Call ShowAlertMsg("�����ʴϱ�?")
			End Select



			session("MbrID") = trim(logRS("MbrID"))
			session("MbrName") = trim(logRS("MbrName"))
			session("MbrEmail") = trim(logRS("MbrEmail"))
			Call CloseRS(logRS)
			session("levelLabel") = levelLabel
			session("joinDT") = trim(valRS("joinDT"))
			session("recentLogin") = trim(valRS("recentLogin"))
			Call CloseRS(valRS)
			'����IP �� �ֱٽð� ����
			Call updateIPDT("vMbrHiddenValue", "IPaddress", "recentLogin", "MbrID = '" & session("MbrID") & "'")

			'��Ű�� ����ؾ� ������ ���ܵ� �����ߴ� ���̵� Ȯ�� �����ϴ�.
			Response.Cookies("MbrID") = session("MbrID")

			'���� �������ΰ�?
			if GotoURL <> "" then
				Response.redirect(GotoURL)
			else
				Response.redirect Application("SiteRoot")
			end if
	     end if

	end if
%>

<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

