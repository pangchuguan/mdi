$PBExportHeader$w_child.srw
forward
global type w_child from window
end type
type sle_1 from singlelineedit within w_child
end type
type mle_1 from multilineedit within w_child
end type
type dw_1 from datawindow within w_child
end type
type rbb_1 from ribbonbar within w_child
end type
type st_close from statictext within w_child
end type
end forward

global type w_child from window
integer width = 3081
integer height = 1828
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
mle_1 mle_1
dw_1 dw_1
rbb_1 rbb_1
st_close st_close
end type
global w_child w_child

on w_child.create
this.sle_1=create sle_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.rbb_1=create rbb_1
this.st_close=create st_close
this.Control[]={this.sle_1,&
this.mle_1,&
this.dw_1,&
this.rbb_1,&
this.st_close}
end on

on w_child.destroy
destroy(this.sle_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.rbb_1)
destroy(this.st_close)
end on

event resize;st_close.x = newwidth - st_close.width
end event

event activate;mle_1.Text += "~r~n" + "Activate..."
mle_1.scroll( mle_1.linecount( ) )
//ue_refresh_xml
parentwindow().dynamic event ue_refresh_xml() 
end event

event open;rbb_1.ImportFromXMLFile("ribbon_response.xml")
end event

event deactivate;mle_1.Text += "~r~n" + "DeActivate..."
mle_1.scroll( mle_1.linecount( ) )
end event

type sle_1 from singlelineedit within w_child
integer x = 2816
integer y = 712
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event getfocus;
mle_1.Text += "~r~n" + "sle GetFocus"
mle_1.scroll( mle_1.linecount( ) )
end event

event losefocus;
mle_1.Text += "~r~n" + "sle LoseFocus"
mle_1.scroll( mle_1.linecount( ) )
end event

type mle_1 from multilineedit within w_child
integer x = 1381
integer y = 600
integer width = 1111
integer height = 600
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type dw_1 from datawindow within w_child
integer x = 270
integer y = 616
integer width = 887
integer height = 512
integer taborder = 10
string title = "none"
string dataobject = "d_test"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;
mle_1.Text += "~r~n" + "dw GetFocus"
mle_1.scroll( mle_1.linecount( ) )

end event

event losefocus;

mle_1.Text += "~r~n" + "dw LoseFocus"
mle_1.scroll( mle_1.linecount( ) )
end event

type rbb_1 from ribbonbar within w_child
event ue_menu1 ( long itemhandle,  long index,  long subindex )
event ue_menu2 ( long itemhandle,  long index,  long subindex )
event ue_closewin ( long itemhandle1 )
integer width = 1920
integer height = 540
long backcolor = 15132390
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event ue_menu1(long itemhandle, long index, long subindex);MessageBox ("","menu1" )
end event

event ue_menu2(long itemhandle, long index, long subindex);MessageBox ("","menu2" )
end event

event ue_closewin(long itemhandle1);ribbonlargeButtonitem lr_largebutton

if rbb_1.GetItem(Itemhandle1,lr_largebutton) = 1 Then
	if lr_largebutton.text = "Close Window" Then
		close(Parent)
	End If
End If

end event

type st_close from statictext within w_child
event ue_move pbm_mousemove
integer x = 1925
integer width = 91
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "×"
alignment alignment = center!
boolean focusrectangle = false
end type

event ue_move;If xpos > 9 and ypos < 50 Then
	BackColor = RGB(255,0,0)
Else
	BackColor = 74791120
End If

end event

event clicked;Close(Parent)
end event

