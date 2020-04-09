$PBExportHeader$w_tmp.srw
forward
global type w_tmp from window
end type
type mle_1 from multilineedit within w_tmp
end type
end forward

global type w_tmp from window
integer width = 1440
integer height = 840
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
end type
global w_tmp w_tmp

type variables

end variables

on w_tmp.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_tmp.destroy
destroy(this.mle_1)
end on

event open;HttpClient lhc_Client
String ls_Value, ls_output

lhc_Client = message.powerobjectparm

If IsValid ( lhc_Client ) Then
	ls_Value = lhc_Client.GetRequestHeader("Accept")
	Destroy ( lhc_Client )
Else
	ls_Value = "none"
End If

ls_output = '"Accept":"' + ls_Value + '"'
//mle_1.text = "{"+ls_output+"}"
gs_values = ls_Value

//closewithreturn(this)

lhc_Client = Create HttpClient
lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )

closewithreturn(this,lhc_Client)

end event

event timer;//closewithreturn(this,)
//HttpClient lhc_Client
//
//lhc_Client = Create HttpClient
//lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
//
//closewithreturn(this,lhc_Client)
end event

type mle_1 from multilineedit within w_tmp
integer x = 18
integer y = 28
integer width = 1394
integer height = 524
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

