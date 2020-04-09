$PBExportHeader$w_mdidock.srw
forward
global type w_mdidock from window
end type
type mdi_1 from mdiclient within w_mdidock
end type
type st_1 from statictext within w_mdidock
end type
type rbb_1 from ribbonbar within w_mdidock
end type
end forward

global type w_mdidock from window
integer width = 3959
integer height = 1724
boolean titlebar = true
string title = "MDI"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdidockhelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_refresh_xml ( )
mdi_1 mdi_1
st_1 st_1
rbb_1 rbb_1
end type
global w_mdidock w_mdidock

type variables
Long 		il_count, il_left_width = 700
long 	il_num = 0

String array1[50] = {"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","Del","Ins",&
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",&
				 "0","1","2","3","4","5","6","7","8","9"}
				
end variables

forward prototypes
public function string wf_getshortcut ()
public subroutine wf_setshortcut ()
end prototypes

event ue_refresh_xml();//
rbb_1.ImportFromXMLFile( "RibbonBar_Demo.xml" )
//title = "test ue_refresh_xml"
end event

public function string wf_getshortcut ();String 	ls_Shortcut
Integer 	ll_num, ll_I


il_num ++
If il_num > 400 Then
	il_num = 1
End If

If il_num <= 50 Then
	ll_num = il_num
	ls_Shortcut = array1[ll_num]
ElseIf il_num <= 100 Then
	ll_num = il_num - 50
	ls_Shortcut = "ctrl+" + array1[ll_num]
ElseIf il_num <= 150 Then
	ll_num = il_num - 100
	ls_Shortcut = "alt+" + array1[ll_num]
ElseIf il_num <= 200 Then
	ll_num = il_num - 150
	ls_Shortcut = "shift+" + array1[ll_num]
ElseIf il_num <= 250 Then
	ll_num = il_num - 200
	ls_Shortcut = "ctrl+alt+" + array1[ll_num]
ElseIf il_num <= 300 Then
	ll_num = il_num - 250
	ls_Shortcut = "ctrl+shift+" + array1[ll_num]
ElseIf il_num <= 350 Then
	ll_num = il_num - 300
	ls_Shortcut = "alt+shift+" + array1[ll_num]
ElseIf il_num <= 400 Then
	ll_num = il_num - 350
	ls_Shortcut = "ctrl+alt+shift+" + array1[ll_num]
End If

Return ls_Shortcut
end function

public subroutine wf_setshortcut ();RibbonCateGoryItem 		lr_CateGory, lr_CateGory2
RibbonPanelItem 			lr_panel, lr_panel2
RibbonLargebuttonItem  	lr_LargeButton, lr_LargeButton2
RibbonSmallButtonItem 	lr_SmallButton, lr_SmallButton2
RibbonCheckBoxItem 		lr_CheckBox, lr_CheckBox2
RibbonGroupItem 			lr_Group, lr_Group2
RibbonComboBoxItem 	lr_ComboBox, lr_ComboBox2
RibbonTabButtonItem 	lr_Tab, lr_Tab2
PowerObject				lpo_Object

RibbonApplicationButtonItem 	lr_AppButton, lr_AppButton2
RibbonApplicationMenu 	lr_AppMenu
RibbonMenuItem 	lr_MenuItem, lr_MenuItem2
RibbonMenu 	lr_Menu

Long 	ll_CateGoryCount, ll_PanelCount, ll_LargeButtonCount, ll_SmallButtonCount, ll_CheckBoxCount
Long 	ll_GroupCount, ll_ComboBoxCount, ll_SpinCount, ll_TabCount, ll_ItemCount, ll_ItemCount2
Long 	ll_i, ll_j, ll_k, ll_m,ll_n, ll_MenuCount, ll_MenuCount2, ll_o, ll_p
String 	ls_text
Integer 	li_return

il_num = 51

