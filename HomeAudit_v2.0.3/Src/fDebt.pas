//Долги
unit fDebt;
                                                                                                
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild, ComCtrls, TeEngine, Series, TeeProcs,
  Chart, LMDBarBase, LMDExplorerBar, Buttons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDDBBtn, TB97, TB97Tlbr;

type
  TfrmDebt = class(TForm)
    pnlFilter: TPanel;
    lblDebtType: TLabel;
    pnlFilterTop: TPanel;
    RxSplitter: TRxSplitter;
    mdDebt: TRxMemoryData;
    dsDebt: TDataSource;
    pmDebt: TPopupMenu;
    pmDebtAdd: TMenuItem;
    pmDebtEdit: TMenuItem;
    pmDebtDelete: TMenuItem;
    N1: TMenuItem;
    pmDebtRefresh: TMenuItem;
    lblPeriod: TLabel;
    lblPeriodStart: TLabel;
    edPeriodBegin: TDBDateTimeEditEh;
    lblPeriodEnd: TLabel;
    edPeriodEnd: TDBDateTimeEditEh;
    lblError: TLabel;
    Pages: TPageControl;
    tsDebt: TTabSheet;
    GridDebt: TDBGridEh;
    tsDebtPeriod: TTabSheet;
    GridDebtPeriod: TDBGridEh;
    mdDebtPeriod: TRxMemoryData;
    dsDebtPeriod: TDataSource;
    lblGroupCriterion: TLabel;
    cbGroupCriterion: TDBComboBoxEh;
    mdDebtPeriodSUMM: TFloatField;
    mdDebtPeriodPERIOD_NO: TWordField;
    tsDiagram: TTabSheet;
    Chart: TChart;
    Series1: TBarSeries;
    mdDebtPeriodAVG_SUMM: TFloatField;
    mdDebtPeriodDAYS_PERIOD: TIntegerField;
    lblComment: TLabel;
    edComment: TDBEditEh;
    sbEndPeriodBegin: TSpeedButton;
    sbEndPeriodEnd: TSpeedButton;
    sbStartPeriodBegin: TSpeedButton;
    sbStartPeriodEnd: TSpeedButton;
    mdDebtPeriodPERIOD: TStringField;
    mdDebtPeriodMIN_DEBT: TFloatField;
    mdDebtPeriodMAX_DEBT: TFloatField;
    mdDebtPeriodDEBT_COUNT: TIntegerField;
    DockDebt: TDock97;
    ToolbarDebt: TToolbar97;
    btnDebtOptimizeWidth: TSpeedButton;
    navDebt: TLMDDBNavigator;
    DockDebtPeriod: TDock97;
    ToolbarDebtPeriod: TToolbar97;
    btnDebtPeriodOptimizeWidth: TSpeedButton;
    navDebtPeriod: TLMDDBNavigator;
    mdDebtDEBT_ID: TIntegerField;
    mdDebtDEBT_DATE: TDateField;
    mdDebtDEBT_SUMM: TFloatField;
    mdDebtDEBT_COMMENT: TStringField;
    mdDebtDEBT_TYPE: TStringField;
    mdDebtPAY_DATE: TDateField;
    mdDebtPAY_SUMM: TFloatField;
    mdDebtPAY_COMMENT: TStringField;
    mdDebtDATE_OF_WEEK: TStringField;
    cbDebtType: TDBComboBoxEh;
    mdDebtPAY_DATE_OF_WEEK: TStringField;
    cbLiquidatedDebt: TCheckBox;
    pmAddPattern: TMenuItem;
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
    procedure GridDebtSortMarkingChanged(Sender: TObject);
    procedure GridDebtGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mdDebtAfterScroll(DataSet: TDataSet);
    procedure cbDebtTypeChange(Sender: TObject);
    procedure mdDebtCalcFields(DataSet: TDataSet);
    procedure PagesChange(Sender: TObject);
    procedure GridDebtPeriodSortMarkingChanged(Sender: TObject);
    procedure pmDebtTypeRefreshClick(Sender: TObject);
    procedure sbEndPeriodBeginClick(Sender: TObject);
    procedure sbEndPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodBeginClick(Sender: TObject);
    procedure btnDebtOptimizeWidthClick(Sender: TObject);
    procedure btnDebtPeriodOptimizeWidthClick(Sender: TObject);
    procedure cdPeriodChange(Sender: TObject);
    procedure edPeriodBeginChange(Sender: TObject);
  private
    fChildInfo: PChildInfo;
    fGetDebtList: boolean;
    fCanDebtDelete: boolean;
    
    procedure LoadFromIni;
    procedure SaveToIni;

    //получение списка долгов
    procedure GetDebtList;
    //запрос в FireBird (долги)
    function QueryFromFireBirdDebt: boolean;
    //копирование данных во временную таблицу (долги)
    procedure CopyToMemoryDataDebt;
  public
    { Public declarations }
  end;

