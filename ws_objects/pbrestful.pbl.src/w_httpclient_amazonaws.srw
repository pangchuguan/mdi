$PBExportHeader$w_httpclient_amazonaws.srw
forward
global type w_httpclient_amazonaws from window
end type
type st_text from statictext within w_httpclient_amazonaws
end type
type st_code from statictext within w_httpclient_amazonaws
end type
type cb_1 from commandbutton within w_httpclient_amazonaws
end type
type tab_1 from tab within w_httpclient_amazonaws
end type
type tabpage_3 from userobject within tab_1
end type
type st_19 from statictext within tabpage_3
end type
type ddlb_1 from dropdownlistbox within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type sle_date from singlelineedit within tabpage_3
end type
type st_date from statictext within tabpage_3
end type
type sle_authorization from singlelineedit within tabpage_3
end type
type st_authorization from statictext within tabpage_3
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
st_19 st_19
ddlb_1 ddlb_1
st_14 st_14
st_2 st_2
st_4 st_4
sle_date sle_date
st_date st_date
sle_authorization sle_authorization
st_authorization st_authorization
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
type tab_1 from tab within w_httpclient_amazonaws
tabpage_3 tabpage_3
end type
end forward

global type w_httpclient_amazonaws from window
integer width = 3584
integer height = 1852
boolean titlebar = true
string title = "HttpClient Test AWS"
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
global w_httpclient_amazonaws w_httpclient_amazonaws

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

on w_httpclient_amazonaws.create
this.st_text=create st_text
this.st_code=create st_code
this.cb_1=create cb_1
this.tab_1=create tab_1
this.Control[]={this.st_text,&
this.st_code,&
this.cb_1,&
this.tab_1}
end on

on w_httpclient_amazonaws.destroy
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

type st_text from statictext within w_httpclient_amazonaws
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

type st_code from statictext within w_httpclient_amazonaws
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

type cb_1 from commandbutton within w_httpclient_amazonaws
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

type tab_1 from tab within w_httpclient_amazonaws
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
string text = "Amazon API Gateway"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_19 st_19
ddlb_1 ddlb_1
st_14 st_14
st_2 st_2
st_4 st_4
sle_date sle_date
st_date st_date
sle_authorization sle_authorization
st_authorization st_authorization
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
this.st_19=create st_19
this.ddlb_1=create ddlb_1
this.st_14=create st_14
this.st_2=create st_2
this.st_4=create st_4
this.sle_date=create sle_date
this.st_date=create st_date
this.sle_authorization=create sle_authorization
this.st_authorization=create st_authorization
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
this.Control[]={this.st_19,&
this.ddlb_1,&
this.st_14,&
this.st_2,&
this.st_4,&
this.sle_date,&
this.st_date,&
this.sle_authorization,&
this.st_authorization,&
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
destroy(this.st_19)
destroy(this.ddlb_1)
destroy(this.st_14)
destroy(this.st_2)
destroy(this.st_4)
destroy(this.sle_date)
destroy(this.st_date)
destroy(this.sle_authorization)
destroy(this.st_authorization)
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

type st_19 from statictext within tabpage_3
integer x = 2318
integer y = 304
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

type st_2 from statictext within tabpage_3
integer x = 23
integer y = 396
integer width = 3150
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "1.打开postman输入上面URL,Authorization选择AWS Signature,并在AccessKey输入上面id和SecretKey输入上面key后点Send按钮"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_3
integer x = 23
integer y = 480
integer width = 2464
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "2.查看postman的Headers获取X-Amz-Date和Authorization的value填写上面对应框，点GetToken按钮"
boolean focusrectangle = false
end type

type sle_date from singlelineedit within tabpage_3
integer x = 1824
integer y = 104
integer width = 1477
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_date from statictext within tabpage_3
integer x = 1463
integer y = 116
integer width = 315
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "X-Amz-Date:"
boolean focusrectangle = false
end type

type sle_authorization from singlelineedit within tabpage_3
integer x = 1824
integer y = 192
integer width = 1477
integer height = 84
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

type st_authorization from statictext within tabpage_3
integer x = 1463
integer y = 204
integer width = 357
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Authorization:"
boolean focusrectangle = false
end type

type sle_username from singlelineedit within tabpage_3
integer x = 279
integer y = 192
integer width = 1175
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "AKIAJYFCS5HBXOIGWCEA"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_3
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
string text = "id:"
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_3
integer x = 23
integer y = 292
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
string text = "key:"
boolean focusrectangle = false
end type

type sle_password from singlelineedit within tabpage_3
integer x = 279
integer y = 280
integer width = 1175
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "6tf/0wrPqifqSuyCdlqU1WldIzr5aPxypBN3FEhD"
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
string text = "https://hk1egzaeia.execute-api.us-east-1.amazonaws.com/appeon/pets "
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
integer x = 2944
integer y = 284
integer width = 352
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
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error,ls_auth, ls_postdata
Long 			ll_rtn, ll_Code
String 		ls_Authorization, ls_Data

Blob  lb_data
nvo_base64 luo_base64
String 	ls_user, ls_pass

lhc_Client = Create HttpClient
st_code.Text = ""
st_Text.Text = ""

ls_Url = Trim ( sle_Url.Text ) 
ls_Method = Trim ( sle_Method.Text )

//后期考虑自动加密AWS Signature
//ls_user = sle_username.Text
//ls_pass = sle_password.Text
//lb_data = Blob(ls_user + ":" + ls_pass,EncodingUTF8!)
//ls_auth = luo_base64.base64encode(lb_data)

//现在通过其他工具postman加密获取到Authorization和X-Amz-Data填写到PB对于的输入框,再获取token
ls_Authorization = Trim ( sle_Authorization.Text )
If IsNull ( ls_Authorization ) Or Trim ( ls_Authorization ) = "" Then
	MessageBox ( "Tip", "Please input Authorization!" )
	Return 
End If
ls_Data = Trim ( sle_Date.text )
If IsNull ( ls_Data ) Or Trim ( ls_Data ) = "" Then
	MessageBox ( "Tip", "Please input X-Amz-Date!" )
	Return 
End If


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

lhc_Client.SetRequestHeader ( "Authorization", ls_Authorization )
lhc_Client.SetRequestHeader ( "X-Amz-Date", ls_Data )
lhc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded" )

ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )

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

