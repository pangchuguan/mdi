$PBExportHeader$webservice.sra
$PBExportComments$Generated Application Object
forward
global type webservice from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type webservice from application
string appname = "webservice"
end type
global webservice webservice

on webservice.create
appname = "webservice"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on webservice.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