If Rbb_1.GetApplicationButton( lr_AppButton ) = 1 Then
	ls_text += "~r~nApplicationButton:" + lr_AppButton.Text 
	If lr_AppButton.GetMenu( lr_AppMenu ) = 1 Then
		ll_MenuCount = lr_AppMenu.GetMasterItemCount( )
		For ll_M = 1 To ll_MenuCount
			If lr_AppMenu.GetMasteritem( ll_M , lr_MenuItem) = 1 Then
				If lr_MenuItem.itemtype <> 0 Then Continue
				lr_MenuItem.ShortCut = wf_GetShortcut()
				li_return = lr_AppMenu.SetMasterItem(ll_M , lr_MenuItem  )
				ls_text += "~r~nMasterMenu SetMasterItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem.ShortCut ) + ")"
				ll_MenuCount2 = lr_AppMenu.GetMasterItemCount( ll_M)
				For ll_N = 1 To ll_MenuCount2
					If lr_AppMenu.GetMasteritem( ll_M,ll_N, lr_MenuItem2) = 1 Then
						If lr_MenuItem2.itemtype <> 0 Then Continue
						lr_MenuItem2.ShortCut = wf_GetShortcut()
						li_return = lr_AppMenu.SetMasterItem(ll_M,ll_N , lr_MenuItem2  )
						ls_text += "~r~nMasterSubMenu SetMasterItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem2.ShortCut ) + ")"
					End If
				Next
			End If
		Next
		//lr_AppButton.SetMenu(lr_AppMenu)
		ll_MenuCount = lr_AppMenu.GetRecentItemCount( )
		For ll_M = 1 To ll_MenuCount
			If lr_AppMenu.GetRecentitem( ll_M , lr_MenuItem) = 1 Then
				lr_MenuItem.ShortCut = wf_GetShortcut()
				li_return = lr_AppMenu.SetRecentItem(ll_M , lr_MenuItem  )
				ls_text += "~r~nRecentMenu SetRecentItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem.ShortCut ) + ")"
			End If
		Next
		li_return =lr_AppButton.SetMenu(lr_AppMenu)
		li_return = rbb_1.SetApplicationbutton( lr_AppButton)
	End If
End If


//TabButton
ll_TabCount = Rbb_1.GetTabbuttoncount( )
For ll_I = 1 To ll_TabCount
	If rbb_1.Gettabbuttonbyindex( ll_I, lr_Tab) = 1 Then
		lr_Tab.ShortCut = wf_GetShortcut()
		ls_text += " ~r~nReturn:"+ String (li_return) + " TabButton Set Shortcut(" + lr_Tab.ShortCut + ")"
		If Rbb_1.GetMenubybuttonhandle( lr_Tab.itemhandle, lr_Menu ) = 1 Then
			For ll_n = 1 To lr_Menu.GetItemCount( )
				If lr_Menu.Getitem( ll_n , lr_MenuItem) = 1 Then
					If lr_MenuItem.itemtype <> 0 Then Continue
					lr_MenuItem.ShortCut = wf_GetShortcut()
					li_return = lr_Menu.SetItem(ll_n , lr_MenuItem  )
					ls_text += "~r~nTabButton Menu SetItem:" + String(li_return) + " Shortcut(" + lr_MenuItem.ShortCut + ")"
					ll_MenuCount2 = lr_Menu.GetItemCount( ll_n)
					For ll_M = 1 To ll_MenuCount2
						If lr_Menu.Getitem( ll_N,ll_M, lr_MenuItem2) = 1 Then
							If lr_MenuItem2.itemtype <> 0 Then Continue
							lr_MenuItem2.ShortCut = wf_GetShortcut()
							li_return = lr_Menu.SetItem(ll_N ,ll_M, lr_MenuItem2  )
							ls_text += "~r~nTabButton Menu(" + String(ll_M) + ") SetItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem2.ShortCut ) + ")"
						End If
					Next
				End If
			Next
			lr_Tab.SetMenu( lr_Menu )
		End If
		
		lpo_Object = lr_Tab
		li_return = rbb_1.SetItem( lr_Tab.itemhandle, lpo_Object)
		
	End If
Next

