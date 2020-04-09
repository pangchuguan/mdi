$PBExportHeader$w_httpclient_appeon.srw
forward
global type w_httpclient_appeon from window
end type
type st_19 from statictext within w_httpclient_appeon
end type
type ddlb_1 from dropdownlistbox within w_httpclient_appeon
end type
type st_16 from statictext within w_httpclient_appeon
end type
type cb_5 from commandbutton within w_httpclient_appeon
end type
type cb_4 from commandbutton within w_httpclient_appeon
end type
type cb_3 from commandbutton within w_httpclient_appeon
end type
type dw_1 from datawindow within w_httpclient_appeon
end type
type cb_2 from commandbutton within w_httpclient_appeon
end type
type st_3 from statictext within w_httpclient_appeon
end type
type cb_1 from commandbutton within w_httpclient_appeon
end type
type st_2 from statictext within w_httpclient_appeon
end type
type st_1 from statictext within w_httpclient_appeon
end type
type tb_pass from singlelineedit within w_httpclient_appeon
end type
type tb_user from singlelineedit within w_httpclient_appeon
end type
end forward

global type w_httpclient_appeon from window
integer width = 3419
integer height = 1772
boolean titlebar = true
string title = "HttpClient AppeonWeb"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_19 st_19
ddlb_1 ddlb_1
st_16 st_16
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
st_3 st_3
cb_1 cb_1
st_2 st_2
st_1 st_1
tb_pass tb_pass
tb_user tb_user
end type
global w_httpclient_appeon w_httpclient_appeon

type prototypes

end prototypes

type variables
String 	is_sign, is_cookie
eon_appeon_resize  ieon_resize

HttpClient 	ihc_Client
end variables

forward prototypes
public function string wf_gettimestamp ()
public function string wf_getrandom ()
public subroutine wf_replace (ref string as_string, string as_str1, string as_str2)
public subroutine wf_split (string as_string, string as_str1, ref string as_result[])
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

public subroutine wf_replace (ref string as_string, string as_str1, string as_str2);Long 	start_pos

start_pos = Pos(as_string, as_str1)
DO WHILE start_pos > 0		
	 as_string = Replace(as_string, start_pos, Len(as_str1), as_str2)
	start_pos = Pos(as_string, as_str1, start_pos)						
LOOP
end subroutine

public subroutine wf_split (string as_string, string as_str1, ref string as_result[]);String ls_temp[]
Long 	start_pos, ll_Count

If Not Len ( as_str1 ) > 0 Then Return 

start_pos = Pos(as_string, as_str1)

DO WHILE start_pos > 1	
	ll_Count ++
	If start_pos = 1 Then		
		ls_temp[ll_Count] = ""
		as_string = Mid ( as_string, 2 )
		start_pos = Pos(as_string, as_str1)
	Else
		ls_temp[ll_Count] = Mid ( as_string, 1, start_pos -1 )
		as_string = Mid ( as_string, start_pos + 1 )
		start_pos = Pos(as_string, as_str1)
	End If				
LOOP

If Len ( as_string ) > 0 Then
	ll_Count ++
	ls_temp[ll_Count] = as_string
End If

as_result = ls_temp

end subroutine

on w_httpclient_appeon.create
this.st_19=create st_19
this.ddlb_1=create ddlb_1
this.st_16=create st_16
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.st_3=create st_3
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.tb_pass=create tb_pass
this.tb_user=create tb_user
this.Control[]={this.st_19,&
this.ddlb_1,&
this.st_16,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.dw_1,&
this.cb_2,&
this.st_3,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.tb_pass,&
this.tb_user}
end on

on w_httpclient_appeon.destroy
destroy(this.st_19)
destroy(this.ddlb_1)
destroy(this.st_16)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.tb_pass)
destroy(this.tb_user)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)

ihc_Client = Create HttpClient
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

event close;
If IsValid ( ihc_Client ) Then DesTroy ( ihc_Client )
end event

type st_19 from statictext within w_httpclient_appeon
integer x = 1774
integer y = 200
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

type ddlb_1 from dropdownlistbox within w_httpclient_appeon
integer x = 2007
integer y = 92
integer width = 366
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

event selectionchanged;Choose Case index
	Case 1
		ihc_Client.secureprotocol = 0
	Case 2
		ihc_Client.secureprotocol = 1
	Case 3
		ihc_Client.secureprotocol = 2
	Case 4
		ihc_Client.secureprotocol = 3
	Case 5
		ihc_Client.secureprotocol = 4
	Case 6
		ihc_Client.secureprotocol = 5
	Case Else
		ihc_Client.secureprotocol = 0
