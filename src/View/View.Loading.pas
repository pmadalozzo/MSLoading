unit View.Loading;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.GIFImg,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TformLoading = class(TForm)
    Label1: TLabel;
    imgGif: TImage;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  formLoading: TformLoading;

implementation


{$R *.dfm}

procedure TformLoading.FormCreate(Sender: TObject);
begin
  with TGIFImage(imgGif.Picture.Graphic) do
   begin
     Animate:= true;
     AnimationSpeed:= 120;
   end;
end;

end.
