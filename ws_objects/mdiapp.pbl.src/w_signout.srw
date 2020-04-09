$PBExportHeader$w_signout.srw
forward
global type w_signout from window
end type
type cb_1 from commandbutton within w_signout
end type
type st_1 from statictext within w_signout
end type
end forward

global type w_signout from window
integer width = 1577
integer height = 1000
boolean titlebar = true
string title = "SignOut"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_1 st_1
end type
global w_signout w_signout

on w_signout.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on w_signout.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

type cb_1 from commandbutton within w_signout
integer x = 1056
integer y = 736
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
end type

event clicked;Close(Parent)
end event

type st_1 from statictext within w_signout
integer x = 421
integer y = 108
integer width = 457
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SignOut"
boolean focusrectangle = false
end type