End Choose
end event

type st_16 from statictext within w_httpclient_appeon
integer x = 1765
integer y = 104
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

type cb_5 from commandbutton within w_httpclient_appeon
integer x = 1083
integer y = 284
integer width = 416
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Mobile license"
end type

event clicked;Long 		ll_pos, ll_ps, ll_Row
String 	ls_Body, ls_ID, ls_Orderno, ls_Product, ls_valid, ls_type1, ls_accout, ls_activated,ls_Body2
String 	ls_array[]
		
If Len ( is_cookie ) < 5 Then
	MessageBox ( "Tip", "Not Login" )
	Return 
End If

ihc_Client.ClearRequestHeaders ()
ihc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;" )
ihc_Client.SetRequestHeader ( "Referer", "https://www.appeon.com" )
ihc_Client.SetRequestHeader ( "X-Requested-With", "XMLHttpRequest" )
ihc_Client.SetRequestHeader ( "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )
ihc_Client.SetRequestHeader ( "Host", "www.appeon.com" )
ihc_Client.SetRequestHeader ( "Cookie", is_cookie )
ihc_Client.sendrequest( "POST", "https://www.appeon.com/user/center/licensemanagement", "product=psm")
ihc_Client.GetResponsebody( ls_Body)

ll_pos = POS ( ls_Body, "data-id=" )
do while ( ll_pos > 0 )
	
	//ls_ID, 
	ls_ID = Mid ( ls_Body, ll_pos + 8, 10  )
	ls_ID = Mid ( ls_ID, pos(ls_id, '"') + 1, 10  )
	ls_ID = Mid ( ls_ID, 1, pos(ls_id, '"') -1 )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) + 6 )
	ls_Body2 = ls_Body
	ls_Body2 = Mid ( ls_Body2, Pos ( ls_Body2, "&nbsp;" ) + 6 )
	wf_replace( ls_Body2, "~r~n", "" )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "</tbody" ) )
	wf_replace( ls_Body2, "</tr>", "" )
	wf_replace( ls_Body2, " ", "" )
	
	string ls_del
	ls_del = Mid(ls_Body2, Pos(ls_Body2,"<svg"))
	ls_del = Mid(ls_del, 1, pos(ls_del, "/svg>") + 4)
	wf_replace( ls_Body2, ls_del, '' )
	wf_replace( ls_Body2, '"', '' )
	wf_replace( ls_Body2, '<td>', '' )
	wf_replace( ls_Body2, '<spanstyle=color:#E8E8E8;>', '' )
	wf_replace( ls_Body2, '</span>', '' )
	wf_replace( ls_Body2, '</td>', '|' )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "|<" ) -1 )
	
	wf_split ( ls_Body2, "|", ls_array )
	ll_ps = UpperBound ( ls_array )
	//ls_Orderno,
	If ll_ps > 0 Then
		ls_Orderno = ls_array[1]
	End if
	//ls_Product,
	If ll_ps > 1 Then
		ls_Product = ls_array[2]
	End if
	//ls_valid
	If ll_ps > 2 Then
		ls_valid = ls_array[3]
	End if
	//ls_type1
	If ll_ps > 3 Then
		ls_type1 = ls_array[4]
	End if
	//ls_accout
	If ll_ps > 4 Then
		ls_accout = ls_array[5]
	End if
	//ls_activated
	If ll_ps > 5 Then
		ls_activated = ls_array[6]
	End if
	
	ll_Row = dw_1.InsertRow ( 0 )
	dw_1.SetItem ( ll_Row, "id", ls_id )
	dw_1.SetItem ( ll_Row, "orderno", ls_Orderno )
	dw_1.SetItem ( ll_Row, "product", ls_Product )
	dw_1.SetItem ( ll_Row, "valid", ls_valid )
	dw_1.SetItem ( ll_Row, "type1", ls_type1 )
	dw_1.SetItem ( ll_Row, "account", ls_accout )
	dw_1.SetItem ( ll_Row, "activated", ls_activated )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) )
	ll_pos = POS ( ls_Body, "data-id=" )
Loop

end event

type cb_4 from commandbutton within w_httpclient_appeon
integer x = 608
integer y = 284
integer width = 416
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "IM license"
end type

