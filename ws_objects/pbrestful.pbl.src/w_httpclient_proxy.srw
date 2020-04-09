$PBExportHeader$w_httpclient_proxy.srw
forward
global type w_httpclient_proxy from window
end type
type st_text from statictext within w_httpclient_proxy
end type
type st_code from statictext within w_httpclient_proxy
end type
type cb_1 from commandbutton within w_httpclient_proxy
end type
type tab_1 from tab within w_httpclient_proxy
end type
type tabpage_3 from userobject within tab_1
end type
type st_18 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_16 from statictext within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type st_13 from statictext within tabpage_3
end type
type st_12 from statictext within tabpage_3
end type
type cb_3 from commandbutton within tabpage_3
end type
type cb_2 from commandbutton within tabpage_3
end type
type cb_8 from commandbutton within tabpage_3
end type
type sle_key from singlelineedit within tabpage_3
end type
type st_10 from statictext within tabpage_3
end type
type sle_locations from singlelineedit within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type sle_method from singlelineedit within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type sle_url from singlelineedit within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type mle_1 from multilineedit within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_18 st_18
ddlb_1 ddlb_1
st_16 st_16
st_14 st_14
st_13 st_13
st_12 st_12
cb_3 cb_3
cb_2 cb_2
cb_8 cb_8
sle_key sle_key
st_10 st_10
sle_locations sle_locations
st_1 st_1
sle_method sle_method
st_8 st_8
sle_url sle_url
st_7 st_7
st_2 st_2
mle_1 mle_1
end type
type tabpage_1 from userobject within tab_1
end type
type st_19 from statictext within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type st_17 from statictext within tabpage_1
end type
type st_15 from statictext within tabpage_1
end type
type st_11 from statictext within tabpage_1
end type
type mle_2 from multilineedit within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type sle_key2 from singlelineedit within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type sle_locations2 from singlelineedit within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type sle_method2 from singlelineedit within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type sle_url2 from singlelineedit within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_19 st_19
ddlb_2 ddlb_2
st_17 st_17
st_15 st_15
st_11 st_11
mle_2 mle_2
cb_5 cb_5
cb_4 cb_4
st_9 st_9
sle_key2 sle_key2
st_6 st_6
sle_locations2 sle_locations2
st_5 st_5
sle_method2 sle_method2
st_4 st_4
sle_url2 sle_url2
st_3 st_3
end type
type tab_1 from tab within w_httpclient_proxy
tabpage_3 tabpage_3
tabpage_1 tabpage_1
end type
end forward

global type w_httpclient_proxy from window
integer width = 3584
integer height = 1852
boolean titlebar = true
string title = "HttpClient Test Proxy"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_text st_text
st_code st_code
cb_1 cb_1
tab_1 tab_1
end type
global w_httpclient_proxy w_httpclient_proxy

type prototypes

end prototypes

type variables
String 	is_sign, is_value
eon_appeon_resize  ieon_resize
HttpClient 		ihc_Client
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

on w_httpclient_proxy.create
this.st_text=create st_text
this.st_code=create st_code
this.cb_1=create cb_1
this.tab_1=create tab_1
this.Control[]={this.st_text,&
this.st_code,&
this.cb_1,&
this.tab_1}
end on

on w_httpclient_proxy.destroy
destroy(this.st_text)
destroy(this.st_code)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type st_text from statictext within w_httpclient_proxy
integer x = 393
integer y = 1572
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

type st_code from statictext within w_httpclient_proxy
integer x = 32
integer y = 1572
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

type cb_1 from commandbutton within w_httpclient_proxy
integer x = 2949
integer y = 1572
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "md5"
end type

event clicked;//对字符串进行md5
String 	ls_new_text, ls_result

u_derek_md5 lu_md5
lu_md5=create u_derek_md5
ls_new_text = "20171117T051225Z"
lu_md5.uf_md5string(ls_new_text,ref ls_result)

destroy lu_md5

MessageBox ( "", ls_result )
end event

