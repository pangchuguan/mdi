$PBExportHeader$w_httpclient.srw
forward
global type w_httpclient from w_appeon_base
end type
type cb_6 from commandbutton within w_httpclient
end type
type p_1 from picture within w_httpclient
end type
type cb_7 from commandbutton within w_httpclient
end type
type httpclient_1 from httpclient within w_httpclient
end type
end forward

shared variables
HttpClient 	shc_HttpClient
end variables

global type w_httpclient from w_appeon_base
event type string ue_httpclient_argument ( httpclient ahc_1,  ref httpclient ahc_2,  httpclient ahc_array[] )
cb_6 cb_6
p_1 p_1
cb_7 cb_7
httpclient_1 httpclient_1
end type
global w_httpclient w_httpclient

type variables
HttpClient 	ihc_HttpClient
String 		is_Restful_http_DotNet,is_Restful_https_DotNet, is_Restful_http_PHP, is_Restful_http_Java, is_Restful_https_Java
string 		is_name
end variables

forward prototypes
public subroutine wf_init ()
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public function string wf_gettimestamp ()
public function string wf_httpclient_argument (any ahc_1, ref httpclient ahc_2, httpclient ahc_array[])
public subroutine wf_scriptexe4 (string as_item, boolean ab_execute)
public subroutine wf_scriptexe1 (string as_item, boolean ab_execute)
public subroutine wf_scriptexe2 (string as_item, boolean ab_execute)
public subroutine wf_scriptexe3 (string as_item, boolean ab_execute)
public function any wf_httpclient_any_ref (ref httpclient ahc_1)
public function any wf_httpclient_any_readonly (readonly httpclient ahc_1)
end prototypes

event type string ue_httpclient_argument(httpclient ahc_1, ref httpclient ahc_2, httpclient ahc_array[]);//====================================================================
// Event: ue_httpclient_argument
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        httpclient    ahc_1
// 	reference    httpclient    ahc_2
// 	value        httpclient    ahc_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-20
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


string ls_Value, ls_Return

If IsValid ( ahc_1 ) Then
	ls_Return += "HttpClient Event: value Argument Success" + "~r~n"
	ls_Value = ahc_1.GetRequestHeader ( "Pragma" )
	If ls_Value = "no-cache" Then
		ls_Return += "HttpClient Event: GetRequestHeader('Pragma') Success" + "~r~n"
	Else
		ls_Return += "HttpClient Event: GetRequestHeader('Pragma') Failed" + "~r~n"
	End If
Else
	ls_Return += "HttpClient Event: value Argument Failed" + "~r~n"
	ls_Return += "HttpClient Event: GetRequestHeader('Pragma') Failed" + "~r~n"
End If

If IsValid ( ahc_2 ) Then
	ls_Return += "HttpClient Event: reference Argument Success" + "~r~n"
Else
	ls_Return += "HttpClient Event: reference Argument Failed" + "~r~n"
End If

If UpperBound ( ahc_array ) > 0 Then
	If IsValid ( ahc_array[1] ) Then
		ls_Return += "HttpClient Event: Array Argument Success" + "~r~n"
		ls_return += "HttpClient Event: Array Argument Success" + "~r~n"
		ls_Value = ahc_array[1].GetRequestHeader ( "Pragma" )
		If ls_Value = "no-cache" Then
			ls_return += "HttpClient Event Array: GetRequestHeader('Pragma') Success" + "~r~n"
		Else
			ls_return += "HttpClient Event Array: GetRequestHeader('Pragma') Failed" + "~r~n"
		End If
	Else
		ls_Return += "HttpClient Event: Array Argument Failed" + "~r~n"
	End If	
Else
	ls_Return += "HttpClient Event: Array Argument Failed" + "~r~n"
End If

Return ls_Return
end event

public subroutine wf_init ();//P001_classic_Create
//p001a_classic_classdefinition
//P002_classic_ClassName
//P003_classic_TypeOf
//P004_classic_Any
//P005_classic_PowerObject
//P006_classic_InstanceVariables
//P007_classic_SharedVariables
//P008_classic_GlobalVariables
//P009_classic_Argument
//P010_classic_Array
//P011_fnRequest_ClearRequestHeaders
//P012_fnRequest_SetRequestHeader
//P013_fnRequest_GetRequestHeader
//P014_fnRequest_SetRequestHeaders
//P015_fnRequest_GetRequestHeaders
//P016_fnRequest_SendRequestGET
//P017_fnRequest_SendRequestPUT
//P018_fnRequest_SendRequestDelete
//P019_fnRequest_SendRequestPOST
//P020_fnRequest_SendRequestPOST_ANSI
//P021_fnRequest_SendRequestPOST_UTF8
//P022_fnRequest_SendRequestPOST_UTF16LE
//P023_fnRequest_SendRequestPOST_UTF16BE
//P024_fnRequest_SendRequestPATCH
//P025_fnRequest_SendRequestNull
//P026_fnRequest_PostData
//P027_fnResponse_GetResponseHeader
//P028_fnResponse_GetResponseHeaders
//P029_fnResponse_GetResponseBody
//P030_fnResponse_GetResponseBody_ANSI
//P031_fnResponse_GetResponseBody_UTF8
//P032_fnResponse_GetResponseBody_UTF16LE
//P033_fnResponse_GetResponseBody_UTF16BE
//P034_fnResponse_GetResponseBody_Blob
//P035_fnResponse_ReadData
//P036_fnResponse_GetResponseStatusCode
//P037_fnResponse_GetResponseStatusText
//P038_Properties_AutoReadData
//P039_Properties_SecureProtocol
//P040_Properties_SecureProtocol_SSL2
//P041_Properties_SecureProtocol_SSL3
//P042_Properties_SecureProtocol_TLS1.0
//P043_Properties_SecureProtocol_TLS1.1
//P044_Properties_SecureProtocol_TLS1.2
//P045_Properties_Timeout


is_testitems = "P001_classic_Create,P001a_classic_Create,p001b_classic_classdefinition,P002_classic_ClassName,P003_classic_TypeOf,P004_classic_Any,P005_classic_PowerObject,P006_classic_InstanceVariables,P007_classic_SharedVariables,P008_classic_GlobalVariables,P009_classic_Argument,P010_classic_Array" + &
",P011_fnRequest_ClearRequestHeaders,P012_fnRequest_SetRequestHeader,P013_fnRequest_GetRequestHeader,P014_fnRequest_SetRequestHeaders,P015_fnRequest_GetRequestHeaders,P016_fnRequest_SendRequestGET,P017_fnRequest_SendRequestPUT,P018_fnRequest_SendRequestDelete,P019_fnRequest_SendRequestPOST,P020_fnRequest_SendRequestPOST_ANSI,P021_fnRequest_SendRequestPOST_UTF8,P022_fnRequest_SendRequestPOST_UTF16LE,P023_fnRequest_SendRequestPOST_UTF16BE,P024_fnRequest_SendRequestPATCH,P025_fnRequest_SendRequestNull,P026_fnRequest_PostData" + &
",P027_fnResponse_GetResponseHeader,P028_fnResponse_GetResponseHeaders,P029_fnResponse_GetResponseBody,P030_fnResponse_GetResponseBody_ANSI,P031_fnResponse_GetResponseBody_UTF8,P032_fnResponse_GetResponseBody_UTF16LE,P033_fnResponse_GetResponseBody_UTF16BE,P034_fnResponse_GetResponseBody_Blob,P035_fnResponse_ReadData,P036_fnResponse_GetResponseStatusCode/Text,P038_Properties_AutoReadData,P039_Properties_SecureProtocol,P040_Properties_SecureProtocol_SSL2,P041_Properties_SecureProtocol_SSL3,P042_Properties_SecureProtocol_TLS1.0,P043_Properties_SecureProtocol_TLS1.1,P044_Properties_SecureProtocol_TLS1.2,P045_Properties_Timeout"

//设置测试总体描述
is_testpurpose = "HttpClient test"

is_Restful_http_DotNet = profilestring("config.ini","settings","Restful_http_DotNet","") //.Net Restful
is_Restful_https_DotNet = profilestring("config.ini","settings","Restful_https_DotNet","") //.Net Restful
is_Restful_http_PHP = profilestring("config.ini","settings","Restful_http_PHP","") //PHP Restful
is_Restful_http_Java = profilestring("config.ini","settings","Restful_http_Java","") //Java Restful
is_Restful_https_Java = profilestring("config.ini","settings","Restful_https_Java","") //Java Restful

//初始化结果集文件
is_expfile = "exp.txt"
is_realfile = "real.txt"

//清空运行值
is_realvalue = ""

end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);
String ls_item

If ai_item < 1 Then Return
ls_item = lb_1.text(ai_item)

If ab_execute Then 
	wf_output("-----Test Point:" + ls_item + "-----", True)
End If

If POS ( ls_item, "_classic_" ) > 0 Then
	wf_ScriptExe1 ( ls_item, ab_execute )
End If

If POS ( ls_item, "_fnRequest_" ) > 0 Then
	wf_ScriptExe2 ( ls_item, ab_execute )
End If

If POS ( ls_item, "_fnResponse_" ) > 0 Then
	wf_ScriptExe3 ( ls_item, ab_execute )
End If

If POS ( ls_item, "_Properties_" ) > 0 Then
	wf_ScriptExe4 ( ls_item, ab_execute )
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

public function string wf_httpclient_argument (any ahc_1, ref httpclient ahc_2, httpclient ahc_array[]);//====================================================================
// Function: wf_httpclient_argument
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        any           ahc_1
// 	reference    httpclient    ahc_2
// 	value        httpclient    ahc_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-20
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
//
String ls_value, ls_return
HttpClient lhc_Client

lhc_Client = ahc_1

If IsValid ( lhc_Client ) Then
	ls_return += "HttpClient Functions: value Argument Success" + "~r~n"
	ls_Value = lhc_Client.GetRequestHeader ( "Pragma" )
	If ls_Value = "no-cache" Then
		ls_return += "HttpClient Functions: GetRequestHeader('Pragma') Success" + "~r~n"
	Else
		ls_return += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
	End If
Else
	ls_return += "HttpClient Functions: value Argument Failed" + "~r~n"
	ls_return += "HttpClient Functions: GetRequestHeader('Pragma') Failed" + "~r~n"
End If

If IsValid ( ahc_2 ) Then
	ls_return += "HttpClient Functions: reference Argument Success" + "~r~n"
	ls_Value = ahc_2.GetRequestHeader ( "Pragma" )
	If ls_Value = "no-cache" Then
		ls_return += "HttpClient Functions: reference GetRequestHeader('Pragma') Success" + "~r~n"
	Else
		ls_return += "HttpClient Functions: reference GetRequestHeader('Pragma') Failed" + "~r~n"
	End If
Else
	ls_return+= "HttpClient Functions: reference Argument Failed" + "~r~n"
End If

If UpperBound ( ahc_array ) > 0 Then
	If IsValid ( ahc_array[1] ) Then
		ls_return += "HttpClient Functions: Array Argument Success" + "~r~n"
		ls_Value = ahc_array[1].GetRequestHeader ( "Pragma" )
		If ls_Value = "no-cache" Then
			ls_return += "HttpClient Functions Array: GetRequestHeader('Pragma') Success" + "~r~n"
		Else
			ls_return += "HttpClient Functions Array: GetRequestHeader('Pragma') Failed" + "~r~n"
		End If
	Else
		ls_return += "HttpClient Functions: Array Argument Failed" + "~r~n"
	End If	
Else	
	ls_return += "HttpClient Functions: Array Argument Failed" + "~r~n"
End If

Return ls_return
end function

public subroutine wf_scriptexe4 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    ai_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-01
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P038_Properties_AutoReadData
//P039_Properties_SecureProtocol
//P040_Properties_SecureProtocol_SSL2
//P041_Properties_SecureProtocol_SSL3
//P042_Properties_SecureProtocol_TLS1.0
//P043_Properties_SecureProtocol_TLS1.1
//P044_Properties_SecureProtocol_TLS1.2
//P045_Properties_Timeout

String ls_item, ls_value
HttpClient 	lhc_Client
Long			ll_rtn

lhc_Client = Create HttpClient

