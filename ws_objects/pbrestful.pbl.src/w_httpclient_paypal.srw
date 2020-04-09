$PBExportHeader$w_httpclient_paypal.srw
forward
global type w_httpclient_paypal from window
end type
type st_text from statictext within w_httpclient_paypal
end type
type st_code from statictext within w_httpclient_paypal
end type
type tab_1 from tab within w_httpclient_paypal
end type
type tabpage_3 from userobject within tab_1
end type
type st_17 from statictext within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type sle_username from singlelineedit within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type st_10 from statictext within tabpage_3
end type
type sle_password from singlelineedit within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type sle_url from singlelineedit within tabpage_3
end type
type sle_method from singlelineedit within tabpage_3
end type
type mle_1 from multilineedit within tabpage_3
end type
type cb_8 from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_17 st_17
st_14 st_14
ddlb_1 ddlb_1
st_5 st_5
sle_username sle_username
st_1 st_1
st_10 st_10
sle_password sle_password
st_8 st_8
st_7 st_7
sle_url sle_url
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type
type tabpage_1 from userobject within tab_1
end type
type st_18 from statictext within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type st_15 from statictext within tabpage_1
end type
type st_12 from statictext within tabpage_1
end type
type mle_2 from multilineedit within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type sle_token2 from singlelineedit within tabpage_1
end type
type sle_method2 from singlelineedit within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type sle_url2 from singlelineedit within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_18 st_18
ddlb_2 ddlb_2
st_15 st_15
st_12 st_12
mle_2 mle_2
cb_1 cb_1
st_4 st_4
sle_token2 sle_token2
sle_method2 sle_method2
st_3 st_3
sle_url2 sle_url2
st_2 st_2
end type
type tabpage_2 from userobject within tab_1
end type
type st_19 from statictext within tabpage_2
end type
type ddlb_3 from dropdownlistbox within tabpage_2
end type
type st_16 from statictext within tabpage_2
end type
type sle_id3 from singlelineedit within tabpage_2
end type
type st_13 from statictext within tabpage_2
end type
type mle_3 from multilineedit within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type sle_token3 from singlelineedit within tabpage_2
end type
type st_11 from statictext within tabpage_2
end type
type sle_method3 from singlelineedit within tabpage_2
end type
type st_9 from statictext within tabpage_2
end type
type sle_url3 from singlelineedit within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_19 st_19
ddlb_3 ddlb_3
st_16 st_16
sle_id3 sle_id3
st_13 st_13
mle_3 mle_3
cb_2 cb_2
sle_token3 sle_token3
st_11 st_11
sle_method3 sle_method3
st_9 st_9
sle_url3 sle_url3
st_6 st_6
end type
type tab_1 from tab within w_httpclient_paypal
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_httpclient_paypal from window
integer width = 3584
integer height = 1852
boolean titlebar = true
string title = "HttpClient Test PayPal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_text st_text
st_code st_code
tab_1 tab_1
end type
global w_httpclient_paypal w_httpclient_paypal

type prototypes

end prototypes

type variables
String 	is_sign, is_value
eon_appeon_resize  ieon_resize
u_derek_fun 	iu_urlfun
end variables

forward prototypes
public function string wf_gettimestamp ()
public function string wf_getrandom ()
public subroutine of_parsejson (ref jsonparser anv_jsonparser, longptr alp_handle, string as_key)
end prototypes

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

public function string wf_getrandom ();Long 		ll_Random

ll_Random = Rand(32767)

Return String ( ll_Random )
end function

public subroutine of_parsejson (ref jsonparser anv_jsonparser, longptr alp_handle, string as_key);//of_ParseJson(JsonParser anv_JsonParser, longptr alp_Handle)

Long 	ll_ChildCount, ll_index, llp_child, llp_root
String ls_null
JsonItemType ljit_JsonItemType

ljit_JsonItemType = anv_JsonParser.GetItemType(alp_Handle)

// 根据结点类型递归或取结点的值
if ljit_JsonItemType = JsonObjectItem! or ljit_JsonItemType = JsonArrayItem! then
	// 递归结点
	ll_ChildCount = anv_JsonParser.GetChildCount(alp_Handle)
	for ll_Index = 1 to ll_ChildCount
		llp_Child = anv_JsonParser.GetChildItem(alp_Handle, ll_Index)
		string ls_key
		ls_key = anv_JsonParser.GetChildKey(alp_Handle, ll_Index)
