Dim strConnect
Dim adoConnection
Dim GetSumSql
Dim Sum_Nal
Dim Type_Doc


Dim strUserID: strUserID = "pmp"
Dim strPassword: strPassword = "12345"
strConnect = "Provider=SQLOLEDB.1; Data Source=PC-PMP\F2008SQL; Initial Catalog = FINANCE; User ID = " & strUserID & ";Password=" & strPassword & ";"

Set adoConnection = CreateObject("ADODB.Connection")
adoConnection.Open strConnect

Set cmdSum = CreateObject("ADODB.Command")
Set cmdSum.ActiveConnection = adoConnection
	cmdSum.CommandType = 4 
	cmdSum.CommandText = "D_GetCashBoxSum"
	
Set adoRecordset = CreateObject("ADODB.Recordset")

 adoRecordSet.Open cmdSum
	Sum_Nal = adoRecordSet.Fields("Total_Sum")
 

IF Sum_Nal >= 0 then
	Type_Doc = "V"
ELSE
	Type_Doc = "R"
END IF


Set cmd = CreateObject("ADODB.Command")
Set	cmd.ActiveConnection = adoConnection

	cmd.CommandType = 4 
	cmd.CommandText = "G_CreateCashBoxDoc"
	
	cmd.Parameters.Append cmd.CreateParameter("@DATE_P_POR", vbDate, 1, 0, Now)
	cmd.Parameters.Append cmd.CreateParameter("@SUM_NAL", vbDouble, 1, 0, Sum_Nal)
	cmd.Parameters.Append cmd.CreateParameter("@FAMILY", vbString, 1, 30, "aut")
	cmd.Parameters.Append cmd.CreateParameter("@TYPE_DOC", vbString, 1, 1, Type_Doc)
	
	cmd.Execute
	
	
Set cmdActualSum = CreateObject("ADODB.Command")
Set cmdActualSum.ActiveConnection = adoConnection

	cmdActualSum.CommandType = 4 
	cmdActualSum.CommandText = "D_CashBoxAddSum"
	
	cmdActualSum.Parameters.Append cmdActualSum.CreateParameter("@Sum_Nal", vbDouble, 1, 0, Sum_Nal)
	cmdActualSum.Execute

	
	
adoRecordSet.Close	
adoConnection.Close

'MsgBox "CashBoxScript successfully worked", vbOK+vbInformation, "CashBoxDoc"


	