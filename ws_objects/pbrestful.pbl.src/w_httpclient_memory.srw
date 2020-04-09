$PBExportHeader$w_httpclient_memory.srw
forward
global type w_httpclient_memory from window
end type
type tab_1 from tab within w_httpclient_memory
end type
type tabpage_1 from userobject within tab_1
end type
type st_7 from statictext within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type cbx_3 from checkbox within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_7 st_7
cbx_1 cbx_1
cbx_3 cbx_3
st_2 st_2
cb_2 cb_2
st_1 st_1
cb_1 cb_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_10 from commandbutton within tabpage_2
end type
type cb_9 from commandbutton within tabpage_2
end type
type cb_8 from commandbutton within tabpage_2
end type
type cb_7 from commandbutton within tabpage_2
end type
type st_8 from statictext within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type hpb_1 from hprogressbar within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
st_8 st_8
st_6 st_6
cb_3 cb_3
hpb_1 hpb_1
st_3 st_3
cb_4 cb_4
end type
type tabpage_3 from userobject within tab_1
end type
type st_9 from statictext within tabpage_3
end type
type cb_5 from commandbutton within tabpage_3
end type
type cb_6 from commandbutton within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_9 st_9
cb_5 cb_5
cb_6 cb_6
st_4 st_4
st_5 st_5
end type
type tab_1 from tab within w_httpclient_memory
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_httpclient_memory from window
integer width = 2162
integer height = 1288
boolean titlebar = true
string title = "HttpClient Memory Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_httpclient_memory w_httpclient_memory

type prototypes

end prototypes

type variables
eon_appeon_resize  ieon_resize
Long 		il_count
Boolean 	ib_continue = True, ib_download = false
string is_ip
HttpClient  ihc_client
end variables

forward prototypes
public function string wf_gettimestamp ()
public function string wf_getrandom ()
end prototypes

public function string wf_gettimestamp ();Long 		ll_days, ll_Seconds, ll_microsecond
Double 	ll_Stamp
Date 		ld_Today
Time 		lt_Now

ld_Today = Today()
ll_days = DaysAfter ( Date(1970,1,1), ld_Today )

lt_Now = Now()
ll_Seconds = SecondsAfter ( Time ( 8,0,0 ), lt_Now )

ll_Stamp = ll_days * 24 * 60 * 60 + ll_Seconds


Return String ( ll_Stamp ) + Left ( String ( lt_now, "ffffff" ), 3 )
end function

public function string wf_getrandom ();Long 		ll_Random

ll_Random = Rand(32767)

Return String ( ll_Random )
end function

on w_httpclient_memory.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_httpclient_memory.destroy
destroy(this.tab_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)

is_ip = profilestring("config.ini","settings","Restful_http_PHP","") //PHP Restful
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type tab_1 from tab within w_httpclient_memory
integer y = 12
integer width = 2048
integer height = 992
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 2011
integer height = 872
long backcolor = 67108864
string text = "Global test"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_7 st_7
cbx_1 cbx_1
cbx_3 cbx_3
st_2 st_2
cb_2 cb_2
st_1 st_1
cb_1 cb_1
end type

on tabpage_1.create
this.st_7=create st_7
this.cbx_1=create cbx_1
this.cbx_3=create cbx_3
this.st_2=create st_2
this.cb_2=create cb_2
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.st_7,&
this.cbx_1,&
this.cbx_3,&
this.st_2,&
this.cb_2,&
this.st_1,&
this.cb_1}
end on

on tabpage_1.destroy
destroy(this.st_7)
destroy(this.cbx_1)
destroy(this.cbx_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.cb_1)
end on

type st_7 from statictext within tabpage_1
integer x = 37
integer y = 576
integer width = 1010
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "通过任务管理器，查看Memory和GDI情况"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within tabpage_1
integer x = 87
integer y = 80
integer width = 430
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "AutoReadData"
boolean checked = true
end type

type cbx_3 from checkbox within tabpage_1
integer x = 594
integer y = 68
integer width = 274
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "log"
end type

type st_2 from statictext within tabpage_1
integer x = 453
integer y = 284
integer width = 1143
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "本次cpu:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within tabpage_1
integer x = 777
integer y = 164
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "停止"
end type

event clicked;ib_continue = False
end event