Choose Case as_item	
	Case 'P038_Properties_AutoReadData'
		If ab_execute = True Then
			//AutoReadData
			//当接收数据量大的时候，AutoReadData 为true时程序占用的内存会大一些，
			//因为这个时候，内部分配了一部分内存，用于保存接收的数据
			//自动化测试内存不方便,有专门的内存测试
			Boolean lb_Auto
			lb_Auto = lhc_Client.AutoReadData
			If lb_Auto Then
				wf_OutPut('Default AutoReadData = True Success', False)
			Else
				wf_OutPut('Default AutoReadData <> True Failed', False)
			End If
			
			lhc_Client.AutoReadData = False
			lb_Auto = lhc_Client.AutoReadData
			If lb_Auto = False Then
				wf_OutPut('Set AutoReadData = False Success', False)
			Else
				wf_OutPut('Set AutoReadData = False Failed', False)
			End If
			
			lhc_Client.AutoReadData = True
			lb_Auto = lhc_Client.AutoReadData
			If lb_Auto Then
				wf_OutPut('Set AutoReadData = True Success', False)
			Else
				wf_OutPut('Set AutoReadData = True Failed', False)
			End If
		Else
			wf_scriptview("//AutoReadData~r~n" +&
					"//当接收数据量大的时候，AutoReadData 为true时程序占用的内存会大一些，~r~n" +&
					"//因为这个时候，内部分配了一部分内存，用于保存接收的数据~r~n" +&
					"//自动化测试内存不方便,有专门的内存测试~r~n" +&
					"Boolean lb_Auto~r~n" +&
					"lb_Auto = lhc_Client.AutoReadData~r~n" +&
					"If lb_Auto Then~r~n" +&
					"	wf_OutPut(~'Default AutoReadData = True Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Default AutoReadData <> True Failed~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.AutoReadData = False~r~n" +&
					"lb_Auto = lhc_Client.AutoReadData~r~n" +&
					"If lb_Auto = False Then~r~n" +&
					"	wf_OutPut(~'Set AutoReadData = False Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Set AutoReadData = False Failed~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.AutoReadData = True~r~n" +&
					"lb_Auto = lhc_Client.AutoReadData~r~n" +&
					"If lb_Auto Then~r~n" +&
					"	wf_OutPut(~'Set AutoReadData = True Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Set AutoReadData = True Failed~', False)~r~n" +&
					"End If~r~n")
			
		End If
	Case 'P039_Properties_SecureProtocol'
		If ab_execute = True Then
			//SecureProtocol
			Integer li_ProTocol
			Long ll_I,ll_Code
			String ls_Respose,ls_Body,ls_txt
			li_ProTocol = lhc_Client.SecureProtocol
			If li_ProTocol = 0 Then
				wf_OutPut('Default SecureProtocol = 0 Success', False)
			Else
				wf_OutPut('Default SecureProtocol <> 0 Failed', False)
			End If
			
			For ll_I = 1 To 5	
				lhc_Client.SecureProtocol = ll_I
				If lhc_Client.SecureProtocol = ll_I Then
					wf_OutPut("Set SecureProtocol = "+String ( ll_I)+" Success", False)
				Else
					wf_OutPut("Set SecureProtocol = "+String ( ll_I ) +" Failed", False)
				End If
			Next
			
			lhc_Client.SecureProtocol = 32767
			If lhc_Client.SecureProtocol = 32767 Then
				wf_OutPut("Set Max SecureProtocol = 32767 Success ??", False)
			Else
				wf_OutPut("Set Max SecureProtocol = 32767 Failed", False)
			End If
			
			lhc_Client.SecureProtocol = -32768
			If lhc_Client.SecureProtocol = -32768 Then
				wf_OutPut("Set Min SecureProtocol = -32768 Success ??", False)
			Else
				wf_OutPut("Set Min SecureProtocol = -32768 Failed", False)
			End If
						
			lhc_Client.SecureProtocol = 0
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 0 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 0 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 0 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 0 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 0 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
			//6
			lhc_Client.SecureProtocol = 6
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Http 6 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Http 6 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Http 6 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Http 6 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
			//-1
			lhc_Client.SecureProtocol = -1
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Http -1 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Http -1 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Http -1 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Http -1 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If			
		Else
			wf_scriptview("//SecureProtocol~r~n" +&
					"Integer li_ProTocol~r~n" +&
					"Long ll_I,ll_rtn, ll_Code~r~n" +&
					"String ls_Respose,ls_Body,ls_txt~r~n" +&
					"li_ProTocol = lhc_Client.SecureProtocol~r~n" +&
					"If li_ProTocol = 0 Then~r~n" +&
					"	wf_OutPut(~'Default SecureProtocol = 0 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Default SecureProtocol <> 0 Failed~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"For ll_I = 1 To 5	~r~n" +&
					"	lhc_Client.SecureProtocol = ll_I~r~n" +&
					"	If lhc_Client.SecureProtocol = ll_I Then~r~n" +&
					"		wf_OutPut(~"Set SecureProtocol = ~"+String ( ll_I)+~" Success~", False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~"Set SecureProtocol = ~"+String ( ll_I ) +~" Failed~", False)~r~n" +&
					"	End If~r~n" +&
					"Next~r~n" +&
					"~r~n" +&
					"lhc_Client.SecureProtocol = 32767~r~n" +&
					"If lhc_Client.SecureProtocol = 32767 Then~r~n" +&
					"	wf_OutPut(~"Set Max SecureProtocol = 32767 Success ??~", False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Set Max SecureProtocol = 32767 Failed~", False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.SecureProtocol = -32768~r~n" +&
					"If lhc_Client.SecureProtocol = -32768 Then~r~n" +&
					"	wf_OutPut(~"Set Min SecureProtocol = -32768 Success ??~", False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Set Min SecureProtocol = -32768 Failed~", False)~r~n" +&
					"End If~r~n" +&
					"			~r~n" +&
					"lhc_Client.SecureProtocol = 0~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 0 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 0 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 0 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 0 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 0 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n" + &
					"//6~r~n" +&
					"lhc_Client.SecureProtocol = 6~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Http 6 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Http 6 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Http 6 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Http 6 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//-1~r~n" +&
					"lhc_Client.SecureProtocol = -1~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Http -1 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Http -1 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Http -1 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Http -1 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If	~r~n")
					
		End If
	Case 'P040_Properties_SecureProtocol_SSL2'
		If ab_execute = True Then
			lhc_Client.SecureProtocol = 1
			ll_rtn = lhc_Client.SendRequest( "GET", is_Restful_https_DotNet + "/api/Token/GetToken?staffId=10000" )
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 1 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 1 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 1 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 1 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 1 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.SecureProtocol = 1~r~n" +&
					"ll_rtn = lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_https_DotNet + "/api/Token/GetToken?staffId=10000~" )~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 1 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 1 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 1 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 1 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 1 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P041_Properties_SecureProtocol_SSL3'
		If ab_execute = True Then
			lhc_Client.SecureProtocol = 2
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			ll_rtn = lhc_Client.SendRequest( "GET", is_Restful_https_DotNet + "/api/Token/GetToken?staffId=10000" )
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 2 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 2 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 2 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 2 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 2 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.SecureProtocol = 2~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"ll_rtn = lhc_Client.SendRequest( ~"GET~", ~""+ is_Restful_https_DotNet + "/api/Token/GetToken?staffId=10000~" )~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 2 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 2 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 2 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 2 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 2 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End I~r~n")
		End If
	Case 'P042_Properties_SecureProtocol_TLS1.0'
		If ab_execute = True Then
			lhc_Client.SecureProtocol = 3
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 3 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 3 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 3 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 3 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 3 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.SecureProtocol = 3~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 3 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 3 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 3 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 3 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 3 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P043_Properties_SecureProtocol_TLS1.1'
		If ab_execute = True Then
			lhc_Client.SecureProtocol = 4
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 4 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 4 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 4 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 4 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 4 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.SecureProtocol = 4~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 4 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 4 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 4 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 4 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 4 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P044_Properties_SecureProtocol_TLS1.2'
		If ab_execute = True Then
			lhc_Client.SecureProtocol = 5
			ll_rtn = lhc_Client.SendRequest("GET", "https://192.0.3.47/employee/getemployees")
			If ll_rtn = 1 Then
				ls_Respose = lhc_Client.Getresponseheaders( )
				wf_OutPut("Https 5 SendRequest GetResponseHeaders() = "+String ( ls_Respose), False)
				ll_rtn = lhc_Client.GetResponsebody( ls_Body)
				wf_OutPut("Https 5 SendRequest GetResponsebody() = "+String ( ls_Body), False)
				ll_Code = lhc_Client.GetResponseStatusCode()
				wf_OutPut("Https 5 SendRequest GetResponseStatusCode() = "+String ( ll_Code), False)
				ls_txt = lhc_Client.GetResponseStatusText()
				wf_OutPut("Https 5 SendRequest GetResponseStatusText() = "+String ( ls_txt), False)
			Else
				wf_OutPut("Https 5 SendRequest Failed" + " Return:" + String ( ll_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.SecureProtocol = 5~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"https://192.0.3.47/employee/getemployees~")~r~n" +&
					"If ll_rtn = 1 Then~r~n" +&
					"	ls_Respose = lhc_Client.Getresponseheaders( )~r~n" +&
					"	wf_OutPut(~"Https 5 SendRequest GetResponseHeaders() = ~"+String ( ls_Respose), False)~r~n" +&
					"	ll_rtn = lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_OutPut(~"Https 5 SendRequest GetResponsebody() = ~"+String ( ls_Body), False)~r~n" +&
					"	ll_Code = lhc_Client.GetResponseStatusCode()~r~n" +&
					"	wf_OutPut(~"Https 5 SendRequest GetResponseStatusCode() = ~"+String ( ll_Code), False)~r~n" +&
					"	ls_txt = lhc_Client.GetResponseStatusText()~r~n" +&
					"	wf_OutPut(~"Https 5 SendRequest GetResponseStatusText() = ~"+String ( ls_txt), False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~"Https 5 SendRequest Failed~" + ~" Return:~" + String ( ll_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P045_Properties_Timeout'
		If ab_execute = True Then
			//Timeout
			Long ll_TimeOut
			ll_TimeOut = lhc_Client.Timeout
			If ll_TimeOut = 60 Then
				wf_OutPut('Default Timeout = 60 Success', False)
			Else
				wf_OutPut('Default Timeout <> 60 Failed' + " Return:" + String ( ll_TimeOut ), False)
			End If
			
			lhc_Client.Timeout = 20
			If lhc_Client.Timeout = 20 Then
				wf_OutPut('Set Timeout = 20 Success', False)
			Else
				wf_OutPut('Set Timeout <> 20 Failed' + " Return:" + String ( ll_TimeOut ), False)
			End If
			
			lhc_Client.Timeout = 4294967295
			If lhc_Client.Timeout = 4294967295 Then
				wf_OutPut('Set Max Timeout = 4294967295 Success', False)
			Else
				wf_OutPut('Set Max Timeout <> 4294967295 Failed' + " Return:" + String ( ll_TimeOut ), False)
			End If
			
			lhc_Client.Timeout = -4294967295
			If lhc_Client.Timeout = -4294967295 Then
				wf_OutPut('Set Min Timeout = -4294967295 Success ??', False)
			Else
				wf_OutPut('Set Max Timeout <> -4294967295 Failed ??' + " Return:" + String ( ll_TimeOut ), False)
			End If
			//设置-1、0.01和10后SendRequest
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			lhc_Client.Timeout = -1
			ll_rtn = lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/class")
			lhc_Client.GetResponsebody( ls_value)
			wf_OutPut('Set Timeout = -1 SendRequest' + " Return:" + String ( ll_rtn ) + " TimeOut:" + String ( lhc_Client.Timeout ) + " Body:" + ls_value, False)
			
			lhc_Client.Timeout = 0.01
			ll_rtn = lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/class")
			lhc_Client.GetResponsebody( ls_value)
			wf_OutPut('Set Timeout = 0.01' + " Return:" + String ( ll_rtn ) + " TimeOut:" + String ( lhc_Client.Timeout ) + " Body:" + ls_value, False)
			
			lhc_Client.Timeout = 10
			ll_rtn = lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/class")
			lhc_Client.GetResponsebody( ls_value)
			wf_OutPut('Set Timeout = 10' + " Return:" + String ( ll_rtn ) + " TimeOut:" + String ( lhc_Client.Timeout ) + " Body:" + ls_value, False)
		Else
			wf_scriptview("//Timeout~r~n" +&
					"Long ll_TimeOut~r~n" +&
					"ll_TimeOut = lhc_Client.Timeout~r~n" +&
					"If ll_TimeOut = 60 Then~r~n" +&
					"	wf_OutPut(~'Default Timeout = 60 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Default Timeout <> 60 Failed~' + ~" Return:~" + String ( ll_TimeOut ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.Timeout = 20~r~n" +&
					"If lhc_Client.Timeout = 20 Then~r~n" +&
					"	wf_OutPut(~'Set Timeout = 20 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Set Timeout <> 20 Failed~' + ~" Return:~" + String ( ll_TimeOut ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.Timeout = 4294967295~r~n" +&
					"If lhc_Client.Timeout = 4294967295 Then~r~n" +&
					"	wf_OutPut(~'Set Max Timeout = 4294967295 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Set Max Timeout <> 4294967295 Failed~' + ~" Return:~" + String ( ll_TimeOut ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.Timeout = -4294967295~r~n" +&
					"If lhc_Client.Timeout = -4294967295 Then~r~n" +&
					"	wf_OutPut(~'Set Min Timeout = -4294967295 Success ??~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Set Max Timeout <> -4294967295 Failed ??~' + ~" Return:~" + String ( ll_TimeOut ), False)~r~n" +&
					"End If~r~n" +&
					"//设置-1、0.01和10后SendRequest~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"lhc_Client.Timeout = -1~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/class~")~r~n" +&
					"lhc_Client.GetResponsebody( ls_value)~r~n" +&
					"wf_OutPut(~'Set Timeout = -1 SendRequest~' + ~" Return:~" + String ( ll_rtn ) + ~" TimeOut:~" + String ( lhc_Client.Timeout ) + ~" Body:~" + ls_value, False)~r~n" +&
					"~r~n" +&
					"lhc_Client.Timeout = 0.01~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~"" + is_Restful_http_PHP + "/restful/class~")~r~n" +&
					"lhc_Client.GetResponsebody( ls_value)~r~n" +&
					"wf_OutPut(~'Set Timeout = 0.01~' + ~" Return:~" + String ( ll_rtn ) + ~" TimeOut:~" + String ( lhc_Client.Timeout ) + ~" Body:~" + ls_value, False)~r~n" +&
					"~r~n" +&
					"lhc_Client.Timeout = 10~r~n" +&
					"ll_rtn = lhc_Client.SendRequest(~"GET~", ~""+is_Restful_http_PHP + "/restful/class~")~r~n" +&
					"lhc_Client.GetResponsebody( ls_value)~r~n" +&
					"wf_OutPut(~'Set Timeout = 10~' + ~" Return:~" + String ( ll_rtn ) + ~" TimeOut:~" + String ( lhc_Client.Timeout ) + ~" Body:~" + ls_value, False)~r~n")
		End If
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
end subroutine

public subroutine wf_scriptexe1 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    ai_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-01
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P001_classic_Create
//P002_classic_ClassName
//P003_classic_TypeOf
//P004_classic_Any
//P005_classic_PowerObject
//P006_classic_InstanceVariables
//P007_classic_SharedVariables
//P008_classic_GlobalVariables
//P009_classic_Argument
//P010_classic_Array

HttpClient 	lhc_Client, lrc_tmp
uo_HttpClient 	lu_HttpClient, lu_HttpClient2
String ls_item, ls_rtn
classdefinition lcd_tmp
ContextInformation lcx_key
//ContextKeyword  lck_key

Choose Case as_item
	Case 'P001_classic_Create' 
		If ab_execute = True Then	
			//Create
			lhc_Client = Create HttpClient
			If IsValid ( lhc_Client ) Then				
				wf_OutPut('Local Create Success', False)
				lhc_Client.SetRequestHeader( "Pragma","no-cache" )
				If lhc_Client.GetRequestHeader( "Pragma" ) = "no-cache" Then
					wf_OutPut('Local Variables Success', False)
				End If				
				DesTroy ( lhc_Client )
				If Not IsValid ( lhc_Client ) Then
					wf_OutPut('Local DesTroy Success', False)
				End If	
			End If
			//Create Using
			lhc_Client = Create Using "httpclient"
			If IsValid ( lhc_Client ) Then
				wf_OutPut('Create Using "httpclient" Success', False)
				lhc_Client.SetRequestHeader( "Pragma","no-cache" )
				If lhc_Client.GetRequestHeader( "Pragma" ) = "no-cache" Then
					wf_OutPut('Create Using "httpclient" test Success', False)
				End If
			End If
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
			
			//userObject
			lu_HttpClient = Create uo_HttpClient
			If IsValid ( lu_HttpClient ) Then
				//HttpClient Constructor:1
				wf_OutPut(gs_values, False) //Constructor
				wf_OutPut('uo_HttpClient Create Success', False)
				DesTroy ( lu_HttpClient )
				wf_OutPut(gs_values, False) //Destructor
				If Not IsValid ( lu_HttpClient ) Then
					wf_OutPut('uo_HttpClient DesTroy Success', False)
				End If
			End If	

			//Trigger Post Event
			lu_HttpClient = Create uo_HttpClient
			//手动触发triggerevent
			lu_HttpClient.triggerevent( constructor!)
			//HttpClient Constructor:2
			wf_OutPut('triggerevent( constructor!):' + gs_values, False) 
			lu_HttpClient.triggerevent( "constructor")
			//HttpClient Constructor:3
			wf_OutPut('triggerevent( "constructor"):' + gs_values, False)
			lu_HttpClient.Event constructor()
			//HttpClient Constructor:4
			wf_OutPut('Event constructor():' + gs_values, False)
			lu_HttpClient.Event Destructor()
			wf_OutPut("Event Destructor() = " + gs_values, False) //Destructor
			////HttpClient Constructor:5
			lu_HttpClient.postevent( constructor!)
			cb_7.Post Event Clicked() //Post Event
			////HttpClient Constructor:6
			lu_HttpClient.postevent( "constructor")
			cb_7.Post Event Clicked() //Post Event
						
		Else
			wf_scriptview("//Create~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"If IsValid ( lhc_Client ) Then				~r~n" +&
					"	wf_OutPut(~'Local Create Success~', False)~r~n" +&
					"	lhc_Client.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	If lhc_Client.GetRequestHeader( ~"Pragma~" ) = ~"no-cache~" Then~r~n" +&
					"		wf_OutPut(~'Local Variables Success~', False)~r~n" +&
					"	End If				~r~n" +&
					"	DesTroy ( lhc_Client )~r~n" +&
					"	If Not IsValid ( lhc_Client ) Then~r~n" +&
					"		wf_OutPut(~'Local DesTroy Success~', False)~r~n" +&
					"	End If	~r~n" +&
					"End If~r~n" +&
					"//Create Using~r~n" +&
					"lhc_Client = Create Using ~"httpclient~"~r~n" +&
					"If IsValid ( lhc_Client ) Then~r~n" +&
					"	wf_OutPut(~'Create Using ~"httpclient~" Success~', False)~r~n" +&
					"	lhc_Client.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	If lhc_Client.GetRequestHeader( ~"Pragma~" ) = ~"no-cache~" Then~r~n" +&
					"		wf_OutPut(~'Create Using ~"httpclient~" test Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n" +&
					"~r~n" +&
					"//userObject~r~n" +&
					"lu_HttpClient = Create uo_HttpClient~r~n" +&
					"If IsValid ( lu_HttpClient ) Then~r~n" +&
					"	//HttpClient Constructor:1~r~n" +&
					"	wf_OutPut(gs_values, False) //Constructor~r~n" +&
					"	wf_OutPut(~'uo_HttpClient Create Success~', False)~r~n" +&
					"	DesTroy ( lu_HttpClient )~r~n" +&
					"	wf_OutPut(gs_values, False) //Destructor~r~n" +&
					"	If Not IsValid ( lu_HttpClient ) Then~r~n" +&
					"		wf_OutPut(~'uo_HttpClient DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"//Trigger/Post Event~r~n" +&
					"lu_HttpClient = Create uo_HttpClient~r~n" +&
					"//手动触发triggerevent~r~n" +&
					"lu_HttpClient.triggerevent( constructor!)~r~n" +&
					"//HttpClient Constructor:2~r~n" +&
					"wf_OutPut(~'triggerevent( constructor!):~' + gs_values, False)~r~n" +&
					"lu_HttpClient.triggerevent( ~"constructor~")~r~n" +&
					"//HttpClient Constructor:3~r~n" +&
					"wf_OutPut(~'triggerevent( ~"constructor~"):~' + gs_values, False)~r~n" +&
					"lu_HttpClient.Event constructor()~r~n" +&
					"//HttpClient Constructor:4~r~n" +&
					"wf_OutPut(~'Event constructor():~' + gs_values, False)~r~n" +&
					"lu_HttpClient.Event Destructor()~r~n" +&
					"wf_OutPut(~"Event Destructor() = ~" + gs_values, False) //Destructor~r~n" +&
					"////HttpClient Constructor:5~r~n" +&
					"lu_HttpClient.postevent( constructor!)~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n" +&
					"////HttpClient Constructor:6~r~n" +&
					"lu_HttpClient.postevent( ~"constructor~")~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n")
		End If
	
	Case 'P001a_classic_Create' 
		If ab_execute = True Then	
			lu_HttpClient2 = Create uo_HttpClient
			//Destructor
			lu_HttpClient2.triggerevent( Destructor!,0,"test_appeon0")
			wf_OutPut('triggerevent( Destructor!,0,"test_appeon0") = ' + gs_values, False)
			lu_HttpClient2.triggerevent( Destructor!,100,250)
			wf_OutPut('triggerevent( Destructor!,100,250) = ' + gs_values, False)
			
			//通过trigger触发自定义事件
			lu_HttpClient2.triggerevent( "ue_triggerevent",0,"test_appeon1")
			wf_OutPut('triggerevent( "ue_triggerevent",0,"test_appeon1" ) = ' + gs_values, False)
			lu_HttpClient2.triggerevent( "ue_triggerevent",100,150)
			wf_OutPut('triggerevent( "ue_triggerevent",100,150 ) = ' + gs_values, False)
			//通过post触发自定义事件
			lu_HttpClient2.postevent( "ue_postevent",0,"test_appeon2")
			cb_7.Post Event Clicked() //Post Event
			lu_HttpClient2.postevent( "ue_postevent",100,200)
			cb_7.Post Event Clicked() //Post Event
			
			lu_HttpClient2.postevent( constructor!,0,"test_appeon3")
			cb_7.Post Event Clicked() //Post Event
			lu_HttpClient2.postevent( constructor!,100,300)
			cb_7.Post Event Clicked() //Post Event
			//多写一条,防止临时变量时间到自动销毁
			lu_HttpClient2.postevent( constructor!,100,300)
			
		Else
			wf_scriptview("lu_HttpClient2 = Create uo_HttpClient~r~n" +&
					"//Destructor~r~n" +&
					"lu_HttpClient2.triggerevent( Destructor!,0,~"test_appeon0~")~r~n" +&
					"wf_OutPut(~'triggerevent( Destructor!,0,~"test_appeon0~") = ~' + gs_values, False)~r~n" +&
					"lu_HttpClient2.triggerevent( Destructor!,100,250)~r~n" +&
					"wf_OutPut(~'triggerevent( Destructor!,100,250) = ~' + gs_values, False)~r~n" +&
					"~r~n" +&
					"//通过trigger触发自定义事件~r~n" +&
					"lu_HttpClient2.triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~")~r~n" +&
					"wf_OutPut(~'triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~" ) = ~' + gs_values, False)~r~n" +&
					"lu_HttpClient2.triggerevent( ~"ue_triggerevent~",100,150)~r~n" +&
					"wf_OutPut(~'triggerevent( ~"ue_triggerevent~",100,150 ) = ~' + gs_values, False)~r~n" +&
					"//通过post触发自定义事件~r~n" +&
					"lu_HttpClient2.postevent( ~"ue_postevent~",0,~"test_appeon2~")~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n" +&
					"lu_HttpClient2.postevent( ~"ue_postevent~",100,200)~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n" +&
					"~r~n" +&
					"lu_HttpClient2.postevent( constructor!,0,~"test_appeon3~")~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n" +&
					"lu_HttpClient2.postevent( constructor!,100,300)~r~n" +&
					"cb_7.Post Event Clicked() //Post Event~r~n" +&
					"//多写一条,防止临时变量时间到自动销毁~r~n" +&
					"lu_HttpClient2.postevent( constructor!,100,300)~r~n")
		End If
	Case 'p001b_classic_classdefinition' 
		If ab_execute = True Then	
			if not isvalid(lrc_tmp) then
				lrc_tmp = create HttpClient
			end if
			//通过classdefinition获取对象名称
			lcd_tmp = lrc_tmp.classdefinition
			ls_rtn = lcd_tmp.name
			wf_output("classdefiniton.name="+ls_rtn,false)
			//通过服务获取公司名称
			lrc_tmp.GetContextservice("ContextInformation", lcx_key)
			lcx_key.GetCompanyName (ls_rtn)
			wf_output("GetCompanyName="+ls_rtn,false)			
		Else
			wf_scriptview("if not isvalid(lrc_tmp) then~r~n" +&
					"	lrc_tmp = create HttpClient~r~n" +&
					"end if~r~n" +&
					"//通过classdefinition获取对象名称~r~n" +&
					"lcd_tmp = lrc_tmp.classdefinition~r~n" +&
					"ls_rtn = lcd_tmp.name~r~n" +&
					"wf_output(~"classdefiniton.name=~"+ls_rtn,false)~r~n" +&
					"//通过服务获取公司名称~r~n" +&
					"lrc_tmp.GetContextservice(~"ContextInformation~", lcx_key)~r~n" +&
					"lcx_key.GetCompanyName (ls_rtn)~r~n" +&
					"wf_output(~"GetCompanyName=~"+ls_rtn,false)~r~n")
		End If

	Case 'P002_classic_ClassName' 
		If ab_execute = True Then
			//ClassName
			lhc_Client = Create HttpClient
			ls_rtn = lhc_Client.classname( )
			wf_OutPut('ClassName() = ' + ls_rtn, False)			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
			
			//userObject
			lu_HttpClient = Create uo_HttpClient
			If IsValid ( lu_HttpClient ) Then
				ls_rtn = lu_HttpClient.classname( )
				wf_OutPut('uo_HttpClient ClassName() = ' + ls_rtn, False)
				DesTroy ( lu_HttpClient )				
			End If
			
			//non UserObject getparent
			ls_rtn = HttpClient_1.getparent().classname()
			wf_OutPut('GetParent() = ' + ls_rtn, False)	
						
		Else				
			wf_scriptview("//ClassName~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"ls_rtn = lhc_Client.classname( )~r~n" +&
					"wf_OutPut(~'ClassName() = ~' + ls_rtn, False)			~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n" +&
					"~r~n" +&
					"//userObject~r~n" +&
					"lu_HttpClient = Create uo_HttpClient~r~n" +&
					"If IsValid ( lu_HttpClient ) Then~r~n" +&
					"	ls_rtn = lu_HttpClient.classname( )~r~n" +&
					"	wf_OutPut(~'uo_HttpClient ClassName() = ~' + ls_rtn, False)~r~n" +&
					"	DesTroy ( lu_HttpClient )				~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//non UserObject getparent~r~n" +&
					"ls_rtn = HttpClient_1.getparent().classname()~r~n" +&
					"wf_OutPut(~'GetParent() = ~' + ls_rtn, False)	~r~n")
		End If
	Case 'P003_classic_TypeOf' 
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			ls_rtn = lhc_Client.classname( )
			If  lhc_Client.typeof( ) = HttpClient! then
				wf_OutPut('TypeOf() = HttpClient! Success', False)					
			Else
				wf_OutPut('TypeOf() <> HttpClient! Failed', False)
			End If
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
			
			//userObject
			lu_HttpClient = Create uo_HttpClient
			If IsValid ( lu_HttpClient ) Then
				If  lu_HttpClient.typeof( ) = HttpClient! Then					
					wf_OutPut('uo_HttpClient TypeOf() = HttpClient! Success', False)
				Else
					wf_OutPut('uo_HttpClient TypeOf() <> HttpClient! Failed', False)
				End If	
				DesTroy ( lu_HttpClient )					
			End If
			
		Else
			wf_scriptview("lhc_Client = Create HttpClient~r~n" +&
					"ls_rtn = lhc_Client.classname( )~r~n" +&
					"If  lhc_Client.typeof( ) = HttpClient! then~r~n" +&
					"	wf_OutPut(~'TypeOf() = HttpClient! Success~', False)					~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'TypeOf() <> HttpClient! Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n" +&
					"~r~n" +&
					"//userObject~r~n" +&
					"lu_HttpClient = Create uo_HttpClient~r~n" +&
					"If IsValid ( lu_HttpClient ) Then~r~n" +&
					"	If  lu_HttpClient.typeof( ) = HttpClient! Then					~r~n" +&
					"		wf_OutPut(~'uo_HttpClient TypeOf() = HttpClient! Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'uo_HttpClient TypeOf() <> HttpClient! Failed~', False)~r~n" +&
					"	End If	~r~n" +&
					"	DesTroy ( lu_HttpClient )					~r~n" +&
					"End If~r~n")
		End If
	Case 'P004_classic_Any' 
		If ab_execute = True Then
			Any any_test
			HttpClient lhc_Client2
			lhc_Client = Create HttpClient
			any_test = lhc_Client
			lhc_Client2 = any_test
			
			ls_rtn = lhc_Client2.classname( )
			wf_OutPut('Any ClassName() = ' + ls_rtn, False)
			
			If  lhc_Client2.typeof( ) = HttpClient! Then					
				wf_OutPut('Any TypeOf() = HttpClient! Success', False)
			Else
				wf_OutPut('Any TypeOf() <> HttpClient! Success', False)
			End If
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("Any any_test~r~n" +&
					"HttpClient lhc_Client2~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"any_test = lhc_Client~r~n" +&
					"lhc_Client2 = any_test~r~n" +&
					"~r~n" +&
					"ls_rtn = lhc_Client2.classname( )~r~n" +&
					"wf_OutPut(~'Any ClassName() = ~' + ls_rtn, False)~r~n" +&
					"~r~n" +&
					"If  lhc_Client2.typeof( ) = HttpClient! Then					~r~n" +&
					"	wf_OutPut(~'Any TypeOf() = HttpClient! Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Any TypeOf() <> HttpClient! Success~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n")

		End If
	Case 'P005_classic_PowerObject' 
		If ab_execute = True Then
			Long ll_rtn
			String ls_value
			lhc_Client = Create HttpClient
			ll_rtn = lhc_Client.SetRequestHeader("Accept", "*/*")
			If  ll_rtn <> 1 Then
				wf_OutPut('SetRequestHeader Failed:' + String ( ll_rtn ), False)
			Else
				//OpenWithParm
				openwithparm(w_tmp,lhc_Client)
				lhc_Client = message.powerobjectparm
				wf_OutPut('OpenWithParm: message GetRequestHeader("Accept") = '+gs_values, False)
				//closewithreturn
				ls_value = lhc_Client.GetRequestHeader("Content-Type")
				wf_OutPut('CloseWithReturn: message GetRequestHeader("Content-Type") = ' + ls_value, False)
			End If 
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )								
		Else
			wf_scriptview("Long ll_rtn~r~n" +&
					"String ls_value~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"ll_rtn = lhc_Client.SetRequestHeader(~"Accept~", ~"*/*~")~r~n" +&
					"If  ll_rtn <> 1 Then~r~n" +&
					"	wf_OutPut(~'SetRequestHeader Failed:~' + String ( ll_rtn ), False)~r~n" +&
					"Else~r~n" +&
					"	//OpenWithParm~r~n" +&
					"	openwithparm(w_tmp,lhc_Client)~r~n" +&
					"	lhc_Client = message.powerobjectparm~r~n" +&
					"	wf_OutPut(~'OpenWithParm: message GetRequestHeader(~"Accept~") = ~'+gs_values, False)~r~n" +&
					"	//closewithreturn~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeader(~"Content-Type~")~r~n" +&
					"	wf_OutPut(~'CloseWithReturn: message GetRequestHeader(~"Content-Type~") = ~' + ls_value, False)	~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n")
		End If		
	Case 'P006_classic_InstanceVariables'
		If ab_execute = True Then
			//Instance Variables
			ihc_HttpClient = Create HttpClient
			If  IsValid ( ihc_HttpClient ) Then						
				wf_OutPut('Instance Create Success', False)
				ihc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
				ls_value = ihc_HttpClient.GetRequestHeader( "Pragma" )
				wf_OutPut('Instance Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				lhc_Client = ihc_HttpClient
				ls_value = lhc_Client.GetRequestHeader( "Pragma" )
				wf_OutPut('Local <- Instance Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				DesTroy ( ihc_HttpClient )
				If  Not IsValid ( ihc_HttpClient ) Then						
					wf_OutPut('Instance DesTroy Success', False)
				End If
			End If 
		Else
			wf_scriptview("//Instance Variables~r~n" +&
					"ihc_HttpClient = Create HttpClient~r~n" +&
					"If  IsValid ( ihc_HttpClient ) Then						~r~n" +&
					"	wf_OutPut(~'Instance Create Success~', False)~r~n" +&
					"	ihc_HttpClient.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	ls_value = ihc_HttpClient.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Instance Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	lhc_Client = ihc_HttpClient~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Local <- Instance Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( ihc_HttpClient )~r~n" +&
					"	If  Not IsValid ( ihc_HttpClient ) Then						~r~n" +&
					"		wf_OutPut(~'Instance DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If ~r~n")
		End If			
	Case 'P007_classic_SharedVariables'
		If ab_execute = True Then
			//Shared Variables
			shc_HttpClient = Create HttpClient
			If  IsValid ( shc_HttpClient ) Then
				wf_OutPut('Shared Create Success', False)
				shc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
				ls_value = shc_HttpClient.GetRequestHeader( "Pragma" )
				wf_OutPut('Shared Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				//OpenWithParm 在w_tmp2中增加Content-Type,关闭后共享变量依然有效
				openwithparm(w_tmp2,shc_HttpClient)
				//close  
				ls_value = shc_HttpClient.GetRequestHeader("Content-Type")
				wf_OutPut('Close Shared Variables GetRequestHeader("Content-Type") = ' + ls_value, False)
				//OpenWithParm 在w_tmp3中SendRequest后销毁,关闭后共享变量已经失效,（重新Create也不行？）
				openwithparm(w_tmp3,shc_HttpClient)
				//close
				If Not IsValid ( shc_HttpClient ) Then
					wf_OutPut('Close Shared variables and destroy is not valid = Success', False)
				Else
					wf_OutPut('Close Shared variables and destroy is valid = Failed', False)
				End If
				
				//Local = Shared
				shc_HttpClient = Create HttpClient
				shc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
				lhc_Client = shc_HttpClient
				ls_value = lhc_Client.GetRequestHeader( "Pragma" )
				wf_OutPut('Local <- Shared Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				DesTroy ( shc_HttpClient )
				If  Not IsValid ( shc_HttpClient ) Then
					wf_OutPut('Shared DesTroy Success', False)
				End If 
			End If
		Else
			wf_scriptview("//Shared Variables~r~n" +&
					"shc_HttpClient = Create HttpClient~r~n" +&
					"If  IsValid ( shc_HttpClient ) Then~r~n" +&
					"	wf_OutPut(~'Shared Create Success~', False)~r~n" +&
					"	shc_HttpClient.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	ls_value = shc_HttpClient.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Shared Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp2中增加Content-Type,关闭后共享变量依然有效~r~n" +&
					"	openwithparm(w_tmp2,shc_HttpClient)~r~n" +&
					"	//close~r~n" +&
					"	ls_value = shc_HttpClient.GetRequestHeader(~"Content-Type~")~r~n" +&
					"	wf_OutPut(~'Close Shared Variables GetRequestHeader(~"Content-Type~") = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp3中SendRequest后销毁,关闭后共享变量已经失效,（重新Create也不行？）~r~n" +&
					"	openwithparm(w_tmp3,shc_HttpClient)~r~n" +&
					"	//close~r~n" +&
					"	If Not IsValid ( shc_HttpClient ) Then~r~n" +&
					"		wf_OutPut(~'Close Shared variables and destroy is not valid = Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'Close Shared variables and destroy is valid = Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"	~r~n" +&
					"	//Local = Shared~r~n" +&
					"	shc_HttpClient = Create HttpClient~r~n" +&
					"	shc_HttpClient.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	lhc_Client = shc_HttpClient~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Local <- Shared Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( shc_HttpClient )~r~n" +&
					"	If  Not IsValid ( shc_HttpClient ) Then~r~n" +&
					"		wf_OutPut(~'Shared DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n")
		End If			
	Case 'P008_classic_GlobalVariables'
		If ab_execute = True Then
			//Global Variables
			ghc_HttpClient = Create HttpClient
			If  IsValid ( ghc_HttpClient ) Then
				wf_OutPut('Global Create Success', False)
				ghc_HttpClient.SetRequestHeader( "Pragma","no-cache" )
				ls_value = ghc_HttpClient.GetRequestHeader( "Pragma" )
				wf_OutPut('Global Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				lhc_Client = ghc_HttpClient
				ls_value = lhc_Client.GetRequestHeader( "Pragma" )
				wf_OutPut('Local <- Global Variables GetRequestHeader( "Pragma" ) = ' + ls_value, False)
				DesTroy ( ghc_HttpClient )
				If  Not IsValid ( ghc_HttpClient ) Then
					wf_OutPut('Global DesTroy Success', False)
				End If
			End If
		Else
			wf_scriptview("//Global Variables~r~n" +&
					"ghc_HttpClient = Create HttpClient~r~n" +&
					"If  IsValid ( ghc_HttpClient ) Then~r~n" +&
					"	wf_OutPut(~'Global Create Success~', False)~r~n" +&
					"	ghc_HttpClient.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"	ls_value = ghc_HttpClient.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Global Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	lhc_Client = ghc_HttpClient~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'Local <- Global Variables GetRequestHeader( ~"Pragma~" ) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( ghc_HttpClient )~r~n" +&
					"	If  Not IsValid ( ghc_HttpClient ) Then~r~n" +&
					"		wf_OutPut(~'Global DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n")
		End If			
	Case 'P009_classic_Argument'
		If ab_execute = True Then
			//Argument
			string ls_output
			HttpClient 	lhc_1, lhc_2
			HttpClient 	lhc_Array[5]
			any 			lany_temp
			
			lhc_1 = Create HttpClient				
			lhc_1.SetRequestHeader( "Pragma","no-cache" )
			lhc_2 = Create HttpClient
			lhc_2.SetRequestHeader( "Pragma","no-cache" )
			lhc_Array[1] = Create HttpClient
			lhc_Array[1].SetRequestHeader( "Pragma","no-cache" )
			
			//any类型reference,Value，数组参数传递窗口函数
			// Arguments:
			// 	value        any           ahc_1
			// 	reference    httpclient    ahc_2
			// 	value        httpclient    ahc_array[]
			lany_temp = lhc_1
			ls_output = wf_httpclient_Argument( lany_temp, lhc_2, lhc_Array)
			wf_OutPut(ls_output, False)
			
			//reference,Value，数组参数传递窗口事件
			// Arguments:
			// 	value        httpclient    ahc_1
			// 	reference    httpclient    ahc_2
			// 	value        httpclient    ahc_array[]
			ls_output = Event ue_HttpClient_Argument( lhc_1,lhc_2,lhc_Array )
			wf_OutPut(ls_output, False)
			
			str_HttpClient lstr_1
			
			lstr_1.hc_1 = lhc_1
			lstr_1.hc_array = lhc_Array
			//reference,Value，数组和结构体参数传递全局函数
			// Arguments:
			// 	value        httpclient        ahc_1
			// 	reference    httpclient        ahc_2
			// 	value        str_httpclient    astr_1
			// 	value        httpclient        ahc_array[]
			ls_output = f_httpclient_argument ( lhc_1, lhc_2, lstr_1, lhc_Array ) 
			wf_OutPut(ls_output, False)
			
			gstr_1.hc_1 = lhc_1
			gstr_1.hc_array = lhc_Array
			
			ls_output = f_httpclient_argument ( lhc_1, lhc_2, gstr_1, lhc_Array ) 
			wf_OutPut(ls_output, False)
			
			//readonly传递，并返回Any类型		
			 lhc_Array[2] = wf_httpclient_any_readonly ( lhc_1 )
			 If  IsValid ( lhc_Array[2] ) Then
				wf_OutPut("HttpClient From Return Any Success", False)	
				ls_value = lhc_Array[2].GetRequestHeader( "Pragma" ) 
				wf_OutPut('HttpClient From Return Any GetRequestHeader("Pragma") = ' + ls_value, False)
				//readonly
				ls_value = lhc_Array[2].GetRequestHeader( "readonly" ) 
				wf_OutPut('readonly HttpClient From Return Any GetRequestHeader("readonly") = ' + ls_value, False)
			End If
			
			If  IsValid ( lhc_1 ) Then DesTroy ( lhc_1 )
			If  IsValid ( lhc_2 ) Then DesTroy ( lhc_2 )
			If  IsValid ( lhc_Array[1] ) Then DesTroy ( lhc_Array[1] )
		Else
			wf_scriptview("//Argument~r~n" +&
					"string ls_output~r~n" +&
					"HttpClient 	lhc_1, lhc_2~r~n" +&
					"HttpClient 	lhc_Array[5]~r~n" +&
					"any 			lany_temp~r~n" +&
					"~r~n" +&
					"lhc_1 = Create HttpClient				~r~n" +&
					"lhc_1.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"lhc_2 = Create HttpClient~r~n" +&
					"lhc_2.SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"lhc_Array[1] = Create HttpClient~r~n" +&
					"lhc_Array[1].SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"~r~n" +&
					"//any类型reference,Value，数组参数传递窗口函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        any           ahc_1~r~n" +&
					"// 	reference    httpclient    ahc_2~r~n" +&
					"// 	value        httpclient    ahc_array[]~r~n" +&
					"lany_temp = lhc_1~r~n" +&
					"ls_output = wf_httpclient_Argument( lany_temp, lhc_2, lhc_Array)~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//reference,Value，数组参数传递窗口事件~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        httpclient    ahc_1~r~n" +&
					"// 	reference    httpclient    ahc_2~r~n" +&
					"// 	value        httpclient    ahc_array[]~r~n" +&
					"ls_output = Event ue_HttpClient_Argument( lhc_1,lhc_2,lhc_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"str_HttpClient lstr_1~r~n" +&
					"~r~n" +&
					"lstr_1.hc_1 = lhc_1~r~n" +&
					"lstr_1.hc_array = lhc_Array~r~n" +&
					"//reference,Value，数组和结构体参数传递全局函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        httpclient        ahc_1~r~n" +&
					"// 	reference    httpclient        ahc_2~r~n" +&
					"// 	value        str_httpclient    astr_1~r~n" +&
					"// 	value        httpclient        ahc_array[]~r~n" +&
					"ls_output = f_httpclient_argument ( lhc_1, lhc_2, lstr_1, lhc_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"gstr_1.hc_1 = lhc_1~r~n" +&
					"gstr_1.hc_array = lhc_Array~r~n" +&
					"~r~n" +&
					"ls_output = f_httpclient_argument ( lhc_1, lhc_2, gstr_1, lhc_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//readonly传递，并返回Any类型~r~n" +&
					" lhc_Array[2] = wf_httpclient_any_readonly ( lhc_1 )~r~n" +&
					" If  IsValid ( lhc_Array[2] ) Then~r~n" +&
					"	wf_OutPut(~"HttpClient From Return Any Success~", False)	~r~n" +&
					"	ls_value = lhc_Array[2].GetRequestHeader( ~"Pragma~" )~r~n" +&
					"	wf_OutPut(~'HttpClient From Return Any GetRequestHeader(~"Pragma~") = ~' + ls_value, False)~r~n" +&
					"	//readonly~r~n" +&
					"	ls_value = lhc_Array[2].GetRequestHeader( ~"readonly~" )~r~n" +&
					"	wf_OutPut(~'readonly HttpClient From Return Any GetRequestHeader(~"readonly~") = ~' + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"If  IsValid ( lhc_1 ) Then DesTroy ( lhc_1 )~r~n" +&
					"If  IsValid ( lhc_2 ) Then DesTroy ( lhc_2 )~r~n" +&
					"If  IsValid ( lhc_Array[1] ) Then DesTroy ( lhc_Array[1] )~r~n")
		End If			
	Case 'P010_classic_Array' 
		If ab_execute = True Then				
			Long ll_I
			//固定数组
			For ll_I = 1 to 5
				lhc_Array[ll_I] = Create HttpClient
				If  IsValid ( lhc_Array[ll_I] ) Then
					wf_OutPut("http_Array["+String ( ll_I )+"] Create Success", False)
					lhc_Array[ll_I].SetRequestHeader( "Pragma","no-cache" )
					wf_OutPut("http_Array["+String ( ll_I )+'] GetRequestHeader("Pragma") = ' + lhc_Array[ll_I].GetRequestHeader( "Pragma" ), False)					
					DesTroy ( lhc_Array[ll_I] )					
					If  Not IsValid ( lhc_Array[ll_I] ) Then
						wf_OutPut("http_Array["+String ( ll_I )+"] DesTroy Success", False)
					End If 
				End If 					
			Next
			//非固定数组
			HttpClient 	lhc_Array2[]
			For ll_I = 1 to 3
				lhc_Array2[ll_I] = Create HttpClient
				If  IsValid ( lhc_Array2[ll_I] ) Then
					wf_OutPut("http_Array2["+String ( ll_I )+"] Create Success", False)
					lhc_Array2[ll_I].SetRequestHeader( "Pragma","no-cache" )
					wf_OutPut("http_Array2["+String ( ll_I )+'] GetRequestHeader("Pragma") = ' + lhc_Array2[ll_I].GetRequestHeader( "Pragma" ), False)
					
					DesTroy ( lhc_Array2[ll_I] )					
					If  Not IsValid ( lhc_Array2[ll_I] ) Then
						wf_OutPut("http_Array2["+String ( ll_I )+"] DesTroy Success", False)
					End If
				End If 					
			Next
			
		Else
			wf_scriptview("Long ll_I~r~n" +&
					"//固定数组~r~n" +&
					"For ll_I = 1 to 5~r~n" +&
					"	lhc_Array[ll_I] = Create HttpClient~r~n" +&
					"	If  IsValid ( lhc_Array[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"http_Array[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		lhc_Array[ll_I].SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"		wf_OutPut(~"http_Array[~"+String ( ll_I )+~'] GetRequestHeader(~"Pragma~") = ~' + lhc_Array[ll_I].GetRequestHeader( ~"Pragma~" ), False)					~r~n" +&
					"		DesTroy ( lhc_Array[ll_I] )					~r~n" +&
					"		If  Not IsValid ( lhc_Array[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"http_Array[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If 					~r~n" +&
					"Next~r~n" +&
					"//非固定数组~r~n" +&
					"HttpClient 	lhc_Array2[]~r~n" +&
					"For ll_I = 1 to 3~r~n" +&
					"	lhc_Array2[ll_I] = Create HttpClient~r~n" +&
					"	If  IsValid ( lhc_Array2[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"http_Array2[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		lhc_Array2[ll_I].SetRequestHeader( ~"Pragma~",~"no-cache~" )~r~n" +&
					"		wf_OutPut(~"http_Array2[~"+String ( ll_I )+~'] GetRequestHeader(~"Pragma~") = ~' + lhc_Array2[ll_I].GetRequestHeader( ~"Pragma~" ), False)~r~n" +&
					"		~r~n" +&
					"		DesTroy ( lhc_Array2[ll_I] )					~r~n" +&
					"		If  Not IsValid ( lhc_Array2[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"http_Array2[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If 					~r~n" +&
					"Next~r~n")
		End If	
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

end subroutine

public subroutine wf_scriptexe2 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    ai_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-01
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P011_fnRequest_ClearRequestHeaders
//P012_fnRequest_SetRequestHeader
//P013_fnRequest_GetRequestHeader
//P014_fnRequest_SetRequestHeaders
//P015_fnRequest_GetRequestHeaders
//P016_fnRequest_SendRequestGET
//P017_fnRequest_SendRequestPUT
//P018_fnRequest_SendRequestDelete
//P019_fnRequest_SendRequestPOST
//P020_fnRequest_SendRequestPOST_ANSI
//P021_fnRequest_SendRequestPOST_UTF8
//P022_fnRequest_SendRequestPOST_UTF16LE
//P023_fnRequest_SendRequestPOST_UTF16BE
//P024_fnRequest_SendRequestPATCH
//P025_fnRequest_SendRequestNull
//P026_fnRequest_PostData

String 		ls_item, ls_error,ls_Null, ls_Space, ls_Value, ls_response, ls_blob
HttpClient 	lhc_Client
Integer 		li_rtn, li_null
Blob 			lb_null

SetNull ( ls_Null )
SetNull ( li_Null )
SetNull ( lb_null )
ls_Space= space(5000)
Choose Case as_item
	Case 'P011_fnRequest_ClearRequestHeaders' 
		If ab_execute = True Then
			//未实例化
			ls_error = "Not Create:View error Failed"
			Try
				li_rtn = lhc_Client.ClearRequestHeaders()
			Catch ( throwable ex)
				ls_error = "Not Create: View error Success" + " Return:" + ex.getmessage()
			End Try
			wf_output(ls_error, False)
			
			lhc_Client = Create HttpClient
			//ClearRequestHeaders 使用前清空
			li_rtn = lhc_Client.ClearRequestHeaders()
			If li_rtn = 1 Then
				wf_output("Create ClearRequestHeaders() Success", False)
			Else
				wf_output("Create ClearRequestHeaders() Failed" + " Return:" + String (li_rtn ), False)
			End If
			//使用后清空
			lhc_Client.SetRequestHeader("Accept", "*/*")
			lhc_Client.SetRequestHeader("中文", "中文测试" )
			lhc_Client.SetRequestHeader( "testjp", "フルネーム")
			li_rtn = lhc_Client.ClearRequestHeaders()
			If li_rtn = 1 Then
				ls_value = lhc_Client.GetRequestHeader("Accept") + lhc_Client.GetRequestHeader("中文") + lhc_Client.GetRequestHeader("testjp")
				wf_output("SetRequest ClearRequestHeaders() Success" + " Return:" + String (ls_value ), False)	
			Else
				wf_output("SetRequest ClearRequestHeaders() Failed" + " Return:" + String (li_rtn ), False)	
			End If
			
			lhc_Client.SetRequestHeaders('Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' )
			li_rtn = lhc_Client.ClearRequestHeaders()
			If li_rtn = 1 Then
				ls_value = lhc_Client.GetRequestHeaders()
				wf_output("SetRequests ClearRequestHeaders() Success" + " Return:" + String (ls_value ), False)
			Else
				wf_output("SetRequest ClearRequestHeaders() Failed" + " Return:" + String (li_rtn ), False)
			End If
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("/未实例化~r~n" +&
					"ls_error = ~"Not Create:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_rtn = lhc_Client.ClearRequestHeaders()~r~n" +&
					"Catch ( throwable ex)~r~n" +&
					"	ls_error = ~"Not Create: View error Success~" + ~" Return:~" + ex.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"//ClearRequestHeaders 使用前清空~r~n" +&
					"li_rtn = lhc_Client.ClearRequestHeaders()~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output(~"Create ClearRequestHeaders() Success~", False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~"Create ClearRequestHeaders() Failed~" + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//使用后清空~r~n" +&
					"lhc_Client.SetRequestHeader(~"Accept~", ~"*/*~")~r~n" +&
					"lhc_Client.SetRequestHeader(~"中文~", ~"中文测试~" )~r~n" +&
					"lhc_Client.SetRequestHeader( ~"testjp~", ~"フルネーム~")~r~n" +&
					"li_rtn = lhc_Client.ClearRequestHeaders()~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeader(~"Accept~") + lhc_Client.GetRequestHeader(~"中文~") + lhc_Client.GetRequestHeader(~"testjp~")~r~n" +&
					"	wf_output(~"SetRequest ClearRequestHeaders() Success~" + ~" Return:~" + String (ls_value ), False)	~r~n" +&
					"Else~r~n" +&
					"	wf_output(~"SetRequest ClearRequestHeaders() Failed~" + ~" Return:~" + String (li_rtn ), False)	~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.SetRequestHeaders(~'Accept:*/*~' + ~"~r~n~" + ~'Accept-Encoding:gzip~'+ ~"~r~n~" + ~'Content-Type:application/json~' )~r~n" +&
					"li_rtn = lhc_Client.ClearRequestHeaders()~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"	wf_output(~"SetRequests ClearRequestHeaders() Success~" + ~" Return:~" + String (ls_value ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~"SetRequest ClearRequestHeaders() Failed~" + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P012_fnRequest_SetRequestHeader'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			//SetRequestHeader
			li_rtn = lhc_Client.SetRequestHeader("Accept", "*/*")
			ls_value = lhc_Client.GetRequestHeader("Accept")
			If li_rtn = 1 And  ls_value = "*/*" Then
				wf_output( 'SetRequestHeader("Accept", "*/*") Success' + " Return:" + String (ls_value ), False)				
			Else
				wf_output( 'SetRequestHeader("Accept", "*/*") Failed' + " Return:" + String (li_rtn ), False)
			End If			
			
			li_rtn = lhc_Client.SetRequestHeader(ls_Null, "*/*")
			If IsNull (li_rtn ) Then
				wf_output( 'SetRequestHeader(ls_Null, "*/*") = null Success', False)
			Else
				wf_output( 'SetRequestHeader(ls_Null, "*/*") <> null Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader("Null", ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SetRequestHeader("Null", ls_Null) = null Success', False)
			Else
				wf_output( 'SetRequestHeader("Null", ls_Null) <> null Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader(ls_Null, ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SetRequestHeader("ls_Null", ls_Null) = null Success', False)
			Else
				wf_output( 'SetRequestHeader("ls_Null", ls_Null) <> null Failed' + " Return:" + String (li_rtn ), False)
			End If
						
			li_rtn = lhc_Client.SetRequestHeader("space", ls_space)	
			wf_output( 'SetRequestHeader("space", space(5000)) ' + " Return:" + String (li_rtn ), False)
						
			li_rtn = lhc_Client.SetRequestHeader(ls_space, "*/*")			
			If li_rtn = 1 Then
				wf_output( 'SetRequestHeader(space(5000), "*/*") Success', False)
			Else
				wf_output( 'SetRequestHeader(space(5000), "*/*") Failed' + " Return:" + String (li_rtn ), False)
			End If
			lhc_Client.clearrequestheaders( ) //做一次清空 因为space太多
			li_rtn = lhc_Client.SetRequestHeader("", "" )
			If li_rtn = -1 Then
				wf_output( 'SetRequestHeader("", "") = -1 Success', False)
			Else
				wf_output( 'SetRequestHeader("", "") <> -1 Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader("", "test" )
			If li_rtn = -1 Then
				wf_output( 'SetRequestHeader("", "test") = -1 Success', False)
			Else
				wf_output( 'SetRequestHeader("", "test") <> -1 Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader("test1", "" )
			wf_output( 'SetRequestHeader("test1", "") ' + " Return:" + String (li_rtn ), False)
			
			li_rtn = lhc_Client.SetRequestHeader("test1", "123" )
			ls_value = lhc_Client.GetRequestHeader("test1")
			If li_rtn = 1 Then
				wf_output( 'SetRequestHeader("test1", "123") Success' + " Return:" + String (ls_value ), False)
			Else
				wf_output( 'SetRequestHeader("test1", "123") Failed' + " Return:" + String (li_rtn ), False)
			End If
			//设置重复值
			li_rtn = lhc_Client.SetRequestHeader("test1", "456" )
			ls_value = lhc_Client.GetRequestHeader("test1")
			If li_rtn = 1 Then
				wf_output( 'SetRequestHeader("test1", "456") Success' + " Return:" + String (ls_value ), False)
			Else
				wf_output( 'SetRequestHeader("test1", "456") Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader("中文", "中文测试" )			
			If li_rtn = 1 And  lhc_Client.GetRequestHeader("中文" ) = "中文测试" Then
				wf_output( 'SetRequestHeader("中文", "中文测试") Success', False)
			Else
				wf_output( 'SetRequestHeader("中文", "中文测试") Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader( "フル", "フルネーム")			
			If li_rtn = 1 And  lhc_Client.GetRequestHeader("フル" ) = "フルネーム" Then
				wf_output( 'SetRequestHeader("フル", "フルネーム") Success', False)
			Else
				wf_output( 'SetRequestHeader("フル", "フルネーム") Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeader( "啼鳥", "處處聞啼鳥")
			If li_rtn = 1 And  lhc_Client.GetRequestHeader("啼鳥" ) = "處處聞啼鳥" Then
				wf_output( 'SetRequestHeader("啼鳥", "處處聞啼鳥") Success', False)
			Else
				wf_output( 'SetRequestHeader("啼鳥", "處處聞啼鳥") Failed' + " Return:" + String (li_rtn ), False)
			End If
			
			ls_value = lhc_Client.GetRequestHeaders ()
			wf_output( 'GetRequestHeaders() = ' + String (ls_value ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("lhc_Client = Create HttpClient~r~n" +&
					"//SetRequestHeader~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"Accept~", ~"*/*~")~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"Accept~")~r~n" +&
					"If li_rtn = 1 And  ls_value = ~"*/*~" Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"Accept~", ~"*/*~") Success~' + ~" Return:~" + String (ls_value ), False)				~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"Accept~", ~"*/*~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(ls_Null, ~"*/*~")~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(ls_Null, ~"*/*~") = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(ls_Null, ~"*/*~") <> null Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"Null~", ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"Null~", ls_Null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"Null~", ls_Null) <> null Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(ls_Null, ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"ls_Null~", ls_Null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"ls_Null~", ls_Null) <> null Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"			~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"space~", ls_space)	~r~n" +&
					"wf_output( ~'SetRequestHeader(~"space~", space(5000)) ~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"			~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(ls_space, ~"*/*~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(space(5000), ~"*/*~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(space(5000), ~"*/*~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"lhc_Client.clearrequestheaders( ) //做一次清空 因为space太多~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"~", ~"~" )~r~n" +&
					"If li_rtn = -1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"~", ~"~") = -1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"~", ~"~") <> -1 Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"~", ~"test~" )~r~n" +&
					"If li_rtn = -1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"~", ~"test~") = -1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"~", ~"test~") <> -1 Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"test1~", ~"~" )~r~n" +&
					"wf_output( ~'SetRequestHeader(~"test1~", ~"~") ~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"test1~", ~"123~" )~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"test1~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"test1~", ~"123~") Success~' + ~" Return:~" + String (ls_value ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"test1~", ~"123~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//设置重复值~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"test1~", ~"456~" )~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"test1~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"test1~", ~"456~") Success~' + ~" Return:~" + String (ls_value ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"test1~", ~"456~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader(~"中文~", ~"中文测试~" )			~r~n" +&
					"If li_rtn = 1 And  lhc_Client.GetRequestHeader(~"中文~" ) = ~"中文测试~" Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"中文~", ~"中文测试~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"中文~", ~"中文测试~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader( ~"フル~", ~"フルネーム~")			~r~n" +&
					"If li_rtn = 1 And  lhc_Client.GetRequestHeader(~"フル~" ) = ~"フルネーム~" Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"フル~", ~"フルネーム~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"フル~", ~"フルネーム~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeader( ~"啼鳥~", ~"處處聞啼鳥~")~r~n" +&
					"If li_rtn = 1 And  lhc_Client.GetRequestHeader(~"啼鳥~" ) = ~"處處聞啼鳥~" Then~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"啼鳥~", ~"處處聞啼鳥~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeader(~"啼鳥~", ~"處處聞啼鳥~") Failed~' + ~" Return:~" + String (li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders ()~r~n" +&
					"wf_output( ~'GetRequestHeaders() = ~' + String (ls_value ), False)~r~n" +&
					"~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n")
		End If
	Case 'P013_fnRequest_GetRequestHeader'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			//GetRequestHeader
			lhc_Client.SetRequestHeader("Accept", "*/*")
			lhc_Client.SetRequestHeader("中文", "中文测试" )
			lhc_Client.SetRequestHeader( "フル", "フルネーム")
			lhc_Client.SetRequestHeader( "啼鳥", "處處聞啼鳥")
			
			ls_value = lhc_Client.GetRequestHeader("Accept")			
			wf_output( 'GetRequestHeader("Accept") = ' + ls_value, False)
			
			ls_value = lhc_Client.GetRequestHeader("accept") //大小写验证
			wf_output( 'GetRequestHeader("accept") = ' + ls_value, False)
			
			ls_value = lhc_Client.GetRequestHeader("中文")
			If ls_value = "中文测试" Then
				wf_output( 'GetRequestHeader("中文") = "中文测试" Success', False)
			Else
				wf_output( 'GetRequestHeader("中文") <> "中文测试" ' + " Failed" + " Return:" + ls_value, False)
			End If	
			
			ls_value = lhc_Client.GetRequestHeader("フル")
			If ls_value = "フルネーム" Then
				wf_output( 'GetRequestHeader("フル") = "フルネーム" Success', False)
			Else
				wf_output( 'GetRequestHeader("フル") <> "フルネーム" ' + " Failed" + " Return:" + ls_value, False)
			End If	
			
			ls_value = lhc_Client.GetRequestHeader("啼鳥")
			If ls_value = "處處聞啼鳥" Then
				wf_output( 'GetRequestHeader("啼鳥") = "處處聞啼鳥" Success', False)
			Else
				wf_output( 'GetRequestHeader("啼鳥") <> "處處聞啼鳥" ' + " Failed" + " Return:" + ls_value, False)
			End If	
			
			ls_value = lhc_Client.GetRequestHeader("NoHeader")
			If ls_value = "" Then
				wf_output( 'GetRequestHeader("NoHeader") = "" Success', False)
			Else
				wf_output( 'GetRequestHeader("NoHeader") <> "" ' + " Failed" + " Return:" + ls_value, False)
			End If	
			
			ls_value = lhc_Client.GetRequestHeader(ls_null)
			If IsNull(ls_value) Then
				wf_output( 'GetRequestHeader(ls_null) = null Success', False)
			Else
				wf_output( 'GetRequestHeader(ls_null) <> null Failed' + " Return:" + ls_value, False)
			End If				
			
			ls_value = lhc_Client.GetRequestHeader(ls_space)
			If ls_value = "" Then
				wf_output( 'GetRequestHeader(space(5000)) = "" Success', False)
			Else
				wf_output( 'GetRequestHeader(space(5000)) <> "" ' + " Failed" + " Return:" + ls_value, False)
			End If				
			
			ls_value = lhc_Client.GetRequestHeader("")
			If ls_value = "" Then
				wf_output( 'GetRequestHeader("") = "" ' + " Success", False)
			Else
				wf_output( 'GetRequestHeader("") <> "" ' + " Failed" + " Return:" + ls_value, False)
			End If	
			
			lhc_Client.SetRequestHeaders('Accept:text/html,application/xhtml+xml,application/xml;' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' )
			ls_value = lhc_Client.GetRequestHeader("Accept")	
			wf_output( 'GetRequestHeader("Accept") = ' + ls_value, False)
			
			ls_value = lhc_Client.GetRequestHeader("Content-Type")
			wf_output( 'GetRequestHeader("Content-Type") = ' + ls_value, False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//GetRequestHeader~r~n" +&
					"lhc_Client.SetRequestHeader(~"Accept~", ~"*/*~")~r~n" +&
					"lhc_Client.SetRequestHeader(~"中文~", ~"中文测试~" )~r~n" +&
					"lhc_Client.SetRequestHeader( ~"フル~", ~"フルネーム~")~r~n" +&
					"lhc_Client.SetRequestHeader( ~"啼鳥~", ~"處處聞啼鳥~")~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"Accept~")			~r~n" +&
					"wf_output( ~'GetRequestHeader(~"Accept~") = ~' + ls_value, False)~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"accept~") //大小写验证~r~n" +&
					"wf_output( ~'GetRequestHeader(~"accept~") = ~' + ls_value, False)~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"中文~")~r~n" +&
					"If ls_value = ~"中文测试~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"中文~") = ~"中文测试~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"中文~") <> ~"中文测试~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"フル~")~r~n" +&
					"If ls_value = ~"フルネーム~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"フル~") = ~"フルネーム~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"フル~") <> ~"フルネーム~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"啼鳥~")~r~n" +&
					"If ls_value = ~"處處聞啼鳥~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"啼鳥~") = ~"處處聞啼鳥~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"啼鳥~") <> ~"處處聞啼鳥~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"NoHeader~")~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"NoHeader~") = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"NoHeader~") <> ~"~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(ls_null)~r~n" +&
					"If IsNull(ls_value) Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(ls_null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(ls_null) <> null Failed~' + ~" Return:~" + ls_value, False)~r~n" +&
					"End If				~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(ls_space)~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(space(5000)) = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(space(5000)) <> ~"~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If				~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"~")~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"~") = ~"~" ~' + ~" Success~", False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeader(~"~") <> ~"~" ~' + ~" Failed~" + ~" Return:~" + ls_value, False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"lhc_Client.SetRequestHeaders(~'Accept:text/html,application/xhtml+xml,application/xml;~' + ~"~r~n~" + ~'Accept-Encoding:gzip~'+ ~"~r~n~" + ~'Content-Type:application/json~' )~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"Accept~")	~r~n" +&
					"wf_output( ~'GetRequestHeader(~"Accept~") = ~' + ls_value, False)~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeader(~"Content-Type~")~r~n" +&
					"wf_output( ~'GetRequestHeader(~"Content-Type~") = ~' + ls_value, False)~r~n")
		End If
	Case 'P014_fnRequest_SetRequestHeaders'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			//SetRequestHeaders 分隔符~r~n
			String 	ls_set
			ls_set = 'Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' 
			li_rtn = lhc_Client.SetRequestHeaders(ls_set)			
			If li_rtn = 1 Then
				wf_output( 'SetRequestHeaders( "Headers" ) Success', False)
			Else
				wf_output( 'SetRequestHeaders( "Headers" ) Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			ls_value = lhc_Client.GetRequestHeaders()
			If Trim ( ls_value ) = Trim ( ls_set ) Then
				wf_output( 'SetRequestHeaders() = GetRequestHeaders()  Success' + " Return:" + ls_value, False)	
			Else
				wf_output( 'SetRequestHeaders() <> GetRequestHeaders()  Failed' + " Return:" + ls_value, False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeaders("a:testa")
			If li_rtn = 1 Then
				ls_value = lhc_Client.GetRequestHeaders()
				wf_output( 'SetRequestHeaders("a:testa") = 1 Success' + " Return:" + String ( ls_value ), False)
			Else
				wf_output( 'SetRequestHeaders("a:testa") <> 1 Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeaders("testabc") //error
			wf_output( 'SetRequestHeaders("testabc")' + " Return:" + String ( li_rtn ), False)
			
			li_rtn = lhc_Client.SetRequestHeaders(ls_null)
			If IsNull (li_rtn ) Then
				wf_output( 'SetRequestHeaders(ls_null) = null Success', False)				
			Else
				wf_output( 'SetRequestHeaders(ls_null) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeaders("")
			If li_rtn = -1 Then
				wf_output( 'SetRequestHeaders("") = -1 Success', False)
			Else
				wf_output( 'SetRequestHeaders("") <> -1 Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SetRequestHeaders(ls_space)
			If li_rtn = -1 Then
				wf_output( 'SetRequestHeaders(space(5000)) = -1 Success', False)
			Else
				wf_output( 'SetRequestHeaders(space(5000)) <> -1 Failed' + " Return:" + String ( li_rtn ), False)
			End If
			//有重复换行符的情况，写两次~r~n 
			lhc_Client.ClearRequestHeaders() //做一次清空
			ls_set = 'Accept:*/*' + "~r~n~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' + "~r~n"
			li_rtn = lhc_Client.SetRequestHeaders(ls_set)	
			ls_value = lhc_Client.GetRequestHeaders()
			wf_output( 'SetRequestHeaders( "重复换行符" ) = ' + ls_value + " ~r~nReturn:" + String ( li_rtn ), False)
			//最后的请求加入~r~n的情况
			lhc_Client.ClearRequestHeaders() //做一次清空
			ls_set = 'Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' + "~r~n"
			li_rtn = lhc_Client.SetRequestHeaders(ls_set)	
			ls_value = lhc_Client.GetRequestHeaders()
			wf_output( 'SetRequestHeaders( "最后加换行符" ) = ' + ls_value + " ~r~nReturn:" + String ( li_rtn ), False)
			//使用C++的换行符的情况\r\n
			lhc_Client.ClearRequestHeaders() //做一次清空
			ls_set = 'Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' + "/r/n\r\n" + "Connection:keep-alive"
			li_rtn = lhc_Client.SetRequestHeaders(ls_set)	
			ls_value = lhc_Client.GetRequestHeaders()
			wf_output( 'SetRequestHeaders( "C++的换行符/r/n\r\n" ) = ' + ls_value + " ~r~nReturn:" + String ( li_rtn ), False)
			//使用Asc码的情况char(13) + char(10)
			lhc_Client.ClearRequestHeaders() //做一次清空
			ls_set = 'Accept:*/*' + "~r~n" + 'Accept-Encoding:gzip'+ "~r~n" + 'Content-Type:application/json' + char(13)+char(10) + "Connection:keep-alive"
			li_rtn = lhc_Client.SetRequestHeaders(ls_set)	
			ls_value = lhc_Client.GetRequestHeaders()
			wf_output( 'SetRequestHeaders( "char(13)+char(10)" ) = ' + ls_value + " ~r~nReturn:" + String ( li_rtn ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//SetRequestHeaders 分隔符~r~n~r~n" +&
					"String 	ls_set~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~~r~~n~" + ~'Accept-Encoding:gzip~'+ ~"~~r~~n~" + ~'Content-Type:application/json~'~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_set)			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeaders( ~"Headers~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders( ~"Headers~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"If Trim ( ls_value ) = Trim ( ls_set ) Then~r~n" +&
					"	wf_output( ~'SetRequestHeaders() = GetRequestHeaders()  Success~' + ~" Return:~" + ls_value, False)	~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders() <> GetRequestHeaders()  Failed~' + ~" Return:~" + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(~"a:testa~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"	wf_output( ~'SetRequestHeaders(~"a:testa~") = 1 Success~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders(~"a:testa~") <> 1 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(~"testabc~") //error~r~n" +&
					"wf_output( ~'SetRequestHeaders(~"testabc~")~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SetRequestHeaders(ls_null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders(ls_null) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(~"~")~r~n" +&
					"If li_rtn = -1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeaders(~"~") = -1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders(~"~") <> -1 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_space)~r~n" +&
					"If li_rtn = -1 Then~r~n" +&
					"	wf_output( ~'SetRequestHeaders(space(5000)) = -1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SetRequestHeaders(space(5000)) <> -1 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//有重复换行符的情况，写两次~~r~~n~r~n" +&
					"lhc_Client.ClearRequestHeaders() //做一次清空~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~~r~~n~~r~~n~" + ~'Accept-Encoding:gzip~'+ ~"~~r~~n~" + ~'Content-Type:application/json~' + ~"~~r~~n~"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_set)	~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'SetRequestHeaders( ~"重复换行符~" ) = ~' + ls_value + ~" ~r~nReturn:~" + String ( li_rtn ), False)~r~n" +&
					"//最后的请求加入的情况~r~n" +&
					"lhc_Client.ClearRequestHeaders() //做一次清空~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~~r~~n~" + ~'Accept-Encoding:gzip~'+ ~"~~r~~n~" + ~'Content-Type:application/json~' + ~"~~r~~n~"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_set)	~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'SetRequestHeaders( ~"最后加换行符~" ) = ~' + ls_value + ~" ~r~nReturn:~" + String ( li_rtn ), False)~r~n" +&
					"//使用C++的换行符的情况/r/n\r\n~r~n" +&
					"lhc_Client.ClearRequestHeaders() //做一次清空~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~~r~~n~" + ~'Accept-Encoding:gzip~'+ ~"~~r~~n~" + ~'Content-Type:application/json~' + ~"/r/n\r\n~" + ~"Connection:keep-alive~"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_set)	~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'SetRequestHeaders( ~"C++的换行符/r/n\r\n~" ) = ~' + ls_value + ~" ~r~nReturn:~" + String ( li_rtn ), False)~r~n" +&
					"//使用Asc码的情况char(13)+char(10)~r~n" +&
					"lhc_Client.ClearRequestHeaders() //做一次清空~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~~r~~n~" + ~'Accept-Encoding:gzip~'+ ~"~~r~~n~" + ~'Content-Type:application/json~' + char(13)+char(10) + ~"Connection:keep-alive~"~r~n" +&
					"li_rtn = lhc_Client.SetRequestHeaders(ls_set)	~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'SetRequestHeaders( ~"char(13)+char(10)~" ) = ~' + ls_value + ~" ~r~nReturn:~" + String ( li_rtn ), False)~r~n")
		End If
	Case 'P015_fnRequest_GetRequestHeaders'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//GetRequestHeaders
			lhc_Client.ClearRequestHeaders()
			ls_value = lhc_Client.GetRequestHeaders()
			If ls_value = "" Then
				wf_output( 'Clear GetRequestHeaders() = "" Success', False)
			Else
				wf_output( 'Clear GetRequestHeaders() <> "" Failed' + " Return:" + ls_value, False)
			End If
			
			ls_set = 'Accept:*/*' + "~r~n" + 'Content-Type:application/json'+ "~r~n" + 'Accept-Encoding:gzip' 
			lhc_Client.SetRequestHeaders(ls_set)
			ls_value = lhc_Client.GetRequestHeaders()
			If trim(ls_value) = trim ( ls_set ) Then
				wf_output( 'GetRequestHeaders() = SetRequestHeaders()  Success' + " Return:" + ls_value, False)
			Else
				wf_output( 'GetRequestHeaders() <> SetRequestHeaders()  Failed' + " Return:" + ls_value, False)
			End If
			
			lhc_Client.SetRequestHeaders("testerror") //error
			lhc_Client.SetRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml")
			lhc_Client.SetRequestHeader("中文", "中文测试" )
			lhc_Client.SetRequestHeader( "フル", "フルネーム")
			lhc_Client.SetRequestHeader( "啼鳥", "處處聞啼鳥")
			ls_value = lhc_Client.GetRequestHeaders()
			wf_output( 'GetRequestHeaders()' + " Return:" + ls_value, False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//GetRequestHeaders~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output( ~'Clear GetRequestHeaders() = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'Clear GetRequestHeaders() <> ~"~" Failed~' + ~" Return:~" + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_set = ~'Accept:*/*~' + ~"~r~n~" + ~'Content-Type:application/json~'+ ~"~r~n~" + ~'Accept-Encoding:gzip~'~r~n" +&
					"lhc_Client.SetRequestHeaders(ls_set)~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"If trim(ls_value) = trim ( ls_set ) Then~r~n" +&
					"	wf_output( ~'GetRequestHeaders() = SetRequestHeaders()  Success~' + ~" Return:~" + ls_value, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'GetRequestHeaders() <> SetRequestHeaders()  Failed~' + ~" Return:~" + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.SetRequestHeaders(~"testerror~") //error~r~n" +&
					"lhc_Client.SetRequestHeader(~"Accept~", ~"text/html,application/xhtml+xml,application/xml~")~r~n" +&
					"lhc_Client.SetRequestHeader(~"中文~", ~"中文测试~" )~r~n" +&
					"lhc_Client.SetRequestHeader( ~"フル~", ~"フルネーム~")~r~n" +&
					"ls_value = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'GetRequestHeaders()~' + ~" Return:~" + ls_value, False)~r~n")
		End If
	Case 'P016_fnRequest_SendRequestGET'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//SendRequest Get
			String ls_body, ls_request
			//400
			li_rtn = lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")			
			If li_rtn = 1 Then
				wf_output( 'SendRequest("GET", "GetToken") Success', False)
			Else
				wf_output( 'SendRequest("GET", "GetToken") Failed' + " Return:" + String ( li_rtn ), False)
			End If
			//{"Code":400,"Message":"请求参数不完整或不正确","Data":""}
			ls_request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			ls_response = lhc_Client.GetResponseHeaders()
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest GET return JSON Success' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			Else
				wf_output( 'SendRequest GET return JSON Failed' + " Return:" + ls_Body +"~r~nRequest:" + ls_request + "~r~nResponse:" + ls_response, False)
			End If
			//200
			lhc_Client.SetRequestHeader ( "staffid", "10000" )
			lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
			lhc_Client.SetRequestHeader ( "nonces", "5468215" )
			li_rtn = lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")			
			If li_rtn = 1 Then
				wf_output( 'SendRequest("GET", "GetToken") Success', False)
			Else
				wf_output( 'SendRequest("GET", "GetToken") Failed' + " Return:" + String ( li_rtn ), False)
			End If
			ls_request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			ls_response = lhc_Client.GetResponseHeaders()
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest GET return JSON Success' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			Else
				wf_output( 'SendRequest GET return JSON Failed' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			End If
			//get
			li_rtn = lhc_Client.SendRequest("get", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")			
			If li_rtn = 1 Then
				wf_output( 'SendRequest("get", "GetToken") Success', False)
			Else
				wf_output( 'SendRequest("get", "GetToken") Failed' + " Return:" + String ( li_rtn ), False)
			End If
			ls_request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			ls_response = lhc_Client.GetResponseHeaders()
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest get return JSON Success' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			Else
				wf_output( 'SendRequest get return JSON Failed' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			End If
			
			//中文
			li_rtn = lhc_Client.SendRequest("中文", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")			
			If li_rtn = 1 Then
				wf_output( 'SendRequest("中文", "GetToken") Success', False)
			Else
				wf_output( 'SendRequest("中文", "GetToken") ' + " Return:" + String ( li_rtn ), False)
			End If
			ls_request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			ls_response = lhc_Client.GetResponseHeaders()
			wf_output( 'SendRequest 中文 return JSON Success' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			
			//フル
			li_rtn = lhc_Client.SendRequest("フル", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")			
			If li_rtn = 1 Then
				wf_output( 'SendRequest("フル", "GetToken") Success', False)
			Else
				wf_output( 'SendRequest("フル", "GetToken") ' + " Return:" + String ( li_rtn ), False)
			End If
			ls_request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			ls_response = lhc_Client.GetResponseHeaders()
			wf_output( 'SendRequest フル return JSON Success' + " Return:" + ls_Body + "~r~nRequest:" + ls_request+ "~r~nResponse:" + ls_response, False)
			
			lhc_Client.ClearRequestHeaders()
			li_rtn = lhc_Client.SendRequest("GET", "")
			If li_rtn = -2 Then
				wf_output( 'SendRequest("GET","") = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest("GET","") = -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("", "")
			If li_rtn = -2 Then
				wf_output( 'SendRequest("","") = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest("","") <> -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("", "", "")
			If li_rtn = -2 Then
				wf_output( 'SendRequest("","", "") = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest("","", "") <> -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If
								
			li_rtn = lhc_Client.SendRequest("GET", "http:/www.appeon.com")
			If li_rtn = -2 Then
				wf_output( 'SendRequest("GET","http:/www.appeon.com") = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest("GET","http:/www.appeon.com") <> -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			//-3 // 需要断外网?
			lhc_Client.TimeOut = 3
			li_rtn = lhc_Client.SendRequest("GET", "https://www.baidu.com")			
			If li_rtn = -3 Then
				wf_output( 'SendRequest("GET","url") = -3 Cannot connect to the Internet Success', False)
			Else
				wf_output( 'SendRequest("GET","url") <> -3 Cannot connect to the InternetL Failed' + " Return:" + String ( li_rtn ), False)
			End If	
			
			//-4 // not Internet
			lhc_Client.TimeOut = 1
			li_rtn = lhc_Client.SendRequest("GET", "http://www.appeon1.com")
			If li_rtn = -4 Then
				wf_output( 'SendRequest("GET","http://www.appeon1.com") = -4 Timeout Success', False)
			Else
				wf_output( 'SendRequest("GET","http://www.appeon1.com") <> -4 Timeout Failed' + " Return:" + String ( li_rtn ), False)
			End If	
			
			li_rtn = lhc_Client.SendRequest(ls_space, "")
			If li_rtn = -2 Then
				wf_output( 'SendRequest(space(5000), "") = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest(space(5000), "") <> -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("GET",ls_space)
			If li_rtn = -2 Then
				wf_output( 'SendRequest("GET",space(5000)) = -2 Invalid URL Success', False)
			Else
				wf_output( 'SendRequest("GET",space(5000)) <> -2 Invalid URL Failed' + " Return:" + String ( li_rtn ), False)
			End If

			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//SendRequest Get~r~n" +&
					"String ls_body, ls_request~r~n" +&
					"//400~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"" + is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", ~"GetToken~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", ~"GetToken~") Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//{~"Code~":400,~"Message~":~"请求参数不完整或不正确~",~"Data~":~"~"}~r~n" +&
					"ls_request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"ls_response = lhc_Client.GetResponseHeaders()~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest GET return JSON Success~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest GET return JSON Failed~' + ~" Return:~" + ls_Body +~"~~r~~nRequest:~" + ls_request + ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"End If~r~n" +&
					"//200~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"staffid~", ~"10000~" )~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"timestamp~", wf_getTimeStamp() )~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"nonces~", ~"5468215~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"" + is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", ~"GetToken~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", ~"GetToken~") Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"ls_response = lhc_Client.GetResponseHeaders()~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest GET return JSON Success~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest GET return JSON Failed~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"End If~r~n" +&
					"//get~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"get~", ~"" + is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"get~", ~"GetToken~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"get~", ~"GetToken~") Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"ls_response = lhc_Client.GetResponseHeaders()~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest get return JSON Success~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest get return JSON Failed~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//中文~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"中文~", ~"" + is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"中文~", ~"GetToken~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"中文~", ~"GetToken~") ~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"ls_response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'SendRequest 中文 return JSON Success~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"~r~n" +&
					"//フル~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"フル~", ~"" + is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000~")			~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"フル~", ~"GetToken~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"フル~", ~"GetToken~") ~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"ls_response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'SendRequest フル return JSON Success~' + ~" Return:~" + ls_Body + ~"~~r~~nRequest:~" + ls_request+ ~"~~r~~nResponse:~" + ls_response, False)~r~n" +&
					"~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"~")~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"~") = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"~") = -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"~", ~"~")~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"~",~"~") = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"~",~"~") <> -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"~", ~"~", ~"~")~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"~",~"~", ~"~") = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"~",~"~", ~"~") <> -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n"+&					
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"http:/www.appeon.com~")~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"http:/www.appeon.com~") = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"http:/www.appeon.com~") <> -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//-3 // 需要断外网?~r~n" +&
					"lhc_Client.TimeOut = 3~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"https://www.baidu.com~")~r~n" +&
					"If li_rtn = -3 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"url~") = -3 Cannot connect to the Internet Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"url~") <> -3 Cannot connect to the InternetL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"//-4 // not Internet~r~n" +&
					"lhc_Client.TimeOut = 1~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"http://www.appeon1.com~")~r~n" +&
					"If li_rtn = -4 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"http://www.appeon1.com~") = -4 Timeout Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",~"http://www.appeon1.com~") <> -4 Timeout Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(ls_space, ~"~")~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(space(5000), ~"~") = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(space(5000), ~"~") <> -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~",ls_space)~r~n" +&
					"If li_rtn = -2 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",space(5000)) = -2 Invalid URL Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~",space(5000)) <> -2 Invalid URL Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n")
		End If	
	Case 'P017_fnRequest_SendRequestPUT'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			String ls_PostData
			//200 
			//修改商品1,name修改为Appeonedit, count修改为18
			lhc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;application/json;charset=UTF-8" )
			li_rtn = lhc_Client.SendRequest("PUT", is_Restful_http_PHP + "/restful/class/1?name=Appeonedit&count=18")
			If li_rtn = 1 Then
				wf_output( 'SendRequest("PUT", "url", "string" ) Success', False)
			Else
				wf_output( 'SendRequest("PUT", "url", "string" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = ""; ls_Response = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest PUT return JSON Success' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'SendRequest PUT return JSON Failed' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
			
			//404
			//修改商品1,name修改为Appeonedit, count修改为18
			//由于服务端不支持postdata所以返回Not Fond
			li_rtn = lhc_Client.SendRequest("PUT", is_Restful_http_PHP + "/restful/class/1",  Blob("class=1&name=Appeonedit&count=18"))
			wf_output( 'SendRequest("PUT", "url", "Blob" ) ' + " Return:" + String ( li_rtn ), False)
			
			ls_Body = ""; ls_Response = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest PUT Blob' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			
			//400
			////修改商品1,name修改为Product1, Price修改为58.8,count修改为10
			////由于header没有带token所以修改失败
			ls_PostData = '{"Id":1,"Name":"Product1","Price":58.8,"Count":10}'			
			li_rtn = lhc_Client.SendRequest("PUT", is_Restful_http_DotNet + "/api/Product/EditProduct", ls_PostData)
			If li_rtn = 1 Then
				wf_output( 'SendRequest("PUT", "url", "string" ) Success', False)
			Else
				wf_output( 'SendRequest("PUT", "url", "string" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = "";ls_Response = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest PUT return JSON Success' + " Return:" + String ( ls_Body ) +" ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'SendRequest PUT return JSON Failed' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
						
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("String ls_PostData~r~n" +&
					"//200~r~n" +&
					"//修改商品1,name修改为Appeonedit, count修改为18~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/x-www-form-urlencoded;application/json;charset=UTF-8~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"PUT~", ~"" + is_Restful_http_PHP + "/restful/class/1?name=Appeonedit&count=18~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"PUT~", ~"url~", ~"string~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"PUT~", ~"url~", ~"string~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)					~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"; ls_Response = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest PUT return JSON Success~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest PUT return JSON Failed~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//404~r~n" +&
					"//修改商品1,name修改为Appeonedit, count修改为18~r~n" +&
					"//由于服务端不支持postdata所以返回Not Fond~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"PUT~", ~"" + is_Restful_http_PHP + "/restful/class/1~",  Blob(~"class=1&name=Appeonedit&count=18~"))~r~n" +&
					"wf_output( ~'SendRequest(~"PUT~", ~"url~", ~"Blob~" ) ~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"; ls_Response = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest PUT Blob~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//400~r~n" +&
					"////修改商品1,name修改为Product1, Price修改为58.8,count修改为10~r~n" +&
					"////由于header没有带token所以修改失败~r~n" +&
					"ls_PostData = ~'{~"Id~":1,~"Name~":~"Product1~",~"Price~":58.8,~"Count~":10}~'			~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"PUT~", ~"" + is_Restful_http_DotNet + "/api/Product/EditProduct~", ls_PostData)~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"PUT~", ~"url~", ~"string~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"PUT~", ~"url~", ~"string~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~";ls_Response = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest PUT return JSON Success~' + ~" Return:~" + String ( ls_Body ) +~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest PUT return JSON Failed~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P018_fnRequest_SendRequestDelete'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//200
			//删除id为2的商品,删除后返回所有商品
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			li_rtn = lhc_Client.SendRequest("DELETE", is_Restful_http_PHP + "/restful/class/2")
			If li_rtn = 1 Then
				wf_output( 'SendRequest("DELETE", "url", "string" ) Success', False)
			Else
				wf_output( 'SendRequest("DELETE", "url", "string" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)			
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest DELETE return JSON Success' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response , False)
			Else
				wf_output( 'SendRequest DELETE return JSON Failed' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
			
			//400
			//删除id=1的商品,由于没有token,返回验证400失败
			li_rtn = lhc_Client.SendRequest("DELETE", is_Restful_http_DotNet + "/api/Product/DeleteProduct?id=1")
			If li_rtn = 1 Then
				wf_output( 'SendRequest("DELETE", "url" ) Success', False)
			Else
				wf_output( 'SendRequest("DELETE", "url" ) Failed' + " Return:" + String ( li_rtn ), False)
			End If			
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)			
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest DELETE return JSON Success' + " Return:" + String ( ls_Body )  + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'SendRequest DELETE return JSON Failed' + " Return:" + String ( ls_Body )  + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If

			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//200~r~n" +&
					"//删除id为2的商品,删除后返回所有商品~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"DELETE~", ~"" + is_Restful_http_PHP + "/restful/class/2~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"DELETE~", ~"url~", ~"string~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"DELETE~", ~"url~", ~"string~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)					~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest DELETE return JSON Success~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest DELETE return JSON Failed~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//400~r~n" +&
					"//删除id=1的商品,由于没有token,返回验证400失败~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"DELETE~", ~"" + is_Restful_http_DotNet + "/api/Product/DeleteProduct?id=1~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"DELETE~", ~"url~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"DELETE~", ~"url~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest DELETE return JSON Success~' + ~" Return:~" + String ( ls_Body )  + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest DELETE return JSON Failed~' + ~" Return:~" + String ( ls_Body )  + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P019_fnRequest_SendRequestPOST'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//增加商品name=Appeonadd,Count=22,成功后返回所有商品列表
			//要让服务器接收postdata必须加入header "Content-Type:application/x-www-form-urlencoded"
			//要让服务器接收文件一般是加header "Content-Type:multipart/form-data"
			//200
			ls_PostData = "name=Appeonadd&count=22"
			lhc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;application/json;charset=UTF-8" )
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/class", ls_PostData)
			If li_rtn = 1 Then
				wf_output( 'SendRequest("POST", "url", "string" ) Success', False)
			Else
				wf_output( 'SendRequest("POST", "url", "string" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)			
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest POST return JSON Success' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'SendRequest POST return JSON Failed' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
			
			//上传jpg图片blob，返回图片地址url，并下载显示右上角图片控件
			Long 	ll_num
			Blob 	lb_blob,lb_data
			ll_num = FileOpen( "login_btn.jpg", StreamMode! )
			If ll_num > 0 Then
				FileRead(ll_num, lb_blob)
				FileClose ( ll_num )
			End IF
			
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/blob2jpg.php", lb_blob)
			If li_rtn = 1 Then
				wf_output( 'SendRequest("POST", "url", "Blob" ) Success', False)
			Else
				wf_output( 'SendRequest("POST", "url", "Blob" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)			
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest POST Blob' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
				HttpClient lhc_temp
				lhc_temp = Create HttpClient
				li_rtn = lhc_temp.sendrequest( "GET", is_Restful_http_PHP + "/restful/" + ls_Body )
				if li_rtn = 1 Then
					li_rtn = lhc_temp.Getresponsebody( lb_data)
					p_1.SetPicture( lb_data )
				End If
				DesTroy ( lhc_temp )
			Else
				wf_output( 'SendRequest POST Blob' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
			
			//415
			//给服务器POST字符串数据,由于没有token,返回验证415失败
			ls_PostData = "user=appeon"			
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_DotNet + "/api/File/CombineFile", ls_PostData)			
			wf_output( 'SendRequest("POST", "url", "string" ) ' + " Return:" + String ( li_rtn ), False)
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest POST' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			
			//404 未加header "Content-Type:application/x-www-form-urlencoded"
			ls_PostData = "name=Appeonadd&count=22"
			lhc_Client.ClearRequestHeaders ( )
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json;charset=UTF-8" )
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/class", ls_PostData)
			If li_rtn = 1 Then
				wf_output( 'SendRequest("POST", "url", "string" ) Success', False)
			Else
				wf_output( 'SendRequest("POST", "url", "string" ) Failed' + " Return:" + String ( li_rtn ), False)					
			End If			
			
			ls_Body = ""
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			lhc_Client.GetResponsebody( ls_Body)
			If Len ( ls_Body ) > 0 Then
				wf_output( 'SendRequest POST return JSON Success' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'SendRequest POST return JSON Failed' + " Return:" + String ( ls_Body ) + " ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			End If
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//增加商品name=Appeonadd,Count=22,成功后返回所有商品列表~r~n" +&
					"//要让服务器接收postdata必须加入header ~"Content-Type:application/x-www-form-urlencoded~"~r~n" +&
					"//要让服务器接收文件一般是加header ~"Content-Type:multipart/form-data~"~r~n" +&
					"//200~r~n" +&
					"ls_PostData = ~"name=Appeonadd&count=22~"~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/x-www-form-urlencoded;application/json;charset=UTF-8~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/class~", ls_PostData)~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest POST return JSON Success~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest POST return JSON Failed~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//上传jpg图片blob，返回图片地址url，并下载显示右上角图片控件~r~n" +&
					"Long 	ll_num~r~n" +&
					"Blob 	lb_blob,lb_data~r~n" +&
					"ll_num = FileOpen( ~"login_btn.jpg~", StreamMode! )~r~n" +&
					"If ll_num > 0 Then~r~n" +&
					"	FileRead(ll_num, lb_blob)~r~n" +&
					"	FileClose ( ll_num )~r~n" +&
					"End IF~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/blob2jpg.php~", lb_blob)~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"Blob~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"Blob~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest POST Blob~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"	HttpClient lhc_temp~r~n" +&
					"	lhc_temp = Create HttpClient~r~n" +&
					"	li_rtn = lhc_temp.sendrequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/UploadFile/jpg.jpg~" ) + ~r~n" +&
					"	if li_rtn = 1 Then~r~n" +&
					"		li_rtn = lhc_temp.Getresponsebody( lb_data)~r~n" +&
					"		p_1.SetPicture( lb_data )~r~n" +&
					"	End If~r~n" +&
					"	DesTroy ( lhc_temp )~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest POST Blob~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//415~r~n" +&
					"//给服务器POST字符串数据,由于没有token,返回验证415失败~r~n" +&
					"ls_PostData = ~"user=appeon~"			~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_DotNet + "/api/File/CombineFile~", ls_PostData)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" ) ~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest POST~' + ~" Return:~" + String ( ls_Body ) + ~" ~~r~~nRequest:~" + ls_Request + ~" ~~r~~nResponse:~" + ls_Response, False)~r~n" + &
					"~r~n//404 未加header ~"Content-Type:application/x-www-form-urlencoded~"~r~n" +&
					"ls_PostData = ~"name=Appeonadd&count=22~"~r~n" +&
					"lhc_Client.ClearRequestHeaders ( )~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json;charset=UTF-8~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/class~", ls_PostData)~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" ) Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" ) Failed~' + ~" Return:~" + String ( li_rtn ), False)					~r~n" +&
					"End If			~r~n" +&
					"~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"If Len ( ls_Body ) > 0 Then~r~n" +&
					"	wf_output( ~'SendRequest POST return JSON Success~' + ~" Return:~" + String ( ls_Body ) + ~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest POST return JSON Failed~' + ~" Return:~" + String ( ls_Body ) + ~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P020_fnRequest_SendRequestPOST_ANSI'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			//多编码 默认编码 传到服务器,服务器原封不动传回来
			//Default
			wf_output('~r~n POST Default:~r~n', False)
			ls_PostData = "encoding=appeon"
			lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData)			
			wf_output( 'SendRequest("POST", "url", "string" )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=中文"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData)			
			wf_output( 'SendRequest("POST", "url", "string" )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=わたしは王"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData)			
			wf_output( 'SendRequest("POST", "url", "string" )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=處處聞啼鳥"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData)			
			wf_output( 'SendRequest("POST", "url", "string" )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			//多编码 EncodingANSI 传到服务器,服务器原封不动传回来
			//Default
			wf_output('~r~n POST_ANSI:~r~n', False)
			ls_PostData = "encoding=appeon"
			lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingANSI!)			
			wf_output( 'SendRequest("POST", "url", "string", ANSI! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=中文"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingANSI!)			
			wf_output( 'SendRequest("POST", "url", "string", ANSI! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=わたしは王"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingANSI!)			
			wf_output( 'SendRequest("POST", "url", "string", ANSI! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=處處聞啼鳥"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingANSI!)			
			wf_output( 'SendRequest("POST", "url", "string", ANSI! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)
			wf_output( 'SendRequest POST ANSI' + " Return:" + String ( ls_Body ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//多编码 默认编码 传到服务器,服务器原封不动传回来~r~n" +&
					"wf_output(~'~~r~~n POST Default:~~r~~n~', False)~r~n" + &
					"ls_PostData = ~"encoding=appeon~"~r~n" +&
					"lhc_Client.SetRequestHeader(~"Content-Type~",~"application/x-www-form-urlencoded;~")~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=中文~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=わたしは王~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=處處聞啼鳥~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~" )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"//多编码 EncodingANSI 传到服务器,服务器原封不动传回来~r~n" +&
					"wf_output(~'~~r~~n POST_ANSI:~~r~~n~', False)~r~n" + &
					"ls_PostData = ~"encoding=appeon~"~r~n" +&
					"lhc_Client.SetRequestHeader(~"Content-Type~",~"application/x-www-form-urlencoded;~")~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingANSI!)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", ANSI! )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=中文~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingANSI!)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", ANSI! )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=わたしは王~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingANSI!)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", ANSI! )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=處處聞啼鳥~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingANSI!)			~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", ANSI! )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body,EncodingANSI!)~r~n" +&
					"wf_output( ~'SendRequest POST ANSI~' + ~" Return:~" + String ( ls_Body ), False)~r~n")
		End If
	Case 'P021_fnRequest_SendRequestPOST_UTF8'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//多编码 EncodingUTF8 传到服务器,服务器原封不动传回来
			ls_PostData = "encoding=appeon"
			lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF8!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF8! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)
			wf_output( 'SendRequest POST UTF8' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=中文"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF8!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF8! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)
			wf_output( 'SendRequest POST UTF8' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=わたしは王"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF8!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF8! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)
			wf_output( 'SendRequest POST UTF8' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=處處聞啼鳥"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF8!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF8! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)
			wf_output( 'SendRequest POST UTF8' + " Return:" + String ( ls_Body ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//多编码 EncodingUTF8 传到服务器,服务器原封不动传回来~r~n" +&
					"ls_PostData = ~"encoding=appeon~"~r~n" +&
					"lhc_Client.SetRequestHeader(~"Content-Type~",~"application/x-www-form-urlencoded;~")~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF8! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF8~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=中文~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF8! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF8~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=わたしは王~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF8! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF8~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=處處聞啼鳥~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF8! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF8!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF8~' + ~" Return:~" + String ( ls_Body ), False)~r~n")
		End If
	Case 'P022_fnRequest_SendRequestPOST_UTF16LE'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//多编码EncodingUTF16LE传到服务器,服务器原封不动传回来
			ls_PostData = "encoding=appeon"
			lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16LE!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF16LE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)
			wf_output( 'SendRequest POST UTF16LE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=中文"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16LE!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF16LE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)
			wf_output( 'SendRequest POST UTF16LE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=わたしは王"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16LE!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF16LE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)
			wf_output( 'SendRequest POST UTF16LE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=處處聞啼鳥"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16LE!)			
			wf_output( 'SendRequest("POST", "url", "string", UTF16LE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)
			wf_output( 'SendRequest POST UTF16LE' + " Return:" + String ( ls_Body ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//多编码EncodingUTF16LE传到服务器,服务器原封不动传回来~r~n" +&
					"ls_PostData = ~"encoding=appeon~"~r~n" +&
					"lhc_Client.SetRequestHeader(~"Content-Type~",~"application/x-www-form-urlencoded;~")~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16LE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16LE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=中文~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16LE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16LE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=わたしは王~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16LE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16LE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=處處聞啼鳥~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16LE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16LE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16LE~' + ~" Return:~" + String ( ls_Body ), False)~r~n")
		End If
	Case 'P023_fnRequest_SendRequestPOST_UTF16BE'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//多编码EncodingUTF16BE传到服务器,服务器原封不动传回来
			ls_PostData = "encoding=appeon"
			lhc_Client.SetRequestHeader("Content-Type","application/x-www-form-urlencoded;")
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16BE!)
			wf_output( 'SendRequest("POST", "url", "string", UTF16BE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)
			wf_output( 'SendRequest POST UTF16BE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=中文"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16BE!)
			wf_output( 'SendRequest("POST", "url", "string", UTF16BE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)
			wf_output( 'SendRequest POST UTF16BE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=わたしは王"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16BE!)
			wf_output( 'SendRequest("POST", "url", "string", UTF16BE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)
			wf_output( 'SendRequest POST UTF16BE' + " Return:" + String ( ls_Body ), False)
			
			ls_PostData = "encoding=處處聞啼鳥"
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php", ls_PostData, EncodingUTF16BE!)
			wf_output( 'SendRequest("POST", "url", "string", UTF16BE! )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)
			wf_output( 'SendRequest POST UTF16BE' + " Return:" + String ( ls_Body ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//多编码EncodingUTF16BE传到服务器,服务器原封不动传回来~r~n" +&
					"ls_PostData = ~"encoding=appeon~"~r~n" +&
					"lhc_Client.SetRequestHeader(~"Content-Type~",~"application/x-www-form-urlencoded;~")~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16BE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16BE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=中文~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16BE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16BE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=わたしは王~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16BE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16BE~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"ls_PostData = ~"encoding=處處聞啼鳥~"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_PHP + "/restful/encoding.php~", ls_PostData, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest(~"POST~", ~"url~", ~"string~", UTF16BE! )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body, EncodingUTF16BE!)~r~n" +&
					"wf_output( ~'SendRequest POST UTF16BE~' + ~" Return:~" + String ( ls_Body ), False)~r~n")
		End If
	Case 'P024_fnRequest_SendRequestPATCH'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			//修改商品的部分信息,并返回所有商品
			//修改id=2的商品name=SAP22
			//200
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json;charset=UTF-8" )
			li_rtn = lhc_Client.SendRequest("PATCH", is_Restful_http_PHP + "/restful/class/2?name=SAP22")
			wf_output( 'SendRequest("PATCH", "url" )' + " Return:" + String ( li_rtn ), False)
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)			
			wf_output( 'SendRequest PATCH' + " Return:" + String ( ls_Body ), False)
			
			//修改商品的部分信息,由于没有提供PATCH返回错误信息
			ls_PostData = '{"Id":1,"Name":"Product1","Price":58.8,"Count":10}'
			li_rtn = lhc_Client.SendRequest("PATCH", is_Restful_http_DotNet + "/api/Product/DeleteProduct?id=1", ls_PostData)
			wf_output( 'SendRequest("PATCH", "url" )' + " Return:" + String ( li_rtn ), False)			
			ls_Body = ""
			lhc_Client.GetResponsebody( ls_Body)			
			wf_output( 'SendRequest PATCH' + " Return:" + String ( ls_Body ), False)
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//修改商品的部分信息,并返回所有商品~r~n" +&
					"//修改id=2的商品name=SAP22~r~n" +&
					"//200~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json;charset=UTF-8~" )~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"PATCH~", ~"" + is_Restful_http_PHP + "/restful/class/2?name=SAP22~")~r~n" +&
					"wf_output( ~'SendRequest(~"PATCH~", ~"url~" )~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"wf_output( ~'SendRequest PATCH~' + ~" Return:~" + String ( ls_Body ), False)~r~n" +&
					"~r~n" +&
					"//修改商品的部分信息,由于没有提供PATCH返回错误信息~r~n" +&
					"ls_PostData = ~'{~"Id~":1,~"Name~":~"Product1~",~"Price~":58.8,~"Count~":10}~'~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"PATCH~", ~"" + is_Restful_http_DotNet + "/api/Product/DeleteProduct?id=1~", ls_PostData)~r~n" +&
					"wf_output( ~'SendRequest(~"PATCH~", ~"url~" )~' + ~" Return:~" + String ( li_rtn ), False)			~r~n" +&
					"ls_Body = ~"~"~r~n" +&
					"lhc_Client.GetResponsebody( ls_Body)			~r~n" +&
					"wf_output( ~'SendRequest PATCH~' + ~" Return:~" + String ( ls_Body ), False)~r~n")
		End If
	Case 'P025_fnRequest_SendRequestNull'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//null
			li_rtn = lhc_Client.SendRequest("GET", ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest("GET", Null ) = null Success', False)
			Else
				wf_output( 'SendRequest("GET", Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest(Null, Null ) = null Success', False)
			Else
				wf_output( 'SendRequest(Null, Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null, ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest(Null, Null, Null ) = null Success', False)
			Else
				wf_output( 'SendRequest(Null, Null, Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null, lb_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest(Null, Null, lb_Null ) = null Success', False)
			Else
				wf_output( 'SendRequest(Null, Null, lb_Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest(ls_Null, is_Restful_http_DotNet + "/api/Product/EditProduct")
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest(Null, "url" ) = null Success', False)
			Else
				wf_output( 'SendRequest(Null, "url" ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_DotNet + "/api/Product/EditProduct", ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest("POST", "url", Null ) = null Success', False)
			Else
				wf_output( 'SendRequest("POST", "url", Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("POST", ls_Null, ls_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest("POST", Null, Null ) = null Success', False)
			Else
				wf_output( 'SendRequest("POST", Null, Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("POST", is_Restful_http_DotNet + "/api/Product/EditProduct", lb_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest("POST", "url", lb_Null ) = null Success', False)
			Else
				wf_output( 'SendRequest("POST", "url", lb_Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("POST", ls_Null, lb_Null)
			If IsNull (li_rtn ) Then
				wf_output( 'SendRequest("POST", Null, lb_Null ) = null Success', False)
			Else
				wf_output( 'SendRequest("POST", Null, lb_Null ) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If

			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("//null~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"GET~", Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null, ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null, Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null, Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(ls_Null, ls_Null, lb_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null, lb_Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(Null, Null, lb_Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(ls_Null, ~"" + is_Restful_http_DotNet + "/api/Product/EditProduct~")~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(Null, ~"url~" ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(Null, ~"url~" ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_DotNet + "/api/Product/EditProduct~", ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ls_Null, ls_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", Null, Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", Null, Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ~"" + is_Restful_http_DotNet + "/api/Product/EditProduct~", lb_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", lb_Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", ~"url~", lb_Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"POST~", ls_Null, lb_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", Null, lb_Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'SendRequest(~"POST~", Null, lb_Null ) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P026_fnRequest_PostData'
		If ab_execute = True Then
			lhc_Client = Create HttpClient
			
			//上传bmp给服务器,结束后通过Get获取并显示右上角图片控件
			//上传成功后保存服务器位置UploadFile/bmp.bmp
			Long li_PackCount, ll_I, ll_rc, flen
			Blob lb_trim
			
			flen = FileLength("pic2.bmp")
			ll_Num = FileOpen("pic2.bmp", StreamMode!, Read!, LockRead!)
			If ll_Num = -1 Then
				wf_output( 'pic2.bmp文件没有找到,请复制到当前运行目录', False)
			Else
				FileReadEX(ll_Num, lb_blob)
				FileClose(ll_Num)
			End If
			
			lhc_Client.TimeOut = 0
			lhc_Client.SetRequestHeader( "Content-Length", string (flen) )
			
			li_rtn = lhc_Client.PostDataStart( is_Restful_http_PHP + "/restful/blob2bmp.php")
			If li_rtn = 1 Then
				wf_output( 'PostDataStart(Blob) = 1 Success', False)
			Else
				wf_output( 'PostDataStart(Blob) Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_PackCount = Ceiling ( Len ( lb_blob) / 10240 )
			For ll_I= 1 To li_PackCount
				lb_trim = BlobMid(lb_blob, (ll_I - 1 ) * 10240 + 1, 10240 )
				ll_rc = lhc_Client.PostData(lb_trim, 10240)
				IF IsNull ( ll_rc ) Or ll_rc <> 1 then
					exit
				End IF
			Next
				
			If ll_rc = 1 Then
				wf_output( 'PostData( blob, 10240) = 1 Success', False)
			Else
				wf_output( 'PostData( blob, 10240) Failed' + " Return:" + String ( ll_rc ), False)
			End If
			
			li_rtn = lhc_Client.PostDataEnd()
			If li_rtn = 1 Then
				ls_Response = lhc_Client.GetResponseHeaders()
				ls_Request = lhc_Client.GetRequestHeaders()
				lhc_Client.GetResponsebody( ls_Body)
				wf_output( 'Blob PostDataEnd() = 1 Success' + " Return:" + String ( ls_Body ) +" ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'Blob PostDataEnd()  Failed' + " Return:" + String ( li_rtn ), False)
			End If
			//上传的图片重新读取出来
			HttpClient lhc_temp2
			lhc_temp2 = Create HttpClient
			li_rtn = lhc_temp2.sendrequest( "GET", is_Restful_http_PHP + "/restful/UploadFile/bmp.bmp" )
			if li_rtn = 1 Then
				li_rtn = lhc_temp2.Getresponsebody( lb_data)
				p_1.SetPicture( lb_data )
				wf_output( 'PostData(Blob) size: ' + String ( Len ( lb_data ) ), False)
			End If
			
			////post String
			//上传txt给服务器,结束后通过Get获取并显示
			//上传成功后保存服务器位置UploadFile/txt.txt
			ll_Num = FileOpen("md5.txt", TextMode!, Read!, LockRead!)
			If ll_Num = -1 Then
				wf_output( 'md5.txt文件没有找到,请复制到当前运行目录', False)
			Else
				FileReadEX(ll_Num, ls_blob)
				FileClose(ll_Num)
			End If
			
			flen = Len ( ls_blob ) * 2
			lhc_Client.ClearRequestHeaders()
			lhc_Client.TimeOut = 10
			lhc_Client.SetRequestHeader( "Content-Length", string (flen) )
			li_rtn = lhc_Client.PostDataStart( is_Restful_http_PHP + "/restful/blob2txt.php")
			If li_rtn = 1 Then
				wf_output( 'PostDataStart(String) = 1 Success', False)
			Else
				wf_output( 'PostDataStart(String) Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			If li_rtn = 1 Then
				ll_rc = lhc_Client.PostData(ls_blob, flen)
				If ll_rc = 1 Then
					wf_output( 'PostData( String, Len(String)) = 1 Success', False)
				Else
					wf_output( 'PostData( String, Len(String)) Failed' + " Return:" + String ( ll_rc ), False)
				End If
			End If
			
			li_rtn = lhc_Client.PostDataEnd()
			If li_rtn = 1 Then
				ls_Response = lhc_Client.GetResponseHeaders()
				ls_Request = lhc_Client.GetRequestHeaders()
				lhc_Client.GetResponsebody( ls_Body)
				wf_output( 'String PostDataEnd() = 1 Success' + " Return:" + String ( ls_Body ) +" ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			Else
				wf_output( 'String PostDataEnd() Failed' + " Return:" + String ( li_rtn ), False)
			End If
			//把内容读取出来
			li_rtn = lhc_temp2.sendrequest( "GET", is_Restful_http_PHP + "/restful/UploadFile/txt.txt" )
			if li_rtn = 1 Then
				li_rtn = lhc_temp2.Getresponsebody( ls_body,EncodingUTF16LE!)
				wf_output( 'PostData(Blob) size: ' + String ( Len ( ls_body ) ), False)
				wf_output( 'Body: ' + String (ls_body ), False)
			End If
			DesTroy ( lhc_temp2 )
			
			//测试异常情况
			DesTroy ( lhc_Client )
			lhc_Client = Create HttpClient
			lhc_Client.SetRequestHeader( "Content-Length", string (Len(lb_blob)) )
			ll_rc = lhc_Client.PostData(lb_blob, Len(lb_blob))
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			wf_output( 'No Start PostData( blob, Len(blob)) Failed' + " Return:" + String ( ll_rc ) +" ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			
			DesTroy ( lhc_Client )
			lhc_Client = Create HttpClient
			lhc_Client.SetRequestHeader( "Content-Length", string (Len(ls_blob) * 2) )
			ll_rc = lhc_Client.PostData(string (ls_blob), flen)
			ls_Response = lhc_Client.GetResponseHeaders()
			ls_Request = lhc_Client.GetRequestHeaders()
			wf_output( 'No Start PostData( String, Len(String)) Failed' + " Return:" + String ( ll_rc ) +" ~r~nRequest:" + ls_Request + " ~r~nResponse:" + ls_Response, False)
			
			li_rtn = lhc_Client.PostDataStart( ls_Null )
			If IsNull ( li_rtn ) Then
				wf_output( 'PostDataStart(ls_Null) = Null Success', False)
			Else
				wf_output( 'PPostDataStart(ls_Null) <> Null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.PostData( ls_Null, 1 )
			If IsNull ( li_rtn ) Then
				wf_output( 'PostData(ls_Null,1) = Null Success', False)
			Else
				wf_output( 'PostData(ls_Null,1) <> Null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.PostData( "12312", li_null )
			If IsNull ( li_rtn ) Then
				wf_output( 'PostData("12312",li_null) = Null Success', False)
			Else
				wf_output( 'PostData("12312",li_null) <> Null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.PostData( ls_Null, li_null )
			If IsNull ( li_rtn ) Then
				wf_output( 'PostData(ls_Null,li_null) = Null Success', False)
			Else
				wf_output( 'PostData(ls_Null,li_null) <> Null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
		Else
			wf_scriptview("lhc_Client = Create HttpClient~r~n" +&
					"~r~n" +&
					"//上传bmp给服务器,结束后通过Get获取并显示右上角图片控件~r~n" +&
					"//上传成功后保存服务器位置UploadFile/bmp.bmp~r~n" +&
					"Long li_PackCount, ll_I, ll_rc, flen~r~n" +&
					"Blob lb_trim~r~n" +&
					"~r~n" +&
					"flen = FileLength(~"pic2.bmp~")~r~n" +&
					"ll_Num = FileOpen(~"pic2.bmp~", StreamMode!, Read!, LockRead!)~r~n" +&
					"If ll_Num = -1 Then~r~n" +&
					"	wf_output( ~'pic2.bmp文件没有找到,请复制到当前运行目录~', False)~r~n" +&
					"Else~r~n" +&
					"	FileReadEX(ll_Num, lb_blob)~r~n" +&
					"	FileClose(ll_Num)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"lhc_Client.TimeOut = 0~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Length~", string (flen) )~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostDataStart( is_Restful_http_PHP + ~"/restful/blob2bmp.php~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'PostDataStart(Blob) = 1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostDataStart(Blob) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_PackCount = Ceiling ( Len ( lb_blob) / 10240 )~r~n" +&
					"For ll_I= 1 To li_PackCount~r~n" +&
					"	lb_trim = BlobMid(lb_blob, (ll_I - 1 ) * 10240 + 1, 10240 )~r~n" +&
					"	ll_rc = lhc_Client.PostData(lb_trim, 10240)~r~n" +&
					"	IF IsNull ( ll_rc ) Or ll_rc <> 1 then~r~n" +&
					"		exit~r~n" +&
					"	End IF~r~n" +&
					"Next~r~n" +&
					"	~r~n" +&
					"If ll_rc = 1 Then~r~n" +&
					"	wf_output( ~'PostData( blob, 10240) = 1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostData( blob, 10240) Failed~' + ~" Return:~" + String ( ll_rc ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostDataEnd()~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"	ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"	lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_output( ~'Blob PostDataEnd() = 1 Success~' + ~" Return:~" + String ( ls_Body ) +~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'Blob PostDataEnd()  Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//上传的图片重新读取出来~r~n" +&
					"HttpClient lhc_temp2~r~n" +&
					"lhc_temp2 = Create HttpClient~r~n" +&
					"li_rtn = lhc_temp2.sendrequest( ~"GET~", is_Restful_http_PHP + ~"/restful/UploadFile/bmp.bmp~" )~r~n" +&
					"if li_rtn = 1 Then~r~n" +&
					"	li_rtn = lhc_temp2.Getresponsebody( lb_data)~r~n" +&
					"	p_1.SetPicture( lb_data )~r~n" +&
					"	wf_output( ~'PostData(Blob) size: ~' + String ( Len ( lb_data ) ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"////post String~r~n" +&
					"//上传txt给服务器,结束后通过Get获取并显示~r~n" +&
					"//上传成功后保存服务器位置UploadFile/txt.txt~r~n" +&
					"ll_Num = FileOpen(~"md5.txt~", TextMode!, Read!, LockRead!)~r~n" +&
					"If ll_Num = -1 Then~r~n" +&
					"	wf_output( ~'md5.txt文件没有找到,请复制到当前运行目录~', False)~r~n" +&
					"Else~r~n" +&
					"	FileReadEX(ll_Num, ls_blob)~r~n" +&
					"	FileClose(ll_Num)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"flen = Len ( ls_blob ) * 2~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"lhc_Client.TimeOut = 10~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Length~", string (flen) )~r~n" +&
					"li_rtn = lhc_Client.PostDataStart( is_Restful_http_PHP + ~"/restful/blob2txt.php~")~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output( ~'PostDataStart(String) = 1 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostDataStart(String) Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ll_rc = lhc_Client.PostData(ls_blob, flen)~r~n" +&
					"	If ll_rc = 1 Then~r~n" +&
					"		wf_output( ~'PostData( String, Len(String)) = 1 Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output( ~'PostData( String, Len(String)) Failed~' + ~" Return:~" + String ( ll_rc ), False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostDataEnd()~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"	ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"	lhc_Client.GetResponsebody( ls_Body)~r~n" +&
					"	wf_output( ~'String PostDataEnd() = 1 Success~' + ~" Return:~" + String ( ls_Body ) +~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'String PostDataEnd() Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//把内容读取出来~r~n" +&
					"li_rtn = lhc_temp2.sendrequest( ~"GET~", is_Restful_http_PHP + ~"/restful/UploadFile/txt.txt~" )~r~n" +&
					"if li_rtn = 1 Then~r~n" +&
					"	li_rtn = lhc_temp2.Getresponsebody( ls_body,EncodingUTF16LE!)~r~n" +&
					"	wf_output( ~'PostData(Blob) size: ~' + String ( Len ( ls_body ) ), False)~r~n" +&
					"	wf_output( ~'Body: ~' + String (ls_body ), False)~r~n" +&
					"End If~r~n" +&
					"DesTroy ( lhc_temp2 )~r~n" +&
					"~r~n" +&
					"//测试异常情况~r~n" +&
					"DesTroy ( lhc_Client )~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Length~", string (Len(lb_blob)) )~r~n" +&
					"ll_rc = lhc_Client.PostData(lb_blob, Len(lb_blob))~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'No Start PostData( blob, Len(blob)) Failed~' + ~" Return:~" + String ( ll_rc ) +~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"~r~n" +&
					"DesTroy ( lhc_Client )~r~n" +&
					"lhc_Client = Create HttpClient~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Length~", string (Len(ls_blob) * 2) )~r~n" +&
					"ll_rc = lhc_Client.PostData(string (ls_blob), flen)~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"ls_Request = lhc_Client.GetRequestHeaders()~r~n" +&
					"wf_output( ~'No Start PostData( String, Len(String)) Failed~' + ~" Return:~" + String ( ll_rc ) +~" ~r~nRequest:~" + ls_Request + ~" ~r~nResponse:~" + ls_Response, False)~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostDataStart( ls_Null )~r~n" +&
					"If IsNull ( li_rtn ) Then~r~n" +&
					"	wf_output( ~'PostDataStart(ls_Null) = Null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PPostDataStart(ls_Null) <> Null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostData( ls_Null, 1 )~r~n" +&
					"If IsNull ( li_rtn ) Then~r~n" +&
					"	wf_output( ~'PostData(ls_Null,1) = Null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostData(ls_Null,1) <> Null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostData( ~"12312~", li_null )~r~n" +&
					"If IsNull ( li_rtn ) Then~r~n" +&
					"	wf_output( ~'PostData(~"12312~",li_null) = Null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostData(~"12312~",li_null) <> Null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.PostData( ls_Null, li_null )~r~n" +&
					"If IsNull ( li_rtn ) Then~r~n" +&
					"	wf_output( ~'PostData(ls_Null,li_null) = Null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output( ~'PostData(ls_Null,li_null) <> Null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )~r~n")
		End If
		
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

end subroutine

public subroutine wf_scriptexe3 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    ai_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-01
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P027_fnResponse_GetResponseHeader
//P028_fnResponse_GetResponseHeaders
//P029_fnResponse_GetResponseBody
//P030_fnResponse_GetResponseBody_ANSI
//P031_fnResponse_GetResponseBody_UTF8
//P032_fnResponse_GetResponseBody_UTF16LE
//P033_fnResponse_GetResponseBody_UTF16BE
//P034_fnResponse_GetResponseBody_Blob
//P035_fnResponse_ReadData
//P036_fnResponse_GetResponseStatusCode
//P037_fnResponse_GetResponseStatusText

String ls_item,ls_Response,ls_Request, ls_txt, ls_Body
Integer	 	li_rtn
String 	ls_value, ls_null, ls_space, ls_set, ls_error
HttpClient lhc_Client, lhc_Client2
Long 		ll_Null, ll_Code
Blob 		lb_data,lb_Null

SetNull ( ll_Null )
SetNull ( ls_null )
SetNull ( lb_Null )
ls_space = space(5000)

lhc_Client = Create HttpClient
lhc_Client2 = Create HttpClient

lhc_Client.TimeOut = 10
lhc_Client.SetRequestHeader ( "staffid", "10000" )
lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
lhc_Client.SetRequestHeader ( "nonces", "1862893498")
lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
lhc_Client.SetRequestHeader ( "Pragma", "no-cache" )
lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")
			
Choose Case as_item
	Case 'P027_fnResponse_GetResponseHeader'
		If ab_execute = True Then
			
			//第一次SendRequest后获取responseHeader
			//lhc_Client.TimeOut = 10
			//lhc_Client.SetRequestHeader ( "staffid", "10000" )
			//lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
			//lhc_Client.SetRequestHeader ( "nonces", "1862893498")
			//lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			//lhc_Client.SetRequestHeader ( "Pragma", "no-cache" )
			//lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")
			
			//GetResponseHeader
			ls_value = lhc_Client.GetResponseHeader("Pragma")			
			If ls_value = "no-cache" Then
				wf_output('GetResponseHeader("Pragma") = "no-cache" Success', False)
			Else
				wf_output('GetResponseHeader("Pragma") = "no-cache" Failed' + " Return:" + String ( ls_value ), False)
			End If
			//大小写测试
			ls_value = lhc_Client.GetResponseHeader("pragmA")
			If ls_value = "no-cache" Then
				wf_output('GetResponseHeader("pragmA") = "no-cache" Success', False)
			Else
				wf_output('GetResponseHeader("pragmA") = "no-cache" Failed' + " Return:" + String ( ls_Value ), False)
			End If
			//获取Date响应头
			ls_Response = lhc_Client.GetResponseHeader("Date")
			wf_output( '1 GetResponseHeader("Date") Return:' + ls_Response, False)
			
			//第二次SendRequest后获取responseHeader Date,验证是否刷新
			lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/class")
			ls_Response = lhc_Client.GetResponseHeader("Date")
			wf_output( '2 GetResponseHeader("Date") Return:' + ls_Response, False)
			
			//错误的SendRequest后获取responseHeader Date
			lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/abcd")
			ls_Response = lhc_Client.GetResponseHeader("Server")
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output( 'Error GetResponseHeader("Server") Return:' + ls_Response + " " + String ( ll_code ) + " " + ls_txt, False)
			
			//POST SendRequest后获取responseHeader Date
			lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php","testname")
			lhc_Client.SetRequestHeader( "Content-Type","application/x-www-form-urlencoded")
			ls_Response = lhc_Client.GetResponseHeader("Server")
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output( 'PSOT GetResponseHeader("Server") Return:' + ls_Response + " " + String ( ll_code ) + " "+ ls_txt, False)
			
			//ClearRequestHeaders后获取responseHeader,验证是否有影响
			ls_Response = lhc_Client.GetResponseHeader("Date")
			wf_output( 'Before ClearRequest GetResponseHeader("Date") Return:' + ls_Response, False)
			lhc_Client.ClearRequestHeaders()
			ls_Response = lhc_Client.GetResponseHeader("Date")
			wf_output( 'Aftter ClearRequest GetResponseHeader("Date") Return:' + ls_Response, False)
			
			ls_value = lhc_Client.GetResponseHeader("")
			If ls_value = "" Then
				wf_output('GetResponseHeader("") = "" Success', False)
			Else
				wf_output('GetResponseHeader("") <> "" Failed' + " Return:" + String ( ls_value ) , False)
			End If
			
			ls_value = lhc_Client.GetResponseHeader( ls_Null )
			If IsNull (ls_value ) Then
				wf_output('GetResponseHeader( Null ) = null Success', False)
			Else
				wf_output('GetResponseHeader( Null ) <> null Failed' + " Return:" + String ( ls_value ), False)
			End If
			
			ls_value = lhc_Client.GetResponseHeader( ls_space )
			If ls_value = "" Then
				wf_output('GetResponseHeader("space(5000)") = "" Success', False)
			Else
				wf_output('GetResponseHeader("space(5000)") <> "" Failed' + " Return:" + String ( ls_value ), False)
			End If
			
		Else
			wf_scriptview("//第一次SendRequest后获取responseHeader~r~n" +&
					"//lhc_Client.TimeOut = 10~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"staffid~", ~"10000~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"timestamp~", wf_getTimeStamp() )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"nonces~", ~"1862893498~")~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Pragma~", ~"no-cache~" )~r~n" +&
					"//lhc_Client.SendRequest(~"GET~", is_Restful_http_DotNet + ~"/api/Token/GetToken?staffId=10000~")~r~n" +&
					"~r~n" +&
					"//GetResponseHeader~r~n" +&
					"ls_value = lhc_Client.GetResponseHeader(~"Pragma~")			~r~n" +&
					"If ls_value = ~"no-cache~" Then~r~n" +&
					"	wf_output(~'GetResponseHeader(~"Pragma~") = ~"no-cache~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseHeader(~"Pragma~") = ~"no-cache~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"//大小写测试~r~n" +&
					"ls_value = lhc_Client.GetResponseHeader(~"pragmA~")~r~n" +&
					"If ls_value = ~"no-cache~" Then~r~n" +&
					"	wf_output(~'GetResponseHeader(~"pragmA~") = ~"no-cache~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseHeader(~"pragmA~") = ~"no-cache~" Failed~' + ~" Return:~" + String ( ls_Value ), False)~r~n" +&
					"End If~r~n" +&
					"//获取Date响应头~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Date~")~r~n" +&
					"wf_output( ~'1 GetResponseHeader(~"Date~") Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//第二次SendRequest后获取responseHeader Date,验证是否刷新~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/class~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Date~")~r~n" +&
					"wf_output( ~'2 GetResponseHeader(~"Date~") Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//错误的SendRequest后获取responseHeader Date~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/abcd~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Server~")~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output( ~'Error GetResponseHeader(~"Server~") Return:~' + ls_Response + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt, False)~r~n" +&
					"~r~n" +&
					"//POST SendRequest后获取responseHeader Date~r~n" +&
					"lhc_Client.SendRequest(~"POST~", is_Restful_http_PHP + ~"/restful/encoding.php~",~"testname~")~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Type~",~"application/x-www-form-urlencoded~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Server~")~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output( ~'POST GetResponseHeader(~"Server~") Return:~' + ls_Response + ~" ~" + String ( ll_code ) + ~" ~"+ ls_txt, False)~r~n" +&
					"~r~n" +&
					"//ClearRequestHeaders后获取responseHeader,验证是否有影响~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Date~")~r~n" +&
					"wf_output( ~'Before ClearRequest GetResponseHeader(~"Date~") Return:~' + ls_Response, False)~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeader(~"Date~")~r~n" +&
					"wf_output( ~'Aftter ClearRequest GetResponseHeader(~"Date~") Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetResponseHeader(~"~")~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output(~'GetResponseHeader(~"~") = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseHeader(~"~") <> ~"~" Failed~' + ~" Return:~" + String ( ls_value ) , False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetResponseHeader( ls_Null )~r~n" +&
					"If IsNull (ls_value ) Then~r~n" +&
					"	wf_output(~'GetResponseHeader( Null ) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseHeader( Null ) <> null Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_value = lhc_Client.GetResponseHeader( ls_space )~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output(~'GetResponseHeader(~"space(5000)~") = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseHeader(~"space(5000)~") <> ~"~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n")
			
		End If
	Case 'P028_fnResponse_GetResponseHeaders'
		If ab_execute = True Then	
			//lhc_Client.TimeOut = 10
			//lhc_Client.SetRequestHeader ( "staffid", "10000" )
			//lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
			//lhc_Client.SetRequestHeader ( "nonces", "1862893498")
			//lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			//lhc_Client.SetRequestHeader ( "Pragma", "no-cache" )
			//lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")
			
			//GetResponseHeaders
			//未使用前获取GetResponseHeaders
			ls_value = lhc_Client2.GetResponseHeaders()
			If ls_value = "" Then
				wf_output('Create GetResponseHeaders() = "" ' + " Success", False)
			Else
				wf_output('Create GetResponseHeaders() <> "" Failed' + " Return:" + String ( ls_value ) , False)
			End If
			//使用SendRequest后获取responseHeaders,验证是否有影响
			ls_value = lhc_Client.GetResponseHeaders()
			wf_output( '1 GetResponseHeaders() Return:' + ls_value, False)			
			//第二次SendRequest后获取responseHeaders,验证是否刷新
			lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/class")
			ls_Response = lhc_Client.GetResponseHeaders()
			wf_output( '2 GetResponseHeaders() Return:' + ls_Response, False)
			
			//错误的SendRequest后获取responseHeaders
			lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/abcd")
			ls_Response = lhc_Client.GetResponseHeaders()
			wf_output( 'Error GetResponseHeaders() Return:' + ls_Response, False)
			
			//POST SendRequest后获取responseHeaders
			lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php","testname")
			lhc_Client.SetRequestHeader( "Content-Type","application/x-www-form-urlencoded")
			ls_Response = lhc_Client.GetResponseHeaders()
			wf_output( 'POST GetResponseHeaders() Return:' + ls_Response, False)
			
			//ClearRequestHeaders后获取responseHeaders,验证是否有影响
			ls_Response = lhc_Client.GetResponseHeaders()
			wf_output( 'Before ClearRequest GetResponseHeaders() Return:' + ls_Response, False)
			lhc_Client.ClearRequestHeaders()
			ls_Response = lhc_Client.GetResponseHeaders()
			wf_output( 'Aftter ClearRequest GetResponseHeaders() Return:' + ls_Response, False)
			
		Else
			wf_scriptview("//lhc_Client.TimeOut = 10~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"staffid~", ~"10000~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"timestamp~", wf_getTimeStamp() )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"nonces~", ~"1862893498~")~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Pragma~", ~"no-cache~" )~r~n" +&
					"//lhc_Client.SendRequest(~"GET~", is_Restful_http_DotNet + ~"/api/Token/GetToken?staffId=10000~")~r~n" +&
					"~r~n" +&
					"//GetResponseHeaders~r~n" +&
					"//未使用前获取GetResponseHeaders~r~n" +&
					"ls_value = lhc_Client2.GetResponseHeaders()~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output(~'Create GetResponseHeaders() = ~"~" ~' + ~" Success~", False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseHeaders() <> ~"~" Failed~' + ~" Return:~" + String ( ls_value ) , False)~r~n" +&
					"End If~r~n" +&
					"//使用SendRequest后获取responseHeaders,验证是否有影响~r~n" +&
					"ls_value = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'1 GetResponseHeaders() Return:~' + ls_value, False)			~r~n" +&
					"//第二次SendRequest后获取responseHeaders,验证是否刷新~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/class~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'2 GetResponseHeaders() Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//错误的SendRequest后获取responseHeaders~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/abcd~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'Error GetResponseHeaders() Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//POST SendRequest后获取responseHeaders~r~n" +&
					"lhc_Client.SendRequest(~"POST~", is_Restful_http_PHP + ~"/restful/encoding.php~",~"testname~")~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Type~",~"application/x-www-form-urlencoded~")~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'POST GetResponseHeaders() Return:~' + ls_Response, False)~r~n" +&
					"~r~n" +&
					"//ClearRequestHeaders后获取responseHeaders,验证是否有影响~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'Before ClearRequest GetResponseHeaders() Return:~' + ls_Response, False)~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"ls_Response = lhc_Client.GetResponseHeaders()~r~n" +&
					"wf_output( ~'Aftter ClearRequest GetResponseHeaders() Return:~' + ls_Response, False)~r~n")
		End If
	Case 'P029_fnResponse_GetResponseBody'
		If ab_execute = True Then	
			//lhc_Client.TimeOut = 10
			//lhc_Client.SetRequestHeader ( "staffid", "10000" )
			//lhc_Client.SetRequestHeader ( "timestamp", wf_getTimeStamp() )
			//lhc_Client.SetRequestHeader ( "nonces", "1862893498")
			//lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			//lhc_Client.SetRequestHeader ( "Pragma", "no-cache" )
			//lhc_Client.SendRequest("GET", is_Restful_http_DotNet + "/api/Token/GetToken?staffId=10000")
			
			li_rtn = lhc_Client2.GetResponseBody(ls_null)
			If IsNull (li_rtn ) Then
				wf_output('Create GetResponseBody(Null) = null Success', False)
			Else
				wf_output('Create GetResponseBody(Null) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client2.GetResponseBody(ls_null, EncodingUTF8!)
			If IsNull (li_rtn ) Then
				wf_output('Create GetResponseBody(Null,EncodingUTF8!) = null Success', False)
			Else
				wf_output('Create GetResponseBody(Null,EncodingUTF8!) = Not null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client2.GetResponseBody(lb_Null)
			If IsNull (li_rtn ) Then
				wf_output('Create GetResponseBody(lb_Null) = null Success', False)
			Else
				wf_output('Create GetResponseBody(lb_Null) = Not null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client2.GetResponseBody(ls_value)
			wf_output('Create GetResponseBody(ls_value) ' + " Return:" + String ( li_rtn ) + " Body:" + ls_Value, False)
			//default
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=utf8" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//json
			lhc_Client.ClearRequestHeaders()
			lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/class" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('GetResponseBody(ls_value) Return JSON' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//xml
			lhc_Client.ClearRequestHeaders()
			lhc_Client.SetRequestHeader ( "Content-Type", "application/xml" )
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/class" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('GetResponseBody(ls_value) Return XML' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//html
			lhc_Client.ClearRequestHeaders()
			lhc_Client.SetRequestHeader ( "Content-Type", "application/html" )
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/class" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('GetResponseBody(ls_value) Return HTML' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//错误的SendRequest后获取GetResponseBody
			lhc_Client.SendRequest("GET", is_Restful_http_PHP + "/restful/abcd")
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('Error GetResponseBody(ls_value)' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//POST SendRequest后获取GetResponseBody
			lhc_Client.SendRequest("POST", is_Restful_http_PHP + "/restful/encoding.php","testname=中文")
			lhc_Client.SetRequestHeader( "Content-Type","application/x-www-form-urlencoded")
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('POST GetResponseBody(ls_value)' + " Return:" + String ( li_rtn ) + " Body:" + ls_Value, False)
			
		Else
			wf_scriptview("//lhc_Client.TimeOut = 10~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"staffid~", ~"10000~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"timestamp~", wf_getTimeStamp() )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"nonces~", ~"1862893498~")~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"//lhc_Client.SetRequestHeader ( ~"Pragma~", ~"no-cache~" )~r~n" +&
					"//lhc_Client.SendRequest(~"GET~", is_Restful_http_DotNet + ~"/api/Token/GetToken?staffId=10000~")~r~n" +&
					"~r~n" +&
					"Blob lb_data,lb_Null			~r~n" +&
					"SetNull(lb_Null)~r~n" +&
					"li_rtn = lhc_Client2.GetResponseBody(ls_null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create GetResponseBody(Null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseBody(Null) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client2.GetResponseBody(ls_null, EncodingUTF8!)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create GetResponseBody(Null,EncodingUTF8!) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseBody(Null,EncodingUTF8!) = Not null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client2.GetResponseBody(lb_Null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create GetResponseBody(lb_Null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseBody(lb_Null) = Not null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client2.GetResponseBody(ls_value)~r~n" +&
					"wf_output(~'Create GetResponseBody(ls_value) ~' + ~" Return:~" + String ( li_rtn ) + ~" Body:~" + ls_Value, False)~r~n" +&
					"//default~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/charset.php?encoding=utf8~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//json~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/json~" )~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/class~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'GetResponseBody(ls_value) Return JSON~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//xml~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/xml~" )~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/class~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'GetResponseBody(ls_value) Return XML~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//html~r~n" +&
					"lhc_Client.ClearRequestHeaders()~r~n" +&
					"lhc_Client.SetRequestHeader ( ~"Content-Type~", ~"application/html~" )~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/class~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'GetResponseBody(ls_value) Return HTML~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//错误的SendRequest后获取GetResponseBody~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP + ~"/restful/abcd~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'Error GetResponseBody(ls_value)~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//POST SendRequest后获取GetResponseBody~r~n" +&
					"lhc_Client.SendRequest(~"POST~", is_Restful_http_PHP + ~"/restful/encoding.php~",~"testname=中文~")~r~n" +&
					"lhc_Client.SetRequestHeader( ~"Content-Type~",~"application/x-www-form-urlencoded~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'POST GetResponseBody(ls_value)~' + ~" Return:~" + String ( li_rtn ) + ~" Body:~" + ls_Value, False)~r~n")
		End If
	Case 'P030_fnResponse_GetResponseBody_ANSI'
		If ab_execute = True Then	
			//EncodingANSI
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=ansi" )
			li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingANSI!)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value,ANSI) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//EncodingANSI To UTF8
			wf_output('~r~n EncodingANSI To UTF8:~r~n', False)
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=ansi" )
			li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF8!)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value,UTF8) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//EncodingANSI To Default
			wf_output('~r~n EncodingANSI To Default:~r~n', False)
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=ansi" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			
		Else
			wf_scriptview("//EncodingANSI~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/charset.php?encoding=ansi~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingANSI!)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value,ANSI) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"wf_output(~'~~r~~n EncodingANSI To UTF8:~~r~~n~', False)~r~n" +&
					"//EncodingANSI To UTF8~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/charset.php?encoding=ansi~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF8!)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value,UTF8) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"wf_output(~'~~r~~n EncodingANSI To Default:~~r~~n~', False)~r~n" +&
					"//EncodingANSI To Default~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/charset.php?encoding=ansi~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n")
			
		End If
	Case 'P031_fnResponse_GetResponseBody_UTF8'
		If ab_execute = True Then	
			//EncodingUTF8
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=utf8" )
			li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF8!)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value,UTF8) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			//EncodingUTF8 To Default
			wf_output('~r~n EncodingUTF8 To Default:~r~n', False)
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=utf8" )
			li_rtn = lhc_Client.GetResponseBody(ls_value)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
		Else
			wf_scriptview("//EncodingUTF8~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/charset.php?encoding=utf8~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF8!)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value,UTF8) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n" +&
					"//EncodingUTF8 To Default~r~n" +&
					"wf_output(~'~~r~~n EncodingUTF8 To Default:~~r~~n~', False)~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", ~"" + is_Restful_http_PHP + "/restful/charset.php?encoding=utf8~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n")
			
		End If
	Case 'P032_fnResponse_GetResponseBody_UTF16LE'
		If ab_execute = True Then	
			//EncodingUTF16LE
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=utf16le" )
			li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16LE!)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value,UTF16LE) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
			
		Else
			wf_scriptview("//EncodingUTF16LE~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/charset.php?encoding=utf16le~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16LE!)~r~n" +&
					"ll_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value,UTF16LE) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n")
			
		End If
	Case 'P033_fnResponse_GetResponseBody_UTF16BE'
		If ab_execute = True Then	
			//EncodingUTF16BE
			lhc_Client.SendRequest( "GET", is_Restful_http_PHP + "/restful/charset.php?encoding=utf16be" )
			li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16BE!)
			ll_code = lhc_Client.Getresponsestatuscode( )
			ls_txt = lhc_Client.GetResponseStatustext( )
			wf_output('SendRequest GetResponseBody(ls_value,UTF16BE) ' + " Return:" + String ( li_rtn ) + " " + String ( ll_code ) + " " + ls_txt + " Body:" + ls_Value, False)
		Else
			wf_scriptview("//EncodingUTF16BE~r~n" +&
					"lhc_Client.SendRequest( ~"GET~", is_Restful_http_PHP + ~"/restful/charset.php?encoding=utf16be~" )~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(ls_value, EncodingUTF16BE!)~r~n" +&
					"l_code = lhc_Client.Getresponsestatuscode( )~r~n" +&
					"ls_txt = lhc_Client.GetResponseStatustext( )~r~n" +&
					"wf_output(~'SendRequest GetResponseBody(ls_value,UTF16BE) ~' + ~" Return:~" + String ( li_rtn ) + ~" ~" + String ( ll_code ) + ~" ~" + ls_txt + ~" Body:~" + ls_Value, False)~r~n")
			
		End If
	Case 'P034_fnResponse_GetResponseBody_Blob'
		If ab_execute = True Then	
			//Blob
			//获取jpg图片,并在右上角显示
			lhc_Client.SendRequest("GET", is_Restful_http_PHP +"/restful/jpg2m.png")
			li_rtn = lhc_Client.GetResponseBody(lb_data) 
			If li_rtn = 1 Then
				wf_output('GetResponseBody(blob) Success', False)
				wf_output('GetResponseBody(blob) = byte['+String ( Len ( lb_data )) + '] Success', False)	
				p_1.SetPicture( lb_data )
			Else
				wf_output('GetResponseBody(blob) <> 1 Failed' + " Return:" + String ( li_rtn ), False)
			End If
		Else
			wf_scriptview("//Blob~r~n" +&
					"//获取jpg图片,并在右上角显示~r~n" +&
					"lhc_Client.SendRequest(~"GET~", is_Restful_http_PHP +~"/restful/jpg2m.png~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseBody(lb_data)~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	wf_output(~'GetResponseBody(blob) Success~', False)~r~n" +&
					"	wf_output(~'GetResponseBody(blob) = byte[~'+String ( Len ( lb_data )) + ~'] Success~', False)	~r~n" +&
					"	p_1.SetPicture( lb_data )~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseBody(blob) <> 1 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n")
			
		End If
	Case 'P035_fnResponse_ReadData'
		If ab_execute = True Then	
			lhc_Client.autoreaddata = false
			li_rtn = lhc_Client2.ReadData(lb_data, ll_null)
			If IsNull (li_rtn ) Then
				wf_output('Create ReadData(Blob,Null) = null Success', False)
			Else
				wf_output('Create ReadData(Blob,Null) <> null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client2.ReadData(lb_null, 1024)
			If IsNull (li_rtn ) Then
				wf_output('Create ReadData(lb_null,1024) = null Success', False)
			Else
				wf_output('Create ReadData(lb_null,1024) = Not null Failed' + " Return:" + String ( li_rtn ), False)
			End If
			
			li_rtn = lhc_Client.SendRequest("GET",  is_Restful_http_PHP +"/restful/jpg2m.jpg")			
			Long 	ll_loop
			Blob 	lb_temp
			If li_rtn = 1 Then
				ll_loop = 1024 * 8
				Do While ( li_rtn = 1 )	
					li_rtn = lhc_Client.ReadData( lb_temp, ll_loop)	
					lb_data =  lb_data + lb_temp	
				Loop
				If li_rtn = 0 Then
					wf_output( 'ReadData(blob,1024*10) = byte['+String(Len ( lb_data))+']' + " Success", False)
					p_1.SetPicture( lb_data )
				Else
					wf_output('ReadData(blob,1024*10)  - Unknow Failed', False)
				End If
			Else
				wf_output('SendRequest For ReadData(blob,1024*10) <> 1 Failed' + " Return:" + String ( li_rtn ), False)
			End If
		Else
			wf_scriptview("lhc_Client.autoreaddata = false~r~n" +&
					"li_rtn = lhc_Client2.ReadData(lb_data, ll_null)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create ReadData(Blob,Null) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create ReadData(Blob,Null) <> null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client2.ReadData(lb_null, 1024)~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create ReadData(lb_null,1024) = null Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create ReadData(lb_null,1024) = Not null Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_rtn = lhc_Client.SendRequest(~"GET~", ~"" +  is_Restful_http_PHP +"~"/restful/jpg2m.jpg~")			~r~n" +&
					"Long 	ll_loop~r~n" +&
					"Blob 	lb_temp~r~n" +&
					"If li_rtn = 1 Then~r~n" +&
					"	ll_loop = 1024 * 8~r~n" +&
					"	Do While ( li_rtn = 1 )	~r~n" +&
					"		li_rtn = lhc_Client.ReadData( lb_temp, ll_loop)	~r~n" +&
					"		lb_data =  lb_data + lb_temp	~r~n" +&
					"	Loop~r~n" +&
					"	If li_rtn = 0 Then~r~n" +&
					"		wf_output( ~'ReadData(blob,1024*10) = byte[~'+String(Len ( lb_data))+~']~' + ~" Success~", False)~r~n" +&
					"		p_1.SetPicture( lb_data )~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'ReadData(blob,1024*10)  - Unknow Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SendRequest For ReadData(blob,1024*10) <> 1 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n")
			
		End If
	Case 'P036_fnResponse_GetResponseStatusCode/Text'
		If ab_execute = True Then	
			li_rtn = lhc_Client2.GetResponseStatusCode()
			If IsNull (li_rtn ) Then
				wf_output('Create GetResponseStatusCode() = null Failed', False)
			Else
				wf_output('Create GetResponseStatusCode() = '+String (li_rtn), False)
			End If
			ls_value = lhc_Client2.GetResponseStatusText()
			If ls_value = "" Then
				wf_output('Create GetResponseStatusText() = "" Success', False)
			Else
				wf_output('Create GetResponseStatusText() <> "" Failed' + " Return:" + String ( ls_value ), False)
			End If
			
			//200--OK
			lhc_Client.SendRequest("GET", is_Restful_http_PHP +"/restful/login_btn.jpg")
			li_rtn = lhc_Client.GetResponseStatusCode() 
			If li_rtn = 200 Then
				wf_output('GetResponseStatusCode() = 200 Success', False)
			Else
				wf_output('GetResponseStatusCode() <> 200 Failed' + " Return:" + String ( li_rtn ), False)
			End If
			ls_value = lhc_Client.GetResponseStatusText() 
			If ls_value = "OK" Then
				wf_output('Create GetResponseStatusText() = "OK" Success', False)
			Else
				wf_output('Create GetResponseStatusText() <> "OK" Failed' + " Return:" + String ( ls_value ), False)
			End If
			
			//302--Found
			lhc_Client.SendRequest("GET", "http://www.appeon.com")
			li_rtn = lhc_Client.GetResponseStatusCode() 
			If li_rtn = 302 Then
				wf_output('GetResponseStatusCode() = 302 Success', False)
			Else
				wf_output('GetResponseStatusCode() <> 302' + " Return:" + String ( li_rtn ), False)
			End If
			ls_value = lhc_Client.GetResponseStatusText() 
			If ls_value = "Found" Then
				wf_output('Create GetResponseStatusText() = "Found" Success', False)
			Else
				wf_output('Create GetResponseStatusText() <> "Found" Failed' + " Return:" + String ( ls_value ), False)
			End If
			
			//404--Not Found
			lhc_Client.SendRequest("GET", is_Restful_http_PHP +"/restful/test.jpg")
			li_rtn = lhc_Client.GetResponseStatusCode() 
			If li_rtn = 404 Then
				wf_output('GetResponseStatusCode() = 404 Success', False)
			Else
				wf_output('GetResponseStatusCode() <> 404' + " Return:" + String ( li_rtn ), False)
			End If
			ls_value = lhc_Client.GetResponseStatusText() 
			If ls_value = "Not Found" Then
				wf_output('Create GetResponseStatusText() = "Not Found" Success', False)
			Else
				wf_output('Create GetResponseStatusText() <> "Not Found" Failed' + " Return:" + String ( ls_value ), False)
			End If
			//5XX 1XX
			//??
			
		Else
			wf_scriptview("li_rtn = lhc_Client2.GetResponseStatusCode()~r~n" +&
					"If IsNull (li_rtn ) Then~r~n" +&
					"	wf_output(~'Create GetResponseStatusCode() = null Failed~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseStatusCode() = ~'+String (li_rtn), False)~r~n" +&
					"End If~r~n" +&
					"ls_value = lhc_Client2.GetResponseStatusText()~r~n" +&
					"If ls_value = ~"~" Then~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() = ~"~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() <> ~"~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//200--OK~r~n" +&
					"lhc_Client.SendRequest(~"GET~", ~"" + is_Restful_http_PHP + "/restful/login_btn.jpg~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseStatusCode()~r~n" +&
					"If li_rtn = 200 Then~r~n" +&
					"	wf_output(~'GetResponseStatusCode() = 200 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseStatusCode() <> 200 Failed~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_value = lhc_Client.GetResponseStatusText()~r~n" +&
					"If ls_value = ~"OK~" Then~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() = ~"OK~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() <> ~"OK~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//302--Found~r~n" +&
					"lhc_Client.SendRequest(~"GET~", ~"http://www.appeon.com~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseStatusCode()~r~n" +&
					"If li_rtn = 302 Then~r~n" +&
					"	wf_output(~'GetResponseStatusCode() = 302 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseStatusCode() <> 302~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_value = lhc_Client.GetResponseStatusText()~r~n" +&
					"If ls_value = ~"Found~" Then~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() = ~"Found~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() <> ~"Found~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//404--Not Found~r~n" +&
					"lhc_Client.SendRequest(~"GET~", ~"" + is_Restful_http_PHP + "/restful/test.jpg~")~r~n" +&
					"li_rtn = lhc_Client.GetResponseStatusCode()~r~n" +&
					"If li_rtn = 404 Then~r~n" +&
					"	wf_output(~'GetResponseStatusCode() = 404 Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'GetResponseStatusCode() <> 404~' + ~" Return:~" + String ( li_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"ls_value = lhc_Client.GetResponseStatusText()~r~n" +&
					"If ls_value = ~"Not Found~" Then~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() = ~"Not Found~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create GetResponseStatusText() <> ~"Not Found~" Failed~' + ~" Return:~" + String ( ls_value ), False)~r~n" +&
					"End If~r~n" +&
					"//5XX 1XX~r~n" +&
					"//??~r~n")
			
		End If
	
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

If IsValid ( lhc_Client2 ) Then DesTroy ( lhc_Client2 )
If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
			
end subroutine

public function any wf_httpclient_any_ref (ref httpclient ahc_1);//====================================================================
// Function: wf_httpclient_any_ref
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference    httpclient    ahc_1
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-20
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

any 	lany_temp
HttpClient 	lhc_Client

lhc_Client = ahc_1
lhc_Client.SetRequestHeader( "Reference", "test" )

lany_temp = lhc_Client

Return lany_temp
end function

public function any wf_httpclient_any_readonly (readonly httpclient ahc_1);//====================================================================
// Function: wf_httpclient_any_readonly
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	readonly    httpclient    ahc_1
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	Pangchuguan		Date: 2017-11-20
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

any 	lany_temp
HttpClient 	lhc_Client

lhc_Client = ahc_1
lhc_Client.SetRequestHeader( "readonly", "test" )

lany_temp = lhc_Client

Return lany_temp
end function

on w_httpclient.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.p_1=create p_1
this.cb_7=create cb_7
this.httpclient_1=create httpclient_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.p_1
this.Control[iCurrent+3]=this.cb_7
end on

on w_httpclient.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.p_1)
destroy(this.cb_7)
destroy(this.httpclient_1)
end on

type mle_output from w_appeon_base`mle_output within w_httpclient
integer y = 2100
integer height = 572
end type

type cb_5 from w_appeon_base`cb_5 within w_httpclient
end type

type cb_4 from w_appeon_base`cb_4 within w_httpclient
end type

type cb_3 from w_appeon_base`cb_3 within w_httpclient
end type

type mle_view from w_appeon_base`mle_view within w_httpclient
integer y = 640
integer height = 1284
end type

type mle_dec from w_appeon_base`mle_dec within w_httpclient
integer height = 516
end type

type cb_2 from w_appeon_base`cb_2 within w_httpclient
end type

type cb_1 from w_appeon_base`cb_1 within w_httpclient
end type

type lb_1 from w_appeon_base`lb_1 within w_httpclient
integer y = 632
integer height = 1348
end type

type gb_1 from w_appeon_base`gb_1 within w_httpclient
end type

type gb_2 from w_appeon_base`gb_2 within w_httpclient
integer height = 1200
end type

type gb_3 from w_appeon_base`gb_3 within w_httpclient
integer y = 564
integer height = 1400
end type

type gb_4 from w_appeon_base`gb_4 within w_httpclient
integer y = 2004
integer height = 696
end type

type cb_6 from commandbutton within w_httpclient
boolean visible = false
integer x = 1627
integer y = 36
integer width = 233
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;wf_OutPut(gs_Post, False) //Post Event

end event

type p_1 from picture within w_httpclient
integer x = 2354
integer y = 52
integer width = 974
integer height = 420
boolean bringtotop = true
boolean focusrectangle = false
end type

type cb_7 from commandbutton within w_httpclient
boolean visible = false
integer x = 1641
integer y = 164
integer width = 233
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;wf_OutPut( gs_values, False) //Post Event

end event

type httpclient_1 from httpclient within w_httpclient descriptor "pb_nvo" = "true" 
end type

on httpclient_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on httpclient_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