var
  frmDebt: TfrmDebt;

implementation

uses
	dmHomeAudit,
        fMain,
        fDebtEd,
        uCommon,
        DateUtil,
        DateUtils;

{$R *.dfm}

procedure TfrmDebt.FormCreate(Sender: TObject);
begin
        //cтруктуру для обслуживания из главной формы
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := AcFilterPanelExecute;
        fChildInfo.Actions[childAdd]         := AcAddExecute;
        fChildInfo.Actions[childAddPattern]  := AcAddPatternExecute;
        fChildInfo.Actions[childEdit]        := AcEditExecute;
        fChildInfo.Actions[childDelete]      := AcDeleteExecute;
	fChildInfo.Actions[childRefresh]     := AcRefreshExecute;
        fChildInfo.haAdd         := true;
        fChildInfo.haRefresh     := true;

        Pages.ActivePageIndex    := 0;
        cbGroupCriterion.Enabled := false;
        mdDebt.Active            := true;
        mdDebtPeriod.Active      := true;
        fGetDebtList             := false;

        LoadFromIni;
        cbDebtType.ItemIndex     := 0;
        cdPeriod.ItemIndex       := 0;

        edPeriodBegin.Value      := StartOfTheWeek(Now);
        edPeriodEnd.Value        := Now;

        fGetDebtList             := true;

        pnlFilter.Visible        := fChildInfo.haFilterPanelOn;
	RxSplitter.Visible       := fChildInfo.haFilterPanelOn;
end;

procedure TfrmDebt.FormShow(Sender: TObject);
begin
        GetDebtList;
end;

procedure TfrmDebt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        SaveToIni;
	mdDebt.Active       := false;
        mdDebtPeriod.Active := false;
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	INI
//
//------------------------------------------------------------------------------

//загрузка параметров из ini-файла
procedure TfrmDebt.LoadFromIni;
var
	sect: string;
begin
	sect := 'Debt';
	fChildInfo.haFilterPanelOn := OptionsIni.ReadBool(sect, 'FilterPanelOn', true);
	pnlFilter.Width            := OptionsIni.ReadInteger(sect, 'FilterPanelWidth', 190);
        cbGroupCriterion.ItemIndex := OptionsIni.ReadInteger(sect, 'GroupCriterion', 0);

        sect := 'Options';
        fCanDebtDelete := OptionsIni.ReadBool(sect, 'CanDebtDelete', true);
end;

//сохранение параметров в ini-файл
procedure TfrmDebt.SaveToIni;
var
	sect: string;
begin
	sect := 'Debt';
	OptionsIni.WriteBool(sect, 'FilterPanelOn', fChildInfo.haFilterPanelOn);
	OptionsIni.WriteInteger(sect, 'FilterPanelWidth', pnlFilter.Width);
        OptionsIni.WriteInteger(sect, 'GroupCriterion', cbGroupCriterion.ItemIndex);
end;

//панель фильтрации
procedure TfrmDebt.AcFilterPanelExecute(Sender: TObject);
begin
        fChildInfo.haFilterPanelOn := not fChildInfo.haFilterPanelOn;
	RxSplitter.Visible         := fChildInfo.haFilterPanelOn;
	pnlFilter.Visible 	   := fChildInfo.haFilterPanelOn;
end;

