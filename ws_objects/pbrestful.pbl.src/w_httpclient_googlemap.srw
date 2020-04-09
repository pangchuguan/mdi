$PBExportHeader$w_httpclient_googlemap.srw
forward
global type w_httpclient_googlemap from window
end type
type st_text from statictext within w_httpclient_googlemap
end type
type st_code from statictext within w_httpclient_googlemap
end type
type tab_1 from tab within w_httpclient_googlemap
end type
type tabpage_3 from userobject within tab_1
end type
type st_cpu from statictext within tabpage_3
end type
type st_19 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type cb_1 from commandbutton within tabpage_3
end type
type sle_locations from singlelineedit within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type st_10 from statictext within tabpage_3
end type
type sle_key from singlelineedit within tabpage_3
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
st_cpu st_cpu
st_19 st_19
ddlb_1 ddlb_1
st_14 st_14
cb_1 cb_1
sle_locations sle_locations
st_1 st_1
st_10 st_10
sle_key sle_key
st_8 st_8
st_7 st_7
sle_url sle_url
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type
type tab_1 from tab within w_httpclient_googlemap
tabpage_3 tabpage_3
end type
end forward

global type w_httpclient_googlemap from window
integer width = 3584
integer height = 1852
boolean titlebar = true
string title = "HttpClient Test Google Map"
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
global w_httpclient_googlemap w_httpclient_googlemap

type prototypes

end prototypes

type variables
String 	is_sign, is_value
eon_appeon_resize  ieon_resize
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

on w_httpclient_googlemap.create
this.st_text=create st_text
this.st_code=create st_code
this.tab_1=create tab_1
this.Control[]={this.st_text,&
this.st_code,&
this.tab_1}
end on

on w_httpclient_googlemap.destroy
destroy(this.st_text)
destroy(this.st_code)
destroy(this.tab_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type st_text from statictext within w_httpclient_googlemap
integer x = 398
integer y = 1316
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

type st_code from statictext within w_httpclient_googlemap
integer x = 37
integer y = 1316
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

type tab_1 from tab within w_httpclient_googlemap
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
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_3)
end on

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 3310
integer height = 1152
long backcolor = 67108864
string text = "Google Map"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_cpu st_cpu
st_19 st_19
ddlb_1 ddlb_1
st_14 st_14
cb_1 cb_1
sle_locations sle_locations
st_1 st_1
st_10 st_10
sle_key sle_key
st_8 st_8
st_7 st_7
sle_url sle_url
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type

on tabpage_3.create
this.st_cpu=create st_cpu
this.st_19=create st_19
this.ddlb_1=create ddlb_1
this.st_14=create st_14
this.cb_1=create cb_1
this.sle_locations=create sle_locations
this.st_1=create st_1
this.st_10=create st_10
this.sle_key=create sle_key
this.st_8=create st_8
this.st_7=create st_7
this.sle_url=create sle_url
this.sle_method=create sle_method
this.mle_1=create mle_1
this.cb_8=create cb_8
this.Control[]={this.st_cpu,&
this.st_19,&
this.ddlb_1,&
this.st_14,&
this.cb_1,&
this.sle_locations,&
this.st_1,&
this.st_10,&
this.sle_key,&
this.st_8,&
this.st_7,&
this.sle_url,&
this.sle_method,&
this.mle_1,&
this.cb_8}
end on

on tabpage_3.destroy
destroy(this.st_cpu)
destroy(this.st_19)
destroy(this.ddlb_1)
destroy(this.st_14)
destroy(this.cb_1)
destroy(this.sle_locations)
destroy(this.st_1)
destroy(this.st_10)
destroy(this.sle_key)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_url)
destroy(this.sle_method)
destroy(this.mle_1)
destroy(this.cb_8)
end on

type st_cpu from statictext within tabpage_3
integer x = 2821
integer y = 296
integer width = 384
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "cpu:"
boolean focusrectangle = false
end type

type st_19 from statictext within tabpage_3
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

type cb_1 from commandbutton within tabpage_3
integer x = 2263
integer y = 268
integer width = 453
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Map2"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn, ll_Code, ll_cpu

lhc_Client = Create HttpClient
sle_locations.Text = "40.714224,-73.961452"
ls_Url = Trim ( sle_Url.Text ) + "?locations="+ sle_locations.Text + "&key=" + sle_key.Text
ls_Method = Trim ( sle_Method.Text )
st_code.Text = ""
st_Text.Text = ""

//lhc_Client.TimeOut = 10

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

ll_cpu = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
st_cpu.Text = "cpu:" + String ( cpu() - ll_cpu )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_1.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
Else
	mle_1.Text = "Return:" + String ( ll_rtn )
End If
end event

type sle_locations from singlelineedit within tabpage_3
integer x = 279
integer y = 192
integer width = 1390
integer height = 84
integer taborder = 70
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

type sle_key from singlelineedit within tabpage_3
integer x = 279
integer y = 280
integer width = 1390
integer height = 84
integer taborder = 60
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
string text = "https://maps.googleapis.com/maps/api/elevation/json"
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
string text = "GET"
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
string text = "Get Map"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn, ll_Code, ll_cpu

lhc_Client = Create HttpClient
sle_locations.Text = "39.7391536,-104.9847034"
ls_Url = Trim ( sle_Url.Text ) + "?locations="+ sle_locations.Text + "&key=" + sle_key.Text
ls_Method = Trim ( sle_Method.Text )
st_code.Text = ""
st_Text.Text = ""

//lhc_Client.TimeOut = 10

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

ll_cpu = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
st_cpu.Text = "cpu:" + String ( cpu() - ll_cpu )

If ll_rtn = 1 Then
	ls_Respose = lhc_Client.Getresponseheaders( )
	ll_rtn = lhc_Client.GetResponsebody( ls_Body)
	mle_1.Text = "Body:~r~n" + ls_Body  + "~r~n~r~nRespose Headers: ~r~n" + ls_Respose
	
	ll_Code = lhc_Client.GetResponseStatusCode()
	st_code.Text = String ( ll_Code )
	ls_txt = lhc_Client.GetResponseStatusText()
	st_Text.Text = ls_txt
	
Else
	mle_1.Text = "Return:" + String ( ll_rtn )
End If
end event