//		If IsNull ( ls_key ) Or Trim ( ls_key ) = "" Then
//			ls_key = "none"
//		End If		
		of_ParseJson(anv_JsonParser, llp_Child,ls_key)
	next
else // 取结点的值
	choose case ljit_JsonItemType
		case JsonStringItem!
			String ls_value 
			ls_value = anv_JsonParser.GetItemString(alp_Handle)				
			is_value = is_value + as_key + ": " + ls_value + "~r~n"
		case JsonNumberItem!
			Double ldb_value
			ldb_value = anv_JsonParser.GetItemNumber(alp_Handle)
			is_value = is_value + as_key + ": " + string ( ldb_value) + "~r~n"
		case JsonBooleanItem!
			Boolean lb_value
			lb_value = anv_JsonParser.GetItemBoolean(alp_Handle)
			is_value = is_value +as_key+ ": " + string ( lb_value) + "~r~n"
		case JsonNullItem!
			//SetNull(ls_Null)			
			is_value = is_value + as_key + ": null " + "~r~n"
	end choose
end if

end subroutine

on w_httpclient_paypal.create
this.st_text=create st_text
this.st_code=create st_code
this.tab_1=create tab_1
this.Control[]={this.st_text,&
this.st_code,&
this.tab_1}
end on

on w_httpclient_paypal.destroy
destroy(this.st_text)
destroy(this.st_code)
destroy(this.tab_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type st_text from statictext within w_httpclient_paypal
integer x = 416
integer y = 1312
integer width = 521
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "text"
boolean focusrectangle = false
end type

type st_code from statictext within w_httpclient_paypal
integer x = 55
integer y = 1312
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "code"
boolean focusrectangle = false
end type

type tab_1 from tab within w_httpclient_paypal
integer x = 37
integer y = 24
integer width = 3346
integer height = 1272
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_3,&
this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1152
long backcolor = 67108864
string text = "PayPal Token"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_17 st_17
st_14 st_14
ddlb_1 ddlb_1
st_5 st_5
sle_username sle_username
st_1 st_1
st_10 st_10
sle_password sle_password
st_8 st_8
st_7 st_7
sle_url sle_url
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type

on tabpage_3.create
this.st_17=create st_17
this.st_14=create st_14
this.ddlb_1=create ddlb_1
this.st_5=create st_5
this.sle_username=create sle_username
this.st_1=create st_1
this.st_10=create st_10
this.sle_password=create sle_password
this.st_8=create st_8
this.st_7=create st_7
this.sle_url=create sle_url
this.sle_method=create sle_method
this.mle_1=create mle_1
this.cb_8=create cb_8
this.Control[]={this.st_17,&
this.st_14,&
this.ddlb_1,&
this.st_5,&
this.sle_username,&
this.st_1,&
this.st_10,&
this.sle_password,&
this.st_8,&
this.st_7,&
this.sle_url,&
this.sle_method,&
this.mle_1,&
this.cb_8}
end on

on tabpage_3.destroy
destroy(this.st_17)
destroy(this.st_14)
destroy(this.ddlb_1)
destroy(this.st_5)
destroy(this.sle_username)
destroy(this.st_1)
destroy(this.st_10)
destroy(this.sle_password)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_url)
destroy(this.sle_method)
destroy(this.mle_1)
destroy(this.cb_8)
end on

type st_17 from statictext within tabpage_3
integer x = 2642
integer y = 116
integer width = 672
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "只有Default和TSL1.2成功"
boolean focusrectangle = false
end type

type st_14 from statictext within tabpage_3
integer x = 2615
integer y = 28
integer width = 238
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSL/TSL:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_3
integer x = 2857
integer y = 12
integer width = 411
integer height = 452
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"default","SSL2.0","SSL3.0","TSL1.0","TSL1.1","TSL1.2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

type st_5 from statictext within tabpage_3
integer x = 2245
integer y = 280
integer width = 992
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "成功获取Bearer Token后切换第二Tab页"
boolean focusrectangle = false
end type

type sle_username from singlelineedit within tabpage_3
integer x = 279
integer y = 192
integer width = 1417
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Af-Bf-ZPrD0j1aXrGRsnAgx2-rcuE-ZTQOr9mEvqsiOzOaaA6ZcoUjjgz-0b3a10106tnaz4wbmF-rg3"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_3
integer x = 23
integer y = 204
integer width = 270
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "username:"
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_3
integer x = 23
integer y = 292
integer width = 261
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "password:"
boolean focusrectangle = false
end type

