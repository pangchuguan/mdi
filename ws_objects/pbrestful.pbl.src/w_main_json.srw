$PBExportHeader$w_main_json.srw
forward
global type w_main_json from window
end type
type st_1 from statictext within w_main_json
end type
type cb_5 from commandbutton within w_main_json
end type
type cb_4 from commandbutton within w_main_json
end type
type cb_3 from commandbutton within w_main_json
end type
type cb_2 from commandbutton within w_main_json
end type
type sle_1 from singlelineedit within w_main_json
end type
type mle_1 from multilineedit within w_main_json
end type
type cb_1 from commandbutton within w_main_json
end type
end forward

shared variables
//JsonGenerator s_bb

//JsonParser s_bbc
end variables

global type w_main_json from window
integer width = 3397
integer height = 1720
boolean titlebar = true
string title = "PBrestful test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
sle_1 sle_1
mle_1 mle_1
cb_1 cb_1
end type
global w_main_json w_main_json

type variables
Long 		il_count
string 	is_value
JsonParser inv_JsonParser
eon_appeon_resize  ieon_resize

//JsonGenerator I_bb

//JsonParser I_bbc

end variables

forward prototypes
public subroutine of_parsejson (jsonparser anv_jsonparser, long alp_handle, string as_key)
public subroutine of_parsejson2 (ref jsonparser anv_jsonparser, long alp_handle, string as_key)
end prototypes

public subroutine of_parsejson (jsonparser anv_jsonparser, long alp_handle, string as_key);//of_ParseJson(JsonParser anv_JsonParser, longptr alp_Handle)

Long 	ll_ChildCount, ll_index, llp_child, llp_root
String ls_null
JsonItemType ljit_JsonItemType

ljit_JsonItemType = anv_JsonParser.GetItemType(alp_Handle)

// 根据结点类型递归或取结点的值
if ljit_JsonItemType = JsonObjectItem! or ljit_JsonItemType = JsonArrayItem! then
	// 递归结点
	ll_ChildCount = anv_JsonParser.GetChildCount(alp_Handle)
	for ll_Index = 1 to ll_ChildCount
		llp_Child = anv_JsonParser.GetChildItem(alp_Handle, ll_Index)
		string ls_key
		ls_key = anv_JsonParser.GetChildKey(alp_Handle, ll_Index)
//		If IsNull ( ls_key ) Or Trim ( ls_key ) = "" Then
//			ls_key = "none"
//		End If		
		of_ParseJson(anv_JsonParser, llp_Child,ls_key)
	next
else // 取结点的值
	choose case ljit_JsonItemType
		case JsonStringItem!
			String ls_value 
			ls_value = anv_JsonParser.GetItemString(alp_Handle)				
			is_value = is_value + as_key + ": " + ls_value + "~r~n"
		case JsonNumberItem!
			Double ldb_value
			ldb_value = anv_JsonParser.GetItemNumber(alp_Handle)
			is_value = is_value + as_key + ": " + string ( ldb_value) + "~r~n"
		case JsonBooleanItem!
			Boolean lb_value
			lb_value = anv_JsonParser.GetItemBoolean(alp_Handle)
			is_value = is_value +as_key+ ": " + string ( lb_value) + "~r~n"
		case JsonNullItem!
			//SetNull(ls_Null)			
			is_value = is_value + as_key + ": null " + "~r~n"
	end choose
end if

end subroutine

public subroutine of_parsejson2 (ref jsonparser anv_jsonparser, long alp_handle, string as_key);//of_ParseJson(JsonParser anv_JsonParser, longptr alp_Handle)

Long 	ll_ChildCount, ll_index, llp_child, llp_root
String ls_null
JsonItemType ljit_JsonItemType
String ls_value 
Double ldb_value
Boolean lb_value

ljit_JsonItemType = anv_JsonParser.GetItemType(alp_Handle)

il_count ++ 
st_1.Text = String ( il_count )
Yield()
// 根据结点类型递归或取结点的值
if ljit_JsonItemType = JsonObjectItem! or ljit_JsonItemType = JsonArrayItem! then
	// 递归结点
	ll_ChildCount = anv_JsonParser.GetChildCount(alp_Handle)
	for ll_Index = 1 to ll_ChildCount
		llp_Child = anv_JsonParser.GetChildItem(alp_Handle, ll_Index)
		string ls_key
		ls_key = anv_JsonParser.GetChildKey(alp_Handle, ll_Index)
