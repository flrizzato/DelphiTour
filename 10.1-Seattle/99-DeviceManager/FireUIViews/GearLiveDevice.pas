unit GearLiveDevice;

interface

implementation

uses

  system.Devices, system.Types, system.SysUtils;

const
  ViewName = 'GearLive'; // The name of the view.

{
  Add this after MobileDevices in
  %AppData%\Roaming\Embarcadero\BDS\15.0\MobileDevices.xml

  <MobileDevice>
    <Displayname>GearLive</Displayname>
    <Name>GearLive</Name>
    <DevicePlatform>3</DevicePlatform>
    <FormFactor>2</FormFactor>
    <Portrait Enabled="True" Width="213" Height="213" Top="227" Left="313" StatusbarHeight="0" StatusBarPos="0" Artwork="C:\Users\jim\Documents\Embarcadero\Studio\HelloFireUI\GearLive.png" />
    <UpsideDown Enabled="False" Width="213" Height="213" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
    <LandscapeLeft Enabled="False" Width="213" Height="213" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
    <LandscapeRight Enabled="False" Width="213" Height="213" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
  </MobileDevice>
}

initialization

  TDeviceinfo.AddDevice(TDeviceinfo.TDeviceClass.Tablet, // Identified as Tablet
    ViewName,
    // The GearLive is 320x320 phyiscal and 213x213 logical with 240 PPI
    // Just like the Android Wear emulator
    TSize.Create(320, 320), TSize.Create(213, 213), // MinPhysicalSize(max, min), MinLogicalSize(max, min)
    TOSVersion.TPlatform.pfAndroid, 240, // 240, //Select the platform and the pixel density.
    True); // Exclusive

finalization

  TDeviceinfo.RemoveDevice(ViewName); // To unregister the view after unistalling the package.

end.