type st_1 from statictext within tabpage_1
integer x = 462
integer y = 188
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "次数：0"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_1
integer x = 73
integer y = 164
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "开始"
end type

event clicked;Long	ll_i, ll_cpu,li_FileNum


ib_continue = true

ghc_Client.ClearRequestHeaders()
ghc_Client.SetRequestHeader ( "Content-Type", "application/json" )

li_FileNum = FileOpen("log.txt",LineMode!, Write!, LockWrite!, Append!, EncodingUtf8!)
Do While ( True )
	Yield()
	If Not ib_continue Then		
		Exit
	End If
	il_count ++
	
	st_1.Text = "次数：" + String ( il_Count )
	ll_cpu = cpu()
	
	String 	ls_txt, ls_Body, ls_response
	Blob 		lb_data, lb_temp
	Long 		ll_Code, ll_loop, ll_rtn

	ghc_Client.TimeOut = 10
	If cbx_1.Checked = true Then
		ghc_Client.autoreaddata = true
	Else
		ghc_Client.autoreaddata = false
	End If
	ghc_Client.ClearRequestHeaders()
	ghc_Client.SetRequestHeader ( "Content-Type", "application/json" )
	ghc_Client.SetRequestHeader ( "Pragma", "no-cache" )
	ghc_Client.SetRequestHeader ( "User-Agent", "Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko" )
	
	//appeon web
	ghc_Client.sendrequest( "GET", "https://www.appeon.com" )
	ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( ls_Body)	
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
	//login
	ghc_Client.sendrequest( "GET", "https://www.appeon.com/user/login?destination=node/252" )
	ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( ls_Body)	
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
//	//getemployees
//	ghc_Client.sendrequest( "GET", "http://webapi.appeon.com/employee/getemployees" )
//	ghc_Client.Getresponseheaders( )
//	ghc_Client.GetResponsebody( ls_Body)	
//	ll_Code = ghc_Client.GetResponseStatusCode()
//	ls_txt = ghc_Client.GetResponseStatusText()
	
//	st_2.Text = String ( ll_Code  ) + " " + ls_txt
	
	//getemployees https
	ghc_Client.sendrequest( "GET", is_ip + "/restful/array.php" )
	ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( ls_Body)	
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
	//st_2.Text = String ( ll_Code  ) + " " + ls_txt
	
	//get jpg	
	ll_rtn = ghc_Client.sendrequest( "GET", is_ip + "/restful/login_btn.jpg" )
	ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( lb_data)	
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
	If cbx_3.Checked = true Then
		FileWriteEx(li_FileNum, String (il_Count) +"次" +String ( now() ) +  "SendRequest begin")
	End If
	
	//get bmp
	ll_rtn = ghc_Client.sendrequest( "GET", is_ip + "/restful/pic3m.bmp" )
	
	ls_response = ghc_Client.Getresponseheaders( )
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
	If cbx_3.Checked = true Then
		FileWriteEx(li_FileNum, String (il_Count) +"次" +String ( now() ) + "ReadData begin")
	End If
	
	ll_loop = 1024 * 1000
	Do While ( ll_rtn = 1 )
		ll_rtn = ghc_Client.ReadData( lb_temp, ll_loop)			
		lb_data =  lb_data + lb_temp	
		//Yield()
	Loop
	
	st_2.Text = "本次cpu：" + String ( cpu() - ll_cpu ) + "  size:" + String (Len (lb_data) )
	
	lb_data = Blob ("" )
	lb_temp = Blob ("")
	ls_Body = ""
	ls_response = ""
	ll_Code = 0
	ls_txt = ""

Loop 

FileClose(li_FileNum)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 2011
integer height = 872
long backcolor = 67108864
string text = "download file test"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
st_8 st_8
st_6 st_6
cb_3 cb_3
hpb_1 hpb_1
st_3 st_3
cb_4 cb_4
end type

on tabpage_2.create
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.st_8=create st_8
this.st_6=create st_6
this.cb_3=create cb_3
this.hpb_1=create hpb_1
this.st_3=create st_3
this.cb_4=create cb_4
this.Control[]={this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.st_8,&
this.st_6,&
this.cb_3,&
this.hpb_1,&
this.st_3,&
this.cb_4}
end on

on tabpage_2.destroy
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.st_8)
destroy(this.st_6)
destroy(this.cb_3)
destroy(this.hpb_1)
destroy(this.st_3)
destroy(this.cb_4)
end on

