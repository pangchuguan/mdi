$PBExportHeader$w_mdi.srw
forward
global type w_mdi from window
end type
type mdi_1 from mdiclient within w_mdi
end type
type dw_1 from uo_outlookbar within w_mdi
end type
type rbb_1 from ribbonbar within w_mdi
end type
end forward

global type w_mdi from window
string tag = "mdiapp.xml"
integer width = 3959
integer height = 1724
boolean titlebar = true
string title = "RibbonBar MDI"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
event ue_refresh_visible ( )
mdi_1 mdi_1
dw_1 dw_1
rbb_1 rbb_1
end type
global w_mdi w_mdi

type variables
Long 		il_count
long 	il_num = 0

String array1[50] = {"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","Del","Ins",&
				"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",&
				 "0","1","2","3","4","5","6","7","8","9"}
end variables

forward prototypes
public subroutine of_add_ribbonbar_history (string as_name, string as_picturename, string as_tag)
public subroutine of_add_ribbonbar_window (string as_name, string as_picturename, string as_tag)
public subroutine of_del_ribbonbar_window (string as_name, string as_flag)
public subroutine of_refresh_ribbonbar_window (string as_name, string as_tag)
end prototypes

event ue_postopen();
dw_1.of_AddItem("My Workspaces","Departments","bmp\Department.bmp",10,"Departments","W")
dw_1.of_AddItem("My Workspaces","Employees","bmp\employee.bmp",11,"Employees","W")
dw_1.of_AddItem("My Workspaces","Training","bmp\Training.bmp",12,"Training","W")
dw_1.of_AddItem("My Workspaces","Bom","bmp\bom.bmp",13,"Bom","W")
dw_1.of_AddItem("My Workspaces","Products","bmp\Product.bmp",14,"Products","W")
dw_1.of_AddItem("My Workspaces","Customers","bmp\Customer.bmp",15,"Customers","W")
dw_1.of_AddItem("My Workspaces","Orders","bmp\Order.bmp",16,"Orders","W")

dw_1.of_AddItem("Reports","Reports","bmp\Reports.bmp",17,"Reports","W")
dw_1.of_AddItem("Reports","Products Report","bmp\Report1.bmp",18,"Products Report","W")
dw_1.of_AddItem("Reports","Orders Report","bmp\Report2.bmp",19,"Orders Report","W")


dw_1.of_AddItem("Print","Print","bmp\print.bmp",20,"Print","W")
dw_1.of_AddItem("Print","Preview","bmp\Preview.bmp",21,"Preview","W")
dw_1.of_AddItem("Print","PrintSetup","bmp\printsetup.bmp",22,"PrintSetup","W")

//dw_1.of_AddItem("Actions","Copy","bmp\copy.bmp",23)
//dw_1.of_AddItem("Actions","Paste","bmp\Paste.bmp",24)
//dw_1.of_AddItem("Actions","Delete","bmp\delete.bmp",25)
//dw_1.of_AddItem("Actions","Cut","bmp\Cut.bmp",26)
//
//dw_1.of_AddItem("Manage","Properties","bmp\Properties.bmp",27)
//dw_1.of_AddItem("Manage","Share","bmp\share.bmp",28)
//dw_1.of_AddItem("Manage","Security","bmp\Security.bmp",29)


// Paint the DataWindow
dw_1.of_Paint()
end event

event ue_refresh_visible();
RibbonLargeButtonItem lr_LargeButton
RibbonSmallButtonItem lr_SmallButton
RibbonTabButtonItem lr_TabButton

Boolean lb_w
window w
w = getfirstsheet()

If IsValid(w) Then
	lb_w = True
	of_refresh_ribbonbar_window(w.tag, w.tag)
End If

//Find TabButtonClose
If rbb_1.getitembytag( "TabClose", lr_TabButton) = 1 Then
	If lr_TabButton.enabled <> lb_w Then
		lr_TabButton.Enabled = lb_w
		rbb_1.SetItem(lr_TabButton)
	End If
End If
//SmallButton Close
If rbb_1.getitembytag( "Close", lr_SmallButton) = 1 Then
	If lr_SmallButton.enabled <> lb_w Then
		lr_SmallButton.Enabled = lb_w
		rbb_1.SetItem(lr_SmallButton)
	End If
End If

