$PBExportHeader$w_httpclient_cache.srw
forward
global type w_httpclient_cache from window
end type
type cb_2 from commandbutton within w_httpclient_cache
end type
type cb_1 from commandbutton within w_httpclient_cache
end type
type tab_1 from tab within w_httpclient_cache
end type
type tabpage_3 from userobject within tab_1
end type
type st_6 from statictext within tabpage_3
end type
type sle_url6 from singlelineedit within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type sle_url5 from singlelineedit within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type sle_url4 from singlelineedit within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type sle_url3 from singlelineedit within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type sle_url2 from singlelineedit within tabpage_3
end type
type st_1 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type sle_url1 from singlelineedit within tabpage_3
end type
type sle_method from singlelineedit within tabpage_3
end type
type mle_1 from multilineedit within tabpage_3
end type
type cb_8 from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_6 st_6
sle_url6 sle_url6
st_5 st_5
sle_url5 sle_url5
st_4 st_4
sle_url4 sle_url4
st_3 st_3
sle_url3 sle_url3
st_2 st_2
sle_url2 sle_url2
st_1 st_1
ddlb_1 ddlb_1
st_14 st_14
st_8 st_8
st_7 st_7
sle_url1 sle_url1
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type
type tab_1 from tab within w_httpclient_cache
tabpage_3 tabpage_3
end type
end forward

global type w_httpclient_cache from window
integer width = 3584
integer height = 1852
boolean titlebar = true
string title = "HttpClient Cache Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
tab_1 tab_1
end type
global w_httpclient_cache w_httpclient_cache

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

on w_httpclient_cache.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.tab_1=create tab_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.tab_1}
end on

on w_httpclient_cache.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type cb_2 from commandbutton within w_httpclient_cache
integer x = 37
integer y = 1568
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;tab_1.tabpage_3.mle_1.Text = ""
end event

type cb_1 from commandbutton within w_httpclient_cache
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

type tab_1 from tab within w_httpclient_cache
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
integer height = 1412
long backcolor = 67108864
string text = "Cache Test"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_6 st_6
sle_url6 sle_url6
st_5 st_5
sle_url5 sle_url5
st_4 st_4
sle_url4 sle_url4
st_3 st_3
sle_url3 sle_url3
st_2 st_2
sle_url2 sle_url2
st_1 st_1
ddlb_1 ddlb_1
st_14 st_14
st_8 st_8
st_7 st_7
sle_url1 sle_url1
sle_method sle_method
mle_1 mle_1
cb_8 cb_8
end type

on tabpage_3.create
this.st_6=create st_6
this.sle_url6=create sle_url6
this.st_5=create st_5
this.sle_url5=create sle_url5
this.st_4=create st_4
this.sle_url4=create sle_url4
this.st_3=create st_3
this.sle_url3=create sle_url3
this.st_2=create st_2
this.sle_url2=create sle_url2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.st_14=create st_14
this.st_8=create st_8
this.st_7=create st_7
this.sle_url1=create sle_url1
this.sle_method=create sle_method
this.mle_1=create mle_1
this.cb_8=create cb_8
this.Control[]={this.st_6,&
this.sle_url6,&
this.st_5,&
this.sle_url5,&
this.st_4,&
this.sle_url4,&
this.st_3,&
this.sle_url3,&
this.st_2,&
this.sle_url2,&
this.st_1,&
this.ddlb_1,&
this.st_14,&
this.st_8,&
this.st_7,&
this.sle_url1,&
this.sle_method,&
this.mle_1,&
this.cb_8}
end on

on tabpage_3.destroy
destroy(this.st_6)
destroy(this.sle_url6)
destroy(this.st_5)
destroy(this.sle_url5)
destroy(this.st_4)
destroy(this.sle_url4)
destroy(this.st_3)
destroy(this.sle_url3)
destroy(this.st_2)
destroy(this.sle_url2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.st_14)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_url1)
destroy(this.sle_method)
destroy(this.mle_1)
destroy(this.cb_8)
end on

