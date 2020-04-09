$PBExportHeader$w_httpclient_bak.srw
forward
global type w_httpclient_bak from window
end type
type cb_1 from commandbutton within w_httpclient_bak
end type
type mle_2 from multilineedit within w_httpclient_bak
end type
type st_2 from statictext within w_httpclient_bak
end type
type mle_1 from multilineedit within w_httpclient_bak
end type
type st_1 from statictext within w_httpclient_bak
end type
end forward

shared variables
HttpClient 	shc_HttpClient
end variables

global type w_httpclient_bak from window
integer width = 3657
integer height = 1916
boolean titlebar = true
string title = "HttpClient Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_httpclient_argument ( httpclient ahc_1,  ref httpclient ahc_2,  httpclient ahc_array[] )
cb_1 cb_1
mle_2 mle_2
st_2 st_2
mle_1 mle_1
st_1 st_1
end type
global w_httpclient_bak w_httpclient_bak

type variables
eon_appeon_resize  ieon_resize
HttpClient 	ihc_HttpClient
String 		is_URL1, is_URL2
end variables

forward prototypes
public subroutine wf_classic_httpclient ()
public subroutine wf_httpclient_request ()
public subroutine wf_httpclient_properties ()
public subroutine wf_httpclient_argument (httpclient ahc_1, ref httpclient ahc_2, httpclient ahc_array[])
public function string wf_gettimestamp ()
public subroutine wf_httpclient_response ()
end prototypes

event ue_httpclient_argument(httpclient ahc_1, ref httpclient ahc_2, httpclient ahc_array[]);string ls_Value
If IsValid ( ahc_1 ) Then
	mle_2.text += "HttpClient Event: value Argument Success" + "~r~n"
	ls_Value = ahc_1.GetRequestHeader ( "Pragma" )
	If ls_Value = "no-cache" Then
		mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Success" + "~r~n"
	Else
		mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
	End If
Else
	mle_2.text += "HttpClient Event: value Argument Failed" + "~r~n"
	mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
End If

If IsValid ( ahc_2 ) Then
	mle_2.text += "HttpClient Event: reference Argument Success" + "~r~n"
Else
	mle_2.text += "HttpClient Event: reference Argument Failed" + "~r~n"
End If

If UpperBound ( ahc_array ) > 0 Then
	If IsValid ( ahc_array[1] ) Then
		mle_2.text += "HttpClient Event: Array Argument Success" + "~r~n"
	Else
		mle_2.text += "HttpClient Event: Array Argument Failed" + "~r~n"
	End If	
Else
	mle_2.text += "HttpClient Event: Array Argument Failed" + "~r~n"
End If
end event

public subroutine wf_classic_httpclient ();//HttpClient 对象 标准pb对象测试
HttpClient  lhc_Client, lhc_Client2
string ls_output,ls_rtn,ls_value
long ll_i
Long 	ll_rtn
any 	lany_test

ls_OutPut = "-----------HttpClient Classic-----------" + "~r~n"
//Create
lhc_Client = Create HttpClient
If  IsValid ( lhc_Client ) Then
	ls_output += "Local Create Success" + "~r~n"
	ls_output += "Local Variables Success" + "~r~n"
Else
	ls_output += "Local Create Failed" + "~r~n"
	ls_output += "Local Variables Failed" + "~r~n"
End If 

//ClassName
ls_rtn = lhc_Client.classname( )
ls_output += "Classname() = "+ls_rtn+"~r~n"

//TypeOf
If   lhc_Client.typeof( ) = HttpClient! Then
	ls_output += "TypeOf() = HttpClient!~r~n"
Else
	ls_output += "TypeOf() <> HttpClient!~r~n"
End If 

//any
lany_test = Create HttpClient
lhc_Client2 = lany_test
ls_rtn = lhc_Client2.classname( )
ls_output += "any Classname() = "+ls_rtn+"~r~n"

//
If   lhc_Client2.typeof( ) = HttpClient! Then
	ls_output += "any TypeOf() = HttpClient!~r~n"
Else
	ls_output += "any TypeOf() <> HttpClient!~r~n"
End If 


//powerobject
ll_rtn = lhc_Client.SetRequestHeader("Accept", "*/*")
If  ll_rtn <> 1 Then
	ls_output += "SetRequestHeader Failed: "+ls_rtn+"~r~n"
Else
	//OpenWithParm
	openwithparm(w_tmp,lhc_Client)
	lhc_Client = message.powerobjectparm
	If  gs_values = "*/*" Then
		ls_output+="OpenWithParm: message Success"+"~r~n"
	Else
		ls_output+="OpenWithParm: message failed"+"~r~n"
	End If 
	//closewithreturn
	ls_value = lhc_Client.GetRequestHeader("Content-Type")
	If  ls_value = "application/json" Then
		ls_output+="CloseWithReturn: message Success "+"~r~n"
	Else
		ls_output+="CloseWithReturn: message failed = "+"~r~n"
	End If 
End If 

//DesTroy
DesTroy ( lhc_Client )
If  Not IsValid ( lhc_Client ) Then
	ls_output += "Local DesTroy success" + "~r~n"
Else
	ls_output = "Local DesTroy failed" + "~r~n"
End If 

//Variables
ihc_HttpClient = Create HttpClient
If  IsValid ( ihc_HttpClient ) Then	
	ls_output += "Instance Create Success" + "~r~n"
	ihc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
	If  ihc_HttpClient.GetRequestHeader( "Pragma" ) = "no-cache" Then
		ls_output += "Instance Variables Success" + "~r~n"
	Else
		ls_output += "Instance Variables Failed" + "~r~n"
	End If 
	DesTroy ( ihc_HttpClient )
	If  Not IsValid ( ihc_HttpClient ) Then
		ls_output += "Instance DesTroy Success" + "~r~n"
	Else
		ls_output += "Instance DesTroy Failed" + "~r~n"
	End If 
Else	
	ls_output += "Instance Create Failed" + "~r~n"
	ls_output += "Instance Variables Failed" + "~r~n"
End If 

shc_HttpClient = Create HttpClient
If  IsValid ( shc_HttpClient ) Then	
	ls_output += "Shared Create Success" + "~r~n"
	shc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
	If  shc_HttpClient.GetRequestHeader( "Pragma" ) = "no-cache" Then
		ls_output += "Shared Variables Success" + "~r~n"
	Else
		ls_output += "Shared Variables Failed" + "~r~n"
	End If 	
	DesTroy ( shc_HttpClient )
	If  Not IsValid ( shc_HttpClient ) Then
		ls_output += "Shared DesTroy Success" + "~r~n"
	Else
		ls_output += "Shared DesTroy Failed" + "~r~n"
	End If 