type cb_10 from commandbutton within tabpage_2
integer x = 1179
integer y = 44
integer width = 718
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "内网(157M) ResponseBody"
end type

event clicked;Long	ll_cpu,li_FileNum,ll_rtn, ll_loop, flen,  ll_num, ll_postition, ll_Length, ll_Count
Blob lb_temp
String ls_txt,ls_response, ls_Length, ls_url
HttpClient 	lhc_client

lhc_client = Create HttpClient
ib_continue = False

ls_url  = is_ip + "/restful/test157.zip"
//获取文件的大小
ll_rtn = lhc_client.sendrequest( "HEAD", ls_url )
ls_response = lhc_client.GetResponseHeaders()
ls_Length = lhc_client.GetResponseHeader( "Content-Length" )
ll_Length = Long ( ls_Length )
hpb_1.maxposition = ll_Length / 1000
hpb_1.position = 0

ll_cpu = cpu()

ib_download = True//开始标记
st_3.Text = "Please wait... Total:" + ls_Length
ll_rtn = lhc_client.sendrequest( "GET", ls_url )

If ll_rtn = 1 Then // download success
	ll_rtn = lhc_Client.GetResponseBody(lb_temp)
	ll_num = FileOpen("download5.zip", StreamMode!, Write!, LockWrite!, Replace!)	
	FileWriteEx(ll_num, lb_temp)
	FileClose(ll_Num)
	
	st_3.Text = "Download success. Total:" + String ( Len ( lb_temp ) )
Else //download failed
	st_3.Text = "Download failed!"
End If

lb_temp = Blob ( "" )

st_6.Text = "本次cpu：" + String ( (cpu() - ll_cpu) )

ib_download = false //结束标记


end event

type cb_9 from commandbutton within tabpage_2
integer x = 1426
integer y = 324
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "终止"
end type

event clicked;ib_download = false
end event

type cb_8 from commandbutton within tabpage_2
integer x = 626
integer y = 164
integer width = 530
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "内网测试(3.18G)"
end type

event clicked;Long	ll_cpu,li_FileNum,ll_rtn, ll_loop, flen,  ll_num, ll_postition, ll_len
dec{0}  ll_Count, ll_Length
Blob lb_temp
String ls_txt,ls_response, ls_Length, ls_url

ib_continue = False

ghc_Client.ClearRequestHeaders()
ls_url  = is_ip + "/restful/APB2016EBF1128X32WINAP001.zip"
//获取文件的大小
ll_rtn = ghc_Client.sendrequest( "HEAD", ls_url )
ls_response = ghc_Client.GetResponseHeaders()
ls_Length = ghc_Client.GetResponseHeader( "Content-Length" )
ll_Length = dec ( ls_Length )
ll_len = Long ( ll_Length / 10000 )
hpb_1.maxposition = 10000
hpb_1.position = 0

ll_cpu = cpu()

ib_download = True//开始标记

ghc_Client.autoreaddata = false
ll_rtn = ghc_Client.sendrequest( "GET", ls_url )
ll_loop = 1024 * 10000
//直接写到文件中
ll_num = FileOpen("download4.zip", StreamMode!, Write!, LockWrite!, Replace!)	
Do While ( ll_rtn = 1 )
	lb_temp = Blob ( "" )
	ll_rtn = ghc_Client.ReadData( lb_temp, ll_loop)	
	FileWrite(ll_num, lb_temp)
	ll_Count  += Len ( lb_temp )
	hpb_1.position = Long ( ll_Count/ll_len)		
	st_3.Text = "下载进度:" + String (  ll_Count  ) + "/" + ls_Length
	yield()
	If Not ib_download Then Exit
Loop

st_6.Text = "本次cpu：" + String ( (cpu() - ll_cpu) )

FileClose(ll_Num)

lb_temp = Blob ("")

ib_download = false //结束标记
end event

type cb_7 from commandbutton within tabpage_2
integer x = 626
integer y = 44
integer width = 530
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "内网测试(157M)"
end type

event clicked;Long	ll_cpu,li_FileNum,ll_rtn, ll_loop, flen,  ll_num, ll_postition, ll_Length, ll_Count
Blob lb_temp
String ls_txt,ls_response, ls_Length, ls_url