//SmallButton Close All
If rbb_1.getitembytag( "Close All", lr_SmallButton) = 1 Then
	If lr_SmallButton.enabled <> lb_w Then
		lr_SmallButton.Enabled = lb_w
		rbb_1.SetItem(lr_SmallButton)
	End If
End If

//LargeButton Window
If rbb_1.getitembytag( "Window", lr_LargeButton) = 1 Then
	If lr_LargeButton.enabled <> lb_w Then
		lr_LargeButton.Enabled = lb_w
		rbb_1.SetItem(lr_LargeButton)
	End If
End If
end event

public subroutine of_add_ribbonbar_history (string as_name, string as_picturename, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew, lr_MenuRecentItem
RibbonApplicationButtonItem 	lr_AppButton
RibbonApplicationMenu 	lr_AppMenu

Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle
String 	ls_PictureName

ls_PictureName = as_picturename

If rbb_1.GetItemByTag( "History", lr_LargeButton ) = 1 Then
	If rbb_1.GetMenubybuttonhandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		//Find & Delete
		For ll_I = ll_Count to 1 Step -1
			li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
			If lr_MenuItem.text = as_name Then
				If Len(as_picturename) <=0 And Len(lr_MenuItem.Picturename) > 0 Then
					//GetPicturename
					ls_PictureName = lr_MenuItem.Picturename
				End If
				lr_Menu.deleteitem( ll_I )
				Exit
			End If
		Next
	End If
	//Insert First
	lr_MenuItemNew.Text = as_name
	lr_MenuItemNew.Tag = as_tag
	lr_MenuItemNew.Clicked = "ue_MenuHistoryClicked"
	lr_MenuItemNew.picturename =  ls_PictureName
	lr_Menu.InsertItemFirst( lr_MenuItemNew)
	lr_LargeButton.SetMenu(lr_Menu)
	rbb_1.SetLargeButton(lr_LargeButton.ItemHandle, lr_LargeButton)
End If	

//Insert Recent

If Rbb_1.GetApplicationButton( lr_AppButton ) = 1 Then
	If lr_AppButton.GetMenu( lr_AppMenu ) = 1 Then
		//delete >= 9  --Only 9 items can visible
		If lr_AppMenu.GetRecentItemCount() >= 9 Then
			lr_AppMenu.DeleteRecentItem(9)
		End If
		
		ll_Handle = lr_AppMenu.InsertRecentItemFirst( as_name, "ue_AppMenuRencentClicked" )
		lr_AppMenu.GetRecentitem( ll_Handle , lr_MenuItem)
		lr_MenuItem.Tag = as_tag
		lr_MenuItem.PictureName =  ls_PictureName		
		li_return = lr_AppMenu.SetRecentItem(ll_Handle , lr_MenuItem )
		lr_AppButton.SetMenu(lr_AppMenu)
		rbb_1.SetApplicationbutton( lr_AppButton)
	End If
End If

of_add_ribbonbar_window(as_name, as_PictureName, as_tag)

Event ue_Refresh_Visible()

end subroutine

public subroutine of_add_ribbonbar_window (string as_name, string as_picturename, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew
Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle
String 	ls_PictureName
Boolean 	lb_Find

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count > 0 Then
			//Find
			For ll_I = 1 To ll_Count
				li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
				If Lower(lr_MenuItem.text) = Lower(as_name) OR Lower(lr_MenuItem.tag) = Lower(as_tag) Then
					If lr_MenuItem.Checked = False Then
						lr_MenuItem.Checked = true
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
					lb_Find = True
				Else
					If lr_MenuItem.Checked Then
						lr_MenuItem.checked = false
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				End If
			Next
		End If
	End If
	If Not lb_Find Then
		//Insert Last
		lr_MenuItemNew.Text = as_name
		lr_MenuItemNew.Tag = as_tag
		lr_MenuItemNew.Checked = True
		lr_MenuItemNew.Clicked = "ue_MenuWindowClicked"
		lr_MenuItemNew.picturename =  as_picturename
		lr_Menu.InsertItemLast( lr_MenuItemNew)
	End If
	lr_LargeButton.SetMenu(lr_Menu)
	rbb_1.SetItem(lr_LargeButton)
End If



end subroutine

public subroutine of_del_ribbonbar_window (string as_name, string as_flag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return
Long 		ll_Count, ll_I

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count <= 0 Then Return
		For ll_I = ll_Count To 1 Step -1
			li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
			If Lower(lr_MenuItem.text) = Lower(as_name) Or as_flag = "all" Then
				lr_Menu.DeleteItem(ll_I)
			End If
		Next
		lr_LargeButton.SetMenu(lr_Menu)
		rbb_1.SetItem(lr_LargeButton)
	End If
End If



end subroutine

public subroutine of_refresh_ribbonbar_window (string as_name, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew
Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count > 0 Then
			//Find
			For ll_I = 1 To ll_Count
				li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
				If Lower(lr_MenuItem.text) = Lower(as_name) Or Lower(lr_MenuItem.tag) = Lower(as_tag) Then
					If lr_MenuItem.checked = False Then
						lr_MenuItem.checked = True
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				Else
					If lr_MenuItem.checked Then
						lr_MenuItem.checked = False
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				End If
			Next
			lr_LargeButton.SetMenu(lr_Menu)
			rbb_1.SetItem(lr_LargeButton)
		End If
	End If
End If



end subroutine

on w_mdi.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.mdi_1=create mdi_1
this.dw_1=create dw_1
this.rbb_1=create rbb_1
this.Control[]={this.mdi_1,&
this.dw_1,&
this.rbb_1}
end on

on w_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.dw_1)
destroy(this.rbb_1)
end on

event open;
rbb_1.ImportFromXMLFile( this.Tag )

This.Post Event ue_postopen()

Opensheet (w_WelCome, This, 1, Layered! )

end event

event resize;rbb_1.width = this.workspaceWidth()

dw_1.y = rbb_1.height + 8
dw_1.height =  this.workspaceHeight() - rbb_1.height - 20 -60 -8

mdi_1.move(dw_1.x + dw_1.width, dw_1.y)
mdi_1.resize(this.workspaceWidth() - dw_1.width - 8 ,this.workspaceHeight() - rbb_1.height - 20 -60 )

SetReDraw(False)
This.arrangesheets( Layer! )
SetReDraw(True)
end event

type mdi_1 from mdiclient within w_mdi
long BackColor=268435456
end type

type dw_1 from uo_outlookbar within w_mdi
integer x = 9
integer y = 484
integer width = 521
integer height = 1032
integer taborder = 10
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_itemclicked;call super::ue_itemclicked;RibbonLargeButtonItem lr_LargeButton

w_child  lw_child
long Job

Choose case Lower(ObjectName)
	Case "print"
		Job = PrintOpen( )
		rbb_1.Print(Job, 500,1000)
		PrintClose(Job)
	Case "printsetup"
		PrintSetup()	
	Case "employees"
		Opensheet (w_employees, Parent, 1, Layered! )
	Case "products"
		Opensheet (w_Products, Parent, 1, Layered! )
	Case "orders"
		Opensheet (w_Orders, Parent, 1, Layered! )
	Case "reports"
		Opensheet (w_Reports, Parent, 1, Layered! )
	Case "tasks"
		Opensheet (w_Tasks, Parent, 1, Layered! )
	Case "bom"
		Opensheet (w_Bom, Parent, 1, Layered! )
	Case "customers"
		Opensheet (w_Customers, Parent, 1, Layered! )
	Case "departments"
		Opensheet (w_Departments, Parent, 1, Layered! )
	Case "orders report"
		Opensheet (w_Orders_report, Parent, 1, Layered! )
	Case "products report"
		Opensheet (w_Products_report, Parent, 1, Layered! )
	Case "reports"
		Opensheet (w_reports, Parent, 1, Layered! )
	Case "training"
		Opensheet (w_training, Parent, 1, Layered! )
	Case Else
		Return
End Choose

Parent.Event ue_Refresh_Visible()

If rbb_1.GetItemByTag(objectName,lr_LargeButton) = 1 Then
	of_add_ribbonbar_history(lr_LargeButton.Text,lr_LargeButton.PictureName,lr_LargeButton.tag )
End If


 
end event

type rbb_1 from ribbonbar within w_mdi
event ue_setmini ( long index )
event ue_buttonclicked ( long itemhandle )
event ue_close ( long index )
event ue_closeall ( long index )
event ue_appmenurencentclicked ( long itemhandle,  long index )
event ue_menuclicked ( long itemhandle,  long index,  long subindex )
event ue_printclicked ( long index )
event ue_menuhistoryclicked ( long itemhandle,  long index,  long subindex )
event ue_tabbuttonhelpclicked ( long itemhandle )
event ue_menuwindowclicked ( long itemhandle,  long index,  long subindex )
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
		If lr_Tab.text = "Minimize" Then
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

event ue_buttonclicked(long itemhandle);
RibbonLargeButtonItem lr_LargeButton
RibbonSmallButtonITem lr_SmallButton
If rbb_1.GetItem( ItemHandle, lr_LargeButton ) = 1 Then
	Choose Case Lower(lr_LargeButton.Tag)
		Case "employees"
			Opensheet (w_employees, Parent, 1, Layered! )
		Case "products"
			Opensheet (w_Products, Parent, 1, Layered! )
		Case "orders"
			Opensheet (w_Orders, Parent, 1, Layered! )
		Case "reports"
			Opensheet (w_Reports, Parent, 1, Layered! )
		Case "tasks"
			Opensheet (w_Tasks, Parent, 1, Layered! )
		Case "bom"
			Opensheet (w_Bom, Parent, 1, Layered! )
		Case "customers"
			Opensheet (w_Customers, Parent, 1, Layered! )
		Case "departments"
			Opensheet (w_Departments, Parent, 1, Layered! )
		Case "orders report"
			Opensheet (w_Orders_report, Parent, 1, Layered! )
		Case "products report"
			Opensheet (w_Products_report, Parent, 1, Layered! )
		Case "training"
			Opensheet (w_training, Parent, 1, Layered! )		
		Case "controls"
			Opensheet(w_contrls, Parent, 1, layered!)
		Case Else
			Return
	End Choose
	of_add_ribbonbar_history(lr_LargeButton.Text,lr_LargeButton.PictureName,lr_LargeButton.tag )
Else
	If rbb_1.GetItem( ItemHandle, lr_SmallButton ) = 1 Then
		Choose Case Lower(lr_SmallButton.Tag)
			Case "controls"
				Opensheet(w_contrls, Parent, 1, layered!)
			Case Else
				Return
		End Choose
		of_add_ribbonbar_history(lr_SmallButton.Text,lr_SmallButton.PictureName,lr_SmallButton.tag )
	Else
		return
	End If
End If




end event

event ue_close(long index);
window w
w = parent.getfirstsheet()

If IsValid(w) Then
	of_del_ribbonbar_window(w.tag ,"")
	Close(w)
End If

w = parent.getfirstsheet()
If Not IsValid(w) Then
	Event ue_Refresh_Visible()
End If

end event

event ue_closeall(long index);window lw_child
lw_child = parent.getfirstsheet()

do while IsValid(lw_child)
	Close(lw_child)
	lw_child = parent.getfirstsheet()
Loop

of_del_ribbonbar_window("" ,"all")

Event ue_Refresh_Visible()
end event

event ue_appmenurencentclicked(long itemhandle, long index);RibbonApplicationButtonItem lr_AppButton
RibbonApplicationMenu lr_AppMenu
RibbonMenuItem lr_MenuItem

rbb_1.GetApplicationButton(lr_AppButton)
If lr_AppButton.ItemHandle = ItemHandle Then
	If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_AppMenu ) = 1 Then
		If ( lr_AppMenu.GetRecentItem(Index,lr_MenuItem) ) = 1 Then
			Choose Case Lower(lr_MenuItem.text)
				Case "employees"
					Opensheet (w_employees, Parent, 1, Layered! )
				Case "products"
					Opensheet (w_Products, Parent, 1, Layered! )
				Case "orders"
					Opensheet (w_Orders, Parent, 1, Layered! )
				Case "reports"
					Opensheet (w_Reports, Parent, 1, Layered! )
				Case "tasks"
					Opensheet (w_Tasks, Parent, 1, Layered! )
				Case "bom"
					Opensheet (w_Bom, Parent, 1, Layered! )
				Case "customers"
					Opensheet (w_Customers, Parent, 1, Layered! )
				Case "departments"
					Opensheet (w_Departments, Parent, 1, Layered! )
				Case "orders report"
					Opensheet (w_Orders_report, Parent, 1, Layered! )
				Case "products report"
					Opensheet (w_Products_report, Parent, 1, Layered! )
				Case "training"
					Opensheet (w_training, Parent, 1, Layered! )
				Case "welcome"
					Opensheet (w_welcome, Parent, 1, Layered! )
			End Choose
			of_add_ribbonbar_history(lr_MenuItem.Text,lr_MenuItem.PictureName,lr_MenuItem.tag )
		End If
	End If
End If

end event

event ue_menuclicked(long itemhandle, long index, long subindex);RibbonApplicationButtonItem lr_AppButton
RibbonApplicationMenu lr_AppMenu
RibbonMenuItem lr_MenuItem
RibbonMenu lr_Menu

rbb_1.GetApplicationButton(lr_AppButton)
If lr_AppButton.ItemHandle = ItemHandle Then
	If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_AppMenu ) = 1 Then
		If SubIndex = 0  Then
			If lr_AppMenu.GetMasterItem(Index,lr_MenuItem) = 1 Then
				Choose Case Lower(lr_MenuItem.Tag)
					Case "close"
						Post Close(Parent)
					Case "options"
						Open(w_option)
				End Choose
			End If
		Else
			If lr_AppMenu.GetMasterItem(Index,SubIndex,lr_MenuItem)  = 1 Then
				Choose Case Lower(lr_MenuItem.Tag)
					Case "about"
						Open(w_about)
					Case "helpcontents"
						Open(w_help)
					Case "account settings"
						Open(w_Account_setting)
					Case "signout"
						Open(w_SignOut)
				End Choose
			End If
		End If

	End If
End If


If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_Menu ) = 1 Then
	If SubIndex = 0 Then
		lr_Menu.GetItem(Index,lr_MenuItem)
		
	Else
		lr_Menu.GetItem(Index,SubIndex,lr_MenuItem)
		
	End If
