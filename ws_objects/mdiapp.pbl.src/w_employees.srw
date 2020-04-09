$PBExportHeader$w_employees.srw
forward
global type w_employees from w_child_base
end type
type st_1 from statictext within w_employees
end type
end forward

global type w_employees from w_child_base
string tag = "employees"
integer width = 3218
integer height = 1760
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_employees w_employees

on w_employees.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_employees.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_employees
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
string text = "Employees"
alignment alignment = center!
boolean focusrectangle = false
end type

