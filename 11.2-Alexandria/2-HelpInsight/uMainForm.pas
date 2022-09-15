unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    /// <summary>
    ///   Este � nosso contador de execu��es
    /// </summary>
    FCount: integer;
  public
    { Public declarations }
    /// <summary>
    ///   Esta fun��o n�o faz nada s�rio
    /// </summary>
    /// <param name="aValue">
    ///   aValue recebe uma string qualquer
    /// </param>
    /// <returns>
    ///   A mesma string que vc passou!
    /// </returns>
    function NadaSerio(aValue: string): string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Caption := NadaSerio('Estamos ao vivo');
end;

function TForm1.NadaSerio(aValue: string): string;
begin
  Inc(FCount);
  Result := aValue + ' #' + FCount.ToString;
end;

end.