If Rbb_1.GetCateGorycount( ) > 0 Then
	//CateGoryCount
	ll_CateGoryCount = Rbb_1.GetCateGorycount( )
	For ll_i =  1 To ll_CateGoryCount
		If rbb_1.getcategoryByIndex( ll_i, lr_CateGory) = 1 Then
			//PanelCount
			ll_PanelCount = rbb_1.GetChildItemcount( lr_CateGory.itemhandle )
			For ll_j = 1 To ll_PanelCount
				If rbb_1.GetChildItemByIndex( lr_CateGory.itemhandle , ll_j, lr_panel) = 1 Then
					ll_ItemCount = rbb_1.GetChildItemcount( lr_panel.itemhandle )
					For ll_m = 1 To ll_ItemCount
								li_Return = Rbb_1.GetChildItemByIndex( lr_panel.itemhandle,ll_M,lpo_Object  )
								Choose Case lpo_Object.ClassName()
									Case "ribbonsmallbuttonitem"
										lr_SmallButton = lpo_Object
										lr_SmallButton.ShortCut = wf_GetShortcut()
										ls_text += " ~r~nReturn:"+ String (li_return) + " SmallButton Set Shortcut(" + lr_SmallButton.ShortCut + ")"
										If Rbb_1.GetMenubybuttonhandle( lr_SmallButton.itemhandle, lr_Menu ) = 1 Then
											For ll_o = 1 To lr_Menu.GetItemCount( )
												If lr_Menu.Getitem( ll_o , lr_MenuItem) = 1 Then
													If lr_MenuItem.itemtype <> 0 Then Continue
													lr_MenuItem.ShortCut = wf_GetShortcut()
													li_return = lr_Menu.SetItem(ll_o , lr_MenuItem  )
													ls_text += "~r~nSmallButton Menu SetItem:" + String(li_return) + " Shortcut(" + lr_MenuItem.ShortCut + ")"
													ll_MenuCount2 = lr_Menu.GetItemCount( ll_o)
													For ll_p = 1 To ll_MenuCount2
														If lr_Menu.Getitem( ll_o,ll_p, lr_MenuItem2) = 1 Then
															If lr_MenuItem2.itemtype <> 0 Then Continue
															lr_MenuItem2.ShortCut = wf_GetShortcut()
															li_return = lr_Menu.SetItem(ll_o ,ll_p, lr_MenuItem2  )
															ls_text += "~r~nSmallButton Menu(" + String(ll_p) + ") SetItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem2.ShortCut ) + ")"
														End If
													Next
												End If
											Next
											lr_SmallButton.SetMenu( lr_Menu )
										End If
										
										lpo_Object = lr_SmallButton
										li_Return = rbb_1.SetItem( lr_SmallButton.ItemHandle, lpo_Object )
										
									Case "ribboncheckboxitem"
										lr_CheckBox = lpo_Object
										
										lr_CheckBox.ShortCut = wf_GetShortcut()
										lpo_Object = lr_CheckBox
										li_Return = rbb_1.SetItem( lr_CheckBox.ItemHandle, lpo_Object )
										If li_Return = 1 Then
											lr_CheckBox2 = lpo_Object
											ls_text += " ~r~nReturn:"+ String (li_return) + " CheckBox Set Shortcut(" + lr_CheckBox.ShortCut + ")"
										End If
									Case "ribboncomboboxitem"
										
									Case "ribbonlargebuttonitem"
										lr_LargeButton = lpo_Object
										
										lr_LargeButton.ShortCut = wf_GetShortcut()
										ls_text += " ~r~nReturn:"+ String (li_return) + " LargeButton Set Shortcut(" + lr_LargeButton.ShortCut + ")"
										If Rbb_1.GetMenubybuttonhandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
											For ll_o = 1 To lr_Menu.GetItemCount( )
												If lr_Menu.Getitem( ll_o , lr_MenuItem) = 1 Then
													If lr_MenuItem.itemtype <> 0 Then Continue
													lr_MenuItem.ShortCut = wf_GetShortcut()
													li_return = lr_Menu.SetItem(ll_o , lr_MenuItem  )
													ls_text += "~r~nSmallButton Menu SetItem:" + String(li_return) + " Shortcut(" + lr_MenuItem.ShortCut + ")"
													ll_MenuCount2 = lr_Menu.GetItemCount( ll_o)
													For ll_p = 1 To ll_MenuCount2
														If lr_Menu.Getitem( ll_o,ll_p, lr_MenuItem2) = 1 Then
															If lr_MenuItem2.itemtype <> 0 Then Continue
															lr_MenuItem2.ShortCut = wf_GetShortcut()
															li_return = lr_Menu.SetItem(ll_o ,ll_p, lr_MenuItem2  )
															ls_text += "~r~nSmallButton Menu(" + String(ll_p) + ") SetItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem2.ShortCut ) + ")"
														End If
													Next
												End If
											Next
											lr_LargeButton.SetMenu( lr_Menu )
										End If
										
										lpo_Object = lr_LargeButton
										li_Return = rbb_1.SetItem( lr_LargeButton.ItemHandle, lpo_Object )
										
									Case "ribbongroupitem"
										lr_Group = lpo_Object
										ll_ItemCount2 = rbb_1.GetChildItemcount( lr_Group.itemhandle )
										For ll_n = 1 To ll_ItemCount2
											li_Return = Rbb_1.GetChildItemByIndex( lr_Group.itemhandle,ll_n,lpo_Object  )
											Choose Case lpo_Object.ClassName()
												Case "ribbonsmallbuttonitem"
													lr_SmallButton = lpo_Object
													
													lr_SmallButton.ShortCut = wf_GetShortcut()
													ls_text += " ~r~nReturn:"+ String (li_return) + " GroupSmallButton Set Shortcut(" + lr_SmallButton.ShortCut + ")"
													If Rbb_1.GetMenubybuttonhandle( lr_SmallButton.itemhandle, lr_Menu ) = 1 Then
														For ll_o = 1 To lr_Menu.GetItemCount( )
															If lr_Menu.Getitem( ll_o , lr_MenuItem) = 1 Then
																If lr_MenuItem.itemtype <> 0 Then Continue
																lr_MenuItem.ShortCut = wf_GetShortcut()
																li_return = lr_Menu.SetItem(ll_o , lr_MenuItem  )
																ls_text += "~r~nSmallButton Menu SetItem:" + String(li_return) + " Shortcut(" + lr_MenuItem.ShortCut + ")"
																ll_MenuCount2 = lr_Menu.GetItemCount( ll_o)
																For ll_p = 1 To ll_MenuCount2
																	If lr_Menu.Getitem( ll_o,ll_p, lr_MenuItem2) = 1 Then
																		If lr_MenuItem2.itemtype <> 0 Then Continue
																		lr_MenuItem2.ShortCut = wf_GetShortcut()
																		li_return = lr_Menu.SetItem(ll_o ,ll_p, lr_MenuItem2  )
																		ls_text += "~r~nSmallButton Menu(" + String(ll_p) + ") SetItem:" + String(li_return) + " Shortcut(" + String ( lr_MenuItem2.ShortCut ) + ")"
																	End If
																Next
															End If
														Next
														lr_SmallButton.SetMenu( lr_Menu )
													End If
										
													lpo_Object = lr_SmallButton
													li_Return = rbb_1.SetItem( lr_SmallButton.ItemHandle, lpo_Object )
													
												Case "ribboncheckboxitem"
													lr_CheckBox = lpo_Object
													
													lr_CheckBox.ShortCut = wf_GetShortcut()
													lpo_Object = lr_CheckBox
													li_Return = rbb_1.SetItem( lr_CheckBox.ItemHandle, lpo_Object )
													If li_Return = 1 Then
														lr_CheckBox2 = lpo_Object
														ls_text += " ~r~nReturn:"+ String (li_return) + " GroupCheckBox Set Shortcut(" + lr_CheckBox.ShortCut + ")"
													End If
												Case "ribboncomboboxitem"
													
											End Choose
										Next //Group
								End Choose
							Next //Panel Item
				End If
			Next //Panels
		End If		
	Next //Category
