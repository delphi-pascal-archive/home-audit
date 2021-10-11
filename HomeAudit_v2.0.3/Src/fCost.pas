//Расходы
unit fCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild, ComCtrls, TeEngine, Series, TeeProcs,
  Chart, LMDBarBase, LMDExplorerBar, Buttons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDDBBtn, TB97, TB97Tlbr;

type
  TfrmCost = class(TForm)
    pnlFilter: TPanel;
    lblCostType: TLabel;
    pnlFilterTop: TPanel;
    cbCostType: TDBComboBoxEh;
    RxSplitter1: TRxSplitter;
    mdCost: TRxMemoryData;
    dsCost: TDataSource;
    pmCost: TPopupMenu;
    pmCostAdd: TMenuItem;
    pmCostEdit: TMenuItem;
    pmCostDelete: TMenuItem;
    N1: TMenuItem;
    pmCostRefresh: TMenuItem;
    mdCostCOST_ID: TIntegerField;
    mdCostREG_DATE: TDateField;
    mdCostCOST_TYPE: TStringField;
    mdCostSUMM: TFloatField;
    mdCostCOMMENT: TStringField;
    mdCostDATE_OF_WEEK: TStringField;
    lblPeriod: TLabel;
    lblPeriodStart: TLabel;
    edPeriodBegin: TDBDateTimeEditEh;
    lblPeriodEnd: TLabel;
    edPeriodEnd: TDBDateTimeEditEh;                                                                 
    lblError: TLabel;
    Pages: TPageControl;
    tsCost: TTabSheet;
    GridCost: TDBGridEh;
    tsCostPeriod: TTabSheet;
    mdCostPeriod: TRxMemoryData;
    dsCostPeriod: TDataSource;
    lblGroupCriterion: TLabel;
    cbGroupCriterion: TDBComboBoxEh;
    mdCostPeriodSUMM: TFloatField;
    mdCostPeriodPERIOD_NO: TWordField;
    tsDiagram: TTabSheet;
    Chart: TChart;
    Series1: TBarSeries;
    mdCostPeriodAVG_SUMM: TFloatField;
    mdCostPeriodDAYS_PERIOD: TIntegerField;
    pnlExclude: TPanel;
    mdCostType: TRxMemoryData;
    dsCostType: TDataSource;
    mdCostTypeCOST_TYPE: TStringField;
    mdCostTypeCOST_TYPE_ID: TIntegerField;
    pnlCostTypeTitle: TPanel;
    cbDopParam: TCheckBox;
    pmCostType: TPopupMenu;
    N2: TMenuItem;
    pmAll: TMenuItem;
    pmNon: TMenuItem;
    pmAllWithout: TMenuItem;
    pmNonWithout: TMenuItem;
    pmCostTypeRefresh: TMenuItem;
    lblComment: TLabel;
    edComment: TDBEditEh;
    sbEndPeriodBegin: TSpeedButton;
    sbEndPeriodEnd: TSpeedButton;
    sbStartPeriodBegin: TSpeedButton;
    sbStartPeriodEnd: TSpeedButton;
    mdCostPeriodPERIOD: TStringField;
    mdCostPeriodMIN_COST: TFloatField;
    mdCostPeriodMAX_COST: TFloatField;
    mdCostPeriodCOST_COUNT: TIntegerField;
    DockCost: TDock97;
    ToolbarCost: TToolbar97;
    btnCostOptimizeWidth: TSpeedButton;
    navCost: TLMDDBNavigator;
    pnlCostPeriod: TPanel;
    pnlCostTypePeriod: TPanel;
    DockCostPeriod: TDock97;
    ToolbarCostPeriod: TToolbar97;
    btnCostPeriodOptimizeWidth: TSpeedButton;
    navCostPeriod: TLMDDBNavigator;
    GridCostPeriod: TDBGridEh;
    DockCostTypePeriod: TDock97;
    ToolbarCostTypesPeriod: TToolbar97;
    btnCostTypePeriodOptimizeWidth: TSpeedButton;
    navCostTypePeriod: TLMDDBNavigator;
    GridCostTypePeriod: TDBGridEh;
    RxSplitter2: TRxSplitter;
    mdCostTypePeriod: TRxMemoryData;
    dsCostTypePeriod: TDataSource;
    mdCostTypePeriodCOST_TYPE: TStringField;
    mdCostTypePeriodSUMM: TFloatField;
    mdCostPeriodBDATE: TDateField;
    mdCostPeriodEDATE: TDateField;
    pmAddPattern: TMenuItem;
    mdCostUNACCOUNTED: TSmallintField;
    mdCostTypeEXCLUDE: TSmallintField;
    GridCostType: TDBGridEh;
    mdCostPeriodUNACCOUNTED: TSmallintField;
    pmCostPeriod: TPopupMenu;
    pmCostCurrentPeriod: TMenuItem;
    mdCostERRAND: TIntegerField;
    mdCostPeriodERRAND: TIntegerField;
    cdPeriod: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcFilterPanelExecute(Sender: TObject);
    procedure AcAddExecute(Sender: TObject);
    procedure AcAddPatternExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure pnlFilterResize(Sender: TObject);
    procedure GridCostSortMarkingChanged(Sender: TObject);
    procedure GridCostGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mdCostAfterScroll(DataSet: TDataSet);
    procedure cbCostTypeChange(Sender: TObject);
    procedure mdCostCalcFields(DataSet: TDataSet);
    procedure PagesChange(Sender: TObject);
    procedure GridCostPeriodSortMarkingChanged(Sender: TObject);
    procedure GridCostTypeCellClick(Column: TColumnEh);
    procedure cbDopParamClick(Sender: TObject);
    procedure pmAllClick(Sender: TObject);
    procedure pmNonClick(Sender: TObject);
    procedure pmAllWithoutClick(Sender: TObject);
    procedure pmNonWithoutClick(Sender: TObject);
    procedure pmCostTypeRefreshClick(Sender: TObject);
    procedure sbEndPeriodBeginClick(Sender: TObject);
    procedure sbEndPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodBeginClick(Sender: TObject);
    procedure btnCostOptimizeWidthClick(Sender: TObject);
    procedure btnCostPeriodOptimizeWidthClick(Sender: TObject);
    procedure GridCostTypePeriodSortMarkingChanged(Sender: TObject);
    procedure mdCostPeriodAfterScroll(DataSet: TDataSet);
    procedure btnCostTypePeriodOptimizeWidthClick(Sender: TObject);
    procedure GridCostPeriodGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure GridCostTypePeriodGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure pmCostCurrentPeriodClick(Sender: TObject);
    procedure pmCostPeriodPopup(Sender: TObject);
    procedure cdPeriodChange(Sender: TObject);
    procedure edPeriodBeginChange(Sender: TObject);
  private
    fChildInfo: PChildInfo;
    fGetCostList: boolean;
    fCostTypePeriod: boolean;
    fCanCostDelete: boolean;
    
    procedure LoadFromIni;
    procedure SaveToIni;

    //задание списка видов расходов
    procedure SetCostTypeList(cb: TDBComboBoxEh);

    //получение списка видов расходов
    procedure GetCostTypeList;
    //запрос в FireBird (виды расходов)
    function QueryFromFireBirdCostType: boolean;
    //копирование данных во временную таблицу (виды расходов)
    procedure CopyToMemoryDataCostType;

    //получение списка расходов
    procedure GetCostList;
    //запрос в FireBird (расходы)
    function QueryFromFireBirdCost: boolean;
    //копирование данных во временную таблицу (расходы)
    procedure CopyToMemoryDataCost;
                           
    //получение списка расходов за период по видам расходов
    procedure GetCostTypePeriodList;
    //запрос в FireBird (виды расходов за период)
    function QueryFromFireBirdCostTypePeriod: boolean;
    //копирование данных во временную таблицу (виды расходов за период)
    procedure CopyToMemoryDataCostTypePeriod;

    //получение данных о текущем периоде
    procedure GetPeriodInfo
    (
            reg_date:    TDate;
        var period_no:   word;
        var period:      string;
        var period_days: word;
        var bdate:       TDate;
        var edate:       TDate
    );

    //вывод пропущенных нулевых расхов - группировка по дням
    procedure PrintNullCost
    (
        reg_date:        TDate;
        prev_period_day: TDate
    );

    //расходы за текущий месяц
    procedure CurrentMonthCost;
  public
    { Public declarations }
  end;

