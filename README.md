# MSLoading

Class Helper que auxilia na visualização enquanto executa a Query.

## ⚡️ Como utilizar o MsLoading

```delphi
unit View.formMain;

interface

uses
  FireDAC.Comp.Client,
  Vcl.Grids,
  MSLoading,
  Vcl.DBGrids;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    quSQL: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  quSQl.sql.text:= 'select * from enti';
  quSQL.OpenLoading;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected:= true;
end;

end.

```

Indicando MsLoading na uses do formulario, a FDQuery carrega a class helper OpenLoading.
