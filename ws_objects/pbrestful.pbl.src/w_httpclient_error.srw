$PBExportHeader$w_httpclient_error.srw
forward
global type w_httpclient_error from window
end type
type mle_1 from multilineedit within w_httpclient_error
end type
type st_2 from statictext within w_httpclient_error
end type
type st_1 from statictext within w_httpclient_error
end type
type cb_2 from commandbutton within w_httpclient_error
end type
type cb_1 from commandbutton within w_httpclient_error
end type
end forward

global type w_httpclient_error from window
integer width = 2473
integer height = 1656
boolean titlebar = true
string title = "HttpClient error Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_httpclient_error w_httpclient_error

type prototypes

end prototypes

type variables
eon_appeon_resize  ieon_resize
Long 		il_count
Boolean 	ib_continue = True
Boolean ib_debug = false
string is_ip
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

on w_httpclient_error.create
this.mle_1=create mle_1
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.mle_1,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_httpclient_error.destroy
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)

is_ip = profilestring("config.ini","settings","Restful_http_PHP","") //PHP Restful
end event

event resize;ieon_resize.of_resize(this,newwidth,newheight,true)
end event

type mle_1 from multilineedit within w_httpclient_error
integer x = 18
integer y = 328
integer width = 2299
integer height = 1192
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_httpclient_error
integer x = 352
integer y = 172
integer width = 827
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

type st_1 from statictext within w_httpclient_error
integer x = 462
integer y = 64
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

type cb_2 from commandbutton within w_httpclient_error
integer x = 846
integer y = 44
integer width = 343
integer height = 100
integer taborder = 20
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

type cb_1 from commandbutton within w_httpclient_error
integer x = 59
integer y = 44
integer width = 343
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "开始"
end type

event clicked;Long	ll_cpu
String 	ls_txt, ls_Body, ls_response, ls_Request
String 	ls_txt2, ls_Body2, ls_response2, ls_Request2
Long 		ll_Code,ll_Code2, ll_rtn, ll_rtn2

ib_continue = true

Do While ( True )
	Yield()
	If Not ib_continue Then		
		Exit
	End If
	il_count ++
	
	//错误URL
	//URL指向地址不存在
	//SendRequest时中断网络
	//SendRequest时关闭IE代理
	//SendRequest时关闭访问的服务器
	//上传文件网络中断后再链接
	
	st_1.Text = "次数：" + String ( il_Count )
	ll_cpu = cpu()
	
	//ghc_Client.TimeOut = 10
	
	ghc_Client.ClearRequestHeaders()
		
	//错误URL
	ll_rtn = ghc_Client.sendrequest( "GET", "http:/ww.appeon.com" )
	ls_Request = ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( ls_Body)	
	ll_Code = ghc_Client.GetResponseStatusCode()
	ls_txt = ghc_Client.GetResponseStatusText()
	
	//URL指向地址不存在
	ll_rtn2 = ghc_Client.sendrequest( "GET", "https://www.appeon11.com" )
	ls_Request2 = ghc_Client.Getresponseheaders( )
	ghc_Client.GetResponsebody( ls_Body2)	
	ll_Code2 = ghc_Client.GetResponseStatusCode()
	ls_txt2 = ghc_Client.GetResponseStatusText()
	
	st_2.Text = "本次cpu：" + String ( cpu() - ll_cpu ) 
	
	mle_1.Text += string ( il_Count ) + "错误URL Return:" + String ( ll_rtn ) + " StatusCode:" +  String ( ll_Code ) + " StatusText:" + ls_txt + "~r~nBody:" + ls_Body +  "~r~nRequestHeader:" + ls_Request + "~r~ncpu:" + String ( cpu() - ll_cpu ) + "~r~n" + &
	 "URL指向地址不存在 Return:" + + String ( ll_rtn2 ) + " StatusCode:" +  String ( ll_Code2 ) + " StatusText:" + ls_txt2 + "~r~n Body:" + ls_Body2 +  "~r~n RequestHeader:" + ls_Request2 + "~r~ncpu:"+ String ( cpu() - ll_cpu ) +  "~r~n"
	
	//SendRequest时中断网络
	
	//SendRequest时关闭IE代理
	
	//SendRequest时关闭访问的服务器
	
	//上传文件网络中断后再链接
	
	

Loop 

end event