End If



//mle_1.Text = ls_text
end subroutine

on w_mdidock.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.mdi_1=create mdi_1
this.st_1=create st_1
this.rbb_1=create rbb_1
this.Control[]={this.mdi_1,&
this.st_1,&
this.rbb_1}
end on

on w_mdidock.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.st_1)
destroy(this.rbb_1)
end on

event open;rbb_1.ImportFromXMLFile( "RibbonBar_Demo.xml" )



end event

event resize;
rbb_1.width = this.workspaceWidth()

st_1.y = rbb_1.height + 8
st_1.height =  this.workspaceHeight() - rbb_1.height - 20 -60

//mdi_1.move(this.workspacex() + il_left_width, this.workspacey()  + rbb_1.height + 4 - 88)
//mdi_1.resize(this.workspaceWidth() - il_left_width - 10 ,this.workspaceHeight() - rbb_1.height - 20 -60)
mdi_1.x = st_1.x + st_1.width
mdi_1.y = st_1.y
mdi_1.width = this.workspaceWidth() - st_1.width - 8
mdi_1.height = st_1.height
mdi_1.move(st_1.x + st_1.width, st_1.y)
mdi_1.resize(mdi_1.width,mdi_1.height)

SetReDraw(False)
This.arrangesheets( Layer! )
SetReDraw(True)
end event