type st_6 from statictext within tabpage_3
integer x = 2505
integer y = 280
integer width = 736
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "每个url访问2次记录访问时间"
boolean focusrectangle = false
end type

type sle_url6 from singlelineedit within tabpage_3
integer x = 178
integer y = 428
integer width = 2290
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://www.microsoft.com/"
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within tabpage_3
integer x = 23
integer y = 440
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url6:"
boolean focusrectangle = false
end type

type sle_url5 from singlelineedit within tabpage_3
integer x = 178
integer y = 344
integer width = 2290
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://promos.mcafee.com/offer.aspx?id=1243491&cid=196992&lqmcat:CN:McAfee_CN_Gen_Retargeting_J:cn_gen_retargeting_J_software:key343"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within tabpage_3
integer x = 23
integer y = 356
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url5:"
boolean focusrectangle = false
end type

type sle_url4 from singlelineedit within tabpage_3
integer x = 178
integer y = 260
integer width = 2290
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://github.com"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within tabpage_3
integer x = 23
integer y = 272
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url4:"
boolean focusrectangle = false
end type

type sle_url3 from singlelineedit within tabpage_3
integer x = 178
integer y = 176
integer width = 2290
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://cn.norton.com"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within tabpage_3
integer x = 23
integer y = 188
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url3:"
boolean focusrectangle = false
end type

type sle_url2 from singlelineedit within tabpage_3
integer x = 178
integer y = 92
integer width = 2290
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://www.kaspersky.com"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_3
integer x = 23
integer y = 104
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url2:"
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
integer x = 2597
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

type st_8 from statictext within tabpage_3
integer x = 2597
integer y = 132
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
integer y = 20
integer width = 142
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url1:"
boolean focusrectangle = false
end type

type sle_url1 from singlelineedit within tabpage_3
integer x = 178
integer y = 8
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
string text = "https://www.visualstudio.com"
borderstyle borderstyle = stylelowered!
end type

type sle_method from singlelineedit within tabpage_3
integer x = 2853
integer y = 120
integer width = 224
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
integer y = 572
integer width = 3259
integer height = 832
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
integer x = 2523
integer y = 448
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt
Long 			ll_rtn, ll_Code, ll_cpu1,ll_cpu2

lhc_Client = Create HttpClient

ls_Method = Trim ( sle_Method.Text )

lhc_Client.TimeOut = 20
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

//url1 first
ls_Url = Trim ( sle_Url1.Text ) 
lhc_Client.SetRequestHeader("Cache-Control", "no-cache")
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url1_1:" + string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url1_1:" + string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url1 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url1_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url1_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If


//url2 first
ls_Url = Trim ( sle_Url2.Text ) 
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url2_1:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url2_1:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url2 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url2_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url2_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If


//url3 first
ls_Url = Trim ( sle_Url3.Text ) 
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url3_1:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url3_1:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url3 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url3_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url3_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If

//url4 first
ls_Url = Trim ( sle_Url4.Text ) 
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url4_1:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url4_1:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url2 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url4_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url4_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If

//url5 first
ls_Url = Trim ( sle_Url5.Text ) 
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url5_1:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url5_1:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url5 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url5_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url5_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If

//url6 first
ls_Url = Trim ( sle_Url6.Text ) 
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url6_1:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url6_1:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
//url6 second
ll_cpu1 = cpu()
ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
ll_cpu2 = cpu() - ll_cpu1
If ll_rtn = 1 Then
	ll_Code = lhc_Client.GetResponseStatusCode()	
	ls_txt = lhc_Client.GetResponseStatusText()
	mle_1.Text += "url6_2:" +string ( ll_cpu2 ) + "~t" + String ( ll_Code ) + " " + ls_txt + "~r~n"
Else
	mle_1.Text += "url6_2:" +string ( ll_cpu2 ) + "~t" + "Return:" + String ( ll_rtn ) + "~r~n"
End If
end event