type tab_1 from tab within w_httpclient_proxy
integer x = 37
integer y = 24
integer width = 3346
integer height = 1532
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
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_3,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_1)
end on

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1412
long backcolor = 67108864
string text = "Proxy Test1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_18 st_18
ddlb_1 ddlb_1
st_16 st_16
st_14 st_14
st_13 st_13
st_12 st_12
cb_3 cb_3
cb_2 cb_2
cb_8 cb_8
sle_key sle_key
st_10 st_10
sle_locations sle_locations
st_1 st_1
sle_method sle_method
st_8 st_8
sle_url sle_url
st_7 st_7
st_2 st_2
mle_1 mle_1
end type

on tabpage_3.create
this.st_18=create st_18
this.ddlb_1=create ddlb_1
this.st_16=create st_16
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_8=create cb_8
this.sle_key=create sle_key
this.st_10=create st_10
this.sle_locations=create sle_locations
this.st_1=create st_1
this.sle_method=create sle_method
this.st_8=create st_8
this.sle_url=create sle_url
this.st_7=create st_7
this.st_2=create st_2
this.mle_1=create mle_1
this.Control[]={this.st_18,&
this.ddlb_1,&
this.st_16,&
this.st_14,&
this.st_13,&
this.st_12,&
this.cb_3,&
this.cb_2,&
this.cb_8,&
this.sle_key,&
this.st_10,&
this.sle_locations,&
this.st_1,&
this.sle_method,&
this.st_8,&
this.sle_url,&
this.st_7,&
this.st_2,&
this.mle_1}
end on

on tabpage_3.destroy
destroy(this.st_18)
destroy(this.ddlb_1)
destroy(this.st_16)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_8)
destroy(this.sle_key)
destroy(this.st_10)
destroy(this.sle_locations)
destroy(this.st_1)
destroy(this.sle_method)
destroy(this.st_8)
destroy(this.sle_url)
destroy(this.st_7)
destroy(this.st_2)
destroy(this.mle_1)
end on

type st_18 from statictext within tabpage_3
integer x = 2633
integer y = 116
integer width = 608
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "SSL2.0和SSL3.0会失败"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_3
integer x = 2857
integer y = 12
integer width = 411
integer height = 452
integer taborder = 10
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

type st_16 from statictext within tabpage_3
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

type st_14 from statictext within tabpage_3
integer x = 23
integer y = 560
integer width = 1691
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "反向测试：2.手动设置代理；1.实例化HttpClient；3.访问Google Map"
boolean focusrectangle = false
end type

type st_13 from statictext within tabpage_3
integer x = 23
integer y = 496
integer width = 1673
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "更换测试：2.手动更换不同的代理；3.访问Google Map"
boolean focusrectangle = false
end type

type st_12 from statictext within tabpage_3
integer x = 23
integer y = 432
integer width = 1673
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "失败测试：2.手动取消代理；3.访问Google Map"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within tabpage_3
integer x = 2629
integer y = 392
integer width = 622
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Manual Setting Proxy"
end type

event clicked;If Not IsValid ( ihc_Client ) Then
	MessageBox ( "Tip", "HttpClient is not instantiated!" )
	Return
End if

MessageBox ( "Tip", "Please manual Setting proxy! ~r~n" + &
"Open IE,click Tools, click Internet Options,click Connections,click Lan Settings,~r~n" + &
"Method 1.click Automatically detect settings;~r~n" + &
"Method 2.click Use automatic configuration script,setting Address;~r~n" + &
"Method 3.click Use a proxy server for you Lan,setting Address and Port;" )


end event

type cb_2 from commandbutton within tabpage_3
integer x = 2629
integer y = 280
integer width = 622
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Create HttpClient"
end type

