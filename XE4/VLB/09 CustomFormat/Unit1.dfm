object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CustomFormat on LiveBinding'
  ClientHeight = 289
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 77
    Width = 317
    Height = 13
    Caption = 'This demo uses a ProtoType Bind source with some sample text in '
  end
  object Label2: TLabel
    Left = 56
    Top = 77
    Width = 317
    Height = 13
    Caption = 'This demo uses a ProtoType Bind source with some sample text in '
  end
  object Label3: TLabel
    Left = 56
    Top = 128
    Width = 409
    Height = 13
    Caption = 
      'Select a CustomFormat from the options below and see how it effe' +
      'cts the LiveBinding'
  end
  object Edit1: TEdit
    Left = 56
    Top = 96
    Width = 177
    Height = 21
    TabOrder = 0
    Text = 
      'ipsum mi vehicula purus, eu congue sapien orci eu est. Morbi bla' +
      'ndit volutpat ante, non ultrices eros semper at. Fusce leo leo, ' +
      'mollis id viverra a, pulvinar non diam. Praesent ornare mauris a' +
      'c magna placerat rutrum.Curabitur volutpat urna fermentum sem ia' +
      'culis ultrices. Maecenas adipiscing sapien risus, nec consectetu' +
      'r arcu. Sed in arcu iaculis felis placerat elementum vitae porta' +
      ' libero. Donec quis purus nisi, ac ultrices lorem. Proin vitae d' +
      'iam id turpis rhoncus vestibulum scelerisque vel leo. Nulla quis' +
      ' scelerisque sem. Etiam imperdiet lacinia nulla sit amet varius.' +
      ' Aliquam in interdum mauris. Praesent placerat, libero vel biben' +
      'dum malesuada, velit libero vestibulum erat, vel porttitor diam ' +
      'urna et nibh. Nullam fringilla cursus tempor. Cras eleifend male' +
      'suada lacus quis consectetur. Cum sociis natoque penatibus et ma' +
      'gnis dis parturient montes, nascetur ridiculus mus. Sed vestibul' +
      'um bibendum sodales.Mauris consectetur ipsum ac turpis aliquam i' +
      'd placerat justo ornare. Donec nisl arcu, faucibus vel dictum vi' +
      'tae, dapibus vel mauris. Sed lacinia, elit ut commodo tempor, ma' +
      'uris felis consequat nisl, sit amet laoreet est quam et tortor. ' +
      'Proin mattis interdum tempus. Etiam ac vehicula neque. Donec tem' +
      'por, velit sit'
  end
  object editOutput: TEdit
    Left = 207
    Top = 149
    Width = 354
    Height = 21
    TabOrder = 1
    Text = 
      'ipsum mi vehicula purus, eu congue sapien orci eu est. Morbi bla' +
      'ndit volutpat ante, non ultrices eros semper at. Fusce leo leo, ' +
      'mollis id viverra a, pulvinar non diam. Praesent ornare mauris a' +
      'c magna placerat rutrum.Curabitur volutpat urna fermentum sem ia' +
      'culis ultrices. Maecenas adipiscing sapien risus, nec consectetu' +
      'r arcu. Sed in arcu iaculis felis placerat elementum vitae porta' +
      ' libero. Donec quis purus nisi, ac ultrices lorem. Proin vitae d' +
      'iam id turpis rhoncus vestibulum scelerisque vel leo. Nulla quis' +
      ' scelerisque sem. Etiam imperdiet lacinia nulla sit amet varius.' +
      ' Aliquam in interdum mauris. Praesent placerat, libero vel biben' +
      'dum malesuada, velit libero vestibulum erat, vel porttitor diam ' +
      'urna et nibh. Nullam fringilla cursus tempor. Cras eleifend male' +
      'suada lacus quis consectetur. Cum sociis natoque penatibus et ma' +
      'gnis dis parturient montes, nascetur ridiculus mus. Sed vestibul' +
      'um bibendum sodales.Mauris consectetur ipsum ac turpis aliquam i' +
      'd placerat justo ornare. Donec nisl arcu, faucibus vel dictum vi' +
      'tae, dapibus vel mauris. Sed lacinia, elit ut commodo tempor, ma' +
      'uris felis consequat nisl, sit amet laoreet est quam et tortor. ' +
      'Proin mattis interdum tempus. Etiam ac vehicula neque. Donec tem' +
      'por, velit sit'
  end
  object cbFormat: TComboBox
    Left = 56
    Top = 149
    Width = 145
    Height = 21
    TabOrder = 2
    OnClick = cbFormatChange
    OnExit = cbFormatChange
    Items.Strings = (
      ''
      'LowerCase(%s)'
      'UpperCase(%s)'
      #39'Text = '#39'+%s')
  end
  object PrototypeBindSource1: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'LoremIpsum1'
        Generator = 'LoremIpsum'
        ReadOnly = False
      end>
    ScopeMappings = <>
    Left = 104
    Top = 16
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSource1
      FieldName = 'LoremIpsum1'
      Control = Edit1
      Track = True
    end
    object LinkControlToEditOutput: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PrototypeBindSource1
      FieldName = 'LoremIpsum1'
      Control = editOutput
      Direction = linkDataToControl
      Track = True
    end
  end
end
