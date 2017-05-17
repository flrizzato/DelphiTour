EMS Custom Login Example

This example demonstrates how to implement custom login and signup endpoints.

Projects
========

CustomLoginPackage.dpk

This project registers and implements a custom EMS resource that implements custom Login and Signup endpoints.  The name of the custom resource is "CustomLogin".

CustomLoginClient.dpr

This project implements an EMS client to login, signup and delete a user.

Using these projects
====================

Open CustomLoginPackage.dpk.  Run.  This will start EMSDevServer and load CustomLoginPackage.bpl.

Open CustomLoginClient.  Run.  When the checkbox is checked the custom Login and Signup endpoints will be called instead of the standard endpoints  in the Users resource. 

The custom Login and Signup endpoints validate the user name and password against Windows users by calling WinApi.Windows.LogonUser.  So, you will need to signup with valid Windows credentials. 

Custom Login
============

There are two ways to cause EMS to execute custom login and signup methods.

1.  The TEMSProvider.LoginResource property may be set to the name of a custom resource.  This custom resource must have a methods that matches the signatures of the Users.LoginUser and Users.SignupUser endpoints.

By checking the box in CustomLoginClient, the TEMSProvider.LoginResource property is set to "CustomLogin". 

2.  The emsserver.ini may include settings to redirect Users.LoginUser and Users.SignupUser to a custom resource.  Add settings to the [Server.Redirect ] section as follows:

[Server.Redirect]
Users.SignupUser={"destination":"CustomLogin"}
Users.LoginUser={"destination":"CustomLogin"}
 


  