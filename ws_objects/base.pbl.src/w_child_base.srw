$PBExportHeader$w_child_base.srw
forward
global type w_child_base from window
end type
end forward

global type w_child_base from window
integer width = 3218
integer height = 1760
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_child_base w_child_base

on w_child_base.create
end on

on w_child_base.destroy
end on

event activate;parentwindow().dynamic post event ue_refresh_visible() 
end event

