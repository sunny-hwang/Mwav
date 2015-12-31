<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	
	
	pMode = Request("pMode")
	'��ǥ�ϳ� üũ Ȯ��(vaildation)
	if Request.Cookies("poolAvail") = "true" and pMode <> "v" then   
		Call ShowAlertMsgClose("��ǥ�� �ϼ̽��ϴ�.")
	end if
	
	
	
	pNbr = Request("pNbr")
	exNbr = Request("exNbr")
	
	'��������
	if not IsNumeric(pNbr) and not IsNumeric(exNbr) then
		Call ShowAlertMsgClose("��ȿ���Դϴ�.")
	end if

	if pMode <> "v" then 
		'��ǥ�� ����	
		SQL = "UPDATE vPollEX SET getPoints = getPoints + 1 "
		SQL = SQL & " Where pNbr = ? and exNbr = ? "
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
	
			.Parameters.Append Cmd.CreateParameter("@pNbr", adUnsignedTinyInt, adParamInput, 2, pNbr)
			.Parameters.Append Cmd.CreateParameter("@exNbr", adUnsignedSmallInt, adParamInput, 2, exNbr)
			'.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, gCode)
			.Execute ,,adExecuteNoRecords
			end With
		Set Cmd = nothing
	
		'��ǥ�ϳ� üũ
		Response.Cookies("poolAvail") = "true"
		Response.Cookies("poolAvail").Expires  = DateAdd("h", 1, now)        '1�ð��� ��Ű����
	end if		'if pMode <> "v" then 

	'�� ��ǥ�� 
	SQL = "SELECT SUM(getPoints) AS pollSum FROM vPollEX "
	SQL = SQL & " Where vPollEX.pNbr = " & pNbr 
	SQL = SQL & " GROUP BY pNbr "
	RSresult = OpenRS(sumRS,SQL,1)
	if RSresult <> "Empty" then
		pollSum = trim(sumRS(0))
		Call CloseRS(sumRS)
	end if
'Response.write sql	
	'�ش� ��ǥ����
	SQL = "SELECT vPollMain.pTopic,vPollMain.pBeginTime,vPollMain.pEndTime, " 
        SQL = SQL & " vPollMain.pRegisterDT, vPollEX.example, vPollEX.getPoints "
	SQL = SQL & " FROM vPollEX INNER JOIN vPollMain ON vPollEX.pNbr = vPollMain.pNbr "
	SQL = SQL & " Where vPollEX.pNbr = " & pNbr 
	
	RSresult = OpenRS(pollRS,SQL,1)
	'Response.Write("RSresult=" + RSresult)
	if RSresult <> "Empty" then
		pTopic = trim(pollRS("pTopic"))
		pBeginTime = trim(pollRS("pBeginTime"))
		pEndTime = trim(pollRS("pEndTime"))
		'pRegisterDT = trim(pollRS("pTopic"))
		
		'����
		pBeginTime = Left(pBeginTime,12)
		if pEndTime = "" then 
			pEndTime = "����"
		else 
			pEndTime = Left(pEndTime,12)
		end if
		pTime = Left(pBeginTime,12) & " ~ " & pEndTime
%>

<html>
<head>
<title>��������</title>
	<meta name="keywords" content="��������(��)">
	<meta name="description" content="�ְ��� ķ�ڴ� ��������Ʈ">
	<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	
	<link href="<%= Application("SiteURLDir") %>Include_css/Style.css" rel="stylesheet" type="text/css">
	<link href="<%= Application("SiteURLDir") %>Include_css/Object.css" rel="stylesheet" type="text/css">
	<!--script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
	<script language="JavaScript" src="Include_js/Function.js"></script-->
    <style type="text/css">
<!--
.style1 {color: #660099}
-->
    </style>
</head>
<base href="<%= Application("SiteURLDir") %>CommonAccessories/PollMan/" target="_self">
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="4" cellpadding="2">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <th width="100" height="30" align="center" bgcolor="#66CCFF">����</th>
        <td><%= pTopic %></td>
      </tr>
      <tr>
        <th height="30" align="center" bgcolor="#66CCFF">�Ⱓ</th>
        <td><%= pTime %></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="2" cellpadding="1">
      <tr align="center" bgcolor="#D2F1FF">
        <th height="25">����</th>
        <th>Ưǥ��</th>
        <th>�׷���</th>
      </tr>
<% 
	Do until pollRS.EOF
		example = trim(pollRS("example"))
		getPoints = trim(pollRS("getPoints"))
		if getPoints = 0 or pollSum = 0 then
			getPercent = 0
		else
			getPercent = getPoints / pollSum * 100			
		end if
%>
      <tr>
        <td height="25"><%= example %></td>
        <td width="100" align="center" bgcolor="#F4FCFF"><%= getPoints %>ǥ</td>
        <td><img src="Images/green.gif" width="<%= getPercent %>%" height="15"></td>
      </tr>
<%
		pollRS.MoveNext
	Loop
%>	  
    </table></td>
  </tr>
  <tr>
    <td height="100" align="center">
	<% 'Call CloseWinddowButton("��ǥâ �ݱ�") %>
    <!-- CloseButton Start -->
      <!--#include File = "../CloseButton/CloseButton.asp" --> 
    <!-- CloseButton End -->	
	</td>
  </tr>
</table>
<%
		Call CloseRS(pollRS)
	end if  'if RSresult <> "Empty" then
%>
</body>
</html>