$PBExportHeader$w_popup.srw
forward
global type w_popup from window
end type
type rbb_1 from ribbonbar within w_popup
end type
end forward

global type w_popup from window
integer width = 4617
integer height = 1740
boolean titlebar = true
string title = "Popup"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rbb_1 rbb_1
end type
global w_popup w_popup

on w_popup.create
this.rbb_1=create rbb_1
this.Control[]={this.rbb_1}
end on

on w_popup.destroy
destroy(this.rbb_1)
end on

event open;rbb_1.ImportFromXMLFile("ribbon_response.xml")
end event

event resize;rbb_1.width = newwidth//this.workspaceWidth()
end event

type rbb_1 from ribbonbar within w_popup
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

