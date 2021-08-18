unit MSLoading;

interface

uses
  FireDAC.Comp.Client,
  System.Threading,
  View.Loading;

type
  THelperLoading = class helper for TFDQuery
   private
   public
     procedure RunTask(var aTask : iTask);
     procedure ExibirLoading;
     function OpenLoading : boolean; overload;
     function OpenLoading(aMessage : string) : boolean; overload;
  end;

var
  FLoading : TformLoading;
  AllTasks : array of iTask;
  FMenssage : string;

implementation

uses
  System.Classes,
  System.SysUtils;

procedure THelperLoading.ExibirLoading;
begin
  TTask.Run(
  procedure
  begin
    TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      FLoading:= TformLoading.Create(nil);
      if FMenssage <> '' then
        FLoading.Label1.Caption:= FMenssage;

      FLoading.Show;
    end);

    TTask.WaitForAll(AllTasks);
    TThread.Queue(TThread.CurrentThread,
    procedure
    begin
      FLoading.Close;
      FLoading.Free;
    end);
  end);
end;

function THelperLoading.OpenLoading : boolean;
begin
  ExibirLoading;
  SetLength(AllTasks, 1);
  RunTask(AllTasks[0]);
end;

function THelperLoading.OpenLoading(aMessage: string): boolean;
begin
  FMenssage:= aMessage;
  ExibirLoading;
  SetLength(AllTasks, 1);
  RunTask(AllTasks[0]);
end;

procedure THelperLoading.RunTask(var aTask: iTask);
begin
  aTask:= TTask.Run(
  procedure
  begin
    Self.Close;
    //sleep(10000); descomentar para teste
    TThread.Synchronize(nil,
    procedure
    begin
      Self.Open;
    end);
  end);
end;

end.