ib_continue = False

ghc_Client.ClearRequestHeaders()
ls_url  = is_ip + "/restful/PWRBLDR126000P371000192.zip"
//获取文件的大小
ll_rtn = ghc_Client.sendrequest( "HEAD", ls_url )
ls_response = ghc_Client.GetResponseHeaders()
ls_Length = ghc_Client.GetResponseHeader( "Content-Length" )
ll_Length = Long ( ls_Length )
hpb_1.maxposition = ll_Length / 10000
hpb_1.position = 0

ll_cpu = cpu()

ib_download = True//开始标记

ghc_Client.autoreaddata = false
ll_rtn = ghc_Client.sendrequest( "GET", ls_url )
ll_loop = 1024 * 10000
//直接写到文件中
ll_num = FileOpen("download3.zip", StreamMode!, Write!, LockWrite!, Replace!)	
Do While ( ll_rtn = 1 )
	lb_temp = Blob ( "" )
	ll_rtn = ghc_Client.ReadData( lb_temp, ll_loop)	
	FileWrite(ll_num, lb_temp)
	ll_Count  += Len ( lb_temp )
	hpb_1.position = ( ll_Count/10000)		
	st_3.Text = "下载进度:" + String (  ll_Count  ) + "/" + ls_Length
	yield()
	If Not ib_download Then Exit
Loop

st_6.Text = "本次cpu：" + String ( (cpu() - ll_cpu) )

FileClose(ll_Num)

lb_temp = Blob ("")

ib_download = false //结束标记


end event

type st_8 from statictext within tabpage_2
integer x = 37
integer y = 576
integer width = 1010
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "通过任务管理器，查看Memory和GDI情况"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_2
integer x = 133
integer y = 488
integer width = 859
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "cou:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within tabpage_2
integer x = 78
integer y = 44
integer width = 530
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "外网测试(42.7M)"
end type

event clicked;Long	ll_cpu,li_FileNum,ll_rtn, ll_loop, flen,  ll_num, ll_postition, ll_Length, ll_Count
Blob lb_temp
String ls_txt,ls_response, ls_Length

ib_continue = False

ghc_Client.ClearRequestHeaders()
String ls_url  = "http://download.appeon.com/APB/2017/ga/APB-2017-DOC-AP-001.zip"
//获取文件的大小
ll_rtn = ghc_Client.sendrequest( "HEAD", ls_url )
ls_response = ghc_Client.GetResponseHeaders()
ls_Length = ghc_Client.GetResponseHeader( "Content-Length" )
ll_Length = Long ( ls_Length )
hpb_1.maxposition = ll_Length / 10000
hpb_1.position = 0

ll_cpu = cpu()

ib_download = True//开始标记

ghc_Client.autoreaddata = false
ll_rtn = ghc_Client.sendrequest( "GET", ls_url )
ll_loop = 1024 * 10000
//直接写到文件中
ll_num = FileOpen("download1.zip", StreamMode!, Write!, LockWrite!, Replace!)	
Do While ( ll_rtn = 1 )
	lb_temp = Blob ( "" )
	ll_rtn = ghc_Client.ReadData( lb_temp, ll_loop)	
	FileWrite(ll_num, lb_temp)
	ll_Count  += Len ( lb_temp )
	hpb_1.position = ( ll_Count/10000)		
	st_3.Text = "下载进度:" + String (  ll_Count  ) + "/" + ls_Length
	yield()
	If Not ib_download Then Exit
Loop

st_6.Text = "本次cpu：" + String ( (cpu() - ll_cpu) )

FileClose(ll_Num)

lb_temp = Blob ("")

ib_download = false //结束标记


end event

type hpb_1 from hprogressbar within tabpage_2
integer x = 128
integer y = 340
integer width = 1202
integer height = 68
unsignedinteger maxposition = 44792
unsignedinteger position = 1
integer setstep = 1
end type

type st_3 from statictext within tabpage_2
integer x = 128
integer y = 412
integer width = 1486
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "下载进度:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_2
integer x = 78
integer y = 164
integer width = 530
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "外网测试(2.3G )"
end type

event clicked;Long	ll_cpu,li_FileNum,ll_rtn, ll_loop, flen,  ll_num, ll_postition, ll_len
dec{0} ll_Count,ll_Length
Blob lb_temp
String ls_txt,ls_response, ls_Length

