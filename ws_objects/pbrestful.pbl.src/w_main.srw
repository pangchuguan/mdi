$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_12 from commandbutton within w_main
end type
type cb_11 from commandbutton within w_main
end type
type cb_10 from commandbutton within w_main
end type
type cb_9 from commandbutton within w_main
end type
type cb_8 from commandbutton within w_main
end type
type cb_7 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

shared variables

end variables

global type w_main from window
integer width = 1413
integer height = 1472
boolean titlebar = true
string title = "PB HttpClient test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_main w_main

type variables

end variables

on w_main.create
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_main.destroy
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_12 from commandbutton within w_main
integer x = 398
integer y = 1076
integer width = 599
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HttpClient Cache Test"
end type

event clicked;Open ( w_httpclient_cache )
Close ( Parent )
end event

type cb_11 from commandbutton within w_main
integer x = 393
integer y = 1188
integer width = 581
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Error Test"
end type

event clicked;Open ( w_httpclient_error )
Close(parent)
end event

type cb_10 from commandbutton within w_main
integer x = 398
integer y = 964
integer width = 581
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Proxy Test"
end type

event clicked;Open ( w_httpclient_proxy )
Close ( Parent )
end event

type cb_9 from commandbutton within w_main
integer x = 398
integer y = 852
integer width = 581
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Amazon AWS"
end type

event clicked;Open ( w_httpclient_amazonaws )
Close ( Parent )
end event

type cb_8 from commandbutton within w_main
integer x = 398
integer y = 740
integer width = 581
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "PayPal"
end type

event clicked;Open ( w_httpclient_paypal )
Close ( Parent )
end event

type cb_7 from commandbutton within w_main
integer x = 398
integer y = 628
integer width = 581
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Google Map"
end type

event clicked;Open ( w_httpclient_googlemap )
Close ( Parent )
end event

type cb_6 from commandbutton within w_main
integer x = 398
integer y = 516
integer width = 581
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test Memory"
end type

event clicked;Open ( w_httpclient_memory )
Close ( Parent )
end event

type cb_5 from commandbutton within w_main
integer x = 398
integer y = 404
integer width = 581
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Appeon web"
end type

event clicked;Open(w_httpclient_appeon)
Close(parent)
end event

type cb_4 from commandbutton within w_main
integer x = 398
integer y = 292
integer width = 581
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HttpClient for Java"
end type

event clicked;open( w_httpclient_java )
Close(parent)
end event

type cb_3 from commandbutton within w_main
boolean visible = false
integer x = 87
integer y = 1180
integer width = 160
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JSON Test"
end type

event clicked;Open ( w_main_json )
Close(parent)
end event

type cb_2 from commandbutton within w_main
integer x = 398
integer y = 180
integer width = 581
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HttpClient for PHP"
end type

event clicked;open( w_HttpClient_php )
Close(parent)
end event

type cb_1 from commandbutton within w_main
integer x = 398
integer y = 68
integer width = 581
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "HttpClient for .Net"
end type

event clicked;open( w_HttpClient_net )


Close(parent)
end event

