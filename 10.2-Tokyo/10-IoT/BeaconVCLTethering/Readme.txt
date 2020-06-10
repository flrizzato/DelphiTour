Demo workflow:

1. VCL App

First run the VCL app on Windows. The VCL app uses a custom VCL style set via Project->Options->Appearance. Ensure that the tethering manager property is set to the same option on both the VCL app and the mobile app (i.e. Network or Bluetooth on both).
If you are using Network, make sure both your Windows VCL app and mobile device are using the same Wifi network. If you are running the IDE on a VM, such as VMWare Fusion,ensure that the Network Adapter property in the Fusion settings is set to Bridged for your VM.


2. Mobile App 

Multiple beacons have been pre-defined via the Beacon component's MonitorizedRegions property. If your beacon UUID is not represented here, you can click on the documents icon in the Editing Beacon1.MonitorizedRegions dialog to add another one.

The mobile application consists of a tab control with 2 tabs. The first tab detects the beacon (if found nearby). Once detected, the label on tab 1 reflects that, and a next button is shown. Upon clicking Next, the FindWalls function is called to detect tethered apps. Once it has found the VCL app, you can click the camera button to send a photo to it. 