End If
	
end event

event ue_PrintClicked(long index); long Job
Job = PrintOpen( )
rbb_1.Print(Job, 500,1000)
PrintClose(Job)
end event

event ue_menuhistoryclicked(long itemhandle, long index, long subindex);
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return

li_return = GetMenubybuttonhandle( itemhandle, lr_Menu )
If li_return = 1 Then
	If lr_Menu.Getitem( index , lr_MenuItem) = 1 Then
		Choose Case Lower(lr_MenuItem.Tag)
			Case "employees"
				Opensheet (w_employees, Parent, 1, Layered! )
			Case "products"
				Opensheet (w_Products, Parent, 1, Layered! )
			Case "orders"
				Opensheet (w_Orders, Parent, 1, Layered! )
			Case "reports"
				Opensheet (w_Reports, Parent, 1, Layered! )
			Case "tasks"
				Opensheet (w_Tasks, Parent, 1, Layered! )
			Case "bom"
				Opensheet (w_Bom, Parent, 1, Layered! )
			Case "customers"
				Opensheet (w_Customers, Parent, 1, Layered! )
			Case "departments"
				Opensheet (w_Departments, Parent, 1, Layered! )
			Case "orders report"
				Opensheet (w_Orders_report, Parent, 1, Layered! )
			Case "products report"
				Opensheet (w_Products_report, Parent, 1, Layered! )
			Case "training"
				Opensheet (w_training, Parent, 1, Layered! )
			Case "welcome"
					Opensheet (w_welcome, Parent, 1, Layered! )
		End Choose
		of_add_ribbonbar_history(lr_MenuItem.Text,lr_MenuItem.PictureName,lr_MenuItem.tag )
	End If
