//Виды расходов
unit fCostType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild;

type
  TfrmCostType = class(TForm)
    GridCostType: TDBGridEh;
    mdCostType: TRxMemoryData;
    dsCostType: TDataSource;
    pmCostType: TPopupMenu;
    pmCostTypeAdd: TMenuItem;
    pmCostTypeEdit: TMenuItem;
    pmCostTypeDelete: TMenuItem;
    N1: TMenuItem;
    pmCostTypeRefresh: TMenuItem;
    mdCostTypeCOST_TYPE_ID: TIntegerField;
    mdCostTypeNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcAddExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure GridCostTypeSortMarkingChanged(Sender: TObject);
    procedure mdCostTypeAfterScroll(DataSet: TDataSet);
  private
    fChildInfo: PChildInfo;
    //получение списка видов расходов
    procedure GetCostTypeList;
    //запрос в FireBird
    function QueryFromFireBird: boolean;
    //копирование данных во временную таблицу
    procedure CopyToMemoryData;
  public
    { Public declarations }
  end;

var
  frmCostType: TfrmCostType;

implementation

uses
	dmHomeAudit,
        fCostTypeEd,
        uCommon;

{$R *.dfm}

procedure TfrmCostType.FormCreate(Sender: TObject);
begin
        //cтруктуру для обслуживания из главной формы
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := nil;
        fChildInfo.Actions[childAdd]         := AcAddExecute;
        fChildInfo.Actions[childEdit]        := AcEditExecute;
        fChildInfo.Actions[childDelete]      := AcDeleteExecute;
	fChildInfo.Actions[childRefresh]     := AcRefreshExecute;
        fChildInfo.haAdd        := true;
        fChildInfo.haAddPattern := false;
        fChildInfo.haRefresh    := true;

        mdCostType.Active := true;
end;

procedure TfrmCostType.FormShow(Sender: TObject);
begin
        GetCostTypeList;
end;

procedure TfrmCostType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	mdCostType.Active := false;
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	Управление записями
//
//------------------------------------------------------------------------------

//добавить запись
procedure TfrmCostType.AcAddExecute(Sender: TObject);
var
	CostTypeEd: TfrmCostTypeEd;
begin
	CostTypeEd := TfrmCostTypeEd.Create(Application);
	if CostTypeEd = nil then
		exit;

	CostTypeEd.Add(dsCostType);
	CostTypeEd.Free;
end;

//редактировать запись
procedure TfrmCostType.AcEditExecute(Sender: TObject);
var
	CostTypeEd: TfrmCostTypeEd;
begin
	//редактирование недоступно
        if (mdCostType.IsEmpty) then
        	exit;

	CostTypeEd := TfrmCostTypeEd.Create(Application);
	if CostTypeEd = nil then
		exit;

	CostTypeEd.Edit(dsCostType, mdCostType.FieldByName('COST_TYPE_ID').AsInteger);
	CostTypeEd.Free;
end;

//удалить запись
procedure TfrmCostType.AcDeleteExecute(Sender: TObject);
begin
	//удаление недоступно
        if (mdCostType.IsEmpty) then
        	exit;

	//диалог подтверждения удаления
        if (YesNoBox(format('Удалить вид расхода (ID #%d)?', [mdCostType.FieldByName('COST_TYPE_ID').AsInteger])) = IDYES) then
	begin
          	//удаление
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM COST_TYPE WHERE COST_TYPE_ID = ' + mdCostType.FieldByName('COST_TYPE_ID').AsString;

                //MsgBox(DataMod.IB_Cursor.SQL.Text);
        	//запуск запроса
        	try
	        	DataMod.IB_Cursor.Open;
        	except
                	ErrorBox('Не удалось удалить запись таблицы.' + #13 +
                	'Возможно, запись используется в других таблицах.');
                        
                	exit;
		end;

                DataMod.IB_Cursor.Close;
	        DataMod.IB_Transaction.Commit;

                mdCostType.Delete;
        end;
end;

//обновить данные
procedure TfrmCostType.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//обновление недоступно
        if (mdCostType.IsEmpty) then
        	exit;

        for i := 0 to GridCostType.Columns.Count - 1 do
        	GridCostType.Columns[i].Title.SortMarker := smNoneEh;

	GetCostTypeList;
end;

//------------------------------------------------------------------------------
//получение списка видов расходов
procedure TfrmCostType.GetCostTypeList;
begin
	//MsgBox('GetCostTypeList');
        if (QueryFromFireBird) then
	        CopyToMemoryData;

end;

//запрос в FireBird
function TfrmCostType.QueryFromFireBird: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT COST_TYPE_ID'
                + ', NAME'
        + ' FROM COST_TYPE'
        + ' ORDER BY COST_TYPE_ID';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы видов расходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу
procedure TfrmCostType.CopyToMemoryData;
begin
	GridCostType.DataSource.DataSet.DisableControls;
        GridCostType.SumList.ClearSumValues;
   	mdCostType.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdCostType.Append;
                mdCostType.FieldByName('COST_TYPE_ID').AsInteger := DataMod.IB_Cursor.FieldByName('COST_TYPE_ID').AsInteger;
                mdCostType.FieldByName('NAME').AsString          := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdCostType.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdCostType.First;

        GridCostType.DataSource.DataSet.EnableControls;
end;

procedure TfrmCostType.GridCostTypeSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridCostType = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridCostType.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridCostType.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridCostType.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdCostType.SortOnFields(fields, false, desc);
end;

procedure TfrmCostType.mdCostTypeAfterScroll(DataSet: TDataSet);
begin
        fChildInfo.haEdit   := not mdCostType.IsEmpty;
        fChildInfo.haDelete := not mdCostType.IsEmpty;
end;     

end.
