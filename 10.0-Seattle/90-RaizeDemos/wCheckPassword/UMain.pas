unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ADSISearch, Vcl.StdCtrls, System.DateUtils,
  RzTabs, ipwcore, ipwldap, System.UITypes, Vcl.Mask, RzEdit, RzDBEdit,
  Vcl.ComCtrls, RzDTP, Vcl.ExtCtrls, RzPanel, RzPopups, RzBorder, RzStatus,
  RzCmboBx, RzLabel, RzCommon, RzButton, RzLine, RzBtnEdt, RzRadChk, RzRadGrp,
  RzForms, Vcl.Menus, System.ImageList, Vcl.ImgList, RzTray,
  Vcl.Imaging.pngimage, RzBHints, RzPrgres, CodeSiteLogging;

const
  KEY    = 18323;
  DOMAIN = 'Domain';
  PWD    = 'Pwd';
  WM_POSTCALL = WM_USER +1;

type
  ipwOp = (ioNone, ioMaxPwdAge, ioUser, ioCheckParam);
  TFrmMain = class(TForm)
{$region 'Components'}
    RzPageControl1: TRzPageControl;
    tsCheck: TRzTabSheet;
    ipwLDAP1: TipwLDAP;
    RzRegIniFile1: TRzRegIniFile;
    RzPropertyStore1: TRzPropertyStore;
    RzStatusBar1: TRzStatusBar;
    gbUser: TRzGroupBox;
    RzClockStatus2: TRzClockStatus;
    RzVersionInfoStatus2: TRzVersionInfoStatus;
    lblLogin: TRzLabel;
    cbLogin: TRzMRUComboBox;
    btnClearLogins: TRzButton;
    lOr: TRzLine;
    lblFullname: TRzLabel;
    cbFullname: TRzMRUComboBox;
    btnClearFullnames: TRzButton;
    btnCheckPassword: TRzButton;
    RzVersionInfo1: TRzVersionInfo;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    edNbDays: TRzNumericEdit;
    tsConnection: TRzTabSheet;
    GroupBox1: TGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edLogin: TRzButtonEdit;
    edDirectoryServer: TRzButtonEdit;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edPassword: TRzButtonEdit;
    btnCheckConnection: TRzButton;
    cbSaveCredentials: TRzCheckBox;
    RzButton1: TRzButton;
    btnGetUsername: TRzButton;
    rgDomain: TRzRadioGroup;
    cDeadline: TRzCalendar;
    lblDeadline: TRzLabel;
    btnDeleteLogin: TRzButton;
    btnDeleteFullname: TRzButton;
    lblCaptionEmail: TRzLabel;
    lblTooLate: TRzLabel;
    lblChangePassword: TRzURLLabel;
    RzFormState1: TRzFormState;
    lblEmail: TRzURLLabel;
    RzTrayIcon1: TRzTrayIcon;
    ImageList1: TImageList;
    pmSystray: TPopupMenu;
    About1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    RzMenuController1: TRzMenuController;
    tsAbout: TRzTabSheet;
    Image1: TImage;
    RzLabel6: TRzLabel;
    lblVersion: TRzLabel;
    RzLabel7: TRzLabel;
    RzURLLabel1: TRzURLLabel;
    RzURLLabel2: TRzURLLabel;
    lblFrance: TRzLabel;
    pbDaysRemaining: TRzProgressBar;
    tmrRotate: TTimer;
    imgW: TImage;
    pnlHide: TRzPanel;
{$endregion 'Components'}
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ipwLDAP1SearchComplete(Sender: TObject; MessageId: Integer; const DN: string; ResultCode: Integer; const Description: string);
    procedure ipwLDAP1SearchResult(Sender: TObject; MessageId: Integer; const DN: string);
    procedure btnClearLoginsClick(Sender: TObject);
    procedure btnClearFullnamesClick(Sender: TObject);
    procedure edDirectoryServerButtonClick(Sender: TObject);
    procedure edLoginButtonClick(Sender: TObject);
    procedure edPasswordButtonClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure btnGetUsernameClick(Sender: TObject);
    procedure cbSaveCredentialsClick(Sender: TObject);
    procedure edConnectionChange(Sender: TObject);
    procedure btnCheckConnectionClick(Sender: TObject);
    procedure btnCheckPasswordClick(Sender: TObject);
    procedure cbFullnameChange(Sender: TObject);
    procedure cbLoginChange(Sender: TObject);
    procedure btnDeleteFullnameClick(Sender: TObject);
    procedure btnDeleteLoginClick(Sender: TObject);
    procedure rgDomainClick(Sender: TObject);
    procedure RzFormState1RestoreState(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure tmrRotateTimer(Sender: TObject);
    procedure RzPageControl1Changing(Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);
    procedure lblFranceDblClick(Sender: TObject);
  private
    { Déclarations privées }
    ADSearch  :TADSISearch;
    io        : ipwOp;
    filtre    : string;
    iNbResults: Integer;
    function  ConvertDate(value: string): TDateTime;
    procedure PostCall(var msg: TMessage); message WM_POSTCALL;
    function  GetNbRecords(value: Integer): string;
  public
    { Déclarations publiques }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

type
  NET_API_STATUS = DWORD;

  NETSETUP_JOIN_STATUS = (
    NetSetupUnknownStatus,
    NetSetupUnjoined,
    NetSetupWorkgroupName,
    NetSetupDomainName);

  PNETSETUP_JOIN_STATUS = ^NETSETUP_JOIN_STATUS;

  TDomainControllerInfoW = record
    DomainControllerName: LPCWSTR;
    DomainControllerAddress: LPCWSTR;
    DomainControllerAddressType: ULONG;
    DomainGuid: TGUID;
    DomainName: LPCWSTR;
    DnsForestName: LPCWSTR;
    Flags: ULONG;
    DcSiteName: LPCWSTR;
    ClientSiteName: LPCWSTR;
  end;
  PDomainControllerInfoW = ^TDomainControllerInfoW;

const
  NET_API_DLL   = 'netapi32.dll';
  NERR_Success  = 0;
  DS_AVOID_SELF = $00004000;

  function DSGetDCName(ComputerName, DomainName: LPCWSTR; DomainGuid: PGUID; SiteName: LPCWSTR; Flags: ULONG; var DomainControllerInfo: PDomainControllerInfoW):  NET_API_STATUS; stdcall; external NET_API_DLL name 'DsGetDcNameW';

const CKEY1 = 12345;
      CKEY2 = 24680;

function EncryptStr(const S :WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result := UTF8ToWideString(RStr);
end;

function TFrmMain.ConvertDate(value: string): TDateTime;
begin
  Result := UnixToDateTime((StrToInt64(value) div 10000000) - 11644473600, False);
end;

procedure TFrmMain.edDirectoryServerButtonClick(Sender: TObject);
begin
  edDirectoryServer.Text := '';
end;

procedure TFrmMain.edConnectionChange(Sender: TObject);
begin
  btnCheckConnection.Enabled := (edDirectoryServer.Text <> '') and (edLogin.Text <> '') and (edPassword.Text <> '');

  if Assigned(cbSaveCredentials.OnClick) then
  begin
    cbSaveCredentialsClick(Sender);
  end;
end;

procedure TFrmMain.edLoginButtonClick(Sender: TObject);
begin
  edLogin.Text := '';
end;

procedure TFrmMain.edPasswordButtonClick(Sender: TObject);
begin
  edPassword.Text := '';
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmMain.About1Click(Sender: TObject);
begin
  RzPageControl1.ActivePage := tsAbout;
end;

procedure TFrmMain.btnGetUsernameClick(Sender: TObject);
begin
  edLogin.Text := GetEnvironmentVariable('username');
end;

procedure TFrmMain.btnCheckConnectionClick(Sender: TObject);
begin
  try
    if io = ioNone then
    begin
      ipwLDAP1.Interrupt();
      io := ioCheckParam;
      ipwLDAP1.ServerName := edDirectoryServer.Text;

      //Note that AD, unlike other LDAP servers, requires a bind before a search will be allowed, so the demo would
      //have to include a few extra lines of code if you are working with AD:
      edLogin.Text := StringReplace(edLogin.Text, '@embarcadero.com', '', [rfIgnoreCase]);
      ipwLDAP1.DN := edLogin.Text + '@embarcadero.com';
      ipwLDAP1.Password := edPassword.Text;
      ipwLDAP1.Bind();

      ipwLDAP1.SearchSizeLimit := 0; // at most 100 results
      ipwLDAP1.Timeout := 0; //set timeout > 0 to use in synch mode
      ipwLDAP1.AttrCount := 1;
      ipwLDAP1.AttrType[0] := 'name';
      ipwLDAP1.DN := 'dc=embarcadero,dc=com';

      ipwLDAP1.SearchScope := ssWholeSubtree;
      CodeSite.Send('Searching with IP*Works!', '(&(objectclass=top)(objectclass=person)(objectclass=organizationalPerson)(objectclass=user)(sAMAccountName=' + edLogin.Text + '))');
      ipwLDAP1.Search('(&(objectclass=top)(objectclass=person)(objectclass=organizationalPerson)(objectclass=user)(sAMAccountName=' + edLogin.Text + '))');

      Screen.Cursor := crHourGlass;
    end;
  except on E: Exception do
    begin
      io := ioNone;
      MessageDlg('Host is probably invalid.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      CodeSite.SendError('Host is probably invalid: ' + E.Message);
    end;
  end;
end;

procedure TFrmMain.btnCheckPasswordClick(Sender: TObject);
var
  ix      : Integer;
  slTemp  : TStringList;
  iNbDays : Integer;
begin
  filtre     := '';
  iNbResults := 0;
  if cbLogin.Text = '' then
  begin
    if cbFullname.Text = '' then
    begin
      MessageDlg('You need to specify a login or a fullname before you click on this button.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    end
    else
    begin
      filtre := '(&(objectclass=top)(objectclass=person)(objectclass=organizationalPerson)(objectclass=user)(name=' + cbFullname.Text + '))';
    end;
  end
  else if cbFullname.Text = '' then
  begin
    filtre := '(&(objectclass=top)(objectclass=person)(objectclass=organizationalPerson)(objectclass=user)(sAMAccountName=' + cbLogin.Text + '))';
  end
  else
  begin
    MessageDlg('You need to delete one of the 2 fields above.'#13#10'(Login or Full name)', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbCancel], 0);
  end;

  if filtre <> '' then
  begin
    if rgDomain.ItemIndex = 0 then
    begin
      // ADSI
      try
        if not edNbDays.Enabled then
        begin
          with ADSearch do
          begin
            BasePath   := 'LDAP://embarcadero.com';
            MaxRows    := 1;
            Attributes := 'maxPwdAge';
            Filter     := 'distinguishedName=DC=embarcadero,DC=com';

            CodeSite.Send('Searching with ADSI', 'distinguishedName=DC=embarcadero,DC=com');
            Search;

            slTemp := GetFirstRow();
            if slTemp <> nil then
            begin
              ix := slTemp.IndexOfName('maxPwdAge');
              if ix <> -1 then
              begin
                iNbDays                    := DaysBetween(ConvertDate(slTemp.ValueFromIndex[ix]), ConvertDate('0'));
                edNbDays.Value             := iNbDays;
                pbDaysRemaining.TotalParts := iNbDays;
              end;
              FreeAndNil(slTemp);
              edNbDays.Enabled := True;
            end;
          end;
        end;

        with ADSearch do
        begin
          BasePath   := 'LDAP://embarcadero.com';
          MaxRows    := 50;
          Attributes := 'sAMAccountName,pwdLastSet,name,mail';
          Filter     := filtre;

          CodeSite.Send('Searching with ADSI', filtre);
          Search;

          slTemp := GetFirstRow();
          while (slTemp <> nil) do
          begin
            Inc(iNbResults);
            CodeSite.EnterMethod(IntToStr(iNbResults) + ' - ' + slTemp[0]);
            ix := slTemp.IndexOfName('sAMAccountName');
            if ix <> -1 then
            begin
              cbLogin.Text := slTemp.ValueFromIndex[ix];
              cbLogin.UpdateMRUList;
              CodeSite.Send('sAMAccountName', cbLogin.Text);
            end;
            ix := slTemp.IndexOfName('name');
            if ix <> -1 then
            begin
              cbFullname.Text := slTemp.ValueFromIndex[ix];
              cbFullname.UpdateMRUList;
              CodeSite.Send('name', cbFullname.Text);
            end;
            ix := slTemp.IndexOfName('mail');
            if ix <> -1 then
            begin
              lblEmail.Caption := slTemp.ValueFromIndex[ix];
              lblEmail.URL := 'mailto:' + lblEmail.Caption;
              lblCaptionEmail.Visible := True;
              CodeSite.Send('mail', lblEmail.Caption);
            end;
            ix := slTemp.IndexOfName('pwdLastSet');
            if ix <> -1 then
            begin
              cDeadline.Date := IncDay(ConvertDate(slTemp.ValueFromIndex[ix]), Round(edNbDays.Value));
              pbDaysRemaining.PartsComplete := Round(edNbDays.Value) - DaysBetween(Now, cDeadline.Date) - 1;
              CodeSite.SendDateTime('pwdLastSet', cDeadline.Date);
              lblDeadline.Visible     := True;
              cDeadline.Visible       := True;
              pbDaysRemaining.Visible := True;

               lblTooLate.Visible := cDeadline.Date < Now;
               lblChangePassword.URL := 'https://adfs.embarcadero.com/adfs/portal/updatepassword?username=' + cbLogin.Text + '@EMBARCADERO.COM';
               lblChangePassword.Visible := DaysBetween(Now, cDeadline.Date) <= 5;
            end;

  //          for ix := 0 to slTemp.Count-1 do
  //          begin
  //
  //            Memo1.Lines.Add(slTemp[ix]);
  //          end;

            CodeSite.ExitMethod(IntToStr(iNbResults) + ' - ' + slTemp[0]);

            FreeAndNil(slTemp);
            slTemp := GetNextRow();
          end;

          RzTrayIcon1.ShowBalloonHint('wCheckPassword', GetNbRecords(iNbResults));
        end;

      except on E: Exception do
        begin
          MessageDlg('Are you sure this computer belongs to the domain?'#13#10'Try the other method in the Connection tab', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
          CodeSite.SendWarning('Computer belongs to the domain? ' + E.Message);
        end;
      end;
    end
    else
    begin
      //IP*WORKS!
      if not edNbDays.Enabled then
      begin
        if io = ioNone then
        begin
          ipwLDAP1.Interrupt();
          io := ioMaxPwdAge;
          ipwLDAP1.ServerName := edDirectoryServer.Text;

          //Note that AD, unlike other LDAP servers, requires a bind before a search will be allowed, so the demo would
          //have to include a few extra lines of code if you are working with AD:
          ipwLDAP1.DN := edLogin.Text + '@embarcadero.com';
          ipwLDAP1.Password := edPassword.Text;
          ipwLDAP1.Bind();

          ipwLDAP1.SearchSizeLimit := 0;
          ipwLDAP1.Timeout := 0;
          ipwLDAP1.AttrCount := 1;
          ipwLDAP1.AttrType[0] := 'maxPwdAge';
          ipwLDAP1.DN := 'dc=embarcadero,dc=com';

          ipwLDAP1.SearchScope := ssWholeSubtree;
          CodeSite.Send('Searching with IP*Works!', 'distinguishedName=DC=embarcadero,DC=com');
          ipwLDAP1.Search('distinguishedName=DC=embarcadero,DC=com');

          Screen.Cursor := crHourGlass;
        end;
      end
      else
      begin
        SendMessage(Self.Handle, WM_POSTCALL, 0, 0);
      end;
    end;
  end;
end;

procedure TFrmMain.btnClearFullnamesClick(Sender: TObject);
begin
  if MessageDlg('Do you really want to remove all the previous fullnames?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    cbFullname.Items.Clear;
    cbFullname.SaveMRUData;
  end;
end;

procedure TFrmMain.btnClearLoginsClick(Sender: TObject);
begin
  if MessageDlg('Do you really want to remove all the previous logins?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    cbLogin.Items.Clear;
    cbLogin.SaveMRUData;
  end;
end;

procedure TFrmMain.btnDeleteFullnameClick(Sender: TObject);
begin
  cbFullname.Text := '';
end;

procedure TFrmMain.btnDeleteLoginClick(Sender: TObject);
begin
  cbLogin.Text := '';
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ADSearch);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  CodeSiteManager.Enabled := FindCmdLineSwitch('d');

  CodeSite.SendVersionInfo;

  CodeSite.SendRegistry(RzRegIniFile1.Path, True);

  pnlHide.Visible := False;

  io       := ioNone;
  ADSearch := TADSISearch.Create;
  RzPropertyStore1.Load;

  if RzRegIniFile1.ValueExists(DOMAIN, PWD) then
  begin
    edPassword.Text := DecryptStr(RzRegIniFile1.ReadString(DOMAIN, PWD, EncryptStr('', KEY)), KEY);
  end;
  cbSaveCredentials.OnClick := cbSaveCredentialsClick;
  rgDomain.OnClick          := rgDomainClick;

  lblVersion.Caption := 'v' + RzVersionInfoStatus2.VersionInfo.FileVersion;
end;

procedure TFrmMain.Image1Click(Sender: TObject);
begin
  RzTrayIcon1.ShowBalloonHint('wCheckPassword', #13#10'Created by Whiler', TRzBalloonHintIcon.bhiInfo);
end;

procedure TFrmMain.ipwLDAP1SearchComplete(Sender: TObject; MessageId: Integer;
  const DN: string; ResultCode: Integer; const Description: string);
begin
  ipwLDAP1.Unbind();
  Screen.Cursor := crDefault;

  if ResultCode <> 9 then
  begin
    MessageDlg('Cannot connect.'#13#10'Check your username and/or password.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;

  if io = ioMaxPwdAge then
  begin
    PostMessage(Self.Handle, WM_POSTCALL, 0, 0);
  end
  else if io = ioUser then
  begin
    RzTrayIcon1.ShowBalloonHint('wCheckPassword', GetNbRecords(iNbResults));
  end;
  io := ioNone;
end;

procedure TFrmMain.ipwLDAP1SearchResult(Sender: TObject; MessageId: Integer; const DN: string);
var
  iNbDays: Integer;
begin
  CodeSite.TraceMethod('ipwLDAP1SearchResult');

  case io of
    ioMaxPwdAge:
    begin
      CodeSite.Send('maxPwdAge', ipwLDAP1.AttrValue[0]);
      iNbDays                    := DaysBetween(ConvertDate(ipwLDAP1.AttrValue[0]), ConvertDate('0'));
      edNbDays.Value             := iNbDays;
      CodeSite.Send('NbDays', iNbDays);
      pbDaysRemaining.TotalParts := iNbDays;
      edNbDays.Enabled           := True;
    end;

    ioUser:
    begin
      Inc(iNbResults);
      CodeSite.EnterMethod(IntToStr(iNbResults) + ' - ' + DN);
      cbLogin.Text := ipwLDAP1.Attr('sAMAccountName');
      cbLogin.UpdateMRUList;

      CodeSite.Send('sAMAccountName', cbLogin.Text);

      cbFullname.Text := ipwLDAP1.Attr('name');
      cbFullname.UpdateMRUList;

      CodeSite.Send('name', cbFullname.Text);

      lblEmail.Caption := ipwLDAP1.Attr('mail');
      lblEmail.URL := 'mailto:' + lblEmail.Caption;

      CodeSite.Send('mail', lblEmail.Caption);

      cDeadline.Date := IncDay(ConvertDate(ipwLDAP1.Attr('pwdLastSet')), Round(edNbDays.Value));

      CodeSite.SendDateTime('pwdLastSet', cDeadline.Date);

      pbDaysRemaining.PartsComplete := Round(edNbDays.Value) - DaysBetween(Now, cDeadline.Date) - 1;

      lblCaptionEmail.Visible := True;
      cDeadline.Visible       := True;
      lblDeadline.Visible     := True;
      pbDaysRemaining.Visible := True;

      lblTooLate.Visible        := cDeadline.Date < Now;
      lblChangePassword.URL     := 'https://adfs.embarcadero.com/adfs/portal/updatepassword?username=' + cbLogin.Text + '@EMBARCADERO.COM';
      lblChangePassword.Visible := DaysBetween(Now, cDeadline.Date) <= 5;

      CodeSite.ExitMethod(IntToStr(iNbResults) + ' - ' + DN);
    end;

    ioCheckParam:
    begin
      MessageDlg(ipwLDAP1.AttrValue[0] + ', your connection is ok.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      CodeSite.Send('Test connection', ipwLDAP1.AttrValue[0]);
    end;
  end;
end;

procedure TFrmMain.lblFranceDblClick(Sender: TObject);
begin
  if GetKeyState(vkW) < 0 then
  begin
    imgW.Visible := True;
    CodeSite.SendScreenShot('About', Self.Handle);
  end;
end;

procedure TFrmMain.PostCall(var msg: TMessage);
begin
  io := ioUser;
  // On lance la recherche suivante
  ipwLDAP1.Interrupt();
  ipwLDAP1.ServerName := edDirectoryServer.Text;
  ipwLDAP1.DN         := edLogin.Text + '@embarcadero.com';
  ipwLDAP1.Password   := edPassword.Text;
  ipwLDAP1.Bind();

  ipwLDAP1.SearchSizeLimit := 0;
  ipwLDAP1.Timeout := 0;
  ipwLDAP1.AttrCount := 4;
  ipwLDAP1.AttrType[0] := 'sAMAccountName';
  ipwLDAP1.AttrType[1] := 'name';
  ipwLDAP1.AttrType[2] := 'mail';
  ipwLDAP1.AttrType[3] := 'pwdLastSet';
  ipwLDAP1.DN := 'dc=embarcadero,dc=com';

  ipwLDAP1.SearchScope := ssWholeSubtree;

  iNbResults := 0;

  CodeSite.Send('Searching with IP*Works!', filtre);
  ipwLDAP1.Search(filtre);

  Screen.Cursor := crHourGlass;
end;

procedure TFrmMain.rgDomainClick(Sender: TObject);
begin
  RzPropertyStore1.Save;
end;

procedure TFrmMain.RzButton1Click(Sender: TObject);
var
  CurrentDomainControllerInfo: PDomainControllerInfoW;
begin
  if (DSGetDCName(nil, 'embarcadero.com', nil, nil, DS_AVOID_SELF, CurrentDomainControllerInfo)=ERROR_SUCCESS) then
  begin
    edDirectoryServer.Text := StringReplace(CurrentDomainControllerInfo.DomainControllerAddress, '\', '',[rfReplaceAll]);
  end
  else
  begin
    MessageDlg('Cannot find any Domain Controller.'#13#10#13#10'Ask the IP at your domain administrator.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TFrmMain.RzFormState1RestoreState(Sender: TObject);
begin
  Self.MakeFullyVisible;
end;

procedure TFrmMain.RzPageControl1Changing(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  tmrRotate.Enabled := NewIndex = tsAbout.PageIndex;
end;

procedure TFrmMain.tmrRotateTimer(Sender: TObject);
begin
  lblFrance.Angle := lblFrance.Angle + 1;
  if lblFrance.Angle = 360 then
  begin
    lblFrance.Angle := 0;
  end;
end;

procedure TFrmMain.cbFullnameChange(Sender: TObject);
begin
  if cbFullname.Text <> '' then
  begin
    cbLogin.Text := '';
  end;
end;

procedure TFrmMain.cbLoginChange(Sender: TObject);
begin
  if cbLogin.Text <> '' then
  begin
    cbFullname.Text := '';
  end;
end;

procedure TFrmMain.cbSaveCredentialsClick(Sender: TObject);
begin
  if cbSaveCredentials.Checked then
  begin
    RzPropertyStore1.Save;

    RzRegIniFile1.WriteString(DOMAIN, PWD, EncryptStr(edPassword.Text, KEY));
  end
  else
  begin
    RzRegIniFile1.EraseSection(DOMAIN);
  end;
end;

function TFrmMain.GetNbRecords(value: Integer): string;
var
  s: string;
begin
  if value < 2 then
  begin
    s := ' has';
  end
  else
  begin
    s := 's have';
  end;
  Result := Format('%d record%s been found!', [iNbResults, s]);
end;

end.