type sle_password from singlelineedit within tabpage_3
integer x = 279
integer y = 280
integer width = 1417
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "EH2OWHgxMgyKc-tN_EGZAh0Kg4i2f7HHR5TFBY1eX06ZuOuVpHzPwdV3kV9XVS8AQiru5GSEh126vEJh"
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within tabpage_3
integer x = 23
integer y = 116
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method:"
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_3
integer x = 23
integer y = 28
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url:"
boolean focusrectangle = false
end type

type sle_url from singlelineedit within tabpage_3
integer x = 279
integer y = 16
integer width = 2290
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://api.sandbox.paypal.com/v1/oauth2/token"
borderstyle borderstyle = stylelowered!
end type

type sle_method from singlelineedit within tabpage_3
integer x = 279
integer y = 104
integer width = 471
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "POST"
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within tabpage_3
integer x = 23
integer y = 396
integer width = 3259
integer height = 728
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_8 from commandbutton within tabpage_3
integer x = 1751
integer y = 268
integer width = 453
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get ToKen"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error,ls_auth, ls_postdata, ls_Request
Long 			ll_rtn, ll_Code
Blob  lb_data
nvo_base64 luo_base64
String 	ls_user, ls_pass, ls_token, ls_tokenType

//json to string
JsonParser lnv_JsonParser
LongPtr ll_RootHandle, llp_Child, llp_Child2
JsonItemType lji_1, lji_2, lji_3

lhc_Client = Create HttpClient

st_code.Text = ""
st_Text.Text = ""

ls_Url = Trim ( sle_Url.Text ) 
ls_Method = Trim ( sle_Method.Text )
ls_user = sle_username.Text
ls_pass = sle_password.Text
lb_data = Blob(ls_user + ":" + ls_pass,EncodingUTF8!)
ls_auth = luo_base64.base64encode(lb_data)

ls_postdata = 'grant_type=client_credentials'

Choose Case ddlb_1.Text
	Case "default"
		lhc_Client.secureprotocol = 0
	Case 'SSL2.0'
		lhc_Client.secureprotocol = 1
	Case 'SSL3.0'
		lhc_Client.secureprotocol = 2
	Case 'TSL1.0'
		lhc_Client.secureprotocol = 3
	Case 'TSL1.1'
		lhc_Client.secureprotocol = 4
	Case 'TSL1.2'
		lhc_Client.secureprotocol = 5
	Case Else
		lhc_Client.secureprotocol = 0
End Choose

lhc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded" )
lhc_Client.SetRequestHeader ( "Authorization", "Basic " + ls_auth )
lhc_Client.SetRequestHeader ( "accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )

ls_Request = lhc_Client.GetRequestHeaders()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url, ls_postdata )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_1.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose + "~r~n~r~nRequest Headers: ~r~n" + ls_Request
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
	//处理返回的json,写入第二、三tab页的token
	If POS ( ls_Body,"access_token" ) > 0 And POS ( ls_Body,"token_type" ) > 0 Then
		//		{
		//			 "scope": "https://uri.paypal.com/services/disputes/read-seller https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/applications/webhooks openid https://uri.paypal.com/services/disputes/update-seller",
		//			 "nonce": "2017-11-14T05:30:33ZFSdhNFwQ2R4UnvWp-pPefFJQ7B7NEabKFWRF4U2e1_c",
		//			 "access_token": "A21AAFHghgBu6G1X62HIpQpyRFALLf4xbx3Hu_vgAOOGNAWJKwKXk6OREmmIybBJGrtH2kjAlwbmzh0fsdJirZLKkZWuPrJng",
		//			 "token_type": "Bearer",
		//			 "app_id": "APP-80W284485P519543T",
		//			 "expires_in": 32400
		//		}
		
		lnv_JsonParser = Create JsonParser		
		ls_Error = lnv_JsonParser.loadstring(ls_Body)
		if Len(ls_Error) > 0 then
			mle_1.Text += "~r~n JsonParser:" + String ( ls_Error )
			Return
		end if
		
		ll_RootHandle = lnv_JsonParser.GetRootItem ( ) 
		lji_1 = lnv_JsonParser.GetItemType ( ll_RootHandle )
		If lji_1 = JsonObjectItem! Then
			llp_Child = lnv_JsonParser.GetChildItem ( ll_RootHandle, 3 ) //access_token
			ls_token = lnv_JsonParser.GetItemString ( llp_Child )
			llp_Child2 = lnv_JsonParser.GetChildItem ( ll_RootHandle, 4 ) //token_type
			ls_tokenType = lnv_JsonParser.GetItemString(llp_Child2)
			tab_1.tabpage_1.sle_token2.Text = ls_tokenType + " " + ls_token
			tab_1.tabpage_2.sle_token3.Text = ls_tokenType + " " + ls_token
		End If
	
		DesTroy ( lnv_JsonParser )
	
	End If
	
