$PBExportHeader$httpclient_autotest.sra
$PBExportComments$Generated Application Object
forward
global type httpclient_autotest from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
HttpClient 	ghc_HttpClient
str_HttpClient 	gstr_1
String 		gs_values

String gs_Post = "HttpClient Post Event Failed"
end variables

global type httpclient_autotest from application
string appname = "httpclient_autotest"
end type
global httpclient_autotest httpclient_autotest

on httpclient_autotest.create
appname="httpclient_autotest"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on httpclient_autotest.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open ( w_HttpClient )
end event