var
  frmCost: TfrmCost;

implementation

uses
	dmHomeAudit,
        fMain,
        fCostEd,
        uCommon,
        DateUtil,
        DateUtils;

{$R *.dfm}

procedure TfrmCost.FormCreate(Sender: TObject);
begin             
        //cтруктуру для обслуживания из главной формы
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := AcFilterPanelExecute;
        fChildInfo.Actions[childAdd]         := AcAddExecute;
        fChildInfo.Actions[childAddPattern]  := AcAddPatternExecute;
        fChildInfo.Actions[childEdit]        := AcEditExecute;
        fChildInfo.Actions[childDelete]      := AcDeleteExecute;
	fChildInfo.Actions[childRefresh]     := AcRefreshExecute;
        fChildInfo.haAdd                     := true;
        fChildInfo.haRefresh                 := true;

        Pages.ActivePageIndex    := 0;
        pnlExclude.Visible       := false;

        mdCostType.Active        := true;
        mdCost.Active            := true;
        mdCostPeriod.Active      := true;
        mdCostTypePeriod.Active  := true;

        fGetCostList             := false;

        SetCostTypeList(cbCostType);
        LoadFromIni;
        cdPeriod.ItemIndex       := 0;

        edPeriodBegin.Value      := StartOfTheWeek(Now);
        edPeriodEnd.Value        := Now;

        fGetCostList             := true;

        pnlFilter.Visible        := fChildInfo.haFilterPanelOn;
	RxSplitter1.Visible      := fChildInfo.haFilterPanelOn;
end;

procedure TfrmCost.FormShow(Sender: TObject);
begin
        fCostTypePeriod := false;

        GetCostTypeList;
        GetCostList;
        CurrentMonthCost;

        fCostTypePeriod := true;

        GetCostTypePeriodList;
end;

procedure TfrmCost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        SaveToIni;
        mdCostType.Active       := false;
	mdCost.Active           := false;
        mdCostPeriod.Active     := false;
        mdCostTypePeriod.Active := false;
	Action := caFree;
end;

//задание списка видов расходов
procedure TfrmCost.SetCostTypeList(cb: TDBComboBoxEh);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT COST_TYPE_ID, NAME'
	+ ' FROM COST_TYPE'
	+ ' ORDER BY NAME';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении списка видов расходов.');
                exit;
	end;

        //количество видов расходов  > 100
        if (DataMod.IB_Cursor.RecordCount > 100) then
        begin
                WarningBox('Количество видов расходов более 100.' + #13 +
                'Поле "Виды расходов" будет недоступно.' + #13#13 +
                'Обратитесь к разработчику.');
                cb.Enabled := false;
           	DataMod.IB_Cursor.Close;
                exit;
        end;

        cb.Items.Clear;
        cb.Items.Add('[все виды]');
        cb.KeyItems.Add('0');

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	cb.Items.Add(DataMod.IB_Cursor.FieldByName('NAME').AsString);
                cb.KeyItems.Add(DataMod.IB_Cursor.FieldByName('COST_TYPE_ID').AsString);
                DataMod.IB_Cursor.Next;
        end;

        cb.ItemIndex := 0;
        DataMod.IB_Cursor.Close;
end;

//------------------------------------------------------------------------------
//
//	INI
//
//------------------------------------------------------------------------------

//загрузка параметров из ini-файла
procedure TfrmCost.LoadFromIni;
var
	sect: string;
begin
	sect := 'Cost';
	fChildInfo.haFilterPanelOn := OptionsIni.ReadBool(sect, 'FilterPanelOn', true);
	pnlFilter.Width            := OptionsIni.ReadInteger(sect, 'FilterPanelWidth', 190);
        pnlCostPeriod.Height       := OptionsIni.ReadInteger(sect, 'CostPeriodPanelHeight', 300);
        cbGroupCriterion.ItemIndex := OptionsIni.ReadInteger(sect, 'GroupCriterion', 0);

        sect := 'Options';
        fCanCostDelete := OptionsIni.ReadBool(sect, 'CanCostDelete', true);
end;

//сохранение параметров в ini-файл
procedure TfrmCost.SaveToIni;
var
	sect: string;
begin
	sect := 'Cost';
	OptionsIni.WriteBool(sect, 'FilterPanelOn', fChildInfo.haFilterPanelOn);
	OptionsIni.WriteInteger(sect, 'FilterPanelWidth', pnlFilter.Width);

        if (Caption = 'Расходы') then
                OptionsIni.WriteInteger(sect, 'CostPeriodPanelHeight', pnlCostPeriod.Height);

        OptionsIni.WriteInteger(sect, 'GroupCriterion', cbGroupCriterion.ItemIndex);