ib_continue = False

ghc_Client.ClearRequestHeaders()
String ls_url  = "http://download.appeon.com/APB/2016/ebf/build_1128.00/unix/APB-2016-EBF1128-UNX-AP-001.zip"
//获取文件的大小
ll_rtn = ghc_Client.sendrequest( "HEAD", ls_url )
ls_response = ghc_Client.GetResponseHeaders()
ls_Length = ghc_Client.GetResponseHeader( "Content-Length" )
ll_Length = dec ( ls_Length )
ll_len = Long ( ll_Length / 10000 )
hpb_1.maxposition = 10000
hpb_1.position = 0

ll_cpu = cpu()

ib_download = True//开始标记

ghc_Client.autoreaddata = false
ll_rtn = ghc_Client.sendrequest( "GET", ls_url )
ll_loop = 1024 * 10000
//直接写到文件中
ll_num = FileOpen("download2.zip", StreamMode!, Write!, LockWrite!, Replace!)	
Do While ( ll_rtn = 1 )
	lb_temp = Blob ( "" )
	ll_rtn = ghc_Client.ReadData( lb_temp, ll_loop)	
	FileWrite(ll_num, lb_temp)
	ll_Count  += Len ( lb_temp )
	hpb_1.position = Long( ll_Count/ll_len)		
	st_3.Text = "下载进度:" + String (  ll_Count  ) + "/" + ls_Length
	yield()
	If Not ib_download Then Exit
Loop

st_6.Text = "本次cpu：" + String ( (cpu() - ll_cpu) )

FileClose(ll_Num)

lb_temp = Blob ("")

ib_download = false //结束标记


end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 2011
integer height = 872
long backcolor = 67108864
string text = "Instance & local test"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_9 st_9
cb_5 cb_5
cb_6 cb_6
st_4 st_4
st_5 st_5
end type

on tabpage_3.create
this.st_9=create st_9
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_4=create st_4
this.st_5=create st_5
this.Control[]={this.st_9,&
this.cb_5,&
this.cb_6,&
this.st_4,&
this.st_5}
end on

on tabpage_3.destroy
destroy(this.st_9)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_4)
destroy(this.st_5)
end on

type st_9 from statictext within tabpage_3
integer x = 37
integer y = 576
integer width = 1010
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "通过任务管理器，查看Memory和GDI情况"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within tabpage_3
integer x = 50
integer y = 140
integer width = 590
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "临时变量循环100(1M)"
end type

event clicked;HttpClient 	lhc_Client
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn,ll_Code, ll_cpu, ll_I

For ll_I = 1 To 100 

	lhc_Client = Create HttpClient	
	
	ls_Url = is_ip + "/restful/array.php" 
	ls_Method = "GET"	
	lhc_Client.timeout = 0	
	ll_cpu = cpu()
	ll_rtn = lhc_Client.sendrequest( ls_Method, ls_Url )
	st_4.Text = "次数:" + String ( ll_I ) +" cpu:" + String ( cpu() - ll_cpu )
	Destroy ( lhc_Client)
	yield()
Next
end event

type cb_6 from commandbutton within tabpage_3
integer x = 50
integer y = 240
integer width = 590
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "实例变量循环100(1M)"
end type

event clicked;
String 		ls_Url, ls_id, ls_Method, ls_Body, ls_Respose, ls_txt, ls_Error
Long 			ll_rtn,ll_Code, ll_cpu, ll_I

For ll_I = 1 To 100 
	If Not IsValid ( ihc_client ) Then
		ihc_client = Create HttpClient
	End If
		
	ls_Url = is_ip + "/restful/array.php" 
	ls_Method = "GET"	
	ihc_client.timeout = 0	
	ll_cpu = cpu()
	ll_rtn = ihc_client.sendrequest( ls_Method, ls_Url )
	st_5.Text = "次数:" + String ( ll_I ) +" cpu:" + String ( cpu() - ll_cpu )
	Destroy ( ihc_client)
	yield()
Next
end event

type st_4 from statictext within tabpage_3
integer x = 663
integer y = 152
integer width = 1024
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "本次cpu:"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_3
integer x = 663
integer y = 252
integer width = 1088
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "本次cpu:"
boolean focusrectangle = false
end type

