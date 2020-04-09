$PBExportHeader$w_response.srw
forward
global type w_response from window
end type
type sle_1 from singlelineedit within w_response
end type
type mle_1 from multilineedit within w_response
end type
type dw_1 from datawindow within w_response
end type
type rbb_1 from ribbonbar within w_response
end type
end forward

global type w_response from window
integer width = 4617
integer height = 1740
boolean titlebar = true
string title = "Response"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
mle_1 mle_1
dw_1 dw_1
rbb_1 rbb_1
end type
global w_response w_response

on w_response.create
this.sle_1=create sle_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.rbb_1=create rbb_1
this.Control[]={this.sle_1,&
this.mle_1,&
this.dw_1,&
this.rbb_1}
end on

on w_response.destroy
destroy(this.sle_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.rbb_1)
end on

event open;rbb_1.ImportFromXMLFile("ribbon_response.xml")
end event

event resize;rbb_1.width = newwidth//this.workspaceWidth()
end event

event activate;mle_1.Text += "~r~n" + "Activate..."
mle_1.scroll( mle_1.linecount( ) )
parentwindow().dynamic event ue_refresh_xml() 
end event

event deactivate;mle_1.Text += "~r~n" + "DeActivate..."
mle_1.scroll( mle_1.linecount( ) )
end event

type sle_1 from singlelineedit within w_response
integer x = 2816
integer y = 712
integer width = 457
integer height = 132
integer taborder = 20
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

event losefocus;
mle_1.Text += "~r~n" + "sle LoseFocus"
mle_1.scroll( mle_1.linecount( ) )
end event

event getfocus;
mle_1.Text += "~r~n" + "sle GetFocus"
mle_1.scroll( mle_1.linecount( ) )
end event

type mle_1 from multilineedit within w_response
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

type dw_1 from datawindow within w_response
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

type rbb_1 from ribbonbar within w_response
event ue_closewin ( long itemhandle1 )
event ue_test ( long index )
event ue_menu1 ( long itemhandle,  long index,  long subindex )
event ue_menu2 ( long itemhandle,  long index,  long subindex )
integer width = 4603
integer height = 456
long backcolor = 15132390
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event ue_closewin(long itemhandle1);ribbonlargeButtonitem lr_largebutton

if rbb_1.GetItem(Itemhandle1,lr_largebutton) = 1 Then
	if lr_largebutton.text = "Close Window" Then
		close(Parent)
	End If
End If

end event

event ue_test(long index);RibbonCateGoryItem 		lr_CateGory, lr_CateGory2
RibbonPanelItem 			lr_panel, lr_panel2
RibbonLargebuttonItem  	lr_LargeButton, lr_LargeButton2
RibbonSmallButtonItem 	lr_SmallButton, lr_SmallButton2
RibbonCheckBoxItem 		lr_CheckBox, lr_CheckBox2
RibbonGroupItem 			lr_Group, lr_Group2
RibbonComboBoxItem 	lr_ComboBox, lr_ComboBox2
RibbonTabButtonItem 	lr_Tab, lr_Tab2
PowerObject				lpo_Object


if (rbb_1.GetItem(index, lpo_Object)) = 1 Then
	Choose Case lpo_Object.ClassName()
		Case "ribbonsmallbuttonitem"
			lr_SmallButton = lpo_Object
			MessageBox ( "SmallButton", lr_SmallButton.Text )
		Case "ribbonlargebuttonitem"
			lr_LargeButton = lpo_Object
			MessageBox ( "LargeButton", lr_LargeButton.Text )
		Case "ribbontabbuttonitem"
			lr_Tab = lpo_Object
			MessageBox ( "TabButton", lr_Tab.Text )
		Case "ribboncheckboxitem"
			lr_CheckBox = lpo_Object
			MessageBox ( "CheckBox", lr_CheckBox.Text )
	End Choose
End IF


end event

event ue_menu1(long itemhandle, long index, long subindex);MessageBox ("","menu1" )
end event

event ue_menu2(long itemhandle, long index, long subindex);MessageBox ("","menu2" )
end event