//------------------------------------------------------------------------------
//
//	Управление записями
//
//------------------------------------------------------------------------------

//добавить запись
procedure TfrmDebt.AcAddExecute(Sender: TObject);
var
	DebtEd: TfrmDebtEd;
begin
	DebtEd := TfrmDebtEd.Create(Application);
	if DebtEd = nil then
		exit;

	DebtEd.Add(dsDebt);
	DebtEd.Free;
end;

//добавить запись по образцу
procedure TfrmDebt.AcAddPatternExecute(Sender: TObject);
var
	DebtEd: TfrmDebtEd;
begin
	DebtEd := TfrmDebtEd.Create(Application);
	if DebtEd = nil then
		exit;

        DebtEd.cbDebtType.Text    := mdDebt.FieldByName('DEBT_TYPE').AsString;
        DebtEd.edDebtSumm.Value   := mdDebt.FieldByName('DEBT_SUMM').AsVariant;
        DebtEd.edDebtComment.Text := mdDebt.FieldByName('DEBT_COMMENT').AsString;

	DebtEd.Add(dsDebt);
	DebtEd.Free;
end;

//редактировать запись
procedure TfrmDebt.AcEditExecute(Sender: TObject);
var
	DebtEd: TfrmDebtEd;
begin
	//редактирование недоступно
        if (mdDebt.IsEmpty) then
        	exit;

	DebtEd := TfrmDebtEd.Create(Application);
	if DebtEd = nil then
		exit;

	DebtEd.Edit(dsDebt, mdDebt.FieldByName('DEBT_ID').AsInteger);
	DebtEd.Free;
end;

//удалить запись
procedure TfrmDebt.AcDeleteExecute(Sender: TObject);
begin
	//удаление недоступно
        if (mdDebt.IsEmpty) then
        	exit;

	//диалог подтверждения удаления
        if (YesNoBox(format('Удалить долг "%f руб." (ID #%d)?', [mdDebt.FieldByName('DEBT_SUMM').AsFloat, mdDebt.FieldByName('DEBT_ID').AsInteger])) = IDYES) then
	begin
          	//удаление
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM DEBTS WHERE DEBT_ID = ' + mdDebt.FieldByName('DEBT_ID').AsString;

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

                mdDebt.Delete;
        end;
end;

//обновить данные
procedure TfrmDebt.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//обновление недоступно
        if (mdDebt.IsEmpty) then
        	exit;

        for i := 0 to GridDebt.Columns.Count - 1 do
        	GridDebt.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridDebtPeriod.Columns.Count - 1 do
        	GridDebtPeriod.Columns[i].Title.SortMarker := smNoneEh;

	GetDebtList;
end;

//------------------------------------------------------------------------------
//получение списка долгов
procedure TfrmDebt.GetDebtList;
var
	i: word;
begin
        Chart.Title.Text.Clear;
        Chart.Title.Text.Add('Долги за период');
        Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
        Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));

        for i := 0 to GridDebt.Columns.Count - 1 do
        	GridDebt.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridDebtPeriod.Columns.Count - 1 do
        	GridDebtPeriod.Columns[i].Title.SortMarker := smNoneEh;

        if (QueryFromFireBirdDebt) then
	        CopyToMemoryDataDebt;
end;

