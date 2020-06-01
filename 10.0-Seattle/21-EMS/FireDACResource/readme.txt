
EMS FireDAc Sample

Setup
-----

Be sure that ResourceModule.FDConnection1 has a valid SQLite connection


Running the Server
-----------------

When you run the SampleEMSFireDACResourcePackage project, the EMSDevServer will start automatically. 
See Project Options/Debugger.  The "Host application" and "Parameters" settings make this work.

Running the Client
------------------

The client expects the EMSDevServer to be running at localhost:8080.  If you are running the server at a different address, modify the properties of ClientForm.EMSProvider1.

How it works
------------

SampleEMSFireDACResourcePackage is dynamically loaded by EMSDevServer.  

ResourceModuleU.pas has code to register a REST API resource.  The resource is called "test".  The resource defines a GET and a POST method.  As a test, you can invoke the GET method using the browser http://localhost:8080/test.

The client application has a TEMSProvider component.  This component identifies the address of the EMS server (http://localhost:8080).  The client application also has a TEMSFireDACClient.  This component identifies the name of a resource ("test").  EMSFireDACClient1.GetData accesses http://localhost:8080/test with HTTP GET.  EMSFireDACClient1.PostUpdates accesses http://localhost:8080/test with HTTP POST.  JSON is returned by the GET.  JSON is sent with the POST.

The TFDSchemaAdapter is able to load from JSON and save to JSON.  On the client side, TFDSchemaAdapter is responsible for loading JSON into TFDMemTables, and for saving delta packages into JSON.  On the server side, TFDSchemaAdapter is responsible for saving query result to JSON and for loading a JSON delta and applying inserts, updates and deletes to the database.  