Else	
	ls_output += "Shared Create Failed" + "~r~n"
	ls_output += "Shared Variables Failed" + "~r~n"
End If 


ghc_HttpClient = Create HttpClient
If  IsValid ( ghc_HttpClient ) Then	
	ls_output += "Global Create Success" + "~r~n"
	ghc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
	If  ghc_HttpClient.GetRequestHeader( "Pragma" ) = "no-cache" Then
		ls_output += "Global Variables Success" + "~r~n"
	Else
		ls_output += "Global Variables Failed" + "~r~n"
	End If 	
	DesTroy ( ghc_HttpClient )
	If  Not IsValid ( ghc_HttpClient ) Then
		ls_output += "Global DesTroy Success" + "~r~n"
	Else
		ls_output += "Global DesTroy Failed" + "~r~n"
	End If 
Else	
	ls_output += "Global Create Failed" + "~r~n"
	ls_output += "Global Variables Failed" + "~r~n"
End If 

mle_2.text += ls_output

//Argument
HttpClient 	lhc_1, lhc_2
HttpClient 	lhc_Array[5]

lhc_1 = Create HttpClient

lhc_1.SetRequestHeader( "Pragma","no-cache" )

lhc_2 = Create HttpClient

lhc_Array[1] = Create HttpClient

wf_httpclient_Argument( lhc_1, lhc_2, lhc_Array)

Event ue_HttpClient_Argument( lhc_1, lhc_2, lhc_Array )

str_HttpClient lstr_1

lstr_1.hc_1 = lhc_1
lstr_1.hc_array = lhc_Array

ls_output = f_httpclient_argument ( lhc_1, lhc_2, lstr_1, lhc_Array ) 


If  IsValid ( lhc_1 ) Then DesTroy ( lhc_1 )
If  IsValid ( lhc_2 ) Then DesTroy ( lhc_2 )
If  IsValid ( lhc_Array[1] ) Then DesTroy ( lhc_Array[1] )

For ll_I = 2 to 5
	lhc_Array[ll_I] = Create HttpClient
	If  IsValid ( lhc_Array[ll_I] ) Then
		ls_output += "http_Array["+String ( ll_I )+"] Create Success" + "~r~n"
		DesTroy ( lhc_Array[ll_I] )
		
		If  Not IsValid ( ihc_HttpClient ) Then
			ls_output += "http_Array["+String ( ll_I )+"] DesTroy Success" + "~r~n"
		Else
			ls_output += "http_Array["+String ( ll_I )+"] DesTroy Failed" + "~r~n"
		End If 
	Else
		ls_output += "http_Array["+String ( ll_I )+"] Create Failed" + "~r~n"
	End If 
	
Next

mle_2.text += ls_output

end subroutine

public subroutine wf_httpclient_request ();Integer	 	li_rtn
String 	ls_OutPut, ls_value, ls_null, ls_space, ls_set, ls_error
HttpClient lhc_Client

SetNull ( ls_null )
ls_space = space(5000)

ls_OutPut = "-----------HttpClient Request-----------" + "~r~n"

ls_error = "Not Create:View error Failed" + "~r~n"
Try
	li_rtn = lhc_Client.ClearRequestHeaders()
Catch ( throwable ex)
	ls_error = "Not Create: View error Success" + "~r~n"
End Try

ls_OutPut += ls_error

lhc_Client = Create HttpClient

//ClearRequestHeaders
li_rtn = lhc_Client.ClearRequestHeaders()
If IsNull (li_rtn ) Then
	ls_OutPut += "Create ClearRequestHeaders() = null Failed" + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += "Create ClearRequestHeaders() Success" + "~r~n"
	Else
		ls_OutPut += "Create ClearRequestHeaders() Failed" + "~r~n"
	End If
End If

lhc_Client.SetRequestHeader("Accept", "*/*")
li_rtn = lhc_Client.ClearRequestHeaders()
If IsNull (li_rtn ) Then
	ls_OutPut += "SetRequest ClearRequestHeaders() = null Failed" + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += "SetRequest ClearRequestHeaders() Success" + "~r~n"
	Else
		ls_OutPut += "SetRequest ClearRequestHeaders() Failed" + "~r~n"
	End If
End If

