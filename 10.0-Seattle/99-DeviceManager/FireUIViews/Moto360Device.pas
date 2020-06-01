unit Moto360Device;

interface

implementation

uses

  system.Devices, system.Types, system.SysUtils;

const
  ViewName = 'Moto360'; // The name of the view.

{
  Add this after MobileDevices in
  %AppData%\Roaming\Embarcadero\BDS\15.0\MobileDevices.xml

  <MobileDevice>
    <Displayname>Moto360</Displayname>
    <Name>Moto360</Name>
    <DevicePlatform>3</DevicePlatform>
    <FormFactor>2</FormFactor>
    <Portrait Enabled="True" Width="240" Height="218" Top="102" Left="29" StatusbarHeight="0" StatusBarPos="0" Artwork="<Fullpath>\Moto360View\Moto360.png" />
    <UpsideDown Enabled="False" Width="240" Height="218" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
    <LandscapeLeft Enabled="False" Width="240" Height="218" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
    <LandscapeRight Enabled="False" Width="240" Height="218" Top="0" Left="0" StatusbarHeight="0" StatusBarPos="0" Artwork="" />
  </MobileDevice>
}

initialization

  TDeviceinfo.AddDevice(TDeviceinfo.TDeviceClass.Tablet, ViewName,
    // The Moto360 is 320x290 phyiscal and 240x218 logical with 213 PPI
    // The Android Wear emulator is 320x320 and 213x213 logical with 240 PPI
    TSize.Create(320, 290), TSize.Create(240, 218), // MinPhysicalSize(max, min), MinLogicalSize(max, min)
    TOSVersion.TPlatform.pfAndroid, 213, //Select the platform and the pixel density.
    True); // Exclusive

finalization

  TDeviceinfo.RemoveDevice(ViewName); // To unregister the view after unistalling the package.

end.