event clicked;Long 		ll_pos, ll_ps, ll_Row
String 	ls_Body, ls_ID, ls_Orderno, ls_Product, ls_valid, ls_type1, ls_accout, ls_activated, ls_Body2
String 	ls_array[]


If Len ( is_cookie ) < 5 Then
	MessageBox ( "Tip", "Not Login" )
	Return 
End If

ihc_Client.ClearRequestHeaders ()
ihc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;" )
ihc_Client.SetRequestHeader ( "Referer", "https://www.appeon.com" )
ihc_Client.SetRequestHeader ( "X-Requested-With", "XMLHttpRequest" )
ihc_Client.SetRequestHeader ( "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )
ihc_Client.SetRequestHeader ( "Host", "www.appeon.com" )
ihc_Client.SetRequestHeader ( "Cookie", is_cookie )

ihc_Client.sendrequest( "POST", "https://www.appeon.com/user/center/licensemanagement", "product=im")
ihc_Client.GetResponsebody( ls_Body)

ll_pos = POS ( ls_Body, "data-id=" )
do while ( ll_pos > 0 )
	
	//ls_ID, 
	ls_ID = Mid ( ls_Body, ll_pos + 8, 10  )
	ls_ID = Mid ( ls_ID, pos(ls_id, '"') + 1, 10  )
	ls_ID = Mid ( ls_ID, 1, pos(ls_id, '"') -1 )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) + 6 )
	ls_Body2 = ls_Body
	ls_Body2 = Mid ( ls_Body2, Pos ( ls_Body2, "&nbsp;" ) + 6 )
	wf_replace( ls_Body2, "~r~n", "" )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "</tbody" ) )
	wf_replace( ls_Body2, "</tr>", "" )
	wf_replace( ls_Body2, " ", "" )
	
	string ls_del
	ls_del = Mid(ls_Body2, Pos(ls_Body2,"<svg"))
	ls_del = Mid(ls_del, 1, pos(ls_del, "/svg>") + 4)
	wf_replace( ls_Body2, ls_del, '' )
	wf_replace( ls_Body2, '"', '' )
	wf_replace( ls_Body2, '<td>', '' )
	wf_replace( ls_Body2, '<spanstyle=color:#E8E8E8;>', '' )
	wf_replace( ls_Body2, '</span>', '' )
	wf_replace( ls_Body2, '</td>', '|' )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "|<" ) -1 )
	
	wf_split ( ls_Body2, "|", ls_array )
	ll_ps = UpperBound ( ls_array )
	//ls_Orderno,
	If ll_ps > 0 Then
		ls_Orderno = ls_array[1]
	End if
	//ls_Product,
	If ll_ps > 1 Then
		ls_Product = ls_array[2]
	End if
	//ls_valid
	If ll_ps > 2 Then
		ls_valid = ls_array[3]
	End if
	//ls_type1
	If ll_ps > 3 Then
		ls_type1 = ls_array[4]
	End if
	//ls_accout
	If ll_ps > 4 Then
		ls_accout = ls_array[5]
	End if
	//ls_activated
	If ll_ps > 5 Then
		ls_activated = ls_array[6]
	End if
	
	ll_Row = dw_1.InsertRow ( 0 )
	dw_1.SetItem ( ll_Row, "id", ls_id )
	dw_1.SetItem ( ll_Row, "orderno", ls_Orderno )
	dw_1.SetItem ( ll_Row, "product", ls_Product )
	dw_1.SetItem ( ll_Row, "valid", ls_valid )
	dw_1.SetItem ( ll_Row, "type1", ls_type1 )
	dw_1.SetItem ( ll_Row, "account", ls_accout )
	dw_1.SetItem ( ll_Row, "activated", ls_activated )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) )
	ll_pos = POS ( ls_Body, "data-id=" )
Loop

end event

type cb_3 from commandbutton within w_httpclient_appeon
integer x = 2775
integer y = 1528
integer width = 457
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Logout license"
end type

event clicked;Long 		ll_Row, ll_rnt
String 	ls_Body, ls_ID
		
If Len ( is_cookie ) < 5 Then
	MessageBox ( "Tip", "Not Login" )
	Return 
End If

If Not dw_1.RowCount() > 0 Then
	MessageBox ( "Tip", "Not Row" )
	Return 
End If

ls_id = dw_1.GetItemString ( dw_1.GetRow(), "id" )