End If


end event

event ue_tabbuttonhelpclicked(long itemhandle);
Open(w_help)
end event

event ue_menuwindowclicked(long itemhandle, long index, long subindex);
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return

li_return = GetMenubybuttonhandle( itemhandle, lr_Menu )
If li_return = 1 Then
	If lr_Menu.Getitem( index , lr_MenuItem) = 1 Then
		Choose Case Lower(lr_MenuItem.Tag)
			Case "employees"
				w_employees.BringtoTop = true
			Case "products"
				w_Products.BringtoTop = true
			Case "orders"
				w_Orders.BringtoTop = true
			Case "reports"
				w_Reports.BringtoTop = true
			Case "tasks"
				w_Tasks.BringtoTop = true
			Case "bom"
				w_Bom.BringtoTop = true
			Case "customers"
				w_Customers.BringtoTop = true
			Case "departments"
				w_Departments.BringtoTop = true
			Case "orders report"
				w_Orders_report.BringtoTop = true
			Case "products report"
				w_Products_report.BringtoTop = true
			Case "training"
				w_training.BringtoTop = true
			Case "welcome"
				w_welcome.BringtoTop = true
		End Choose
		//of_refresh_ribbonbar_window(lr_MenuItem.Text, lr_MenuItem.tag)
	End If
End If


end event