//SetRequestHeader
li_rtn = lhc_Client.SetRequestHeader("Accept", "*/*")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("Accept", "*/*") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("Accept", "*/*") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("Accept", "*/*") Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader(ls_Null, "*/*")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader(ls_Null, "*/*") = null Success' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader(ls_Null, "*/*") Failed' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader(ls_Null, "*/*") Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader("Accept", ls_Null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("Accept", ls_Null) = null Success' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("Accept", ls_Null) Failed' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("Accept", ls_Null) Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader("Accept", ls_space)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("Accept", space(5000)) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("Accept", space(5000)) Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("Accept", space(5000)) Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader(ls_space, "*/*")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader(space(5000), "*/*") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader(space(5000), "*/*") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader(space(5000), "*/*") Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader("", "" )
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("", "") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("", "") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("", "") Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeader("中文", "中文测试" )
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("", "") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("", "") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("", "") Failed' + "~r~n"
	End If
End If
//( "test", "フルネーム")
li_rtn = lhc_Client.SetRequestHeader( "test", "フルネーム")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeader("", "") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeader("", "") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeader("", "") Failed' + "~r~n"
	End If
End If

//GetRequestHeader
//lhc_Client.SetRequestHeader("Accept", "*/*")
ls_value = lhc_Client.GetRequestHeader("Accept")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("Accept") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("Accept") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("Accept") = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader("accept")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("accept") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("accept") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("accept") = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader("中文")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("中文") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("中文") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("中文") = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader("test")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("フルネーム") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("フルネーム") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("フルネーム") = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader("NoHeader")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("NoHeader") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("NoHeader") = ' + Trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("NoHeader") = "" ' + " Success" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader(ls_null)
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader(ls_null) = null Success' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader(ls_null) = ' + Trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader(ls_null) = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader(ls_space)
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader(space(5000)) = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader(space(5000)) = ' + Trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader(space(5000)) = "" ' + " Success" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeader("")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeader("") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetRequestHeader("") = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeader("") = "" ' + " Success" + "~r~n"
	End If
End If


//SetRequestHeaders
lhc_Client.ClearRequestHeaders()
//ls_set = '"Accept":"*/*"' + "~r~n" + '"Accept-Encoding":"gzip"'+ "~r~n" + '"Content-Type":"application/json"'  //考虑分隔符
ls_set = 'Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' //+ "~r~n"
li_rtn = lhc_Client.SetRequestHeaders(ls_set)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeaders(ls_set for enter) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeaders(ls_set for enter) Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeaders(ls_set for enter) Failed' + "~r~n"
	End If
End If

ls_value = lhc_Client.GetRequestHeaders()
If IsNull (ls_value ) Then
	ls_OutPut += 'GetRequestHeaders() = null Failed' + "~r~n"
Else
	If Trim ( ls_value ) = Trim ( ls_set ) Then
		ls_OutPut += 'SetRequestHeaders() = GetRequestHeaders()  Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeaders() <> GetRequestHeaders()  Failed' + "~r~n"
	End If
End If

//lhc_Client.ClearRequestHeaders()
//ls_set = '"Accept":"*/*"' + "; " + '"Content-Type":"application/json"'+ "; " + '"Accept-Encoding":"gzip"'  //考虑分隔符，目前只支持换行~r~n


li_rtn = lhc_Client.SetRequestHeaders(ls_null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeaders(ls_null) = null Success' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeaders(ls_null) Failed' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeaders(ls_null) Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeaders("")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeaders("") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeaders("") Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeaders("") Failed' + "~r~n"
	End If
End If

li_rtn = lhc_Client.SetRequestHeaders(ls_space)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SetRequestHeaders(space(5000)) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SetRequestHeaders(space(5000)) Success' + "~r~n"
	Else
		ls_OutPut += 'SetRequestHeaders(space(5000)) Failed' + "~r~n"
	End If
End If

//GetRequestHeaders
lhc_Client.ClearRequestHeaders()
ls_value = lhc_Client.GetRequestHeaders()
If IsNull (ls_value ) Then
	ls_OutPut += 'Clear GetRequestHeaders() = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'Clear GetRequestHeaders() = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'Clear GetRequestHeaders() = "" ' +  " Success" + "~r~n"
	End If
End If

ls_set = 'Accept:*/*' + "~r~n" + 'Content-Type:application/json'+ "~r~n" + 'Accept-Encoding:gzip' + "~r~n"
li_rtn = lhc_Client.SetRequestHeaders(ls_set)
ls_value = lhc_Client.GetRequestHeaders()
If IsNull (ls_value ) Then
	ls_OutPut += 'SetRequestHeaders() = null Failed' + "~r~n"
Else
	If trim(ls_value) = trim ( ls_set ) Then
		ls_OutPut += 'GetRequestHeaders() = SetRequestHeaders()  Success' + "~r~n"
	Else
		ls_OutPut += 'GetRequestHeaders() <> SetRequestHeaders()  Failed' + "~r~n"
	End If
End If

//SendRequest
String ls_body
//Get
lhc_Client.TimeOut = 10
li_rtn = lhc_Client.SendRequest("GET", is_url1 + "/api/Token/GetToken")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("GET", "url") = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("GET", "url") Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("GET") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("GET") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("GET") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("GET") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("GET") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If
//{"Code":400,"Message":"请求参数不完整或不正确","Data":""}

lhc_Client.GetResponsebody( ls_Body)

If ls_Body = '{"Code":400,"Message":"请求参数不完整或不正确","Data":""}' Then
	ls_OutPut += 'SendRequest GET return JSON Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest GET return JSON Failed' + "~r~n"
End If

//PUT
lhc_Client.ClearRequestHeaders()
String 	ls_PostData
ls_PostData = '{"Id":1,"Name":"Product1","Price":58.8,"Count":10}'
li_rtn = lhc_Client.SendRequest("PUT", is_Url1 + "/api/Product/EditProduct", ls_PostData)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("PUT", "url", "string" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("PUT", "url", "string" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("GET") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("GET") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("GET") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("GET") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("GET") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

ls_Body = ""
lhc_Client.GetResponsebody( ls_Body)

If ls_Body = '{"Code":400,"Message":"请求参数不完整或不正确","Data":""}' Then
	ls_OutPut += 'SendRequest PUT return JSON Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest PUT return JSON Failed' + "~r~n"
End If

//Delete
li_rtn = lhc_Client.SendRequest("DELETE", is_url1 + "/api/Product/DeleteProduct?id=1")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("DELETE", "url" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("DELETE", "url" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("DELETE") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("DELETE") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("DELETE") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("DELETE") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("DELETE") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

ls_Body = ""
lhc_Client.GetResponsebody( ls_Body)

If ls_Body = '{"Code":400,"Message":"请求参数不完整或不正确","Data":""}' Then
	ls_OutPut += 'SendRequest DELETE return JSON Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest DELETE return JSON Failed' + "~r~n"
End If

//POST
ls_PostData = "test.txt"
lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
li_rtn = lhc_Client.SendRequest("POST", is_url1 + "/api/File/CombineFile", ls_PostData)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("POST", "url", "string" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("POST", "url", "string" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

//考虑不同的编码
//ls_PostData = "test.txt"
//lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
//li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/File/CombineFile", ls_PostData, EncodingANSI) //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
//If IsNull (li_rtn ) Then
//	ls_OutPut += 'SendRequest("POST", "url", "string" ) = null Failed' + "~r~n"
//Else
//	If li_rtn = 1 Then
//		ls_OutPut += 'SendRequest("POST", "url", "string" ) Success' + "~r~n"
//	Else
//		Choose Case li_rtn
//			case -1
//				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
//			case -2
//				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
//			case -3
//				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
//			case -4
//				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
//			Case else
//				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
//		End Choose
//	End If
//End If

//lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
//li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/File/CombineFile", ls_PostData, EncodingUTF8!) //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
//If IsNull (li_rtn ) Then
//	ls_OutPut += 'SendRequest("POST", "url", "string" ) = null Failed' + "~r~n"
//Else
//	If li_rtn = 1 Then
//		ls_OutPut += 'SendRequest("POST", "url", "string" ) Success' + "~r~n"
//	Else
//		Choose Case li_rtn
//			case -1
//				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
//			case -2
//				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
//			case -3
//				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
//			case -4
//				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
//			Case else
//				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
//		End Choose
//	End If
//End If

//lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
//li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/File/CombineFile", ls_PostData, EncodingUTF16LE!) //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
//If IsNull (li_rtn ) Then
//	ls_OutPut += 'SendRequest("POST", "url", "string" ) = null Failed' + "~r~n"
//Else
//	If li_rtn = 1 Then
//		ls_OutPut += 'SendRequest("POST", "url", "string" ) Success' + "~r~n"
//	Else
//		Choose Case li_rtn
//			case -1
//				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
//			case -2
//				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
//			case -3
//				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
//			case -4
//				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
//			Case else
//				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
//		End Choose
//	End If
//End If

//lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
//li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/File/CombineFile", ls_PostData, EncodingUTF16BE!) //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
//If IsNull (li_rtn ) Then
//	ls_OutPut += 'SendRequest("POST", "url", "string" ) = null Failed' + "~r~n"
//Else
//	If li_rtn = 1 Then
//		ls_OutPut += 'SendRequest("POST", "url", "string" ) Success' + "~r~n"
//	Else
//		Choose Case li_rtn
//			case -1
//				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
//			case -2
//				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
//			case -3
//				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
//			case -4
//				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
//			Case else
//				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
//		End Choose
//	End If
//End If

ls_Body = ""
lhc_Client.GetResponsebody( ls_Body)
If ls_Body = '{"Code":400,"Message":"请求参数不完整或不正确","Data":""}' Then
	ls_OutPut += 'SendRequest POST return JSON Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest POST return JSON Failed' + "~r~n"
End If

//PATCH?

Long 	ll_num
Blob 	ls_blob
ls_blob = Blob ( "test.txt" )
ll_num = FileOpen( "md5.txt", StreamMode! )
If ll_num > 0 Then
	FileRead(ll_num, ls_blob)
	FileClose ( ll_num )
End IF

lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/File/CombineFile", ls_blob)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("POST", "url", "blob" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("POST", "url", "blob" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("POST") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("POST") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("POST") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("POST") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("POST") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

ls_Body = ""
lhc_Client.GetResponsebody( ls_Body)
If ls_Body = '{"Code":400,"Message":"请求参数不完整或不正确","Data":""}' Then
	ls_OutPut += 'SendRequest POST return JSON Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest POST return JSON Failed' + "~r~n"
End If

//null
li_rtn = lhc_Client.SendRequest("GET", ls_Null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("GET", Null ) = null Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest("GET", Null ) <> null Failed' + "~r~n"
End If

li_rtn = lhc_Client.SendRequest(ls_Null, is_URL1 + "/api/Product/EditProduct")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest(Null, "url" ) = null Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest(Null, "url" ) <> null Failed' + "~r~n"
End If

li_rtn = lhc_Client.SendRequest("POST", is_URL1 + "/api/Product/EditProduct", ls_Null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("POST", "url", Null ) = null Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest("POST", "url", Null ) <> null Failed' + "~r~n"
End If

li_rtn = lhc_Client.SendRequest("TEST", is_URL1 + "/api/Product/EditProduct")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("TEST", "url" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("TEST", "url" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("TEST") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("TEST") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("TEST") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("TEST") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("TEST") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

li_rtn = lhc_Client.SendRequest("GET", "")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("GET", "" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("GET", "" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("GET","") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("GET","") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("GET","") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("GET","") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("GET","") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

li_rtn = lhc_Client.SendRequest("", "")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("", "" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("", "" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("","") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("","") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("","") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("","") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("","") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

li_rtn = lhc_Client.SendRequest("", "", "")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("", "", "" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("", "", "" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("","", "") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("","", "") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("","", "") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("","", "") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("","", "") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

li_rtn = lhc_Client.SendRequest(ls_space, "", "")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest(space(5000), "", "" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest(space(5000), "", "" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest(space(5000),"", "") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest(space(5000),"", "") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest(space(5000),"", "") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest(space(5000),"", "") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest(space(5000),"", "") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If


li_rtn = lhc_Client.SendRequest("GET", ls_space, "")
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("GET",space(5000), "" ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("GET",space(5000), "" ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("GET",space(5000), "") - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("GET",space(5000), "") - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("GET",space(5000), "") - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("GET",space(5000), "") - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("GET",space(5000), "") - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

li_rtn = lhc_Client.SendRequest("GET", is_URL1 + "/api/Product/EditProduct", ls_space)
If IsNull (li_rtn ) Then
	ls_OutPut += 'SendRequest("GET", "url", space(5000) ) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'SendRequest("GET", "url", space(5000) ) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'SendRequest("GET","url", space(5000)) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'SendRequest("GET","url", space(5000)) - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'SendRequest("GET","url", space(5000)) - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'SendRequest("GET","url", space(5000)) - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'SendRequest("GET","url", space(5000)) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

//-1
li_rtn = lhc_Client.SendRequest("GET", "http://www.appeon11.com")

If li_rtn = -1 Then
	ls_OutPut += 'SendRequest("GET","url") - General error Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest("GET","url") - General error Failed' + "~r~n"
End If		

//-2
li_rtn = lhc_Client.SendRequest("GET", "http:www.appeon11.com")

If li_rtn = -2 Then
	ls_OutPut += 'SendRequest("GET","url") - Invalid URL Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest("GET","url") - Invalid URL Failed' + "~r~n"
End If	
//-3 // 需要断网，有时间单独测试
//li_rtn = lhc_Client.SendRequest("GET", "http://www.appeon.com")
//
//If li_rtn = -3 Then
//	ls_OutPut += 'SendRequest("GET","url") - Cannot connect to the Internet Success' + "~r~n"
//Else
//	ls_OutPut += 'SendRequest("GET","url") - Cannot connect to the InternetL Failed' + "~r~n"
//End If	
//-4
lhc_Client.TimeOut = 1
li_rtn = lhc_Client.SendRequest("GET", "http://www.baidu.com")
If li_rtn = -4 Then
	ls_OutPut += 'SendRequest("GET","url") - Timeout Success' + "~r~n"
Else
	ls_OutPut += 'SendRequest("GET","url") - Timeout Failed' + "~r~n"
End If	

//PostDataStart
//PostData
//PostDataEnd
Long 	li_PackCount, ll_I
Integer li_rc

Blob 	lb_trim, lb_data, b
Long 	flen, loops,new_pos, i, bytes_read

//flen = FileLength("pic.bmp")
flen = FileLength("md5.txt")
If flen = 0 Then
	messagebox('提示','文件长度为0！',StopSign!)	
	return
End If

lhc_Client.TimeOut = 0
lhc_Client.SetRequestHeader( "Content-Length", string (flen) )

li_rtn = lhc_Client.PostDataStart( is_URL1 + "/api/File/CombineFile")
If IsNull (li_rtn ) Then
	ls_OutPut += 'PostDataStart(Blob) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'PostDataStart(Blob) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'PostDataStart(Blob) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'PostDataStart(Blob) - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'PostDataStart(Blob) - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'PostDataStart(Blob) - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'PostDataStart(Blob) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If



//ll_Num = FileOpen("pic.bmp", StreamMode!, Read!, LockRead!)
ll_Num = FileOpen("md5.txt", StreamMode!, Read!, LockRead!)
If ll_Num = -1 Then
	messagebox('提示','打开文件失败！',StopSign!)
	return
End If
//st_start.text = string(now(),'hh:mm:ss:fff')

If flen > 32765 Then
	If Mod(flen, 32765) = 0 Then
		loops = flen/32765
	ELSE
		loops = (flen/32765) + 1
	End If
ELSE
	loops = 1
End If
new_pos = 1
FOR i = 1 to loops
	bytes_read = FileRead(ll_Num, b)
	lb_data = lb_data + b
NEXT
FileClose(ll_Num)

If li_rtn = 1 Then
	li_PackCount = Ceiling ( Len ( lb_data) / 1024 )
	For ll_I= 1 To li_PackCount
		lb_trim = BlobMid(lb_data, (ll_I - 1 ) * 1024 + 1, 1024 )
		li_rc = lhc_Client.PostData(lb_trim, 1024)
		IF IsNull ( li_rc ) Or li_rc <> 1 then
			exit
		End IF
	Next
	If IsNull (li_rc ) Then
		ls_OutPut += 'PostData( blob, 1024) = null Failed' + "~r~n"
	Else
		If li_rc = 1 Then
			ls_OutPut += 'PostData( blob, 1024) Success' + "~r~n"
		Else
			Choose Case li_rc
				case -1
					ls_OutPut += 'PostData( blob, 1024) - General error Failed' + "~r~n"
				case -2
					ls_OutPut += 'PostData( blob, 1024) - Timeout Failed' + "~r~n"				
				Case else
					ls_OutPut += 'PostData( blob, 1024) - Unknow Failed' + "~r~n"
			End Choose
		End If
	End If
End If

li_rtn = lhc_Client.PostDataEnd()
If IsNull (li_rtn ) Then
	ls_OutPut += 'Blob PostDataEnd() = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'Blob PostDataEnd() Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'Blob PostDataEnd() - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Blob PostDataEnd() - Invalid URL Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Blob PostDataEnd() - Unknow Failed' + "~r~n"
		End Choose
	End If
End If


li_rtn = lhc_Client.PostDataStart( is_URL1 + "is_URL1 + /api/File/CombineFile")
If IsNull (li_rtn ) Then
	ls_OutPut += 'PostDataStart(String) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'PostDataStart(String) Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'PostDataStart(String) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'PostDataStart(String) - Invalid URL Failed' + "~r~n"
			case -3
				ls_OutPut += 'PostDataStart(String) - Cannot connect to the Internet Failed' + "~r~n"
			case -4
				ls_OutPut += 'PostDataStart(String) - Timeout Failed' + "~r~n"
			Case else
				ls_OutPut += 'PostDataStart(String) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If


If li_rtn = 1 Then	
	li_rc = lhc_Client.PostData(string (lb_data), flen)	
	If IsNull (li_rc ) Then
		ls_OutPut += 'PostData( String, Len(String)) = null Failed' + "~r~n"
	Else
		If li_rc = 1 Then
			ls_OutPut += 'PostData( String, Len(String)) Success' + "~r~n"
		Else
			Choose Case li_rc
				case -1
					ls_OutPut += 'PostData( String, Len(String)) - General error Failed' + "~r~n"
				case -2
					ls_OutPut += 'PostData( String, Len(String)) - Timeout Failed' + "~r~n"				
				Case else
					ls_OutPut += 'PostData( String, Len(String)) - Unknow Failed' + "~r~n"
			End Choose
		End If
	End If
End If

li_rtn = lhc_Client.PostDataEnd()
If IsNull (li_rtn ) Then
	ls_OutPut += 'String PostDataEnd() = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'String PostDataEnd() Success' + "~r~n"
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'String PostDataEnd() - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'String PostDataEnd() - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'String PostDataEnd() - Unknow Failed' + "~r~n"
		End Choose
	End If
End If



mle_2.text += ls_output

If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )


end subroutine

public subroutine wf_httpclient_properties ();String 	ls_OutPut
Long 		ll_TimeOut, ll_I
Integer 	li_ProTocol
Boolean 	lb_Auto
HttpClient 	lhc_Client

lhc_Client = Create HttpClient

ls_OutPut = "-----------HttpClient Properties-----------" + "~r~n"
//AutoReadData
lb_Auto = lhc_Client.AutoReadData
If Not lb_Auto Then
	ls_OutPut += "Default AutoReadData = False Success" + "~r~n"
Else
	ls_OutPut += "Default AutoReadData <> False Failed" + "~r~n"
End If

lhc_Client.AutoReadData = True
If lhc_Client.AutoReadData Then
	ls_OutPut += "Set AutoReadData = True Success" + "~r~n"
Else
	ls_OutPut += "Set AutoReadData = True Failed" + "~r~n"
End If

//SecureProtocol
li_ProTocol = lhc_Client.SecureProtocol
If li_ProTocol = 0 Then
	ls_OutPut += "Default SecureProtocol = 0 Success" + "~r~n"
Else
	ls_OutPut += "Default SecureProtocol <> 0 Failed" + "~r~n"
End If

For ll_I = 1 To 5	
	lhc_Client.SecureProtocol = ll_I
	If lhc_Client.SecureProtocol = ll_I Then
		ls_OutPut += "Set SecureProtocol = "+String ( ll_I)+" Success" + "~r~n"
	Else
		ls_OutPut += "Set SecureProtocol = "+String ( ll_I ) +" Failed" + "~r~n"
	End If
Next

lhc_Client.SecureProtocol = 32767
If lhc_Client.SecureProtocol = 32767 Then
	ls_OutPut += "Set Max SecureProtocol = 32767 Success ??" + "~r~n"
Else
	ls_OutPut += "Set Max SecureProtocol = 32767 Failed" + "~r~n"
End If

lhc_Client.SecureProtocol = -32768
If lhc_Client.SecureProtocol = -32768 Then
	ls_OutPut += "Set Min SecureProtocol = -32768 Success ??" + "~r~n"
Else
	ls_OutPut += "Set Min SecureProtocol = -32768 Failed" + "~r~n"
End If

//SSL
//0	 – All secure protocols. This is a default value.
//1	 – SSL2
//2	 – SSL3
//3	 – TLS1.0
//4	 – TLS1.1
//5	 – TLS1.2
//https://www.ssllabs.com/ssltest/    可以测试该网站支持的版本协议

Long 		ll_rtn, ll_Code
String 	ls_Respose, ls_Body, ls_txt
lhc_Client.SecureProtocol = 0
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 0 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 0 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 0 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 0 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 0 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 0 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 0 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 0 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 0 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 0 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If

//lhc_Client.SecureProtocol = 1
lhc_Client.SecureProtocol = 1
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 1 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 1 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 1 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 1 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 1 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 1 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 1 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 1 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 1 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 1 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If
//lhc_Client.SecureProtocol = 2
lhc_Client.SecureProtocol =2
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 2 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 2 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 2 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 2 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 2 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 2 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 2 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 2 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 2 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 2 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If
//lhc_Client.SecureProtocol = 3
lhc_Client.SecureProtocol =3
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 3 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 3 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 3 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 3 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 3 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 3 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 3 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 3 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 3 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 3 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If
//lhc_Client.SecureProtocol = 4
lhc_Client.SecureProtocol = 4
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 4 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 4 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 4 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 4 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 4 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 4 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 4 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 4 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 4 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 4 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If
//lhc_Client.SecureProtocol = 5
lhc_Client.SecureProtocol = 5
ll_rtn = lhc_Client.SendRequest("GET", "https://webapi.appeon.com/employee/getemployees")
If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	If Pos ( ls_body, "First_name" ) > 0 Then
		ls_OutPut += "Https 5 SendRequest Success" + "~r~n"
	Else
		ls_OutPut += "Https 5 SendRequest Failed" + "~r~n"
	End If
	ll_Code = lhc_Client.GetResponseStatusCode()
	If ll_Code > 0 Then
		ls_OutPut += "Https 5 GetResponseStatusCode = " + String ( ll_Code ) + " Success" + "~r~n"
	Else
		ls_OutPut += "Https 5 GetResponseStatusCode = " + String ( ll_Code ) + " Failed" + "~r~n"
	End If
	ls_txt = lhc_Client.GetResponseStatusText()
	If Len ( ls_txt ) > 0 Then
		ls_OutPut += "Https 5 GetResponseStatusText = " +ls_txt+ " Success" + "~r~n"
	Else
		ls_OutPut += "Https 5 GetResponseStatusText = '' Failed" + "~r~n"
	End If
Else
	Choose Case ll_rtn
			case 0
				ls_OutPut += 'Https 5 SendRequest  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'Https 5 SendRequest  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Https 5 SendRequest - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Https 5 SendRequest - Unknow Failed' + "~r~n"
		End Choose
End If

//Timeout
ll_TimeOut = lhc_Client.Timeout
If ll_TimeOut = 60 Then
	ls_OutPut += "Default Timeout = 60 Success" + "~r~n"
Else
	ls_OutPut += "Default Timeout <> 60 Failed" + "~r~n"
End If

lhc_Client.Timeout = 20
If lhc_Client.Timeout = 20 Then
	ls_OutPut += "Set Timeout = 20 Success" + "~r~n"
Else
	ls_OutPut += "Set Timeout = 20 Failed" + "~r~n"
End If

lhc_Client.Timeout = 4294967295
If lhc_Client.Timeout = 4294967295 Then
	ls_OutPut += "Set Max Timeout = 4294967295 Success" + "~r~n"
Else
	ls_OutPut += "Set Max Timeout = 4294967295 Failed" + "~r~n"
End If

lhc_Client.Timeout = -4294967295
If lhc_Client.Timeout = -4294967295 Then
	ls_OutPut += "Set Min Timeout = -4294967295 Success ??" + "~r~n"
Else
	ls_OutPut += "Set Min Timeout = -4294967295 Failed" + "~r~n"
End If

mle_2.text += ls_output

If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
end subroutine

public subroutine wf_httpclient_argument (httpclient ahc_1, ref httpclient ahc_2, httpclient ahc_array[]);//
String ls_value

If IsValid ( ahc_1 ) Then
	mle_2.text += "HttpClient Functions: value Argument Success" + "~r~n"
	ls_Value = ahc_1.GetRequestHeader ( "Pragma" )
	If ls_Value = "no-cache" Then
		mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Success" + "~r~n"
	Else
		mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
	End If
Else
	mle_2.text += "HttpClient Functions: value Argument Failed" + "~r~n"
	mle_2.text += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
End If

If IsValid ( ahc_2 ) Then
	mle_2.text += "HttpClient Functions: reference Argument Success" + "~r~n"
Else
	mle_2.text += "HttpClient Functions: reference Argument Failed" + "~r~n"
End If

If UpperBound ( ahc_array ) > 0 Then
	If IsValid ( ahc_array[1] ) Then
		mle_2.text += "HttpClient Functions: Array Argument Success" + "~r~n"
	Else
		mle_2.text += "HttpClient Functions: Array Argument Failed" + "~r~n"
	End If	
Else
	mle_2.text += "HttpClient Functions: Array Argument Failed" + "~r~n"
End If
end subroutine

public function string wf_gettimestamp ();Long 		ll_days, ll_Seconds, ll_microsecond
Double 	ll_Stamp
Date 		ld_Today
Time 		lt_Now

ld_Today = Today()
ll_days = DaysAfter ( Date(1970,1,1), ld_Today )

lt_Now = Now()
ll_Seconds = SecondsAfter ( Time ( 8,0,0 ), lt_Now )

ll_Stamp = ll_days * 24 * 60 * 60 + ll_Seconds


Return String ( ll_Stamp ) + Left ( String ( lt_now, "ffffff" ), 3 )
end function

public subroutine wf_httpclient_response ();Integer	 	li_rtn
String 	ls_OutPut, ls_value, ls_null, ls_space, ls_set, ls_error
HttpClient lhc_Client, lhc_Client2
Long 		ll_Null

SetNull ( ll_Null )
SetNull ( ls_null )
ls_space = space(5000)

ls_OutPut = "-----------HttpClient Response-----------" + "~r~n"

lhc_Client = Create HttpClient
lhc_Client2 = Create HttpClient

lhc_Client.TimeOut = 10000
lhc_Client.SetRequestHeader ( "staffid", "10000" )
lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
lhc_Client.SetRequestHeader ( "nonces", "1862893498")
lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
lhc_Client.SetRequestHeader ( "Pragma", "no-cache" )

lhc_Client.SendRequest("GET", is_URL1 + "/api/Token/GetToken?staffId=10000")

//GetResponseHeader
ls_value = lhc_Client.GetResponseHeader("Pragma")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeader("Pragma") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetResponseHeader("Pragma") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeader("Pragma") = "" ' + " Failed" + "~r~n"
	End If
End If


ls_value = lhc_Client.GetResponseHeader("")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeader("") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetResponseHeader("") = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeader("") = "" ' + " Success" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetResponseHeader( ls_Null )
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeader( Null ) = null Success' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetResponseHeader( Null ) = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeader( Null ) = "" ' + " Failed" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetResponseHeader( ls_space )
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeader( space(5000) ) = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetResponseHeader( space(5000) ) = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeader( space(5000) ) = "" ' + " Success" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetResponseHeader("pragmA")
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeader("pragmA") = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'GetResponseHeader("pragmA") = ' + trim(ls_value) + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeader("pragmA") = "" ' + " Failed" + "~r~n"
	End If
End If

//GetResponseHeaders
ls_value = lhc_Client2.GetResponseHeaders()
If IsNull (ls_value ) Then
	ls_OutPut += 'Create GetResponseHeaders() = null Failed' + "~r~n"
Else
	If Len ( ls_value ) > 0 Then
		ls_OutPut += 'Create GetResponseHeaders() = ' + trim(ls_value) + " Failed" + "~r~n"
	Else
		ls_OutPut += 'Create GetResponseHeaders() = "" ' + " Success" + "~r~n"
	End If
End If

ls_value = lhc_Client.GetResponseHeaders()
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseHeaders() = null Failed' + "~r~n"
Else
	If Pos( ls_value, "Content-Type" ) > 0 Then
		ls_OutPut += 'GetResponseHeaders() Exists "Content-Type"' + " Success" + "~r~n"
	Else
		ls_OutPut += 'GetResponseHeaders() Not Exists "Content-Type" ' + " Failed" + "~r~n"
	End If
End If

//GetResponseBody
Blob 	lb_data, lb_Null
SetNull(ls_value)
SetNull(lb_Null)
li_rtn = lhc_Client2.GetResponseBody(ls_value)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create GetResponseBody(Null) = null Success' + "~r~n"
Else
	ls_OutPut += 'Create GetResponseBody(Null) = Not null Failed' + "~r~n"		
End If

li_rtn = lhc_Client2.GetResponseBody(ls_value, EncodingUTF8!)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create GetResponseBody(Null,EncodingUTF8!) = null Success' + "~r~n"
Else
	ls_OutPut += 'Create GetResponseBody(Null,EncodingUTF8!) = Not null Failed' + "~r~n"		
End If

li_rtn = lhc_Client2.GetResponseBody(lb_Null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create GetResponseBody(lb_Null) = null Success' + "~r~n"
Else
	ls_OutPut += 'Create GetResponseBody(lb_Null) = Not null Failed' + "~r~n"		
End If

ls_value = ""
li_rtn = lhc_Client2.GetResponseBody(ls_value)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create GetResponseBody(ls_value) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'Create GetResponseBody(ls_value) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'Create GetResponseBody(ls_value) = null Success' + "~r~n"
		Else			
			ls_OutPut += 'Create GetResponseBody(ls_value) = Not null" ' + " Failed" + "~r~n"			
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'Create GetResponseBody(ls_value) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'Create GetResponseBody(ls_value) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'Create GetResponseBody(ls_value) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If
lhc_Client.SendRequest( "GET", is_URL2 + "/restful/charset.php?encoding=utf8" )
li_rtn = lhc_Client.GetResponseBody(ls_value)
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(ls_value) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(ls_value) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'GetResponseBody(ls_value) = null Failed' + "~r~n"
		Else
			If Pos( ls_value, "齐齐哈尔" ) > 0 Then
				ls_OutPut += 'GetResponseBody(ls_value) Exists "齐齐哈尔"' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(ls_value) Not Exists "齐齐哈尔" ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'GetResponseBody(ls_value) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(ls_value) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(ls_value) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

//https://api.appeon.com/test/json.php?encoding=ansi
//https://api.appeon.com/test/json.php?encoding=utf8
//https://api.appeon.com/test/json.php?encoding=utf16le
//https://api.appeon.com/test/json.php?encoding=utf16be

//http://192.0.2.195/restful/charset.php?encoding=utf8
//http://192.0.2.195/restful/charset.php?encoding=ansi
//http://192.0.2.195/restful/charset.php?encoding=utf16le
//http://192.0.2.195/restful/charset.php?encoding=utf16be


lhc_Client.SendRequest( "GET", is_URL2 + "/restful/charset.php?encoding=utf8" )
li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF8!)  //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) = null Failed' + "~r~n"
		Else
			If Pos( ls_value, "珠海" ) > 0 Then
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) Exists "珠海"' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) Not Exists "珠海" ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF8!) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If
lhc_Client.SendRequest( "GET", is_URL1 + "/restful/charset.php?encoding=ansi" )
li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingANSI!)  //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) = null Failed' + "~r~n"
		Else
			If Pos( ls_value, "张家界" ) > 0 Then
				ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) Exists "张家界"' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) Not Exists "张家界" ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingANSI!) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If
lhc_Client.SendRequest( "GET", is_URL2 + "5/restful/charset.php?encoding=utf16le" )
li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16LE!)  //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) = null Failed' + "~r~n"
		Else
			If Pos( ls_value, "北京" ) > 0 Then
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) Exists "北京"' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) Not Exists "北京" ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16LE!) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If
lhc_Client.SendRequest( "GET", is_URL2 + "/restful/charset.php?encoding=utf16be" )
li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16BE!)  //EncodingANSI! EncodingUTF8! EncodingUTF16LE! EncodingUTF16BE!
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) Success' + "~r~n"
		If IsNull (ls_value ) Then
			ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) = null Failed' + "~r~n"
		Else
			If Pos( ls_value, "广州" ) > 0 Then
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) Exists "广州"' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) Not Exists "广州" ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case -1
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(ls_value,EncodingUTF16BE!) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

//lhc_Client.SendRequest("GET","http://127.0.0.1/1.jpg")
li_rtn = lhc_Client.GetResponseBody(lb_data) 
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseBody(blob) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'GetResponseBody(blob) Success' + "~r~n"
		If IsNull (lb_data ) Then
			ls_OutPut += 'GetResponseBody(blob) = null Failed' + "~r~n"
		Else
			If Len ( lb_data ) > 0 Then
				ls_OutPut += 'GetResponseBody(blob) Exists byte "' + " Success" + "~r~n"
			Else
				ls_OutPut += 'GetResponseBody(blob) Not Exists byte ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn			
			case -1
				ls_OutPut += 'GetResponseBody(blob) - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'GetResponseBody(blob) - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'GetResponseBody(blob) - Unknow Failed' + "~r~n"
		End Choose
	End If
End If


//ReadData
li_rtn = lhc_Client2.ReadData(lb_data, ll_null)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create ReadData(Blob,Null) = null Success' + "~r~n"
Else
	ls_OutPut += 'Create ReadData(Blob,Null) = Not null Failed' + "~r~n"		
End If

li_rtn = lhc_Client2.ReadData(lb_null, 1024)
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create ReadData(Blob,1024) = null Success' + "~r~n"
Else
	ls_OutPut += 'Create ReadData(Blob,1024) = Not null Failed' + "~r~n"		
End If

lhc_Client.SendRequest("GET","http://127.0.0.1/1.jpg")
li_rtn = lhc_Client.ReadData(lb_data, 1024*8) 
If IsNull (li_rtn ) Then
	ls_OutPut += 'ReadData(blob,1024*8) = null Failed' + "~r~n"
Else
	If li_rtn = 1 Then
		ls_OutPut += 'ReadData(blob,1024*8)  Success' + "~r~n"
		If IsNull (lb_data ) Then
			ls_OutPut += 'ReadData(blob,1024*8)  = null Failed' + "~r~n"
		Else
			If Len ( lb_data ) > 0 Then
				ls_OutPut += 'ReadData(blob,1024*8)  Exists byte ' + " Success" + "~r~n"
			Else
				ls_OutPut += 'ReadData(blob,1024*8)  Not Exists byte ' + " Failed" + "~r~n"
			End If
		End If
	Else
		Choose Case li_rtn
			case 0
				ls_OutPut += 'ReadData(blob,1024*8)  - Reading data is finished Failed' + "~r~n"
			case -1
				ls_OutPut += 'ReadData(blob,1024*8)  - General error Failed' + "~r~n"
			case -2
				ls_OutPut += 'ReadData(blob,1024*8)  - Timeout Failed' + "~r~n"			
			Case else
				ls_OutPut += 'ReadData(blob,1024*8)  - Unknow Failed' + "~r~n"
		End Choose
	End If
End If

//GetResponseStatusCode
li_rtn = lhc_Client2.GetResponseStatusCode() 
If IsNull (li_rtn ) Then
	ls_OutPut += 'Create GetResponseStatusCode() = null Failed' + "~r~n"
Else
	ls_OutPut += 'Create GetResponseStatusCode() = '+String (li_rtn)+' Success' + "~r~n"	
End If

li_rtn = lhc_Client.GetResponseStatusCode() 
If IsNull (li_rtn ) Then
	ls_OutPut += 'GetResponseStatusCode() = null Failed' + "~r~n"
Else
	ls_OutPut += 'GetResponseStatusCode() = '+String (li_rtn)+' Success' + "~r~n"	
End If

//GetResponseStatusText
ls_value = lhc_Client2.GetResponseStatusText() 
If IsNull (ls_value ) Then
	ls_OutPut += 'Create GetResponseStatusText() = null Failed' + "~r~n"
Else
	ls_OutPut += 'Create GetResponseStatusText() = '+ls_value+' Success' + "~r~n"	
End If

ls_value = lhc_Client.GetResponseStatusText() 
If IsNull (ls_value ) Then
	ls_OutPut += 'GetResponseStatusText() = null Failed' + "~r~n"
Else
	ls_OutPut += 'GetResponseStatusText() = '+ls_value+' Success' + "~r~n"	
End If

//1XX
//2XX
//3XX
//4XX
//5XX


mle_2.text += ls_output

If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
If IsValid ( lhc_Client2 ) Then DesTroy ( lhc_Client2 )

end subroutine

on w_httpclient_bak.create
this.cb_1=create cb_1
this.mle_2=create mle_2
this.st_2=create st_2
this.mle_1=create mle_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.mle_2,&
this.st_2,&
this.mle_1,&
this.st_1}
end on

on w_httpclient_bak.destroy
destroy(this.cb_1)
destroy(this.mle_2)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.st_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)

is_url1 = profilestring("config.ini","settings","url1","")
is_url2 = profilestring("config.ini","settings","url2","")

mle_1.Text = is_url1 + "~n" + is_Url2

//4.1.1	HttpClient对象用例（PB系统对象）
//	通过classname，获取新加对象的类名
//	Typeof、ClassName函数的返回值
//	通过create和destroy，创建和销毁对象
//	手工封装HttpClient对象，自定义常用函数，方便继承调用
//	语法异常测试？
//	组合测试，场景设计？
//	变量范围，放全局变量？重复调用？HttpClient是否加到已有的用户对象列表里？
//	安全验证怎么测试？
//	作为参数传递application、window(事件，函数，message)，UserObject，Functions，structure
//

//Run item
//cb_1.Event Clicked()
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type cb_1 from commandbutton within w_httpclient_bak
integer x = 23
integer y = 580
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Run item"
end type

event clicked;
mle_2.Text = ""
//classic
wf_classic_HttpClient()
//Request
wf_HttpClient_Request()
////Response
wf_HttpClient_Response()
////Properties
wf_HttpClient_Properties()
end event

type mle_2 from multilineedit within w_httpclient_bak
integer x = 1554
integer y = 96
integer width = 2043
integer height = 1700
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_httpclient_bak
integer x = 1810
integer y = 20
integer width = 270
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_httpclient_bak
integer x = 18
integer y = 112
integer width = 1463
integer height = 364
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_httpclient_bak
integer x = 9
integer y = 24
integer width = 352
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url"
boolean focusrectangle = false
end type