ihc_Client.ClearRequestHeaders ()
ihc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;" )
ihc_Client.SetRequestHeader ( "Referer", "https://www.appeon.com" )
ihc_Client.SetRequestHeader ( "X-Requested-With", "XMLHttpRequest" )
ihc_Client.SetRequestHeader ( "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )
ihc_Client.SetRequestHeader ( "Host", "www.appeon.com" )
ihc_Client.SetRequestHeader ( "Cookie", is_cookie )
ihc_Client.sendrequest( "POST", "https://www.appeon.com/user/center/logoutuser", "op=logout&licenseId=" + ls_id)  //op=logout&licenseId=2377
ll_rnt = ihc_Client.GetResponsebody( ls_Body)

If ll_rnt = 1 Then
	If POS ( ls_Body, 'status":200' ) > 0 Then
		MessageBox("Tip", "Logout successfully")
	Else
		MessageBox("Tip","Logout Falid")
	End If
                      
End If


end event

type dw_1 from datawindow within w_httpclient_appeon
integer x = 133
integer y = 412
integer width = 3090
integer height = 1056
integer taborder = 40
string title = "none"
string dataobject = "d_license"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_httpclient_appeon
integer x = 133
integer y = 284
integer width = 416
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "PB license"
end type

event clicked;Long 		ll_pos, ll_ps, ll_Row
String 	ls_Body, ls_ID, ls_Orderno, ls_Product, ls_valid, ls_type1, ls_accout, ls_activated, ls_Body2
String 	ls_array[]

If Len ( is_cookie ) < 5 Then
	MessageBox ( "Tip", "Not Login" )
	Return 
End If

ihc_Client.ClearRequestHeaders ()
ihc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;" )
ihc_Client.SetRequestHeader ( "Referer", "https://www.appeon.com" )
ihc_Client.SetRequestHeader ( "X-Requested-With", "XMLHttpRequest" )
ihc_Client.SetRequestHeader ( "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" )
ihc_Client.SetRequestHeader ( "Host", "www.appeon.com" )
ihc_Client.SetRequestHeader ( "Cookie", is_cookie )

ihc_Client.sendrequest( "POST", "https://www.appeon.com/user/center/licensemanagement", "product=pb")
ihc_Client.GetResponsebody( ls_Body)

ll_pos = POS ( ls_Body, "data-id=" )
do while ( ll_pos > 0 )
	
	//ls_ID, 
	ls_ID = Mid ( ls_Body, ll_pos + 8, 10  )
	ls_ID = Mid ( ls_ID, pos(ls_id, '"') + 1, 10  )
	ls_ID = Mid ( ls_ID, 1, pos(ls_id, '"') -1 )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) + 6 )
	ls_Body2 = ls_Body
	ls_Body2 = Mid ( ls_Body2, Pos ( ls_Body2, "&nbsp;" ) + 6 )
	wf_replace( ls_Body2, "~r~n", "" )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "</tbody" ) )
	wf_replace( ls_Body2, "</tr>", "" )
	wf_replace( ls_Body2, " ", "" )
	
	string ls_del
	ls_del = Mid(ls_Body2, Pos(ls_Body2,"<svg"))
	ls_del = Mid(ls_del, 1, pos(ls_del, "/svg>") + 4)
	wf_replace( ls_Body2, ls_del, '' )
	wf_replace( ls_Body2, '"', '' )
	wf_replace( ls_Body2, '<td>', '' )
	wf_replace( ls_Body2, '<spanstyle=color:#E8E8E8;>', '' )
	wf_replace( ls_Body2, '</span>', '' )
	wf_replace( ls_Body2, '</td>', '|' )
	ls_Body2 = Mid ( ls_Body2, 1, Pos ( ls_Body2, "|<" ) -1 )
	
	wf_split ( ls_Body2, "|", ls_array )
	ll_ps = UpperBound ( ls_array )
	//ls_Orderno,
	If ll_ps > 0 Then
		ls_Orderno = ls_array[1]
	End if
	//ls_Product,
	If ll_ps > 1 Then
		ls_Product = ls_array[2]
	End if
	//ls_valid
	If ll_ps > 2 Then
		ls_valid = ls_array[3]
	End if
	//ls_type1
	If ll_ps > 3 Then
		ls_type1 = ls_array[4]
	End if
	//ls_accout
	If ll_ps > 4 Then
		ls_accout = ls_array[5]
	End if
	//ls_activated
	If ll_ps > 5 Then
		ls_activated = ls_array[6]
	End if
	
	ll_Row = dw_1.InsertRow ( 0 )
	dw_1.SetItem ( ll_Row, "id", ls_id )
	dw_1.SetItem ( ll_Row, "orderno", ls_Orderno )
	dw_1.SetItem ( ll_Row, "product", ls_Product )
	dw_1.SetItem ( ll_Row, "valid", ls_valid )
	dw_1.SetItem ( ll_Row, "type1", ls_type1 )
	dw_1.SetItem ( ll_Row, "account", ls_accout )
	dw_1.SetItem ( ll_Row, "activated", ls_activated )
	
	ls_Body = Mid ( ls_Body, Pos ( ls_body, "data-id=" ) )
	ll_pos = POS ( ls_Body, "data-id=" )
