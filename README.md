# MSLoading

Class Helper que auxilia na visualização enquanto executa a Query.

## ⚡️ Como utilizar o MsLoading

Indicando MsLoading na uses do formulario, a FDQuery carrega a class helper OpenLoading.

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
  quSQl.sql.text:= 'select * from table';
  quSQL.OpenLoading;
end;

end.

```
