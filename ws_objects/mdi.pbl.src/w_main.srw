$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_1 from datawindow within w_main
end type
type mle_1 from multilineedit within w_main
end type
type sle_1 from singlelineedit within w_main
end type
type rbb_1 from ribbonbar within w_main
end type
end forward

global type w_main from window
integer width = 4645
integer height = 1764
boolean titlebar = true
string title = "Employee"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
mle_1 mle_1
sle_1 sle_1
rbb_1 rbb_1
end type
global w_main w_main

on w_main.create
this.dw_1=create dw_1
this.mle_1=create mle_1
this.sle_1=create sle_1
this.rbb_1=create rbb_1
this.Control[]={this.dw_1,&
this.mle_1,&
this.sle_1,&
this.rbb_1}
end on

on w_main.destroy
destroy(this.dw_1)
destroy(this.mle_1)
destroy(this.sle_1)
destroy(this.rbb_1)
end on

event open;rbb_1.ImportFromXMLFile("RibbonBar_Word.xml")
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

type dw_1 from datawindow within w_main
integer x = 270
integer y = 616
integer width = 887
integer height = 512
integer taborder = 20
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

type mle_1 from multilineedit within w_main
integer x = 1381
integer y = 600
integer width = 1111
integer height = 600
integer taborder = 10
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

type sle_1 from singlelineedit within w_main
integer x = 2816
integer y = 712
integer width = 457
integer height = 132
integer taborder = 10
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

type rbb_1 from ribbonbar within w_main
event ue_setmini ( long index )
event ue_test ( long index )
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

event ue_setmini(long index);String 	ls_path
Long 		ll_TabCount, ll_I
integer 	li_return
RibbonTabButtonItem 	lr_Tab,lr_Tab2
ls_path = "png\"

If rbb_1.isminimized( ) Then
	rbb_1.setminimized( false)
	ls_path = ls_path + "up.png"
Else
	rbb_1.setminimized( true)
	ls_path = ls_path + "down.png"
End If


ll_TabCount = Rbb_1.GetTabbuttoncount( )
For ll_I = 1 To ll_TabCount
	If rbb_1.Gettabbuttonbyindex( ll_I, lr_Tab) = 1 Then
		If lr_Tab.text = "up" Then
			lr_Tab.picturename = ls_path
			li_return = rbb_1.SetTabButton(lr_Tab.itemhandle, lr_Tab)
		End If
	End If
Next

w_mdi.event Resize(0,w_mdi.Width ,w_mdi.height)
//parent.event Resize(0,w_mdi.Width ,w_mdi.height)


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