event clicked;If Not IsValid ( ihc_Client ) Then
	ihc_Client = Create HttpClient
	ihc_Client.TimeOut = 10
	ihc_Client.SetRequestHeader ( "accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )
	ihc_Client.SetRequestHeader ( "accept-language", "zh-CN,zh;q=0.8" )
	ihc_Client.SetRequestHeader ( "upgrade-insecure-requests", "1" )
	ihc_Client.SetRequestHeader ( "Content-Type", "application/json" )
	ihc_Client.SetRequestHeader ( "User-Agent", "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" )

Else
	DesTroy ( ihc_Client )
	ihc_Client = Create HttpClient
End if

If IsValid ( ihc_Client ) Then
	MessageBox ( "Tip", "HttpClient Instantiated success!" )
End If
end event

type cb_8 from commandbutton within tabpage_3
integer x = 2629
integer y = 504
integer width = 622
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.Get Google Map"
end type

event clicked;
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn, ll_Code

If Not IsValid ( ihc_Client ) Then
	MessageBox ( "Tip", "HttpClient is not instantiated!" )
	Return
End if

st_code.Text = ""
st_Text.Text = ""
mle_1.Text = ""

//sle_locations.Text = "39.7391536,-104.9847034"
ls_Url = Trim ( sle_Url.Text ) + "?locations="+ sle_locations.Text + "&key=" + sle_key.Text
ls_Method = Trim ( sle_Method.Text )

Choose Case ddlb_1.Text
	Case "default"
		ihc_Client.secureprotocol = 0
	Case 'SSL2.0'
		ihc_Client.secureprotocol = 1
	Case 'SSL3.0'
		ihc_Client.secureprotocol = 2
	Case 'TSL1.0'
		ihc_Client.secureprotocol = 3
	Case 'TSL1.1'
		ihc_Client.secureprotocol = 4
	Case 'TSL1.2'
		ihc_Client.secureprotocol = 5
	Case Else
		ihc_Client.secureprotocol = 0
End Choose

ll_rtn = ihc_Client.sendrequest( ls_Method, ls_Url )

If ll_rtn = 1 Then
	ls_Respose = ihc_Client.Getresponseheaders( )
	ll_rtn = ihc_Client.GetResponsebody( ls_Body)
	mle_1.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose
	
	ll_Code = ihc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = ihc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
Else
	mle_1.Text = "Return:" + String ( ll_rtn )
End If
end event

type sle_key from singlelineedit within tabpage_3
integer x = 279
integer y = 280
integer width = 1390
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "AIzaSyBC9rhx1rBnp5X-24ZhSasuXKZPrI5PQJE"
borderstyle borderstyle = stylelowered!
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
string text = "Key:"
boolean focusrectangle = false
end type

type sle_locations from singlelineedit within tabpage_3
integer x = 279
integer y = 192
integer width = 1390
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "39.7391536,-104.9847034"
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
string text = "Locations:"
boolean focusrectangle = false
end type

type sle_method from singlelineedit within tabpage_3
integer x = 279
integer y = 104
integer width = 471
integer height = 80
integer taborder = 20
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
string text = "https://maps.googleapis.com/maps/api/elevation/json"
borderstyle borderstyle = stylelowered!
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

type st_2 from statictext within tabpage_3
integer x = 23
integer y = 368
integer width = 1691
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "操作步骤：1.实例化HttpClient；2.手动设置代理；3.访问Google Map"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within tabpage_3
integer x = 23
integer y = 648
integer width = 3259
integer height = 756
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

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1412
long backcolor = 67108864
string text = "Proxy Test2"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_19 st_19
ddlb_2 ddlb_2
st_17 st_17
st_15 st_15
st_11 st_11
mle_2 mle_2
cb_5 cb_5
cb_4 cb_4
st_9 st_9
sle_key2 sle_key2
st_6 st_6
sle_locations2 sle_locations2
st_5 st_5
sle_method2 sle_method2
st_4 st_4
sle_url2 sle_url2
st_3 st_3
end type

on tabpage_1.create
this.st_19=create st_19
this.ddlb_2=create ddlb_2
this.st_17=create st_17
this.st_15=create st_15
this.st_11=create st_11
this.mle_2=create mle_2
this.cb_5=create cb_5
this.cb_4=create cb_4
this.st_9=create st_9
this.sle_key2=create sle_key2
this.st_6=create st_6
this.sle_locations2=create sle_locations2
this.st_5=create st_5
this.sle_method2=create sle_method2
this.st_4=create st_4
this.sle_url2=create sle_url2
this.st_3=create st_3
this.Control[]={this.st_19,&
this.ddlb_2,&
this.st_17,&
this.st_15,&
this.st_11,&
this.mle_2,&
this.cb_5,&
this.cb_4,&
this.st_9,&
this.sle_key2,&
this.st_6,&
this.sle_locations2,&
this.st_5,&
this.sle_method2,&
this.st_4,&
this.sle_url2,&
this.st_3}
end on

on tabpage_1.destroy
destroy(this.st_19)
destroy(this.ddlb_2)
destroy(this.st_17)
destroy(this.st_15)
destroy(this.st_11)
destroy(this.mle_2)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.st_9)
destroy(this.sle_key2)
destroy(this.st_6)
destroy(this.sle_locations2)
destroy(this.st_5)
destroy(this.sle_method2)
destroy(this.st_4)
destroy(this.sle_url2)
destroy(this.st_3)
end on

