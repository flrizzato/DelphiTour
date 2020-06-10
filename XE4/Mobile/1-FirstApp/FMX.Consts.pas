{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit FMX.Consts;

interface

const
  DefaultFontSize = 11;
  DefaultFontFamily = 'Tahoma';

  // Keys for TPlatformServices.GlobalFlags
  GlobalDisableStylusGestures: string = 'GlobalDisableStylusGestures'; // do not localize
  GlobalDisableiOSGPUCanvas: string = 'GlobalDisableiOSGPUCanvas'; // do not localize

resourcestring

  { Error Strings }
  SInvalidPrinterOp       = 'Operation not supported on selected printer';
  SInvalidPrinter         = 'Printer selected is not valid';
  SPrinterIndexError      = 'Printer index out of range';
  SDeviceOnPort           = '%s on %s';
  SNoDefaultPrinter       = 'There is no default printer currently selected';
  SNotPrinting            = 'Printer is not currently printing';
  SPrinting               = 'Printing in progress';
  SInvalidPrinterSettings = 'Invalid printing job settings';
  SInvalidPageFormat      = 'Invalid page format settings';
  SCantStartPrintJob      = 'Cannot start the printing job';
  SCantEndPrintJob        = 'Cannot end the printing job';
  SCantPrintNewPage       = 'Cannot add the page for printing';
  SCantSetNumCopies       = 'Cannot change the number of document copies';
  StrCannotFocus          = 'Cannot focus this control';

  SInvalidStyleForPlatform = 'The style you have chosen is not available for your currently selected target platform. You can select a custom style or remove the stylebook to allow FireMonkey to automatically load the native style at run time';

  SInvalidPrinterClass    = 'Invalid printer class: %s';
  SPromptArrayTooShort    = 'Length of value array must be >= length of prompt array';
  SPromptArrayEmpty       = 'Prompt array must not be empty';
  SInvalidColorString     = 'Invalid Color string';

  SInvalidFmxHandle   = 'Invalid FMX Handle: %s%.*x';
  SMediaFileNotSupported  = 'Unsupported media file %s%';
  SUnsupportedPlatformService = 'Unsupported platform service: %s';
  SUnsupportedVersion = 'Unsupported data version: %s';
  SNotInstance = 'Instance of "%s" do not created';
  SFlasherNotRegistered = 'Class of flashing control, is not registered';
  SUnsupportedInterface = 'Class %0:s does not support interface %1:s';
  SNullException = 'Handled null exception';

  StrErrorShortCut = 'An unknown combination of keys %s';
  StrEUseHeirs = 'You can use only the inheritors of class "%s"';

  SInvalidGestureID = 'Invalid gesture ID (%d)';
  SInvalidStreamFormat = 'Invalid stream format';
  SDuplicateGestureName = 'Duplicate gesture name: %s';
  SDuplicateRecordedGestureName = 'A recorded gesture named %s already exists';
  SControlNotFound = 'Control not found';
  SRegisteredGestureNotFound = 'The following registered gestures were not found:'#13#10#13#10'%s';
  SErrorLoadingFile = 'Error loading previously saved settings file: %s'#13'Would you like to delete it?';
  STooManyRegisteredGestures = 'Too many registered gestures';
  SDuplicateRegisteredGestureName = 'A registered gesture named %s already exists';
  SUnableToSaveSettings = 'Unable to save settings';
  SInvalidGestureName = 'Invalid gesture name (%s)';
  SOutOfRange = 'Value must be between %d and %d';

  SAddIStylusAsyncPluginError = 'Unable to add IStylusAsyncPlugin: %s';
  SAddIStylusSyncPluginError = 'Unable to add IStylusSyncPlugin: %s';
  SRemoveIStylusAsyncPluginError = 'Unable to remove IStylusAsyncPlugin: %s';
  SRemoveIStylusSyncPluginError = 'Unable to remove IStylusSyncPlugin: %s';
  SStylusHandleError = 'Unable to get or set window handle: %s';
  SStylusEnableError = 'Unable to enable or disable IRealTimeStylus: %s';
  SEnableRecognizerError = 'Unable to enable or disable IGestureRecognizer: %s';
  SInitialGesturePointError = 'Unable to retrieve initial gesture point';
  SSetStylusGestureError = 'Unable to set stylus gestures: %s';
  StrESingleMainMenu = 'The main menu can be only a single instance';
  SMainMenuSupportsOnlyTMenuItems = 'A main menu only supports TMenuItem children';

  SNoImplementation = 'No %s implementation found';

  SBitmapSizeNotEqual       = 'Bitmap size must be equal in copy operation';

  { grids }
  StrInvalidThePosition = 'Invalid positions or sizes';
  SDuplicateCustomOptions = 'A registered grid options class named %s already exists';
  SDefColumnText = '<Column # %d>';


  { Dialog Strings }
  SMsgDlgWarning = 'Warning';
  SMsgDlgError = 'Error';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Confirmação';
  SMsgDlgYes = 'Yes';
  SMsgDlgNo = 'No';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Cancel';
  SMsgDlgHelp = 'Help';
  SMsgDlgHelpNone = 'No help available';
  SMsgDlgHelpHelp = 'Help';
  SMsgDlgAbort = 'Abort';
  SMsgDlgRetry = 'Retry';
  SMsgDlgIgnore = 'Ignore';
  SMsgDlgAll = 'All';
  SMsgDlgNoToAll = 'No to All';
  SMsgDlgYesToAll = 'Yes to &All';
  SMsgDlgClose = 'Close';

  SUsername = '&Username';
  SPassword = '&Password';
  SDomain = '&Domain';
  SLogin = 'Login';

  { Menus }
  SMenuAppQuit = 'Quit %s';
  SMenuCloseWindow = 'Close Window';
  SMenuAppHide = 'Hide %s';
  SMenuAppHideOthers = 'Hide Others';
  SAppDesign = '<Application.Title>';
  SAppDefault = 'application';
  SGotoTab = 'Go to %s';
  SGotoNilTab = 'Go to <Tab>';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';
  SmkcCmd = 'Cmd+';

  SEditUndo = 'Undo';
  SEditCopy = 'Copy';
  SEditCut = 'Cut';
  SEditPaste = 'Paste';
  SEditDelete = 'Delete';
  SEditSelectAll = 'Select All';

  SAseLexerTokenError = 'ERROR at line %d. %s expected but token %s found.';
  SAseLexerCharError = 'ERROR at line %d. ''%s'' expected but char ''%s'' found.';
  SAseLexerFileCorruption = 'File is corrupt.';

  SAseParserWrongMaterialsNumError = 'Wrong materials number';
  SAseParserWrongVertexNumError = 'Wrong vertex number';
  SAseParserWrongNormalNumError = 'Wrong normal number';
  SAseParserWrongTexCoordNumError = 'Wrong texture coord number';
  SAseParserWrongVertexIdxError = 'Wrong vertex index';
  SAseParserWrongFacesNumError = 'Wrong faces number';
  SAseParserWrongFacesIdxError = 'Wrong faces index';
  SAseParserWrongTriangleMeshNumError = 'Wrong triangle mesh number';
  SAseParserWrongTriangleMeshIdxError = 'Wrong triangle mesh index';
  SAseParserWrongTexCoordIdxError = 'Wrong texture coord index';
  SAseParserUnexpectedKyWordError = 'Unexpected key word';

  SIndexDataNotFoundError = 'Index data not found. File is corrupt.';
  SEffectIdNotFoundError = 'Effect id %s not found. File is corrupt.';
  SMeshIdNotFoundError = 'Mesh id %s not found. File is corrupt.';
  SControllerIdNotFoundError = 'Controller id %s not found. File is corrupt.';

  SCannotCreateCircularDependence = 'Cannot create a circular dependency beetwen components';
  SPropertyOutOfRange = '%s property out of range';

  SPrinterDPIChangeError = 'Active printer DPI can''t be changed while printing';
  SPrinterSettingsReadError = 'Error occured while reading printer settings: %s';
  SPrinterSettingsWriteError = 'Error occured while writing printer settings: %s';

  SVAllFiles = 'All Files';
  SVBitmaps = 'Bitmaps';
  SVIcons = 'Icons';
  SVTIFFImages = 'TIFF Images'; 
  SVJPGImages = 'JPEG Images';
  SVPNGImages = 'PNG Images';
  SVGIFImages = 'GIF Images';
  SVJP2Images = 'Jpeg 2000 Images';
  SVTGAImages = 'TGA Images';
  SWMPImages = 'WMP Images';

  SVAviFiles = 'AVI Files';
  SVWMVFiles = 'WMV Files';
  SVMP4Files = 'Mpeg4 Files';
  SVMOVFiles = 'QuickTime Files';
  SVM4VFiles = 'M4V Files';

  SVWMAFiles = 'Windows Media Audio Files';
  SVMP3Files = 'Mpeg Layer 3 Files';
  SVWAVFiles = 'WAV Files';
  SVCAFFiles = 'Apple Core Audio Format Files';

  { Media }

  SNoFlashError = 'Flash doesn''t exist on this device';
  SNoTorchError = 'Flash doesn''t exist on this device';

  { Pickers }
  SPickerCancel = 'Cancel';
  SPickerDone   = 'Done';

  { Media Library }
  STakePhotoFromCamera = 'Take Photo';
  STakePhotoFromLibarary = 'Photo Library';
  SOpenStandartServices = 'Open to';

  { Canvas helpers / 2D and 3D engine / GPU }
  SInvalidCallingConditions = 'Invalid calling conditions for ''%s''.';
  SInvalidRenderingConditions = 'Invalid rendering conditions for ''%s''.';
  STextureSizeTooSmall = 'Cannot create texture for ''%s'' because the size is too small.';
  SCannotAcquireBitmapAccess = 'Cannot acquire bitmap access for ''%s''.';
  SCannotFindSuitablePixelFormat = 'Cannot find a suitable pixel format for ''%s''.';
  SCannotCreateDirect3D = 'Cannot create Direct3D object for ''%s''.';
  SCannotCreateD3DDevice = 'Cannot create Direct3D device for ''%s''.';
  SCannotAcquireDXGIFactory = 'Cannot acquire DXGI factory from Direct3D device for ''%s''.';
  SCannotAssociateWindowHandle = 'Cannot associate the window handle for ''%s''.';
  SCannotRetrieveDisplayMode = 'Cannot retrieve display mode for ''%s''.';
  SCannotRetrieveBufferDesc = 'Cannot retrieve buffer description for ''%s''.';
  SCannotCreateSamplerState = 'Cannot create sampler state for ''%s''.';
  SCannotRetrieveSurface = 'Cannot retreive surface for ''%s''.';
  SCannotCreateTexture = 'Cannot create texture for ''%s''.';
  SCannotUploadTexture = 'Cannot upload pixel data to texture for ''%s''.';
  SCannotActivateTexture = 'Cannot activate the texture for ''%s''.';
  SCannotAcquireTextureAccess = 'Cannot acquire texture access for ''%s''.';
  SCannotCopyTextureResource = 'Cannot copy texture resource ''%s''.';
  SCannotCreateRenderTargetView = 'Cannot create render target view for ''%s''.';
  SCannotActivateFrameBuffers = 'Cannot activate frame buffers for ''%s''.';
  SCannotCreateRenderBuffers = 'Cannot create render buffers for ''%s''.';
  SCannotRetrieveRenderBuffers = 'Cannot retrieve device render buffers for ''%s''.';
  SCannotActivateRenderBuffers = 'Cannot activate render buffers for ''%s''.';
  SCannotBeginRenderingScene = 'Cannot begin rendering scene for ''%s''.';
  SCannotSyncDeviceBuffers = 'Cannot synchronize device buffers for ''%s''.';
  SCannotUploadDeviceBuffers = 'Cannot upload device buffers for ''%s''.';
  SCannotCreateDepthStencil = 'Cannot create a depth/stencil buffer for ''%s''.';
  SCannotRetrieveDepthStencil = 'Cannot retrieve device depth/stencil buffer for ''%s''.';
  SCannotActivateDepthStencil = 'Cannot activate depth/stencil buffer for ''%s''.';
  SCannotCreateSwapChain = 'Cannot create a swap chain for ''%s''.';
  SCannotResizeSwapChain = 'Cannot resize swap chain for ''%s''.';
  SCannotActivateSwapChain = 'Cannot activate swap chain for ''%s''.';
  SCannotCreateVertexShader = 'Cannot create vertex shader for ''%s''.';
  SCannotCreatePixelShader = 'Cannot create pixel shader for ''%s''.';
  SCannotCreateVertexLayout = 'Cannot create vertex layout for ''%s''.';
  SCannotCreateVertexDeclaration = 'Cannot create vertex declaration for ''%s''.';
  SCannotCreateVertexBuffer = 'Cannot create vertex buffer for ''%s''.';
  SCannotCreateIndexBuffer = 'Cannot create index buffer for ''%s''.';
  SCannotCreateShader = 'Cannot create shader for ''%s''.';
  SCannotFindShaderVariable = 'Cannot find shader variable ''%s'' for ''%s''.';
  SCannotActivateShaderProgram = 'Cannot activate shader program for ''%s''.';
  SCannotCreateOpenGLContext = 'Cannot create OpenGL context for ''%s''.';
  SCannotUpdateOpenGLContext = 'Cannot update OpenGL context for ''%s''.';
  SCannotDrawMeshObject = 'Cannot draw mesh object for ''%s''.';
  SErrorInContextMethod = 'Error in context method ''%s''.';
  SFeatureNotSupported = 'This feature is not supported in ''%s''.';
  SErrorCompressingStream = 'Error compressing stream.';
  SErrorDecompressingStream = 'Error decompressing stream.';
  SErrorUnpackingShaderCode = 'Error unpacking shader code.';

implementation

end.