Else
	mle_1.Text = "Return:" + String ( ll_rtn )
End If



end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1152
long backcolor = 67108864
string text = "webhooks"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_18 st_18
ddlb_2 ddlb_2
st_15 st_15
st_12 st_12
mle_2 mle_2
cb_1 cb_1
st_4 st_4
sle_token2 sle_token2
sle_method2 sle_method2
st_3 st_3
sle_url2 sle_url2
st_2 st_2
end type

on tabpage_1.create
this.st_18=create st_18
this.ddlb_2=create ddlb_2
this.st_15=create st_15
this.st_12=create st_12
this.mle_2=create mle_2
this.cb_1=create cb_1
this.st_4=create st_4
this.sle_token2=create sle_token2
this.sle_method2=create sle_method2
this.st_3=create st_3
this.sle_url2=create sle_url2
this.st_2=create st_2
this.Control[]={this.st_18,&
this.ddlb_2,&
this.st_15,&
this.st_12,&
this.mle_2,&
this.cb_1,&
this.st_4,&
this.sle_token2,&
this.sle_method2,&
this.st_3,&
this.sle_url2,&
this.st_2}
end on

on tabpage_1.destroy
destroy(this.st_18)
destroy(this.ddlb_2)
destroy(this.st_15)
destroy(this.st_12)
destroy(this.mle_2)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.sle_token2)
destroy(this.sle_method2)
destroy(this.st_3)
destroy(this.sle_url2)
destroy(this.st_2)
end on

type st_18 from statictext within tabpage_1
integer x = 2642
integer y = 116
integer width = 672
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "只有Default和TSL1.2成功"
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 2857
integer y = 12
integer width = 411
integer height = 452
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"default","SSL2.0","SSL3.0","TSL1.0","TSL1.1","TSL1.2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

type st_15 from statictext within tabpage_1
integer x = 2615
integer y = 28
integer width = 238
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSL/TSL:"
boolean focusrectangle = false
end type

type st_12 from statictext within tabpage_1
integer x = 2245
integer y = 300
integer width = 992
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "成功获取ID后切换第三Tab页"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within tabpage_1
integer x = 23
integer y = 396
integer width = 3259
integer height = 728
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within tabpage_1
integer x = 1751
integer y = 284
integer width = 453
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get webhooks"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error,ls_auth, ls_postdata, ls_Request
Long 			ll_rtn, ll_Code

//json to string
JsonParser lnv_JsonParser
LongPtr ll_RootHandle, llp_Child, llp_Child2, llp_Child3
JsonItemType lji_1, lji_2, lji_3

lhc_Client = Create HttpClient

st_code.Text = ""
st_Text.Text = ""

ls_Url = Trim ( sle_Url2.Text ) 
ls_Method = Trim ( sle_Method2.Text )
ls_auth = Trim ( sle_token2.Text ) //Bearer token 第一步已经获取

If IsNull ( ls_auth ) Or Trim ( ls_auth ) = "" Then
	MessageBox ( "Tip", "Bearer token is null, plaese click [Get Token] button on first tab." )
	Return
End If

Choose Case ddlb_2.Text
	Case "default"
		lhc_Client.secureprotocol = 0
	Case 'SSL2.0'
		lhc_Client.secureprotocol = 1
	Case 'SSL3.0'
		lhc_Client.secureprotocol = 2
	Case 'TSL1.0'
		lhc_Client.secureprotocol = 3
	Case 'TSL1.1'
		lhc_Client.secureprotocol = 4
	Case 'TSL1.2'
		lhc_Client.secureprotocol = 5
	Case Else
		lhc_Client.secureprotocol = 0