type st_19 from statictext within tabpage_1
integer x = 2633
integer y = 116
integer width = 608
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "SSL2.0和SSL3.0会失败"
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 2857
integer y = 12
integer width = 411
integer height = 452
integer taborder = 10
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

type st_17 from statictext within tabpage_1
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

type st_15 from statictext within tabpage_1
integer x = 23
integer y = 488
integer width = 1673
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "失败测试：1.手动取消代理；2.访问GoogleMap是否失败；"
boolean focusrectangle = false
end type

type st_11 from statictext within tabpage_1
integer x = 23
integer y = 428
integer width = 1673
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "更换测试：1.手动更改不同代理；2.访问GoogleMap是否成功；"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within tabpage_1
integer x = 23
integer y = 576
integer width = 3259
integer height = 828
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

type cb_5 from commandbutton within tabpage_1
integer x = 2615
integer y = 312
integer width = 622
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Manual Setting Proxy"
end type

event clicked;
MessageBox ( "Tip", "Please manual Setting proxy! ~r~n" + &
"Open IE,click Tools, click Internet Options,click Connections,click Lan Settings,~r~n" + &
"Method 1.click Automatically detect settings;~r~n" + &
"Method 2.click Use automatic configuration script,setting Address;~r~n" + &
"Method 3.click Use a proxy server for you Lan,setting Address and Port;" )
end event

type cb_4 from commandbutton within tabpage_1
integer x = 2615
integer y = 424
integer width = 622
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Get Google Map"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn, ll_Code

//sle_locations.Text = "39.7391536,-104.9847034"
ls_Url = Trim ( sle_Url2.Text ) + "?locations="+ sle_locations2.Text + "&key=" + sle_key2.Text
ls_Method = Trim ( sle_Method2.Text )
st_code.Text = ""
st_Text.Text = ""
mle_2.Text = ""

lhc_Client = Create HttpClient

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

ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_2.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
Else
	mle_2.Text = "Return:" + String ( ll_rtn )
End If
end event

type st_9 from statictext within tabpage_1
integer x = 23
integer y = 372
integer width = 2162
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "操作步骤：1.手动设置好代理；2.访问GoogleMap是否成功(httpClient临时变量)；"
boolean focusrectangle = false
end type

type sle_key2 from singlelineedit within tabpage_1
integer x = 279
integer y = 280
integer width = 1390
integer height = 84
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "AIzaSyBC9rhx1rBnp5X-24ZhSasuXKZPrI5PQJE"
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within tabpage_1
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
string text = "Key:"
boolean focusrectangle = false
end type

type sle_locations2 from singlelineedit within tabpage_1
integer x = 279
integer y = 192
integer width = 1390
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "40.714224,-73.961452"
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within tabpage_1
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
string text = "Locations:"
boolean focusrectangle = false
end type

type sle_method2 from singlelineedit within tabpage_1
integer x = 279
integer y = 104
integer width = 471
integer height = 80
integer taborder = 30
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

type st_4 from statictext within tabpage_1
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
string text = "https://maps.googleapis.com/maps/api/elevation/json"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_1
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

