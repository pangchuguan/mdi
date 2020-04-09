$PBExportHeader$w_child.srw
forward
global type w_child from window
end type
type rbb_1 from ribbonbar within w_child
end type
type st_close from statictext within w_child
end type
end forward

global type w_child from window
integer width = 2391
integer height = 1512
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rbb_1 rbb_1
st_close st_close
end type
global w_child w_child

on w_child.create
this.rbb_1=create rbb_1
this.st_close=create st_close
this.Control[]={this.rbb_1,&
this.st_close}
end on

on w_child.destroy
destroy(this.rbb_1)
destroy(this.st_close)
end on

event resize;st_close.x = newwidth - st_close.width
end event

event activate;//ue_refresh_xml
//parentwindow().dynamic event ue_refresh_xml() 
end event

event open;rbb_1.ImportFromXMLFile("ribbon_response.xml")
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