End Choose

lhc_Client.SetRequestHeader ( "Authorization", ls_auth )

ls_Request = lhc_Client.GetRequestHeaders()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url, ls_postdata )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_2.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose + "~r~n~r~nRequest Headers: ~r~n" + ls_Request
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
	//处理返回的json,写入第三tab页的ID
	If POS ( ls_Body,"webhooks" ) > 0 And POS ( ls_Body,"id~":" ) > 0 Then
		
		//{
		//    "webhooks": [
		//        {
		//            "id": "2A392483JA294393U",
		//            "url": "https://www.163.com",
		//            "event_types": [
		//                {
		//                    "name": "*",
		//                    "description": "ALL",
		//                    "status": "ENABLED"
		//                }
		//            ],
		//            "links": [
		//                {
		//                    "href": "https://api.sandbox.paypal.com/v1/notifications/webhooks/2A392483JA294393U",
		//                    "rel": "self",
		//                    "method": "GET"
		//                },
		//                {
		//                    "href": "https://api.sandbox.paypal.com/v1/notifications/webhooks/2A392483JA294393U",
		//                    "rel": "update",
		//                    "method": "PATCH"
		//                },
		//                {
		//                    "href": "https://api.sandbox.paypal.com/v1/notifications/webhooks/2A392483JA294393U",
		//                    "rel": "delete",
		//                    "method": "DELETE"
		//                }
		//            ]
		//        }
		//    ]
		//}
		
		lnv_JsonParser = Create JsonParser		
		ls_Error = lnv_JsonParser.loadstring(ls_Body)
		if Len(ls_Error) > 0 then
			mle_2.Text += "~r~n JsonParser:" + String ( ls_Error )
			Return
		end if
		
		ll_RootHandle = lnv_JsonParser.GetRootItem ( ) 
		lji_1 = lnv_JsonParser.GetItemType ( ll_RootHandle )
		If lji_1 = JsonObjectItem! Then
			llp_Child = lnv_JsonParser.GetChildItem ( ll_RootHandle, 1 ) //webhooks
			lji_2 =  lnv_JsonParser.GetItemType ( llp_Child )
			If lji_2 = JsonArrayItem! Then
				llp_Child2 = lnv_JsonParser.GetChildItem ( llp_Child, 1 ) //ObjectItem
				lji_3 =  lnv_JsonParser.GetItemType ( llp_Child2 )
				If lji_3 = JsonObjectItem! Then
					llp_Child3 = lnv_JsonParser.GetChildItem ( llp_Child2, 1 ) //id
					ls_id = lnv_JsonParser.GetItemString(llp_Child3)
					tab_1.tabpage_2.sle_id3.Text = ls_id
				End If
			End If
		End If
	
		DesTroy ( lnv_JsonParser )
	
	End If
	
Else
	mle_2.Text = "Return:" + String ( ll_rtn )
End If


end event

type st_4 from statictext within tabpage_1
integer x = 23
integer y = 204
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Token:"
boolean focusrectangle = false
end type

type sle_token2 from singlelineedit within tabpage_1
integer x = 279
integer y = 192
integer width = 1417
integer height = 84
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_method2 from singlelineedit within tabpage_1
integer x = 279
integer y = 104
integer width = 471
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "GET"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_1
integer x = 23
integer y = 116
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method:"
boolean focusrectangle = false
end type

type sle_url2 from singlelineedit within tabpage_1
integer x = 279
integer y = 16
integer width = 2290
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://api.sandbox.paypal.com/v1/notifications/webhooks"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within tabpage_1
integer x = 23
integer y = 28
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url:"
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1152
long backcolor = 67108864
string text = "webhook details"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_19 st_19
ddlb_3 ddlb_3
st_16 st_16
sle_id3 sle_id3
st_13 st_13
mle_3 mle_3
cb_2 cb_2
sle_token3 sle_token3
st_11 st_11
sle_method3 sle_method3
st_9 st_9
sle_url3 sle_url3
st_6 st_6
end type

on tabpage_2.create
this.st_19=create st_19
this.ddlb_3=create ddlb_3
this.st_16=create st_16
this.sle_id3=create sle_id3
this.st_13=create st_13
this.mle_3=create mle_3
this.cb_2=create cb_2
this.sle_token3=create sle_token3
this.st_11=create st_11
this.sle_method3=create sle_method3
this.st_9=create st_9
this.sle_url3=create sle_url3
this.st_6=create st_6
this.Control[]={this.st_19,&
this.ddlb_3,&
this.st_16,&
this.sle_id3,&
this.st_13,&
this.mle_3,&
this.cb_2,&
this.sle_token3,&
this.st_11,&
this.sle_method3,&
this.st_9,&
this.sle_url3,&
this.st_6}
end on

on tabpage_2.destroy
destroy(this.st_19)
destroy(this.ddlb_3)
destroy(this.st_16)
destroy(this.sle_id3)
destroy(this.st_13)
destroy(this.mle_3)
destroy(this.cb_2)
destroy(this.sle_token3)
destroy(this.st_11)
destroy(this.sle_method3)
destroy(this.st_9)
destroy(this.sle_url3)
destroy(this.st_6)
end on

type st_19 from statictext within tabpage_2
integer x = 2642
integer y = 116
integer width = 672
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "只有Default和TSL1.2成功"
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within tabpage_2
integer x = 2857
integer y = 12
integer width = 411
integer height = 452
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"default","SSL2.0","SSL3.0","TSL1.0","TSL1.1","TSL1.2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

type st_16 from statictext within tabpage_2
integer x = 2615
integer y = 28
integer width = 238
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSL/TSL:"
boolean focusrectangle = false
end type

type sle_id3 from singlelineedit within tabpage_2
integer x = 279
integer y = 284
integer width = 1417
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within tabpage_2
integer x = 23
integer y = 296
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ID:"
boolean focusrectangle = false
end type

type mle_3 from multilineedit within tabpage_2
integer x = 23
integer y = 396
integer width = 3259
integer height = 728
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within tabpage_2
integer x = 1751
integer y = 284
integer width = 453
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get details"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error,ls_auth, ls_postdata, ls_Request
Long 			ll_rtn, ll_Code

lhc_Client = Create HttpClient

st_code.Text = ""
st_Text.Text = ""

ls_auth = Trim ( sle_token3.Text ) //Bearer token 第一步已经获取
If IsNull ( ls_auth ) Or Trim ( ls_auth ) = "" Then
	MessageBox ( "Tip", "Bearer token is null, plaese click [Get Token] button on first tab." )
	Return
End If

ls_ID = Trim ( sle_id3.Text ) //webhook id 第二步已经获取
If IsNull ( ls_ID ) Or Trim ( ls_ID ) = "" Then
	MessageBox ( "Tip", "webhook id is null, plaese click [Get webhooks] button on second tab." )
	Return
End If

ls_Url = Trim ( sle_Url3.Text )  + ls_ID
ls_Method = Trim ( sle_Method3.Text )

Choose Case ddlb_3.Text
	Case "default"
		lhc_Client.secureprotocol = 0
	Case 'SSL2.0'
		lhc_Client.secureprotocol = 1
	Case 'SSL3.0'
		lhc_Client.secureprotocol = 2
	Case 'TSL1.0'
		lhc_Client.secureprotocol = 3
	Case 'TSL1.1'
		lhc_Client.secureprotocol = 4
	Case 'TSL1.2'
		lhc_Client.secureprotocol = 5
	Case Else
		lhc_Client.secureprotocol = 0
End Choose

lhc_Client.SetRequestHeader ( "Authorization", ls_auth )

ls_Request = lhc_Client.GetRequestHeaders()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url, ls_postdata )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_3.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose + "~r~n~r~nRequest Headers: ~r~n" + ls_Request
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
Else
	mle_3.Text = "Return:" + String ( ll_rtn )
End If


end event

type sle_token3 from singlelineedit within tabpage_2
integer x = 279
integer y = 192
integer width = 1417
integer height = 84
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within tabpage_2
integer x = 23
integer y = 204
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Token:"
boolean focusrectangle = false
end type

type sle_method3 from singlelineedit within tabpage_2
integer x = 279
integer y = 104
integer width = 471
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "GET"
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within tabpage_2
integer x = 23
integer y = 116
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method:"
boolean focusrectangle = false
end type

type sle_url3 from singlelineedit within tabpage_2
integer x = 279
integer y = 16
integer width = 2290
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://api.sandbox.paypal.com/v1/notifications/webhooks/"
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within tabpage_2
integer x = 23
integer y = 28
integer width = 247
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url:"
boolean focusrectangle = false
end type

