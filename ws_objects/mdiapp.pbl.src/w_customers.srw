$PBExportHeader$w_customers.srw
forward
global type w_customers from w_child_base
end type
type st_1 from statictext within w_customers
end type
end forward

global type w_customers from w_child_base
string tag = "customers"
integer width = 3218
integer height = 1760
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_customers w_customers

on w_customers.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_customers.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_customers
integer x = 695
integer y = 76
integer width = 549
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Customers"
alignment alignment = center!
boolean focusrectangle = false
end type

