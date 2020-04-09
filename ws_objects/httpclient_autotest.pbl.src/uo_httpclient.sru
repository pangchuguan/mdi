$PBExportHeader$uo_httpclient.sru
forward
global type uo_httpclient from httpclient
end type
end forward

global type uo_httpclient from httpclient
event ue_trigger ( )
event ue_post ( )
event ue_triggerevent ( )
event ue_postevent ( )
end type
global uo_httpclient uo_httpclient

type variables
String is_Trigger = "HttpClient Trigger Event Failed"
String is_Post = "HttpClient Post Event Failed"
Long 	il_count = 0
end variables

event ue_trigger();is_Trigger = "HttpClient Trigger Event Success " + String ( il_count )
end event

event ue_post();is_Post = "HttpClient Post Event Success " + String ( il_count )
gs_Post = "HttpClient Post Event Success " + String ( il_count )
end event

event ue_triggerevent();
string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "ue_TriggerEvent logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
else
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "ue_TriggerEvent logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
end if

end event

event ue_postevent();string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "ue_PostEvent logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
else
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "ue_PostEvent logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
end if
end event

event constructor;
string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "PostEvent Constructor! logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
elseIf string(message.wordparm) = '100' Then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "PostEvent Constructor! logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
else
	il_count++
	gs_values = "HttpClient Constructor:" + String ( il_count )
	
//	Post 	Event ue_post()
//	Trigger Event ue_Trigger()
end if
end event

on uo_httpclient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_httpclient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;

string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "TriggerEvent Destructor! logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
elseIf string(message.wordparm) = '100' Then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "TriggerEvent Destructor! logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
else
	gs_values = "HttpClient Destructor Success"	
end if
end event