Loop

end event

type st_3 from statictext within w_httpclient_appeon
integer x = 2779
integer y = 100
integer width = 457
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "未登陆"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_httpclient_appeon
integer x = 2386
integer y = 84
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Login"
end type

event clicked;String 		ls_user, ls_pass, ls_cookie, ls_url, ls_Response, ls_PostData, ls_Location
Long 			ll_rtn, ll_code


ls_user = tb_user.Text;
ls_pass = tb_pass.Text;

If IsNull ( ls_User ) Or Trim ( ls_user ) = "" Then
	MessageBox( "Tip","User is Null!");
	 return;
End If

If IsNull ( ls_pass ) Or Trim ( ls_pass ) = "" Then
	MessageBox( "Tip","Password is Null!");
	 return;
End If

ls_user = ls_User + "%40appeon.com"
///////////https://www.appeon.com/user/login?destination=node/252
ls_url = "https://www.appeon.com/user/login?destination=node/252";
//has_js=1
ihc_Client.SetRequestHeader( "has_js", "1" )
ll_rtn = ihc_Client.SendRequest( "GET", ls_Url )
If ll_rtn = 1 Then
	//ls_Response = ihc_Client.GetResponseHeaders()
	ls_cookie = ihc_Client.GetResponseHeader("Set-Cookie")
	ihc_Client.SetRequestHeader( "Set-Cookie", ls_cookie )
	//////////////////name=pangchuguan%40appeon.com&pass=appeon&remember_me=1&form_build_id=form-ccjstwJ5z42Vb67tDJuc93BAZwWMj32Ahhh7R4WP-90&form_id=user_login&op=Log+In
	ls_PostData = "name=" + ls_user + "&pass=" + ls_pass + "&remember_me=1&form_build_id=form-ccjstwJ5z42Vb67tDJuc93BAZwWMj32Ahhh7R4WP-9&form_id=user_login&op=Log+In";
	ihc_Client.SetRequestHeader ( "Content-Type", "application/x-www-form-urlencoded;" )
	ll_rtn = ihc_Client.SendRequest( "POST", ls_Url, ls_PostData)
	
	ll_code = ihc_Client.getresponsestatuscode( )
	
	If ll_code = 302 Then //203
		ls_Response = ihc_Client.GetResponseHeaders()
		ls_cookie = ihc_Client.GetResponseHeader("Set-Cookie")
		ls_Location = ihc_Client.GetResponseHeader("Location")
		
		If Len ( ls_Cookie ) > 5 Then
			is_cookie = ls_Cookie
			st_3.Text = "登陆成功!"
		Else
			st_3.Text = "登陆失败!"
		End If
		
	Else
		MessageBox ( "Error2", "URL Not Found,statuscode :" + String ( ll_code ) )
		st_3.Text = "登陆失败!"
	End If
	
	
Else
	MessageBox ( "Error", "Return :" + String ( ll_rtn ) )
	st_3.Text = "登陆失败!"
End If


end event

type st_2 from statictext within w_httpclient_appeon
integer x = 1010
integer y = 104
integer width = 165
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "密码:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_httpclient_appeon
integer x = 119
integer y = 100
integer width = 165
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "用户:"
boolean focusrectangle = false
end type

type tb_pass from singlelineedit within w_httpclient_appeon
integer x = 1184
integer y = 88
integer width = 567
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "appeon"
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type tb_user from singlelineedit within w_httpclient_appeon
integer x = 293
integer y = 88
integer width = 709
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "pangchuguan"
borderstyle borderstyle = stylelowered!
end type

