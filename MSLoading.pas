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
     function Loading(aQuery : TFDQuery) : boolean;
  end;

var
  FLoading : TformLoading;
  AllTasks : array of iTask;

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

function THelperLoading.Loading(aQuery : TFDQuery) : boolean;
begin
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
    //sleep(10000);
    TThread.Synchronize(nil,
    procedure
    begin
      Self.Open;
    end);
  end);
end;

end.