end;

//панель фильтрации
procedure TfrmCost.AcFilterPanelExecute(Sender: TObject);
begin
        fChildInfo.haFilterPanelOn := not fChildInfo.haFilterPanelOn;
	RxSplitter1.Visible        := fChildInfo.haFilterPanelOn;
	pnlFilter.Visible 	   := fChildInfo.haFilterPanelOn;
end;

//------------------------------------------------------------------------------
//
//	Управление записями
//
//------------------------------------------------------------------------------

//добавить запись
procedure TfrmCost.AcAddExecute(Sender: TObject);
var
	CostEd: TfrmCostEd;
begin
	CostEd := TfrmCostEd.Create(Application);
	if CostEd = nil then
		exit;

	CostEd.Add(dsCost);
	CostEd.Free;

        CurrentMonthCost;
end;

//добавить запись по образцу
procedure TfrmCost.AcAddPatternExecute(Sender: TObject);
var
	CostEd: TfrmCostEd;
begin
	CostEd := TfrmCostEd.Create(Application);
	if CostEd = nil then
		exit;

        CostEd.cbCostType.Text       := mdCost.FieldByName('COST_TYPE').AsString;
        CostEd.edSumm.Value          := mdCost.FieldByName('SUMM').AsVariant;
        CostEd.edComment.Text        := mdCost.FieldByName('COMMENT').AsString;
        CostEd.cbUnaccounted.Checked := boolean(mdCost.FieldByName('UNACCOUNTED').AsInteger);

	CostEd.Add(dsCost);
	CostEd.Free;

        CurrentMonthCost;
end;

//редактировать запись
procedure TfrmCost.AcEditExecute(Sender: TObject);
var
	CostEd: TfrmCostEd;
begin
	//редактирование недоступно
        if (mdCost.IsEmpty) then
        	exit;

	CostEd := TfrmCostEd.Create(Application);
	if CostEd = nil then
		exit;

	CostEd.Edit(dsCost, mdCost.FieldByName('COST_ID').AsInteger);
	CostEd.Free;

        CurrentMonthCost;
end;

//удалить запись
procedure TfrmCost.AcDeleteExecute(Sender: TObject);
begin
	//удаление недоступно
        if (mdCost.IsEmpty) then
        	exit;

	//диалог подтверждения удаления
        if (YesNoBox(format('Удалить расход "%f руб." (ID #%d)?', [mdCost.FieldByName('SUMM').AsFloat, mdCost.FieldByName('COST_ID').AsInteger])) = IDYES) then
	begin
          	//удаление
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM COSTS WHERE COST_ID = ' + mdCost.FieldByName('COST_ID').AsString;

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

                mdCost.Delete;

                CurrentMonthCost;
        end;
end;

//обновить данные
procedure TfrmCost.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//обновление недоступно
        if (mdCost.IsEmpty) then
        	exit;

        for i := 0 to GridCost.Columns.Count - 1 do
        	GridCost.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridCostPeriod.Columns.Count - 1 do
        	GridCostPeriod.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
        	GridCostTypePeriod.Columns[i].Title.SortMarker := smNoneEh;

        fCostTypePeriod := false;

        GetCostTypeList;
	GetCostList;
        CurrentMonthCost;

        fCostTypePeriod := true;

        GetCostTypePeriodList;
end;

//------------------------------------------------------------------------------
//получение списка видов расходов
procedure TfrmCost.GetCostTypeList;
begin
	//MsgBox('GetCostTypeList');
        if (QueryFromFireBirdCostType) then
	        CopyToMemoryDataCostType;
end;

//запрос в FireBird (виды расходов)
function TfrmCost.QueryFromFireBirdCostType: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT COST_TYPE_ID'
                + ', NAME'
        + ' FROM COST_TYPE'
        + ' ORDER BY NAME';

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

//копирование данных во временную таблицу (виды расходов)
procedure TfrmCost.CopyToMemoryDataCostType;
begin
	GridCostType.DataSource.DataSet.DisableControls;
        GridCostType.SumList.ClearSumValues;
   	mdCostType.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdCostType.Append;
                mdCostType.FieldByName('COST_TYPE_ID').AsInteger := DataMod.IB_Cursor.FieldByName('COST_TYPE_ID').AsInteger;
                mdCostType.FieldByName('COST_TYPE').AsString     := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdCostType.FieldByName('EXCLUDE').AsInteger      := 1;
                mdCostType.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdCostType.First;

        GridCostType.DataSource.DataSet.EnableControls;
end;

//------------------------------------------------------------------------------
//получение списка расходов
procedure TfrmCost.GetCostList;
var
	i: word;
begin
        //MsgBox('GetCostList');

        Chart.Title.Text.Clear;
        Chart.Title.Text.Add('Расходы за период');
        Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
        Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));

        for i := 0 to GridCost.Columns.Count - 1 do
        	GridCost.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridCostPeriod.Columns.Count - 1 do
        	GridCostPeriod.Columns[i].Title.SortMarker := smNoneEh;

        if (QueryFromFireBirdCost) then
	        CopyToMemoryDataCost;
end;

