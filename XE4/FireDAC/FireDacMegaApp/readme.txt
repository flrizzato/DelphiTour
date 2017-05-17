To run AnyDAC Mega Demo application, you first have to setup
a connection. For that:

1) install AnyDAC
2) create AnyDAC demo database 
      http://www.da-soft.com/anydac/docu/Demo_Databases.html
3) create a connection definition for a required database
      http://www.da-soft.com/anydac/docu/Setting_up_Connections.html
      http://www.da-soft.com/anydac/docu/Defining_Connection.html
      http://www.da-soft.com/anydac/docu/Database_Connectivity.html
4) open MegaApp.dpr in Delphi IDE
5) select fMain.pas, then ADConnection1, then set 
ADConnection1.ConnectionDefName to your connection definition
6) run application