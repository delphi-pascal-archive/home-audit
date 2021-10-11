// омандировки
unit fErrand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild;

type
  TfrmErrand = class(TForm)
    GridErrand: TDBGridEh;
    mdErrand: TRxMemoryData;
    dsErrand: TDataSource;
    pmErrand: TPopupMenu;
    pmCostTypeAdd: TMenuItem;
    pmCostTypeEdit: TMenuItem;
    pmCostTypeDelete: TMenuItem;
    N1: TMenuItem;
    pmCostTypeRefresh: TMenuItem;
    mdErrandERRAND_ID: TIntegerField;
    mdErrandBDATE: TDateField;
    mdErrandEDATE: TDateField;
    mdErrandCOMMENT: TStringField;
    mdErrandRRAND_PERIOD: TStringField;
    mdErrandDAYS_PERIOD: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcAddExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure GridErrandSortMarkingChanged(Sender: TObject);
    procedure mdErrandAfterScroll(DataSet: TDataSet);
    procedure mdErrandCalcFields(DataSet: TDataSet);
  private
    fChildInfo: PChildInfo;
    //получение списка командировок
    procedure GetErrandList;
    //запрос в FireBird
    function QueryFromFireBird: boolean;
    //копирование данных во временную таблицу
    procedure CopyToMemoryData;
  public
    { Public declarations }
  end;

var
  frmErrand: TfrmErrand;

implementation

uses
	dmHomeAudit,
        fErrandEd,
        uCommon,
        DateUtils;

{$R *.dfm}

procedure TfrmErrand.FormCreate(Sender: TObject);
begin
        //cтруктуру дл€ обслуживани€ из главной формы
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := nil;
        fChildInfo.Actions[childAdd]         := AcAddExecute;
        fChildInfo.Actions[childEdit]        := AcEditExecute;
        fChildInfo.Actions[childDelete]      := AcDeleteExecute;
	fChildInfo.Actions[childRefresh]     := AcRefreshExecute;
        fChildInfo.haAdd        := true;
        fChildInfo.haAddPattern := false;
        fChildInfo.haRefresh    := true;

        mdErrand.Active := true;
end;

procedure TfrmErrand.FormShow(Sender: TObject);
begin
        GetErrandList;
end;

procedure TfrmErrand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	mdErrand.Active := false;
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	”правление запис€ми
//
//------------------------------------------------------------------------------

//добавить запись
procedure TfrmErrand.AcAddExecute(Sender: TObject);
var
	ErrandEd: TfrmErrandEd;
begin
	ErrandEd := TfrmErrandEd.Create(Application);
	if ErrandEd = nil then
		exit;

	ErrandEd.Add(dsErrand);
	ErrandEd.Free;
end;

//редактировать запись
procedure TfrmErrand.AcEditExecute(Sender: TObject);
var
	ErrandEd: TfrmErrandEd;
begin
	//редактирование недоступно
        if (mdErrand.IsEmpty) then
        	exit;

	ErrandEd := TfrmErrandEd.Create(Application);
	if ErrandEd = nil then
		exit;

	ErrandEd.Edit(dsErrand, mdErrand.FieldByName('ERRAND_ID').AsInteger);
	ErrandEd.Free;
end;

//удалить запись
procedure TfrmErrand.AcDeleteExecute(Sender: TObject);
begin
	//удаление недоступно
        if (mdErrand.IsEmpty) then
        	exit;

	//диалог подтверждени€ удалени€
        if (YesNoBox(format('”далить командировку (ID #%d)?', [mdErrand.FieldByName('ERRAND_ID').AsInteger])) = IDYES) then
	begin
          	//удаление
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM ERRANDS WHERE ERRAND_ID = ' + mdErrand.FieldByName('ERRAND_ID').AsString;

                //MsgBox(DataMod.IB_Cursor.SQL.Text);
        	//запуск запроса
        	try
	        	DataMod.IB_Cursor.Open;
        	except
                	ErrorBox('Ќе удалось удалить запись таблицы.' + #13 +
                	'¬озможно, запись используетс€ в других таблицах.');
                        
                	exit;
		end;

                DataMod.IB_Cursor.Close;
	        DataMod.IB_Transaction.Commit;

                mdErrand.Delete;
        end;
end;

//обновить данные
procedure TfrmErrand.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//обновление недоступно
        if (mdErrand.IsEmpty) then
        	exit;

        for i := 0 to GridErrand.Columns.Count - 1 do
        	GridErrand.Columns[i].Title.SortMarker := smNoneEh;

	GetErrandList;
end;

//------------------------------------------------------------------------------
//получение списка командировок
procedure TfrmErrand.GetErrandList;
begin
	//MsgBox('GetCostTypeList');
        if (QueryFromFireBird) then
	        CopyToMemoryData;

end;

//запрос в FireBird
function TfrmErrand.QueryFromFireBird: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT ERRAND_ID'
                + ', BDATE'
                + ', EDATE'
                + ', COMMENT'
        + ' FROM ERRANDS'
        + ' ORDER BY ERRAND_ID';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('ќшибка при заполнении таблицы командировок.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу
procedure TfrmErrand.CopyToMemoryData;
begin
	GridErrand.DataSource.DataSet.DisableControls;
        GridErrand.SumList.ClearSumValues;
   	mdErrand.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdErrand.Append;
                mdErrand.FieldByName('ERRAND_ID').AsInteger := DataMod.IB_Cursor.FieldByName('ERRAND_ID').AsInteger;
                mdErrand.FieldByName('BDATE').AsDateTime    := DataMod.IB_Cursor.FieldByName('BDATE').AsDateTime;
                mdErrand.FieldByName('EDATE').AsDateTime    := DataMod.IB_Cursor.FieldByName('EDATE').AsDateTime;
                mdErrand.FieldByName('COMMENT').AsString    := DataMod.IB_Cursor.FieldByName('COMMENT').AsString;
                mdErrand.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdErrand.First;

        GridErrand.DataSource.DataSet.EnableControls;
end;

procedure TfrmErrand.GridErrandSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridErrand = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridErrand.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridErrand.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridErrand.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdErrand.SortOnFields(fields, false, desc);
end;

procedure TfrmErrand.mdErrandAfterScroll(DataSet: TDataSet);
begin
        fChildInfo.haEdit   := not mdErrand.IsEmpty;
        fChildInfo.haDelete := not mdErrand.IsEmpty;
end;     

procedure TfrmErrand.mdErrandCalcFields(DataSet: TDataSet);
begin
        mdErrand.FieldByName('≈RRAND_PERIOD').AsString := mdErrand.FieldByName('BDATE').AsString + ' - ' + mdErrand.FieldByName('EDATE').AsString;
        mdErrand.FieldByName('DAYS_PERIOD').AsInteger  := DaysBetween(mdErrand.FieldByName('BDATE').AsDateTime, mdErrand.FieldByName('EDATE').AsDateTime) + 1;
end;

end.