//запрос в FireBird (расходы)
function TfrmCost.QueryFromFireBirdCost: boolean;
var
        rec_no: integer;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Clear;
        DataMod.IB_Cursor.SQL.Add('SELECT C.COST_ID'
                + ', C.REG_DATE'
                + ', T.NAME'
                + ', C.SUMM'
                + ', C.COMMENT'
                + ', C.UNACCOUNTED'
                + ', ('
                + '    SELECT FIRST (1) 1'
                + '    FROM ERRANDS e'
                + '    WHERE C.REG_DATE BETWEEN E.BDATE AND E.EDATE'
                + '  ) AS ERRAND'
        + ' FROM COSTS c'
        + ' INNER JOIN COST_TYPE t ON T.COST_TYPE_ID = C.COST_TYPE_ID'
        + ' WHERE C.REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + '''');

        //выбран вид расходов
        if (cbCostType.ItemIndex <> 0) then
                DataMod.IB_Cursor.SQL.Add('AND T.COST_TYPE_ID = ' + cbCostType.KeyItems.Strings[cbCostType.ItemIndex]);

        //комментарий
        if (edComment.Text <> '') then
                DataMod.IB_Cursor.SQL.Add('AND LOWER(C.COMMENT) LIKE LOWER(''%' + edComment.Text + '%'')');

        //дополнительные параметры фильтрации
        GridCostType.DataSource.DataSet.DisableControls;
        rec_no := mdCostType.RecNo;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                if (mdCostType.FieldByName('EXCLUDE').AsInteger = 0) then
                        DataMod.IB_Cursor.SQL.Add('AND C.COST_TYPE_ID <> ' + mdCostType.FieldByName('COST_TYPE_ID').AsString);

                mdCostType.Next;
        end;
        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        DataMod.IB_Cursor.SQL.Add('ORDER BY C.REG_DATE, C.COST_ID');

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы расходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (расходы)
procedure TfrmCost.CopyToMemoryDataCost;
var
        i, cost_count,
        record_count,
        step_record,
        step_days: integer;

        summ_period,
        min_cost,
        max_cost: double;

        period_no,
        period_no_column,
        unacc_flag,
        errand_flag,
        period_days: word;

        reg_date,
        bdate,
        edate,
        prev_period_day: TDate;

        period: string;
begin
	GridCost.DataSource.DataSet.DisableControls;
        GridCostPeriod.DataSource.DataSet.DisableControls;

        GridCost.SumList.ClearSumValues;
	GridCostPeriod.SumList.ClearSumValues;
        GridCostTypePeriod.SumList.ClearSumValues;

        for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
                if (GridCostTypePeriod.Columns.Items[i].FieldName = 'COST_TYPE') then
                	GridCostTypePeriod.Columns[i].Footer.Value := '0 записей';

   	mdCost.EmptyTable;
        mdCostPeriod.EmptyTable;
        mdCostTypePeriod.EmptyTable;

        Chart.Series[0].Clear;

        cost_count        := 0;
        step_record       := 1000;
        record_count      := 0;
        step_days         := 0;
        summ_period       := 0;
        period_no         := 0;
        period_no_column  := 0;
        period_days       := 0;
        min_cost          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
        max_cost          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
        unacc_flag        := DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger;
        errand_flag       := DataMod.IB_Cursor.FieldByName('ERRAND').AsInteger;
        reg_date          := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
        bdate             := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
        edate             := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
        prev_period_day   := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;

        //поиск номера колонки "Номер периода"
        for i := 0 to GridCostPeriod.Columns.Count - 1 do
                if (GridCostPeriod.Columns.Items[i].FieldName = 'PERIOD_NO') then
                 	period_no_column := i;

        //группировка по дням
        if (cbGroupCriterion.ItemIndex = 0) then
                GridCostPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер дня'
        //группировка по неделям
        else if (cbGroupCriterion.ItemIndex = 1) then
                GridCostPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер недели'
        //группировка по месяцам
        else if (cbGroupCriterion.ItemIndex = 2) then
                GridCostPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер месяца'
        //группировка по годам
        else if (cbGroupCriterion.ItemIndex = 3) then
                GridCostPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер года';

        //получение данных о текущем периоде
        GetPeriodInfo(reg_date, period_no, period, period_days, bdate, edate);

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
                //расходы
                mdCost.Append;
                mdCost.FieldByName('UNACCOUNTED').AsInteger := DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger;
                mdCost.FieldByName('ERRAND').AsInteger      := DataMod.IB_Cursor.FieldByName('ERRAND').AsInteger;
                mdCost.FieldByName('COST_ID').AsInteger     := DataMod.IB_Cursor.FieldByName('COST_ID').AsInteger;
                mdCost.FieldByName('REG_DATE').AsDateTime   := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
                mdCost.FieldByName('COST_TYPE').AsString    := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdCost.FieldByName('SUMM').AsFloat          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                mdCost.FieldByName('COMMENT').AsString      := DataMod.IB_Cursor.FieldByName('COMMENT').AsString;
                mdCost.Post;

                reg_date := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;

                //расходы за период
                if (((cbGroupCriterion.ItemIndex = 0) and (period_no <> DayOfTheYear(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 1) and (period_no <> WeekOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 2) and (period_no <> MonthOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 3) and (period_no <> YearOf(reg_date))))
                then
                begin
                        //если за период есть хотя бы один расход без признака
                        //"не учитывать при группировке за период"
                        if (summ_period > 0) then
                        begin
                                mdCostPeriod.Append;
                                mdCostPeriod.FieldByName('UNACCOUNTED').AsInteger := unacc_flag;
                                mdCostPeriod.FieldByName('ERRAND').AsInteger      := errand_flag;
                                mdCostPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                                mdCostPeriod.FieldByName('PERIOD').AsString       := period;
                                mdCostPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                                mdCostPeriod.FieldByName('COST_COUNT').AsInteger  := cost_count;
                                mdCostPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                                //средний расход за период
                                if (not mdCostPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                                        mdCostPeriod.FieldByName('AVG_SUMM').AsFloat := mdCostPeriod.FieldByName('SUMM').AsFloat / mdCostPeriod.FieldByName('DAYS_PERIOD').AsInteger
                                else
                                        mdCostPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                                mdCostPeriod.FieldByName('MIN_COST').AsFloat      := min_cost;
                                mdCostPeriod.FieldByName('MAX_COST').AsFloat      := max_cost;
                                mdCostPeriod.FieldByName('BDATE').AsDateTime      := bdate;
                                mdCostPeriod.FieldByName('EDATE').AsDateTime      := edate;
                                mdCostPeriod.Post;

                                //вывод пропущенных нулевых расхов - группировка по дням
                                if ((cbGroupCriterion.ItemIndex = 0) and (reg_date <> prev_period_day + 1)) then
                                        PrintNullCost(reg_date, prev_period_day);

                                Chart.Series[0].Add(summ_period, period, clInactiveCaption);
                        end;

                        cost_count      := 0;
                        summ_period     := 0;
                        unacc_flag      := 0;
                        errand_flag     := 0;
                        prev_period_day := reg_date;
                        min_cost        := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                        max_cost        := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        //получение данных о текущем периоде
                        GetPeriodInfo(reg_date, period_no, period, period_days, bdate, edate);
                end;

                //расход с признаком "не учитывать при группировке за период"
                if (DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger = 1) then
                        unacc_flag := 1
                else
                begin
                        if (DataMod.IB_Cursor.FieldByName('SUMM').AsFloat < min_cost) then
                                min_cost := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        if (DataMod.IB_Cursor.FieldByName('SUMM').AsFloat > max_cost) then
                                max_cost := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        inc(cost_count);
                        summ_period := summ_period + DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                end;

                //расход с признаком "командировка"
                if (DataMod.IB_Cursor.FieldByName('ERRAND').AsInteger = 1) then
                        errand_flag := 1;

                if (record_count = step_record) then
                begin
                	frmMain.StatusBar.Panels[1].Text := format('Загружено: %d записей', [record_count]);
                        frmMain.StatusBar.Refresh;
                    	step_record := step_record + 1000;
                end;

                inc(record_count);
                DataMod.IB_Cursor.Next;
        end;

        DataMod.IB_Cursor.Close;

        //расходы за период
        if ((not mdCost.IsEmpty) and (summ_period > 0)) then
        begin
               //вывод пропущенных нулевых расхов - группировка по дням
                if ((cbGroupCriterion.ItemIndex = 0) and (reg_date <> prev_period_day + 1)) then
                        PrintNullCost(reg_date, prev_period_day);

                mdCostPeriod.Append;
                mdCostPeriod.FieldByName('UNACCOUNTED').AsInteger := unacc_flag;
                mdCostPeriod.FieldByName('ERRAND').AsInteger      := errand_flag;
                mdCostPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                mdCostPeriod.FieldByName('PERIOD').AsString       := period;
                mdCostPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                mdCostPeriod.FieldByName('COST_COUNT').AsInteger  := cost_count;
                mdCostPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                //средний расход за период
                if (not mdCostPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                        mdCostPeriod.FieldByName('AVG_SUMM').AsFloat := mdCostPeriod.FieldByName('SUMM').AsFloat / mdCostPeriod.FieldByName('DAYS_PERIOD').AsInteger
                else
                        mdCostPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                mdCostPeriod.FieldByName('MIN_COST').AsFloat      := min_cost;
                mdCostPeriod.FieldByName('MAX_COST').AsFloat      := max_cost;
                mdCostPeriod.FieldByName('BDATE').AsDateTime      := bdate;
                mdCostPeriod.FieldByName('EDATE').AsDateTime      := edate;
                mdCostPeriod.Post;

                Chart.Series[0].Add(summ_period, period, clInactiveCaption);
        end;

        mdCost.First;
        mdCostPeriod.First; //сработает событие "mdCostPeriodAfterScroll"
        frmMain.StatusBar.Panels[1].Text := GetLongHint(Application.Hint);

        GridCost.DataSource.DataSet.EnableControls;
        GridCostPeriod.DataSource.DataSet.EnableControls;
end;

//------------------------------------------------------------------------------
//получение списка видов расходов за период
procedure TfrmCost.GetCostTypePeriodList;
var
        i: word;
begin
        if (not fCostTypePeriod) then
                exit;

        for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
        	GridCostTypePeriod.Columns[i].Title.SortMarker := smNoneEh;

	//MsgBox('GetCostTypePeriodList');
        if (QueryFromFireBirdCostTypePeriod) then
	        CopyToMemoryDataCostTypePeriod;
end;

//запрос в FireBird (виды расходов за период)
function TfrmCost.QueryFromFireBirdCostTypePeriod: boolean;
var
        bdate,
        edate: string[10];
        dop_param: string;
        rec_no: integer;
begin
	result := false;

        bdate     := mdCostPeriod.FieldByName('BDATE').AsString;
        edate     := mdCostPeriod.FieldByName('EDATE').AsString;
        dop_param := '';

        if (bdate = '') or (edate = '') then
                exit;

        DataMod.IB_Cursor.SQL.Clear;
        DataMod.IB_Cursor.SQL.Add('SELECT T.NAME'
                + ', SUM(C.SUMM) SUMM'
        + ' FROM COSTS C'
        + ' INNER JOIN COST_TYPE T ON T.COST_TYPE_ID = C.COST_TYPE_ID'
        + ' WHERE C.REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + ''''
        + ' AND   C.REG_DATE BETWEEN ''' + bdate + ''' AND ''' + edate + ''''
        + ' AND   C.UNACCOUNTED = 0');

        //выбран вид расходов
        if (cbCostType.ItemIndex <> 0) then
                DataMod.IB_Cursor.SQL.Add('AND T.COST_TYPE_ID = ' + cbCostType.KeyItems.Strings[cbCostType.ItemIndex]);

        //комментарий
        if (edComment.Text <> '') then
                DataMod.IB_Cursor.SQL.Add('AND LOWER(C.COMMENT) LIKE LOWER(''%' + edComment.Text + '%'')');

        //дополнительные параметры фильтрации
        GridCostType.DataSource.DataSet.DisableControls;
        rec_no := mdCostType.RecNo;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                if (mdCostType.FieldByName('EXCLUDE').AsInteger = 0) then
                        //DataMod.IB_Cursor.SQL.Add('AND T.COST_TYPE_ID <> ' + mdCostType.FieldByName('COST_TYPE_ID').AsString);
                        dop_param := dop_param + ' AND T.COST_TYPE_ID <> ' + mdCostType.FieldByName('COST_TYPE_ID').AsString;

                mdCostType.Next;
        end;
        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        DataMod.IB_Cursor.SQL.Add(dop_param);
        DataMod.IB_Cursor.SQL.Add('GROUP BY T.NAME');

        //======================================================================
        //для вывода нулевых сумм
        DataMod.IB_Cursor.SQL.Add('UNION');
        DataMod.IB_Cursor.SQL.Add('SELECT NAME'
                + ', 0'
                + ' FROM COST_TYPE T'
                + ' WHERE NOT EXISTS'
                + ' ('
                + '   SELECT FIRST(1) 1'
                + '   FROM COSTS C'
                + '   WHERE C.COST_TYPE_ID = T.COST_TYPE_ID'
                + '   AND   C.REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + ''''
                + '   AND   C.REG_DATE BETWEEN ''' + bdate + ''' AND ''' + edate + ''''
                + '   AND   C.UNACCOUNTED = 0');

        //выбран вид расходов
        if (cbCostType.ItemIndex <> 0) then
                DataMod.IB_Cursor.SQL.Add('AND T.COST_TYPE_ID = ' + cbCostType.KeyItems.Strings[cbCostType.ItemIndex]);

         //комментарий
        if (edComment.Text <> '') then
                DataMod.IB_Cursor.SQL.Add('AND LOWER(C.COMMENT) LIKE LOWER(''%' + edComment.Text + '%'')');

        //дополнительные параметры фильтрации
        DataMod.IB_Cursor.SQL.Add(dop_param);

        DataMod.IB_Cursor.SQL.Add(')');
        //======================================================================

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы видов расходов за период.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (виды расходов за период)
procedure TfrmCost.CopyToMemoryDataCostTypePeriod;
var
        i, record_count: word;
begin
        record_count := 0;
	GridCostTypePeriod.DataSource.DataSet.DisableControls;
        GridCostTypePeriod.SumList.ClearSumValues;
   	mdCostTypePeriod.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdCostTypePeriod.Append;
                mdCostTypePeriod.FieldByName('COST_TYPE').AsString := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdCostTypePeriod.FieldByName('SUMM').AsFloat       := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                mdCostTypePeriod.Post;
                DataMod.IB_Cursor.Next;
                inc(record_count);
        end;
        DataMod.IB_Cursor.Close;
        mdCostTypePeriod.First;

        GridCostTypePeriod.DataSource.DataSet.EnableControls;

        for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
                if (GridCostTypePeriod.Columns.Items[i].FieldName = 'COST_TYPE') then
                	GridCostTypePeriod.Columns[i].Footer.Value := format('%d записей', [record_count]);
end;

//------------------------------------------------------------------------------
procedure TfrmCost.pnlFilterResize(Sender: TObject);
begin
        cbCostType.Width              := pnlFilter.Width  - 20;
        cbGroupCriterion.Width        := pnlFilter.Width  - 20;
        edComment.Width               := pnlFilter.Width  - 20;

        edPeriodBegin.Width           := pnlFilter.Width  - 80;
        edPeriodEnd.Width             := pnlFilter.Width  - 80;
        sbStartPeriodBegin.Left       := pnlFilter.Width  - 50;
        sbEndPeriodBegin.Left         := pnlFilter.Width  - 30;
        sbStartPeriodEnd.Left         := pnlFilter.Width  - 50;
        sbEndPeriodEnd.Left           := pnlFilter.Width  - 30;
        cdPeriod.Width                := pnlFilter.Width  - 20;

        pnlExclude.Height             := pnlFilter.Height - 290;
        GridCostType.Columns[1].Width := pnlFilter.Width  - 40;
end;

procedure TfrmCost.GridCostSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridCost = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridCost.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridCost.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridCost.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdCost.SortOnFields(fields, false, desc);
end;

procedure TfrmCost.GridCostPeriodSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridCostPeriod = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridCostPeriod.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridCostPeriod.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridCostPeriod.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdCostPeriod.SortOnFields(fields, false, desc);
end;

procedure TfrmCost.GridCostTypePeriodSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridCostTypePeriod = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridCostTypePeriod.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridCostTypePeriod.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridCostTypePeriod.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdCostTypePeriod.SortOnFields(fields, false, desc);
end;

procedure TfrmCost.GridCostGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
        if (mdCost.FieldByName('COST_ID').IsNull) then
                Background := $FFFFFF
        else
        if ((DayOf(mdCost.FieldByName('REG_DATE').AsDateTime) mod 2) = 0) then
                Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmCost.GridCostPeriodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
        if (mdCostPeriod.FieldByName('UNACCOUNTED').AsInteger = 0) then
                Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmCost.GridCostTypePeriodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
        if (mdCostTypePeriod.FieldByName('SUMM').AsInteger = 0) then
                Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmCost.mdCostAfterScroll(DataSet: TDataSet);
begin
        if ((Pages.ActivePageIndex <> 0) or (Caption <> 'Расходы')) then
	        exit;

        fChildInfo.haAddPattern := not mdCost.IsEmpty;
        fChildInfo.haEdit       := not mdCost.IsEmpty;
        fChildInfo.haDelete     := not mdCost.IsEmpty and fCanCostDelete;
end;     

procedure TfrmCost.cbCostTypeChange(Sender: TObject);
var
        i: integer;
begin
        lblError.Visible := false;

        if (not fGetCostList) then
                exit;

        //проверка корректности заполнения поля даты
        if ((TryGetDateTime(edPeriodBegin.Text)) and (TryGetDateTime(edPeriodEnd.Text))
        and ((edPeriodBegin.Value) <= (edPeriodEnd.Value)))then
        begin
                fCostTypePeriod := false;
                GetCostList;
                fCostTypePeriod := true;

                GetCostTypePeriodList;
        end

        else
        begin
                mdCost.EmptyTable;
                mdCostPeriod.EmptyTable;
                mdCostTypePeriod.EmptyTable;
                fChildInfo.haAddPattern := false;
                fChildInfo.haEdit       := false;
                lblError.Visible        := true;
                GridCost.SumList.ClearSumValues;
                GridCostPeriod.SumList.ClearSumValues;
                GridCostTypePeriod.SumList.ClearSumValues;

                for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
                        if (GridCostTypePeriod.Columns.Items[i].FieldName = 'COST_TYPE') then
                                GridCostTypePeriod.Columns[i].Footer.Value := '0 записей';

                Chart.Title.Text.Clear;
                Chart.Title.Text.Add('Расходы за период');
                Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
                Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));
                Chart.Series[0].Clear;
        end;

end;

procedure TfrmCost.mdCostCalcFields(DataSet: TDataSet);
var
        day_of_week: byte;
        res: string[2];
begin
        if ((mdCost.FieldByName('COST_ID').IsNull) or (mdCost.FieldByName('REG_DATE').IsNull)) then
                exit;

        day_of_week := DayOfTheWeek(mdCost.FieldByName('REG_DATE').AsDateTime);

        case day_of_week of
                1: res := 'пн';
                2: res := 'вт';
                3: res := 'ср';
                4: res := 'чт';
                5: res := 'пт';
                6: res := 'сб';
                7: res := 'вс';
        end;

        mdCost.FieldByName('DATE_OF_WEEK').AsString := res;
end;

procedure TfrmCost.PagesChange(Sender: TObject);
begin
        //расходы
        if (Pages.ActivePageIndex = 0) then
	begin
                cbGroupCriterion.Enabled := false;
                fChildInfo.haAdd         := true;

                if (mdCost.IsEmpty) then
                begin
                        fChildInfo.haAddPattern  := false;
                        fChildInfo.haEdit        := false;
                end

                else
                begin
                        fChildInfo.haAddPattern  := true;
                        fChildInfo.haEdit        := true;
                end;

                fChildInfo.haDelete      := fCanCostDelete;
                fChildInfo.haRefresh     := true;
	end

        //расходы за период
	else if (Pages.ActivePageIndex = 1) then
	begin
                cbGroupCriterion.Enabled := true;
		fChildInfo.haAdd         := false;
                fChildInfo.haAddPattern  := false;
                fChildInfo.haEdit        := false;
                fChildInfo.haDelete      := false;
                fChildInfo.haRefresh     := true;
	end

        //диаграмма
	else
	begin
                cbGroupCriterion.Enabled := true;
		fChildInfo.haAdd         := false;
                fChildInfo.haAddPattern  := false;
                fChildInfo.haEdit        := false;
                fChildInfo.haDelete      := false;
                fChildInfo.haRefresh     := true;
	end;
end;

procedure TfrmCost.GridCostTypeCellClick(Column: TColumnEh);
begin
        if (Column.FieldName <> 'EXCLUDE') then
                exit;

        mdCostType.Edit;
        mdCostType.FieldByName('EXCLUDE').AsInteger := 1 - mdCostType.FieldByName('EXCLUDE').AsInteger;
        mdCostType.Post;

        GetCostList;
end;

procedure TfrmCost.cbDopParamClick(Sender: TObject);
var
        rec_no: integer;
begin
        if (cbDopParam.Checked) then
        begin
                pnlExclude.Visible := true;
                exit;
        end;

        pnlExclude.Visible := false;
        rec_no := mdCostType.RecNo;

        GridCostPeriod.DataSource.DataSet.DisableControls;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                mdCostType.Edit;
                mdCostType.FieldByName('EXCLUDE').AsInteger := 1;
                mdCostType.Post;
                mdCostType.Next;
        end;

        mdCostType.RecNo := rec_no;
        GridCostPeriod.DataSource.DataSet.EnableControls;

        if (not lblError.Visible) then
                GetCostList;
end;

//все
procedure TfrmCost.pmAllClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdCostType.RecNo;

        GridCostType.DataSource.DataSet.DisableControls;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                mdCostType.Edit;
                mdCostType.FieldByName('EXCLUDE').AsInteger := 1;
                mdCostType.Post;
                mdCostType.Next;
        end;

        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        GetCostList;
end;

//ничего
procedure TfrmCost.pmNonClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdCostType.RecNo;

        GridCostType.DataSource.DataSet.DisableControls;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                mdCostType.Edit;
                mdCostType.FieldByName('EXCLUDE').AsInteger := 0;
                mdCostType.Post;
                mdCostType.Next;
        end;

        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        GetCostList;
end;

//все, кроме текущего
procedure TfrmCost.pmAllWithoutClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdCostType.RecNo;

        GridCostType.DataSource.DataSet.DisableControls;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                mdCostType.Edit;
                mdCostType.FieldByName('EXCLUDE').AsInteger := integer(mdCostType.RecNo <> rec_no);
                mdCostType.Post;

                mdCostType.Next;
        end;

        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        GetCostList;
end;

//ничего, кроме текущего
procedure TfrmCost.pmNonWithoutClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdCostType.RecNo;

        GridCostType.DataSource.DataSet.DisableControls;
        mdCostType.First;
        while (not (mdCostType.Eof)) do
        begin
                mdCostType.Edit;
                mdCostType.FieldByName('EXCLUDE').AsInteger := integer(mdCostType.RecNo = rec_no);
                mdCostType.Post;

                mdCostType.Next;
        end;

        mdCostType.RecNo := rec_no;
        GridCostType.DataSource.DataSet.EnableControls;

        GetCostList;
end;

//обновить
procedure TfrmCost.pmCostTypeRefreshClick(Sender: TObject);
begin
        GetCostTypeList;
        GetCostList;
end;

procedure TfrmCost.sbStartPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения расходов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmCost.sbEndPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения расходов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;
        cdPeriod.ItemIndex  := 0;
end;

procedure TfrmCost.sbStartPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения расходов.');
                exit;
	end;

        edPeriodEnd.Value  := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;
        cdPeriod.ItemIndex := 0;
end;

procedure TfrmCost.sbEndPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения расходов.');
                exit;
	end;

        edPeriodEnd.Value  := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmCost.btnCostOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridCost.Columns.Count - 1 do
                GridCost.Columns[i].OptimizeWidth;
end;

procedure TfrmCost.btnCostPeriodOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridCostPeriod.Columns.Count - 1 do
                GridCostPeriod.Columns[i].OptimizeWidth;
end;

procedure TfrmCost.btnCostTypePeriodOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridCostTypePeriod.Columns.Count - 1 do
                GridCostTypePeriod.Columns[i].OptimizeWidth;
end;

procedure TfrmCost.mdCostPeriodAfterScroll(DataSet: TDataSet);
begin
        GetCostTypePeriodList;
end;

//получение данных о текущем периоде
procedure TfrmCost.GetPeriodInfo
(
            reg_date:    TDate;
        var period_no:   word;
        var period:      string;
        var period_days: word;
        var bdate:       TDate;
        var edate:       TDate
);
begin
        //группировка по дням
        if (cbGroupCriterion.ItemIndex = 0) then
        begin
                period_no    := DayOfTheYear(reg_date);
                period       := format('%s', [DateToStr(reg_date)]);
                period_days  := 1;
                bdate        := reg_date;
                edate        := reg_date;
        end

        //группировка по неделям
        else if (cbGroupCriterion.ItemIndex = 1) then
        begin
                period_no    := WeekOf(reg_date);
                period       := format('%s - %s', [DateToStr(StartOfTheWeek(reg_date)), DateToStr(EndOfTheWeek(reg_date))]);
                period_days  := 7;
                bdate        := StartOfTheWeek(reg_date);
                edate        := EndOfTheWeek(reg_date);
        end

        //группировка по месяцам
        else if (cbGroupCriterion.ItemIndex = 2) then
        begin
                period_no    := MonthOf(reg_date);
                period       := format('%s - %s (%s %d)', [DateToStr(StartOfTheMonth(reg_date)), DateToStr(EndOfTheMonth(reg_date)), GetMonthStr(period_no), YearOf(reg_date)]);
                period_days  := DaysInMonth(reg_date);
                bdate        := StartOfTheMonth(reg_date);
                edate        := EndOfTheMonth(reg_date);
        end

        //группировка по годам
        else if (cbGroupCriterion.ItemIndex = 3) then
        begin
                period_no    := YearOf(reg_date);
                period       := format('%s - %s', [DateToStr(StartOfTheYear(reg_date)), DateToStr(EndOfTheYear(reg_date))]);
                period_days  := DaysInYear(reg_date);
                bdate        := StartOfTheYear(reg_date);
                edate        := EndOfTheYear(reg_date);
        end;
end;

//вывод пропущенных нулевых расхов - группировка по дням
procedure TfrmCost.PrintNullCost
(
        reg_date:        TDate;
        prev_period_day: TDate
);
var
        i, step_days: integer;
begin
        step_days := DaysBetween(reg_date, prev_period_day) - 1;

        for i := 1 to DaysBetween(reg_date, prev_period_day) - 1 do
        begin
                mdCostPeriod.Append;
                mdCostPeriod.FieldByName('UNACCOUNTED').AsInteger := 0;
                mdCostPeriod.FieldByName('ERRAND').AsInteger      := 0;
                mdCostPeriod.FieldByName('PERIOD_NO').AsInteger   := DayOfTheYear(reg_date - step_days);
                mdCostPeriod.FieldByName('PERIOD').AsString       := format('%s', [DateToStr(reg_date - step_days)]);
                mdCostPeriod.FieldByName('DAYS_PERIOD').AsInteger := 1;
                mdCostPeriod.FieldByName('COST_COUNT').AsInteger  := 0;
                mdCostPeriod.FieldByName('SUMM').AsFloat          := 0;
                mdCostPeriod.FieldByName('AVG_SUMM').AsFloat      := 0;
                mdCostPeriod.FieldByName('MIN_COST').AsFloat      := 0;
                mdCostPeriod.FieldByName('MAX_COST').AsFloat      := 0;
                mdCostPeriod.FieldByName('BDATE').AsDateTime      := reg_date - step_days;
                mdCostPeriod.FieldByName('EDATE').AsDateTime      := reg_date - step_days;
                mdCostPeriod.Post;

                dec(step_days);
        end;
end;

//расходы за текущий месяц
procedure TfrmCost.CurrentMonthCost;
var
        i: integer;
        str: string;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT SUM(SUMM) MONTH_SUMM'
        + ' FROM COSTS'
        + ' WHERE REG_DATE BETWEEN ''' + DateToStr(StartOfTheMonth(Now)) + ''' AND ''' + DateToStr(EndOfTheMonth(Now)) + '''';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении суммы расходов за текущий месяц.');
                exit;
	end;

        str := format('%s %d: ', [GetMonthStr(MonthOf(Now)), YearOf(Now)]);

        if (DataMod.IB_Cursor.FieldByName('MONTH_SUMM').IsNull) then
                //разделитель целой и дробной части берется из настройки операционной системы
                str := str + '0' + DecimalSeparator + '00 руб.'
        else
                str := str + format('%f руб.', [DataMod.IB_Cursor.FieldByName('MONTH_SUMM').AsFloat]);

        for i := 0 to GridCost.Columns.Count - 1 do
                if (GridCost.Columns.Items[i].FieldName = 'COST_TYPE') then
                	GridCost.Columns[i].Footer.Value :=  str;

        DataMod.IB_Cursor.Close;
end;

procedure TfrmCost.pmCostCurrentPeriodClick(Sender: TObject);
var
        frm: TfrmCost;
begin
        if (mdCostPeriod.IsEmpty) then
                exit;

  	frm := TfrmCost.Create(self); //первый вызов 'GetCostList'
        frm.Caption := 'Расходы [' + mdCostPeriod.FieldByName('BDATE').AsString + ' - ' + mdCostPeriod.FieldByName('EDATE').AsString + ']';

        frm.fGetCostList               := false;
        frm.edPeriodBegin.Value        := mdCostPeriod.FieldByName('BDATE').AsDateTime;
        frm.fGetCostList               := true;
        frm.edPeriodEnd.Value          := mdCostPeriod.FieldByName('EDATE').AsDateTime; //второй вызов 'GetCostList'

        frm.pnlFilter.Visible          := false;
        frm.fChildInfo.haAdd           := false;
        frm.fChildInfo.haAdd           := false;
        frm.fChildInfo.haAddPattern    := false;
        frm.fChildInfo.haEdit          := false;
        frm.fChildInfo.haDelete        := false;
        frm.fChildInfo.haRefresh       := false;
        frm.tsCostPeriod.Destroy;
        frm.tsDiagram.Destroy;
        frm.Show;
end;

procedure TfrmCost.pmCostPeriodPopup(Sender: TObject);
begin
        if (not mdCostPeriod.IsEmpty) then
                pmCostCurrentPeriod.Enabled := true
        else
                pmCostCurrentPeriod.Enabled := false;
end;

procedure TfrmCost.cdPeriodChange(Sender: TObject);
begin
        if ((not fGetCostList) or (cdPeriod.ItemIndex = 0)) then
                exit;

        fGetCostList := false;

        //текущая неделя
        if (cdPeriod.ItemIndex = 1) then
        begin
                edPeriodBegin.Value := StartOfTheWeek(Now);
                edPeriodEnd.Value   := Now;
        end

        //текущий месяц
        else if (cdPeriod.ItemIndex = 2) then
        begin

                edPeriodBegin.Value := StartOfTheMonth(Now);
                edPeriodEnd.Value   := Now;
        end

        //текущий год
        else if (cdPeriod.ItemIndex = 3) then
        begin
                edPeriodBegin.Value := StartOfTheYear(Now);
                edPeriodEnd.Value   := Now;
        end

        //предыдущая неделя
        else if (cdPeriod.ItemIndex = 4) then
        begin
                edPeriodBegin.Value := StartOfTheWeek(StartOfTheWeek(Now) - 1);
                edPeriodEnd.Value   := StartOfTheWeek(Now) - 1;
        end

        //предыдущий месяц
        else if (cdPeriod.ItemIndex = 5) then
        begin

                edPeriodBegin.Value := StartOfTheMonth(StartOfTheMonth(Now) - 1);
                edPeriodEnd.Value   := StartOfTheMonth(Now) - 1;
        end

        //предыдущий год
        else if (cdPeriod.ItemIndex = 6) then
        begin
                edPeriodBegin.Value := StartOfTheYear(StartOfTheYear(Now) - 1);
                edPeriodEnd.Value   := StartOfTheYear(Now) - 1;
        end

        //весь период
        else if (cdPeriod.ItemIndex = 7) then
        begin
                sbEndPeriodEndClick(nil);
                sbStartPeriodBeginClick(nil);
        end;

        fGetCostList := true;

        //----------------------------------------------------------------------
        //далее такой же обработчик как у "FormShow"
        fCostTypePeriod := false;

        GetCostTypeList;
        GetCostList;
        CurrentMonthCost;

        fCostTypePeriod := true;

        GetCostTypePeriodList;
end;

procedure TfrmCost.edPeriodBeginChange(Sender: TObject);
begin
        if ((edPeriodBegin.Focused) or (edPeriodEnd.Focused)) then
                cdPeriod.ItemIndex := 0;
                
        cbCostTypeChange(nil);
end;

end.
