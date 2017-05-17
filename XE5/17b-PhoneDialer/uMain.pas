unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.PhoneDialer,
  FMX.Platform, FMX.Edit;

type
  TPhoneDialerForm = class(TForm)
    btnGetCarrierInfo: TButton;
    lblCarrierName: TLabel;
    lblISOCountryCode: TLabel;
    lblNetworkCode: TLabel;
    lblMobileNetwork: TLabel;
    btnMakeCall: TButton;
    edtTelephoneNumber: TEdit;
    lblTelephoneNumber: TLabel;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure btnGetCarrierInfoClick(Sender: TObject);
    procedure btnMakeCallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PhoneDialerForm: TPhoneDialerForm;

implementation

{$R *.fmx}

procedure TPhoneDialerForm.btnGetCarrierInfoClick(Sender: TObject);
var
  PhoneDialerService: IFMXPhoneDialerService;

begin
  { test whether the PhoneDialer services are supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDialerService)) then
  begin
    { if yes, then update the labels with the retrieved information }
    lblCarrierName.Text := PhoneDialerService.GetCarrier.GetCarrierName;
    lblISOCountryCode.Text := PhoneDialerService.GetCarrier.GetIsoCountryCode;
    lblNetworkCode.Text := PhoneDialerService.GetCarrier.GetMobileCountryCode;
    lblMobileNetwork.Text := PhoneDialerService.GetCarrier.GetMobileNetwork;
  end;
end;

procedure TPhoneDialerForm.btnMakeCallClick(Sender: TObject);
var
  PhoneDialerService: IFMXPhoneDialerService;

begin
  { test whether the PhoneDialer services are supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDialerService)) then
  begin
    { if the Telephone Number is entered in the edit box then make the call, else
      display an error message }
    if edtTelephoneNumber.Text <> '' then
      PhoneDialerService.Call(edtTelephoneNumber.Text)
    else
    begin
      ShowMessage('Please type-in a telephone number.');
      edtTelephoneNumber.SetFocus;
    end;
  end;
end;

end.
