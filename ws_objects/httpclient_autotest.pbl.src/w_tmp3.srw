$PBExportHeader$w_tmp3.srw
forward
global type w_tmp3 from window
end type
type mle_1 from multilineedit within w_tmp3
end type
end forward

shared variables
HttpClient 		shc_client2
end variables

global type w_tmp3 from window
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
global w_tmp3 w_tmp3

type variables

end variables

on w_tmp3.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_tmp3.destroy
destroy(this.mle_1)
end on

event open;String ls_Value, ls_output

shc_client2 = message.powerobjectparm

//使用后不销毁
shc_client2.TimeOut = 10
shc_client2.SendRequest ( "Get", "Https://www.appeon.com" )

DesTroy ( shc_client2 )
//再create好像不成功,指针失联了
//shc_client2 = Create HttpClient
//shc_client2.SetRequestHeader ( "Content-Type", "application/json;UTF-8" )


close(this)

end event

event timer;//closewithreturn(this,)
//HttpClient lhc_Client
//
//lhc_Client = Create HttpClient
//lhc_Client.SetRequestHeader ( "Content-Type", "application/json" )
//
//closewithreturn(this,lhc_Client)
end event

type mle_1 from multilineedit within w_tmp3
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