//запрос в FireBird (долги)
function TfrmDebt.QueryFromFireBirdDebt: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Clear;
        DataMod.IB_Cursor.SQL.Add('SELECT'
                + '  DEBT_ID'
                + ', DECODE'
                + ' ('
                        + ' DEBT_TYPE,'
                        + ' 0, ''я должен'','
                        + ' 1, ''мне должны'','
                        + ' ''неизвестный вид долга'''
                + ' ) DEBT_TYPE'
                + ', DEBT_DATE'
                + ', DEBT_SUMM'
                + ', DEBT_COMMENT'
                + ', PAY_DATE'
                + ', PAY_SUMM'
                + ', PAY_COMMENT'
        + ' FROM DEBTS'
        + ' WHERE DEBT_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + '''');

        //выбран вид долгов
        if (cbDebtType.ItemIndex <> 0) then
                DataMod.IB_Cursor.SQL.Add('AND DEBT_TYPE = ' + IntToStr(cbDebtType.ItemIndex - 1));

        //комментарий
        if (edComment.Text <> '') then
                DataMod.IB_Cursor.SQL.Add('AND LOWER(DEBT_COMMENT) LIKE LOWER(''%' + edComment.Text + '%'')');

        if (cbLiquidatedDebt.Checked) then
                DataMod.IB_Cursor.SQL.Add('AND COALESCE(DEBT_SUMM, 0) <> COALESCE(PAY_SUMM, 0)');

        DataMod.IB_Cursor.SQL.Add('ORDER BY DEBT_DATE, DEBT_ID');

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы долгов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (долги)
procedure TfrmDebt.CopyToMemoryDataDebt;
var
        i, debt_count,
        record_count,
        step: integer;

        summ,
        summ_period,
        min_debt,
        max_debt: double;

        period_no,
        period_no_column,
        period_days: word;

        reg_date: TDate;

        period: string[50];
begin
	GridDebt.DataSource.DataSet.DisableControls;
        GridDebtPeriod.DataSource.DataSet.DisableControls;

        GridDebt.SumList.ClearSumValues;
	GridDebtPeriod.SumList.ClearSumValues;

   	mdDebt.EmptyTable;
        mdDebtPeriod.EmptyTable;

        Chart.Series[0].Clear;

        debt_count       := 0;
        record_count     := 0;
        step             := 1000;
        summ             := 0;
        summ_period      := 0;
        min_debt         := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;
        max_debt         := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;
        period_no        := 0;
        period_no_column := 0;
        period_days      := 0;

        reg_date         := DataMod.IB_Cursor.FieldByName('DEBT_DATE').AsDateTime;

        //поиск номера колонки "Номер периода"
        for i := 0 to GridDebtPeriod.Columns.Count - 1 do
                if (GridDebtPeriod.Columns.Items[i].FieldName = 'PERIOD_NO') then
                 	period_no_column := i;

        //группировка по дням
        if (cbGroupCriterion.ItemIndex = 0) then
        begin
                period_no     := DayOfTheYear(reg_date);
                period        := format('%s', [DateToStr(reg_date)]);
                period_days   := 1;
                GridDebtPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер дня';
        end

        //группировка по неделям
        else if (cbGroupCriterion.ItemIndex = 1) then
        begin
                period_no    := WeekOf(reg_date);
                period       := format('%s - %s', [DateToStr(StartOfTheWeek(reg_date)), DateToStr(EndOfTheWeek(reg_date))]);
                period_days  := 7;
                GridDebtPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер недели';
        end

        //группировка по месяцам
        else if (cbGroupCriterion.ItemIndex = 2) then
        begin
                period_no    := MonthOf(reg_date);
                period       := format('%s - %s (%s %d)', [DateToStr(StartOfTheMonth(reg_date)), DateToStr(EndOfTheMonth(reg_date)), GetMonthStr(period_no), YearOf(reg_date)]);
                period_days  := DaysInMonth(reg_date);
                GridDebtPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер месяца';
        end

        //группировка по годам
        else if (cbGroupCriterion.ItemIndex = 3) then
        begin
                period_no    := YearOf(reg_date);
                period       := format('%s - %s', [DateToStr(StartOfTheYear(reg_date)), DateToStr(EndOfTheYear(reg_date))]);
                period_days  := DaysInYear(reg_date);
                GridDebtPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер года';
        end;

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
                //долги
        	mdDebt.Append;
                mdDebt.FieldByName('DEBT_ID').AsInteger     := DataMod.IB_Cursor.FieldByName('DEBT_ID').AsInteger;
                mdDebt.FieldByName('DEBT_TYPE').AsString    := DataMod.IB_Cursor.FieldByName('DEBT_TYPE').AsString;
                mdDebt.FieldByName('DEBT_DATE').AsDateTime  := DataMod.IB_Cursor.FieldByName('DEBT_DATE').AsDateTime;
                mdDebt.FieldByName('DEBT_SUMM').AsFloat     := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;
                mdDebt.FieldByName('DEBT_COMMENT').AsString := DataMod.IB_Cursor.FieldByName('DEBT_COMMENT').AsString;

                if (DataMod.IB_Cursor.FieldByName('PAY_DATE').IsNotNull) then
                        mdDebt.FieldByName('PAY_DATE').AsDateTime := DataMod.IB_Cursor.FieldByName('PAY_DATE').AsDateTime;

                if (DataMod.IB_Cursor.FieldByName('PAY_SUMM').IsNotNull) then
                        mdDebt.FieldByName('PAY_SUMM').AsFloat := DataMod.IB_Cursor.FieldByName('PAY_SUMM').AsFloat;
                mdDebt.FieldByName('PAY_COMMENT').AsString    := DataMod.IB_Cursor.FieldByName('PAY_COMMENT').AsString;
                mdDebt.Post;

                reg_date := DataMod.IB_Cursor.FieldByName('DEBT_DATE').AsDateTime;
                inc(debt_count);

                //долги за период
                if (((cbGroupCriterion.ItemIndex = 0) and (period_no <> DayOfTheYear(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 1) and (period_no <> WeekOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 2) and (period_no <> MonthOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 3) and (period_no <> YearOf(reg_date))))
                then
                begin
                        mdDebtPeriod.Append;
                        mdDebtPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                        mdDebtPeriod.FieldByName('PERIOD').AsString       := period;
                        mdDebtPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                        mdDebtPeriod.FieldByName('DEBT_COUNT').AsInteger  := debt_count;
                        mdDebtPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                        //средний долг за период
                        if (not mdDebtPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                                mdDebtPeriod.FieldByName('AVG_SUMM').AsFloat := mdDebtPeriod.FieldByName('SUMM').AsFloat / mdDebtPeriod.FieldByName('DAYS_PERIOD').AsInteger
                        else
                                mdDebtPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                        mdDebtPeriod.FieldByName('MIN_DEBT').AsFloat      := min_debt;
                        mdDebtPeriod.FieldByName('MAX_DEBT').AsFloat      := max_debt;
                        mdDebtPeriod.Post;

                        Chart.Series[0].Add(summ_period, period, clInactiveCaption);
                        debt_count  := 0;
                        summ_period := 0;

                        min_debt := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;
                        max_debt := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;

                        //группировка по дням
                        if (cbGroupCriterion.ItemIndex = 0) then
                        begin
                                period_no    := DayOfTheYear(reg_date);
                                period       := format('%s', [DateToStr(reg_date)]);
                                //period_days  := 1;
                        end

                        //группировка по неделям
                        else if (cbGroupCriterion.ItemIndex = 1) then
                        begin
                                period_no    := WeekOf(reg_date);
                                period       := format('%s - %s', [DateToStr(StartOfTheWeek(reg_date)), DateToStr(EndOfTheWeek(reg_date))]);
                                //period_days  := 7;
                        end

                        //группировка по месяцам
                        else if (cbGroupCriterion.ItemIndex = 2) then
                        begin
                                period_no    := MonthOf(reg_date);
                                period       := format('%s - %s (%s %d)', [DateToStr(StartOfTheMonth(reg_date)), DateToStr(EndOfTheMonth(reg_date)), GetMonthStr(period_no), YearOf(reg_date)]);
                                period_days  := DaysInMonth(reg_date);
                        end

                        //группировка по годам
                        else if (cbGroupCriterion.ItemIndex = 3) then
                        begin
                                period_no    := YearOf(reg_date);
                                period       := format('%s - %s', [DateToStr(StartOfTheYear(reg_date)), DateToStr(EndOfTheYear(reg_date))]);
                                period_days  := DaysInYear(reg_date);
                        end;
                end;

                if (DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat < min_debt) then
                        min_debt := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;

                if (DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat > max_debt) then
                        max_debt := DataMod.IB_Cursor.FieldByName('DEBT_SUMM').AsFloat;

                DataMod.IB_Cursor.Next;

                if (record_count = step) then
                begin
                	frmMain.StatusBar.Panels[1].Text := format('Загружено: %d записей', [record_count]);
                        frmMain.StatusBar.Refresh;
                    	step := step + 1000;
                end;

                inc(record_count);
                summ        := summ        + mdDebt.FieldByName('DEBT_SUMM').AsFloat;
                summ_period := summ_period + mdDebt.FieldByName('DEBT_SUMM').AsFloat;
        end;

        DataMod.IB_Cursor.Close;

        //долги за период
        if (not mdDebt.IsEmpty) then
        begin
                mdDebtPeriod.Append;
                mdDebtPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                mdDebtPeriod.FieldByName('PERIOD').AsString       := period;
                mdDebtPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                mdDebtPeriod.FieldByName('DEBT_COUNT').AsInteger  := debt_count;
                mdDebtPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                //средний долг за период
                if (not mdDebtPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                        mdDebtPeriod.FieldByName('AVG_SUMM').AsFloat := mdDebtPeriod.FieldByName('SUMM').AsFloat / mdDebtPeriod.FieldByName('DAYS_PERIOD').AsInteger
                else
                        mdDebtPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                mdDebtPeriod.FieldByName('MIN_DEBT').AsFloat      := min_debt;
                mdDebtPeriod.FieldByName('MAX_DEBT').AsFloat      := max_debt;
                mdDebtPeriod.Post;

                Chart.Series[0].Add(summ_period, period, clInactiveCaption);
        end;

        mdDebt.First;
        mdDebtPeriod.First;
        frmMain.StatusBar.Panels[1].Text := GetLongHint(Application.Hint);

        GridDebt.DataSource.DataSet.EnableControls;
        GridDebtPeriod.DataSource.DataSet.EnableControls;
end;

//------------------------------------------------------------------------------
procedure TfrmDebt.pnlFilterResize(Sender: TObject);
begin
        cbDebtType.Width        := pnlFilter.Width  - 20;
        cbGroupCriterion.Width  := pnlFilter.Width  - 20;
        edComment.Width         := pnlFilter.Width  - 20;

        edPeriodBegin.Width     := pnlFilter.Width  - 80;
        edPeriodEnd.Width       := pnlFilter.Width  - 80;
        sbStartPeriodBegin.Left := pnlFilter.Width  - 50;
        sbEndPeriodBegin.Left   := pnlFilter.Width  - 30;
        sbStartPeriodEnd.Left   := pnlFilter.Width  - 50;
        sbEndPeriodEnd.Left     := pnlFilter.Width  - 30;
        cdPeriod.Width          := pnlFilter.Width  - 20;
end;

procedure TfrmDebt.GridDebtSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridDebt = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridDebt.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridDebt.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridDebt.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdDebt.SortOnFields(fields, false, desc);
end;

procedure TfrmDebt.GridDebtPeriodSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridDebtPeriod = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridDebtPeriod.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridDebtPeriod.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridDebtPeriod.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdDebtPeriod.SortOnFields(fields, false, desc);
end;

procedure TfrmDebt.GridDebtGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
        if ((mdDebt.FieldByName('DEBT_SUMM').AsFloat) = (mdDebt.FieldByName('PAY_SUMM').AsFloat)) then
		Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmDebt.mdDebtAfterScroll(DataSet: TDataSet);
begin
        if (Pages.ActivePageIndex <> 0) then
	        exit;

        fChildInfo.haAddPattern := not mdDebt.IsEmpty;
        fChildInfo.haEdit       := not mdDebt.IsEmpty;
        fChildInfo.haDelete     := not mdDebt.IsEmpty and fCanDebtDelete;
end;     

procedure TfrmDebt.cbDebtTypeChange(Sender: TObject);
begin
        lblError.Visible := false;

	if (fGetDebtList = true) then
        begin
                //проверка корректности заполнения поля даты
        	if ((TryGetDateTime(edPeriodBegin.Text)) and (TryGetDateTime(edPeriodEnd.Text))
                and ((edPeriodBegin.Value) <= (edPeriodEnd.Value)))then
   			GetDebtList

	        else
        	begin
          		mdDebt.EmptyTable;
                        mdDebtPeriod.EmptyTable;
                        lblError.Visible := true;
                        GridDebt.SumList.ClearSumValues;
	                GridDebtPeriod.SumList.ClearSumValues;

                        Chart.Title.Text.Clear;
                        Chart.Title.Text.Add('Долги за период');
                        Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
                        Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));
                        Chart.Series[0].Clear;
                end;
        end;
end;

procedure TfrmDebt.mdDebtCalcFields(DataSet: TDataSet);
var
        day_of_week: byte;
        res: string[2];
begin
        if (mdDebt.FieldByName('DEBT_ID').IsNull) then
                exit;

        //долг
        if (not mdDebt.FieldByName('DEBT_DATE').IsNull) then
        begin
                day_of_week := DayOfTheWeek(mdDebt.FieldByName('DEBT_DATE').AsDateTime);

                case day_of_week of
                        1: res := 'пн';
                        2: res := 'вт';
                        3: res := 'ср';
                        4: res := 'чт';
                        5: res := 'пт';
                        6: res := 'сб';
                        7: res := 'вс';
                end;

                mdDebt.FieldByName('DEBT_DATE_OF_WEEK').AsString := res;
        end;

        //выплата
        if (not mdDebt.FieldByName('PAY_DATE').IsNull) then
        begin
                day_of_week := DayOfTheWeek(mdDebt.FieldByName('PAY_DATE').AsDateTime);

                case day_of_week of
                        1: res := 'пн';
                        2: res := 'вт';
                        3: res := 'ср';
                        4: res := 'чт';
                        5: res := 'пт';
                        6: res := 'сб';
                        7: res := 'вс';
                end;

                mdDebt.FieldByName('PAY_DATE_OF_WEEK').AsString := res;
        end;
end;

procedure TfrmDebt.PagesChange(Sender: TObject);
begin
        //долги
        if (Pages.ActivePageIndex = 0) then
	begin
                cbGroupCriterion.Enabled := false;
                fChildInfo.haAdd         := true;
                fChildInfo.haAddPattern  := true;
                fChildInfo.haEdit        := true;
                fChildInfo.haDelete      := fCanDebtDelete;
                fChildInfo.haRefresh     := true;
	end

        //долги за период
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
                fChildInfo.haRefresh     := false;
	end;
end;

//обновить
procedure TfrmDebt.pmDebtTypeRefreshClick(Sender: TObject);
begin
        GetDebtList;
end;

procedure TfrmDebt.sbStartPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(DEBT_DATE) MIN_DATE FROM DEBTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения долгов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex  := 0;
end;

procedure TfrmDebt.sbEndPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(DEBT_DATE) MAX_DATE FROM DEBTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения долгов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;
        cdPeriod.ItemIndex  := 0;
end;

procedure TfrmDebt.sbStartPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(DEBT_DATE) MIN_DATE FROM DEBTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения долгов.');
                exit;
	end;

        edPeriodEnd.Value  := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;
        cdPeriod.ItemIndex := 0;
end;

procedure TfrmDebt.sbEndPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(DEBT_DATE) MAX_DATE FROM DEBTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения долгов.');
                exit;
	end;

        edPeriodEnd.Value := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmDebt.btnDebtOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridDebt.Columns.Count - 1 do
                GridDebt.Columns[i].OptimizeWidth;
end;

procedure TfrmDebt.btnDebtPeriodOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridDebtPeriod.Columns.Count - 1 do
                GridDebtPeriod.Columns[i].OptimizeWidth;
end;

procedure TfrmDebt.cdPeriodChange(Sender: TObject);
begin
        if ((not fGetDebtList) or (cdPeriod.ItemIndex = 0)) then
                exit;

        fGetDebtList := false;

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

        fGetDebtList := true;

        //----------------------------------------------------------------------
        //далее такой же обработчик как у "FormShow"
        GetDebtList;
end;

procedure TfrmDebt.edPeriodBeginChange(Sender: TObject);
begin
        if ((edPeriodBegin.Focused) or (edPeriodEnd.Focused)) then
                cdPeriod.ItemIndex := 0;

        cbDebtTypeChange(nil);
end;

end.