type mdi_1 from mdiclient within w_mdidock
long BackColor=268435456
end type

type st_1 from statictext within w_mdidock
integer x = 9
integer y = 484
integer width = 681
integer height = 1032
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
boolean focusrectangle = false
end type

type rbb_1 from ribbonbar within w_mdidock
event ue_open3 ( long index )
event ue_setmini ( long index )
event ue_test ( long index )
event ue_open2 ( long index )
event ue_close ( long index )
event ue_closeall ( long index )
event ue_test2 ( long itemhandle,  long index )
event ue_menuclicked ( long itemhandle,  long index,  long subindex )
event ue_print ( long index )
event ue_test3 ( long itemhandle,  long index,  long subindex )
integer x = 5
integer y = 4
integer width = 3913
integer height = 456
long backcolor = 15132390
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event ue_open3(long index);
 Open (w_mdi2)

end event

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

Parent.SetReDraw(False)
Parent.event Resize(0,Parent.Width ,Parent.height)
Parent.arrangesheets( Layer! )
Parent.SetReDraw(True)

end event

event ue_test(long index);RibbonLargeButtonItem lr_largeButton
w_child  lw_child
w_response lw_child2
w_popup lw_child3
w_main lw_child4
window 	lw_1
If rbb_1.GetItem(index, lr_LargeButton) = 1 Then
	choose case lr_largeButton.text
		case "Order"
			opensheetasdocument ( lw_child2, parent , "response" )
		case "Task"
			opensheetasdocument ( lw_child3, parent , "popup" )
		Case "Report"
			opensheetasdocument ( lw_child4, parent , "main" )
		Case else
			opensheetasdocument ( lw_child, parent , "child" )
	End Choose
Else
	opensheetasdocument ( lw_child, parent , "child" )
End If

// il_count ++
// 
// lw_child.title = "Title:" + String (il_count)
 
end event

event ue_open2(long index);
 Open (w_response)
end event

event ue_close(long index);window w
w = parent.getfirstsheet()

If IsValid(w) Then
	Close(w)
End If
end event

event ue_closeall(long index);window lw_child
lw_child = parent.getfirstsheet()

do while IsValid(lw_child)
	Close(lw_child)
	lw_child = parent.getfirstsheet()
Loop
end event

event ue_test2(long itemhandle, long index);MessageBox("Tips", "ItemHandle:" + String ( ItemHandle ) + " ~tIndex:" + String (Index) )
end event

event ue_menuclicked(long itemhandle, long index, long subindex);MessageBox("Tips", "ItemHandle:" + String ( ItemHandle ) + " ~tIndex:" + String (Index) +&
" ~tSubIndex:" + String (SubIndex))
end event

event ue_print(long index); long Job
Job = PrintOpen( )
rbb_1.Print(Job, 500,1000)
PrintClose(Job)
end event

event ue_test3(long itemhandle, long index, long subindex);MessageBox("Tips", "ItemHandle:" + String ( ItemHandle ) + " ~tIndex:" + String (Index) +&
" ~tSubIndex:" + String (SubIndex))
end event

