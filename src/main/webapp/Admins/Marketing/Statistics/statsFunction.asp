<%
''''''''''''''''''''''' ���� �������� ����  '''''''''''''''
Function GetPCWvalue(pcw)
    pcwArray = split(pcw, ";")

    Dim PCWvalue(4)
    PCWvalue(0) = pcwArray(0)

    'PmoterID
    'rocktry, s1free2, yousayok
    	Select Case pcwArray(0)
    		Case "rocktry"
                stat_Pname = "�ҵ���"
    		Case "s1free2"
                stat_Pname = "������"
    		Case "yousayok"
                stat_Pname = "���ѹ�"
    	  	Case Else
    	  	    'PmoterID = "SiteRoot"
    	  	    stat_Pname = Application("shopName")
    	End Select
     PCWvalue(1) = stat_Pname

    'CameFromPage
    '������ NoName
    	Select Case pcwArray(1)
    		Case "100"
                CameFromPage = "�����̸���"
    		Case "200"
                CameFromPage = "�Խ���"
    		Case "300"
    			CameFromPage = "ȸ���̸���"
    	  	Case Else
    	  	    CameFromPage = "������������"
    	End Select
    	PCWvalue(2) = CameFromPage

    'WhatsAbout
    	Select Case pcwArray(2)
    		Case "10000"
                WhatsAbout = "����Ʈ ���� ������� �̺�Ʈ"
    		Case "10001"
                WhatsAbout = "�İ� �̺�Ʈ1"
    		Case "10002"
                WhatsAbout = "�İ� �̺�Ʈ2"
    	  	Case Else
    	  	    WhatsAbout = "������������"
    	End Select
    	PCWvalue(3) = WhatsAbout

    GetPCWvalue = PCWvalue
End Function


'pINFO������ �����ϰ� ��´�. �ڷ� ���� �ٷ� �θ� ���丮����.
Function GetpINFOshort(pINFO)
    'startIndex = InStrRev(pINFO,"/")
    'pINFOshort = Mid(pINFO, startIndex)
    jj = 0
    pINFOrev = StrReverse(pINFO)
    'Response.write pINFOrev
    for ii = 1 to Len(pINFOrev)
        if Mid(pINFOrev,ii,1) = "/" then
            jj = jj + 1
            if jj = 2 then Exit for
        end if
    next
    if jj >= 2 then
        pINFOshort = "..." & StrReverse(Left(pINFOrev, ii))
    else
        pINFOshort = StrReverse(Left(pINFOrev, ii))
    end if
    GetpINFOshort = pINFOshort
End Function




'������ ���� ī��Ʈ���� ���Ѵ�.
Function GetDayCount(whichDay)          'GetDayCount(#2003-01-03#),GetDayCount("2003-01-03")
    SQL = "SELECT COUNT(*) AS dayCount FROM vStatistics "
    SQL = SQL & " WHERE YEAR(stat_date) = '" & YEAR(whichDay) & "'"
    SQL = SQL & " and MONTH(stat_date) = '" & MONTH(whichDay) & "'"
    SQL = SQL & " and DAY(stat_date) = '" & DAY(whichDay) & "'"
	RSresult = OpenSimpleRS(rsWD,SQL)
    if RSresult <> "Empty" then
		dayCount = trim(rsWD("dayCount"))
		Call CloseRS(rsWD)
	end if

	GetDayCount = dayCount
End Function


'�������̸��� �ٲ������ ������Ʈ �Ѵ�.
Sub UpdatePageName(PATH_INFO,CameToThePage)          'Call UpdatePageName(PATH_INFO,CameToThePage)
    SQL = "SELECT log_CameToThePage "
    SQL = SQL & " FROM vStat_Log "
    SQL = SQL & " WHERE log_pINFO = '" & PATH_INFO & "'"

	RSresult = OpenSimpleRS(rsPN,SQL)
    if RSresult <> "Empty" then
	    log_CameToThePage = trim(rsPN("log_CameToThePage"))
		Call CloseRS(rsPN)
	end if

    if stat_CameToThePage <> CameToThePage then
        SQL = "Update vStatistics set stat_CameToThePage = '" & CameToThePage & "'"
        SQL = SQL & " WHERE stat_pINFO = '" & PATH_INFO & "'"
        dbConn.Execute SQL

        SQL = "Update vStat_Log set log_CameToThePage = '" & CameToThePage & "'"
        SQL = SQL & " WHERE log_pINFO = '" & PATH_INFO & "'"
        dbConn.Execute SQL
    end if
'response.write sql
End Sub

%>