//		If IsNull ( ls_key ) Or Trim ( ls_key ) = "" Then
//			ls_key = "none"
//		End If		
		of_ParseJson2(anv_JsonParser, llp_Child,ls_key)
	next
else // 取结点的值
	choose case ljit_JsonItemType
		case JsonStringItem!
			
			ls_value = anv_JsonParser.GetItemString(alp_Handle)				
			is_value +=  as_key + ": " + ls_value + "~r~n"
		case JsonNumberItem!
			
			ldb_value = anv_JsonParser.GetItemNumber(alp_Handle)
			is_value += as_key + ": " + string ( ldb_value) + "~r~n"
		case JsonBooleanItem!
			
			lb_value = anv_JsonParser.GetItemBoolean(alp_Handle)
			is_value += as_key+ ": " + string ( lb_value) + "~r~n"
		case JsonNullItem!
			//SetNull(ls_Null)			
			is_value += as_key + ": null " + "~r~n"
	end choose
end if

end subroutine

on w_main_json.create
this.st_1=create st_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_1=create sle_1
this.mle_1=create mle_1
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.sle_1,&
this.mle_1,&
this.cb_1}
end on

on w_main_json.destroy
destroy(this.st_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.mle_1)
destroy(this.cb_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type st_1 from statictext within w_main_json
integer x = 1344
integer y = 424
integer width = 283
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_main_json
integer x = 1335
integer y = 308
integer width = 603
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test JsonParser file"
end type

event clicked;//JsonParser lnv_JsonParser
String ls_Error, ls_name, ls_path,ls_file
long ll_RootHandle, ll_ItemCount, ll_Row, ll_id, ll_ChildCount, ll_Index, llp_Child, ll_return
DateTime ldt_Birthday
JsonItemType ljit_JsonItemType

ll_return = getfileopenname("Select Json File",ls_path,ls_file,"*.*","All File(*.*),*.*")

if ll_return > 0 then
	
	//ls_Error = lnv_JsonParser.loadstring( '[{"id":1, "name":"evan1", "birthday":"2016-1-1"}, {"id":2, "name":"evan2", "birthday":"2015-5-1"}]')
	inv_JsonParser = Create JsonParser
	ls_Error = inv_JsonParser.loadfile(ls_path)
	if Len(ls_Error) > 0 then
		MessageBox("Error", ls_Error)
		Return
	end if
	
	mle_1.Text = ""
	is_value = ""
	
	ll_RootHandle = inv_JsonParser.GetRootItem() 
	
	ljit_JsonItemType = inv_JsonParser.GetItemType(ll_RootHandle)
	
	// 根据结点类型递归或取结点的值
	if ljit_JsonItemType = JsonObjectItem! or ljit_JsonItemType = JsonArrayItem! then
		// 递归结点
		ll_ChildCount = inv_JsonParser.GetChildCount(ll_RootHandle)
		for ll_Index = 1 to ll_ChildCount
			llp_Child = inv_JsonParser.GetChildItem(ll_RootHandle, ll_Index)
			string ls_key
			ls_key = inv_JsonParser.GetChildKey(ll_RootHandle, ll_Index)
			of_ParseJson2(inv_JsonParser, llp_Child,ls_key)
		next
	Else
		// 取结点的值
		choose case ljit_JsonItemType
			case JsonStringItem!
				String ls_value 
				ls_value = inv_JsonParser.GetItemString(ll_RootHandle)							
				is_value = is_value + " String: " + ls_value + "~r~n"
			case JsonNumberItem!
				Double ldb_value
				ldb_value = inv_JsonParser.GetItemNumber(ll_RootHandle)
				is_value = is_value + " Double: " + string ( ldb_value) + "~r~n"
			case JsonBooleanItem!
				Boolean lb_value
				lb_value = inv_JsonParser.GetItemBoolean(ll_RootHandle)
				is_value = is_value + " Boolean: " + string ( lb_value) + "~r~n"
			case JsonNullItem!
				//SetNull(ls_Null)
				is_value = is_value + " NullItem: NULL" + "~r~n"
		end choose
	End If
End If

mle_1.Text = is_value



end event

type cb_4 from commandbutton within w_main_json
integer x = 1957
integer y = 168
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;//JsonGenerator lnv_JsonGenerator[1]


//LongPtr llp_RootObject = lnv_JsonGenerator.CreateJsonObject ()

//JsonGenerator lnv_JsonArray

//LongPtr llp_RootArray = lnv_JsonArray.CreateJsonArray()
end event

type cb_3 from commandbutton within w_main_json
integer x = 1033
integer y = 160
integer width = 663
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test JsonGenerator array"
end type

event clicked;

JsonGenerator lnv_JsonArray
// 创建根结点是Object的JSON
// 创建根结点是Array的JSON
lnv_JsonArray = Create JsonGenerator
LongPtr llp_RootArray = lnv_JsonArray.CreateJsonArray()
if llp_RootArray <> -1 then
	
			
//	 增加Object子结点
	LongPtr llp_ChildObject = lnv_JsonArray.AddItemObject(llp_RootArray)
	lnv_JsonArray.AddItemNumber(llp_ChildObject, "year", 2017)
	lnv_JsonArray.AddItemDate(llp_ChildObject, "date", 2017-09-21)
	lnv_JsonArray.AddItemTime(llp_ChildObject, "time", 12:00:00)
	
	llp_ChildObject = lnv_JsonArray.AddItemObject(llp_RootArray)
	lnv_JsonArray.AddItemNumber(llp_ChildObject, "year", 2016)
	lnv_JsonArray.AddItemDate(llp_ChildObject, "date", 2016-09-21)
	lnv_JsonArray.AddItemTime(llp_ChildObject, "time", 11:00:00)
	
	// 增加Array子结点
	LongPtr llp_ChildArray = lnv_JsonArray.AddItemArray(llp_ChildObject,"abc")
	lnv_JsonArray.AddItemNumber(llp_ChildArray, 101)
	lnv_JsonArray.AddItemNumber(llp_ChildArray, 102)
	lnv_JsonArray.AddItemNumber(llp_ChildArray, 103)

	
	String ls_json
	ls_Json = lnv_JsonArray.GetJsonString()
	mle_1.Text = ls_Json

end if

//if IsValid ( lnv_JsonGenerator) then
//	String ls_json
//	ls_Json = lnv_JsonGenerator.GetJsonString()
//	
//end if

end event

type cb_2 from commandbutton within w_main_json
integer x = 485
integer y = 160
integer width = 526
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test JsonGenerator"
end type

event clicked;JsonGenerator lnv_JsonGenerator

//JsonGenerator lnv_JsonGenerator
// 创建根结点是Object的JSON
LongPtr llp_RootObject 

lnv_JsonGenerator = Create JsonGenerator

llp_RootObject = lnv_JsonGenerator.CreateJsonObject ()
if llp_RootObject <> -1 then
	
	// 增加Value子结点
	lnv_JsonGenerator.AddItemString(llp_RootObject, "string", "string")
	lnv_JsonGenerator.AddItemNumber(llp_RootObject, "long", 100)
	lnv_JsonGenerator.AddItemBoolean(llp_RootObject, "boolean", true)
	lnv_JsonGenerator.AddItemDateTime(llp_RootObject, "datetime", datetime (blob("2017-09-21 12:00:00")))
	lnv_JsonGenerator.AddItemDate(llp_RootObject, "date", today())
	lnv_JsonGenerator.AddItemTime(llp_RootObject, "time", now()) 
	lnv_JsonGenerator.AddItemBlob(llp_RootObject, "blob", blob("this is blob"))
	lnv_JsonGenerator.AddItemNull(llp_RootObject, "remark")
	

	
//	String ls_json
//	ls_Json = lnv_JsonGenerator.GetJsonString()
//	mle_1.Text = ls_Json

end if

if IsValid ( lnv_JsonGenerator) then
	String ls_json
	ls_Json = string ( lnv_JsonGenerator.GetJsonblob() )
	mle_1.Text = ls_Json
	
end if



end event

type sle_1 from singlelineedit within w_main_json
integer x = 23
integer y = 28
integer width = 3113
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "[{~"id~":1, ~"name~":~"evan1~", ~"birthday~":~"2016-10-1 12:13:14~"}, {~"id~":2, ~"name~":~"evan2~", ~"birthday~":~"2015-5-11 01:02:03~"}]"
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_main_json
integer x = 27
integer y = 276
integer width = 1271
integer height = 1264
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_main_json
integer x = 37
integer y = 152
integer width = 425
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test JsonParser"
end type

event clicked;JsonParser lnv_JsonParser
String ls_Error, ls_name
long ll_RootHandle, ll_ItemCount, ll_Row, ll_id, ll_ChildCount, ll_Index, llp_Child
DateTime ldt_Birthday
JsonItemType ljit_JsonItemType

//ls_Error = lnv_JsonParser.loadstring( '[{"id":1, "name":"evan1", "birthday":"2016-1-1"}, {"id":2, "name":"evan2", "birthday":"2015-5-1"}]')
lnv_JsonParser = Create JsonParser
ls_Error = lnv_JsonParser.loadstring(sle_1.text)
if Len(ls_Error) > 0 then
	MessageBox("Error", ls_Error)
	Return
end if

mle_1.Text = ""
is_value = ""
ll_RootHandle = lnv_JsonParser.GetRootItem() 

ljit_JsonItemType = lnv_JsonParser.GetItemType(ll_RootHandle)

// 根据结点类型递归或取结点的值
if ljit_JsonItemType = JsonObjectItem! or ljit_JsonItemType = JsonArrayItem! then
	// 递归结点
	ll_ChildCount = lnv_JsonParser.GetChildCount(ll_RootHandle)
	for ll_Index = 1 to ll_ChildCount
		llp_Child = lnv_JsonParser.GetChildItem(ll_RootHandle, ll_Index)
		string ls_key
		ls_key = lnv_JsonParser.GetChildKey(ll_RootHandle, ll_Index)
		of_ParseJson(lnv_JsonParser, llp_Child,ls_key)
	next
Else
	// 取结点的值
	choose case ljit_JsonItemType
		case JsonStringItem!
			String ls_value 
			ls_value = lnv_JsonParser.GetItemString(ll_RootHandle)							
			is_value = is_value + " String: " + ls_value + "~r~n"
		case JsonNumberItem!
			Double ldb_value
			ldb_value = lnv_JsonParser.GetItemNumber(ll_RootHandle)
			is_value = is_value + " Double: " + string ( ldb_value) + "~r~n"
		case JsonBooleanItem!
			Boolean lb_value
			lb_value = lnv_JsonParser.GetItemBoolean(ll_RootHandle)
			is_value = is_value + " Boolean: " + string ( lb_value) + "~r~n"
		case JsonNullItem!
			//SetNull(ls_Null)
			is_value = is_value + " NullItem: NULL" + "~r~n"
	end choose
End If

mle_1.Text = is_value
//of_ParseJson(lnv_JsonParser, ll_RootHandle)

//if lnv_JsonParser.GetItemType(ll_RootHandle) = JsonArrayItem! then // JsonItemType: JsonValueItem!, JsonObjectItem!, JsonArrayItem!
//	ll_ItemCount = lnv_JsonParser.GetChildCount(ll_RootHandle)	
//	for ll_Row = 1  to ll_ItemCount
//		long ll_ItemHandle
//		ll_ItemHandle = lnv_JsonParser.GetChildItem(ll_RootHandle, ll_Row)		
////		ll_Id = lnv_JsonParser.GetItemNumber(ll_ItemHandle, "id")
////		ls_Name = lnv_JsonParser.GetItemString(ll_ItemHandle, "name")
////		ldt_Birthday = lnv_JsonParser.GetItemDateTime(ll_ItemHandle, "birthday")
//		
//		ll_Id = lnv_JsonParser.GetItemNumber(ll_ItemHandle)
//		ls_Name = lnv_JsonParser.GetItemString(ll_ItemHandle)
//		ldt_Birthday = lnv_JsonParser.GetItemDateTime(ll_ItemHandle)
//		mle_1.Text = mle_1.Text + String ( ll_row ) + " Row: id=" + String ( ll_id ) + " name=" + ls_name + " birthday=" + string (ldt_Birthday,"yyyy-mm-dd hh:mm:ss"  ) + "~r~n"
//		//MessageBox ( "tip", String ( ll_id ) + "--" + ls_name + "----" + string (ldt_Birthday  )  )		
//	next
//end if

end event

