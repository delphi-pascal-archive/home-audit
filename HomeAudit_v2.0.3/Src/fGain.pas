//Доходы
unit fGain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild, ComCtrls, TeEngine, Series, TeeProcs,
  Chart, LMDBarBase, LMDExplorerBar, Buttons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDDBBtn, TB97Tlbr, TB97Ctls, TB97;

type
  TfrmGain = class(TForm)
    pnlFilter: TPanel;
    lblGainType: TLabel;
    pnlFilterTop: TPanel;
    cbGainType: TDBComboBoxEh;
    RxSplitter: TRxSplitter;
    mdGain: TRxMemoryData;
    dsGain: TDataSource;
    pmGain: TPopupMenu;
    pmGainAdd: TMenuItem;
    pmGainEdit: TMenuItem;
    pmGainDelete: TMenuItem;
    N1: TMenuItem;
    pmGainRefresh: TMenuItem;
    mdGainREG_DATE: TDateField;
    mdGainSUMM: TFloatField;
    mdGainCOMMENT: TStringField;
    mdGainDATE_OF_WEEK: TStringField;
    lblPeriod: TLabel;
    lblPeriodStart: TLabel;
    lblPeriodEnd: TLabel;
    lblError: TLabel;
    Pages: TPageControl;
    tsGain: TTabSheet;
    GridGain: TDBGridEh;
    tsGainPeriod: TTabSheet;
    GridGainPeriod: TDBGridEh;
    mdGainPeriod: TRxMemoryData;
    dsGainPeriod: TDataSource;
    lblGroupCriterion: TLabel;
    cbGroupCriterion: TDBComboBoxEh;
    mdGainPeriodSUMM: TFloatField;
    mdGainPeriodPERIOD_NO: TWordField;
    mdGainPeriodPERIOD: TStringField;
    tsDiagram: TTabSheet;
    Chart: TChart;
    Series1: TBarSeries;
    mdGainPeriodAVG_SUMM: TFloatField;
    mdGainPeriodDAYS_PERIOD: TIntegerField;
    pnlExclude: TPanel;
    mdGainType: TRxMemoryData;
    dsGainType: TDataSource;
    mdGainTypeEXCLUDE: TBooleanField;
    GridGainType: TDBGridEh;
    pnlGainTypeTitle: TPanel;
    cbDopParam: TCheckBox;
    pmGainType: TPopupMenu;
    N2: TMenuItem;
    pmAll: TMenuItem;
    pmNon: TMenuItem;
    pmAllWithout: TMenuItem;
    pmNonWithout: TMenuItem;
    pmGainTypeRefresh: TMenuItem;
    lblComment: TLabel;
    edComment: TDBEditEh;
    mdGainGAIN_ID: TIntegerField;
    mdGainGAIN_TYPE: TStringField;
    mdGainTypeGAIN_TYPE_ID: TIntegerField;
    mdGainTypeGAIN_TYPE: TStringField;
    edPeriodBegin: TDBDateTimeEditEh;
    edPeriodEnd: TDBDateTimeEditEh;
    sbStartPeriodBegin: TSpeedButton;
    sbStartPeriodEnd: TSpeedButton;
    sbEndPeriodBegin: TSpeedButton;
    sbEndPeriodEnd: TSpeedButton;
    mdGainPeriodMIN_GAIN: TFloatField;
    mdGainPeriodMAX_GAIN: TFloatField;
    mdGainPeriodGAIN_COUNT: TIntegerField;
    DockGainPeriod: TDock97;
    ToolbarGainPeriod: TToolbar97;
    navGainPeriod: TLMDDBNavigator;
    btnGainPeriodOptimizeWidth: TSpeedButton;
    DockGain: TDock97;
    ToolbarGain: TToolbar97;
    btnGainOptimizeWidth: TSpeedButton;
    navGain: TLMDDBNavigator;
    pmAddPattern: TMenuItem;
    mdGainUNACCOUNTED: TSmallintField;
    mdGainPeriodUNACCOUNTED: TSmallintField;
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
    procedure GridGainSortMarkingChanged(Sender: TObject);
    procedure GridGainGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mdGainAfterScroll(DataSet: TDataSet);
    procedure cbGainTypeChange(Sender: TObject);
    procedure mdGainCalcFields(DataSet: TDataSet);
    procedure PagesChange(Sender: TObject);
    procedure GridGainPeriodSortMarkingChanged(Sender: TObject);
    procedure GridGainTypeCellClick(Column: TColumnEh);
    procedure cbDopParamClick(Sender: TObject);
    procedure pmAllClick(Sender: TObject);
    procedure pmNonClick(Sender: TObject);
    procedure pmAllWithoutClick(Sender: TObject);
    procedure pmNonWithoutClick(Sender: TObject);
    procedure pmGainTypeRefreshClick(Sender: TObject);
    procedure sbEndPeriodBeginClick(Sender: TObject);
    procedure sbEndPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodEndClick(Sender: TObject);
    procedure sbStartPeriodBeginClick(Sender: TObject);
    procedure btnGainPeriodOptimizeWidthClick(Sender: TObject);
    procedure btnGainOptimizeWidthClick(Sender: TObject);
    procedure GridGainPeriodGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure cdPeriodChange(Sender: TObject);
    procedure edPeriodBeginChange(Sender: TObject);
  private
    fChildInfo: PChildInfo;
    fGetGainList: boolean;
    fCanGainDelete: boolean;
    procedure LoadFromIni;
    procedure SaveToIni;

    //задание списка видов доходов
    procedure SetGainTypeList(cb: TDBComboBoxEh);

    //получение списка видов доходов
    procedure GetGainTypeList;
    //запрос в FireBird (виды доходов)
    function QueryFromFireBirdGainType: boolean;
    //копирование данных во временную таблицу (виды доходов)
    procedure CopyToMemoryDataGainType;

    //получение списка доходов
    procedure GetGainList;
    //запрос в FireBird (доходы)
    function QueryFromFireBirdGain: boolean;
    //копирование данных во временную таблицу (доходы)
    procedure CopyToMemoryDataGain;

    //получение данных о текущем периоде
    procedure GetPeriodInfo
    (
            reg_date:    TDate;
        var period_no:   word;
        var period:      string;
        var period_days: word
    );

    //доход за текущий месяц
    procedure CurrentMonthGain;
  public
    { Public declarations }
  end;

var
  frmGain: TfrmGain;

implementation

uses
	dmHomeAudit,
        fMain,
        fGainEd,
        uCommon,
        DateUtil,
        DateUtils;

{$R *.dfm}

procedure TfrmGain.FormCreate(Sender: TObject);
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
        
        mdGainType.Active        := true;
        mdGain.Active            := true;
        mdGainPeriod.Active      := true;

        fGetGainList             := false;

        SetGainTypeList(cbGainType);
        LoadFromIni;
        cdPeriod.ItemIndex       := 0;

        edPeriodBegin.Value      := StartOfTheMonth(Now);
        edPeriodEnd.Value        := Now;

        fGetGainList             := true;

        pnlFilter.Visible        := fChildInfo.haFilterPanelOn;
	RxSplitter.Visible       := fChildInfo.haFilterPanelOn;
end;

procedure TfrmGain.FormShow(Sender: TObject);
begin
        GetGainTypeList;
        GetGainList;
        CurrentMonthGain;
end;

procedure TfrmGain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        SaveToIni;
        mdGainType.Active   := false;
	mdGain.Active       := false;
        mdGainPeriod.Active := false;
	Action := caFree;
end;

//задание списка видов доходов
procedure TfrmGain.SetGainTypeList(cb: TDBComboBoxEh);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT GAIN_TYPE_ID, NAME'
	+ ' FROM GAIN_TYPE'
	+ ' ORDER BY NAME';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении списка видов доходов.');
                exit;
	end;

        //количество видов доходов  > 100
        if (DataMod.IB_Cursor.RecordCount > 100) then
        begin
                WarningBox('Количество видов доходов более 100.' + #13 +
                'Поле "Виды доходов" будет недоступно.' + #13#13 +
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
                cb.KeyItems.Add(DataMod.IB_Cursor.FieldByName('GAIN_TYPE_ID').AsString);
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
procedure TfrmGain.LoadFromIni;
var
	sect: string;
begin
	sect := 'Gain';
	fChildInfo.haFilterPanelOn := OptionsIni.ReadBool(sect, 'FilterPanelOn', true);
	pnlFilter.Width            := OptionsIni.ReadInteger(sect, 'FilterPanelWidth', 190);
        cbGroupCriterion.ItemIndex := OptionsIni.ReadInteger(sect, 'GroupCriterion', 0);

        sect := 'Options';
        fCanGainDelete := OptionsIni.ReadBool(sect, 'CanGainDelete', true);
end;

//сохранение параметров в ini-файл
procedure TfrmGain.SaveToIni;
var
	sect: string;
begin
	sect := 'Gain';
	OptionsIni.WriteBool(sect, 'FilterPanelOn', fChildInfo.haFilterPanelOn);
	OptionsIni.WriteInteger(sect, 'FilterPanelWidth', pnlFilter.Width);
        OptionsIni.WriteInteger(sect, 'GroupCriterion', cbGroupCriterion.ItemIndex);
end;

//панель фильтрации
procedure TfrmGain.AcFilterPanelExecute(Sender: TObject);
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
procedure TfrmGain.AcAddExecute(Sender: TObject);
var
	GainEd: TfrmGainEd;
begin
	GainEd := TfrmGainEd.Create(Application);
	if GainEd = nil then
		exit;

	GainEd.Add(dsGain);
	GainEd.Free;

        CurrentMonthGain;
end;

//добавить запись по образцу
procedure TfrmGain.AcAddPatternExecute(Sender: TObject);
var
	GainEd: TfrmGainEd;
begin
	GainEd := TfrmGainEd.Create(Application);
	if GainEd = nil then
		exit;

        GainEd.cbGainType.Text       := mdGain.FieldByName('GAIN_TYPE').AsString;
        GainEd.edSumm.Value          := mdGain.FieldByName('SUMM').AsVariant;
        GainEd.edComment.Text        := mdGain.FieldByName('COMMENT').AsString;
        GainEd.cbUnaccounted.Checked := boolean(mdGain.FieldByName('UNACCOUNTED').AsInteger);

	GainEd.Add(dsGain);
	GainEd.Free;

        CurrentMonthGain;
end;

//редактировать запись
procedure TfrmGain.AcEditExecute(Sender: TObject);
var
	GainEd: TfrmGainEd;
begin
	//редактирование недоступно
        if (mdGain.IsEmpty) then
        	exit;

	GainEd := TfrmGainEd.Create(Application);
	if GainEd = nil then
		exit;

	GainEd.Edit(dsGain, mdGain.FieldByName('GAIN_ID').AsInteger);
	GainEd.Free;

        CurrentMonthGain;
end;

//удалить запись
procedure TfrmGain.AcDeleteExecute(Sender: TObject);
begin
	//удаление недоступно
        if (mdGain.IsEmpty) then
        	exit;

	//диалог подтверждения удаления
        if (YesNoBox(format('Удалить доход "%f руб." (ID #%d)?', [mdGain.FieldByName('SUMM').AsFloat, mdGain.FieldByName('GAIN_ID').AsInteger])) = IDYES) then
	begin
          	//удаление
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM GAINS WHERE GAIN_ID = ' + mdGain.FieldByName('GAIN_ID').AsString;

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

                mdGain.Delete;

                CurrentMonthGain;
        end;
end;

//обновить данные
procedure TfrmGain.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//обновление недоступно
        if (mdGain.IsEmpty) then
        	exit;

        for i := 0 to GridGain.Columns.Count - 1 do
        	GridGain.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridGainPeriod.Columns.Count - 1 do
        	GridGainPeriod.Columns[i].Title.SortMarker := smNoneEh;

        GetGainTypeList;
	GetGainList;
        CurrentMonthGain;
end;

//------------------------------------------------------------------------------
//получение списка видов доходов
procedure TfrmGain.GetGainTypeList;
begin
	//MsgBox('GetGainTypeList');
        if (QueryFromFireBirdGainType) then
	        CopyToMemoryDataGainType;
end;

//запрос в FireBird (виды доходов)
function TfrmGain.QueryFromFireBirdGainType: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT GAIN_TYPE_ID'
                + ', NAME'
        + ' FROM GAIN_TYPE'
        + ' ORDER BY NAME';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы видов доходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (виды доходов)
procedure TfrmGain.CopyToMemoryDataGainType;
begin
	GridGainType.DataSource.DataSet.DisableControls;
        GridGainType.SumList.ClearSumValues;
   	mdGainType.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdGainType.Append;
                mdGainType.FieldByName('GAIN_TYPE_ID').AsInteger := DataMod.IB_Cursor.FieldByName('GAIN_TYPE_ID').AsInteger;
                mdGainType.FieldByName('GAIN_TYPE').AsString     := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdGainType.FieldByName('EXCLUDE').AsBoolean      := true;
                mdGainType.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdGainType.First;

        GridGainType.DataSource.DataSet.EnableControls;
end;

//------------------------------------------------------------------------------
//получение списка доходов
procedure TfrmGain.GetGainList;
var
	i: word;
begin
        //MsgBox('GetGainList');

        Chart.Title.Text.Clear;
        Chart.Title.Text.Add('Доходы за период');
        Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
        Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));

        for i := 0 to GridGain.Columns.Count - 1 do
        	GridGain.Columns[i].Title.SortMarker := smNoneEh;

        for i := 0 to GridGainPeriod.Columns.Count - 1 do
        	GridGainPeriod.Columns[i].Title.SortMarker := smNoneEh;

        if (QueryFromFireBirdGain) then
	        CopyToMemoryDataGain;
end;

//запрос в FireBird (доходы)
function TfrmGain.QueryFromFireBirdGain: boolean;
var
        rec_no: integer;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Clear;
        DataMod.IB_Cursor.SQL.Add('SELECT G.GAIN_ID'
                + ', G.REG_DATE'
                + ', T.NAME'
                + ', G.SUMM'
                + ', G.COMMENT'
                + ', G.UNACCOUNTED'
        + ' FROM GAINS g'
        + ' INNER JOIN GAIN_TYPE t ON T.GAIN_TYPE_ID = G.GAIN_TYPE_ID'
        + ' WHERE G.REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + '''');

        //выбран вид доходов
        if (cbGainType.ItemIndex <> 0) then
                DataMod.IB_Cursor.SQL.Add('AND T.GAIN_TYPE_ID = ' + cbGainType.KeyItems.Strings[cbGainType.ItemIndex]);

        //комментарий
        if (edComment.Text <> '') then
                DataMod.IB_Cursor.SQL.Add('AND LOWER(G.COMMENT) LIKE LOWER(''%' + edComment.Text + '%'')');

        //дополнительные параметры фильтрации
        GridGainType.DataSource.DataSet.DisableControls;
        rec_no := mdGainType.RecNo;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                if (mdGainType.FieldByName('EXCLUDE').AsBoolean = false) then
                        DataMod.IB_Cursor.SQL.Add('AND G.GAIN_TYPE_ID <> ' + mdGainType.FieldByName('GAIN_TYPE_ID').AsString);

                mdGainType.Next;
        end;
        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        DataMod.IB_Cursor.SQL.Add('ORDER BY G.REG_DATE, G.GAIN_ID');

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при заполнении таблицы доходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (доходы)
procedure TfrmGain.CopyToMemoryDataGain;
var
        i, gain_count,
        record_count,
        step_record: integer;

        summ_period,
        min_gain,
        max_gain: double;

        period_no,
        period_no_column,
        period_days,
        unacc_flag: word;

        reg_date: TDate;

        period: string;
begin
	GridGain.DataSource.DataSet.DisableControls;
        GridGainPeriod.DataSource.DataSet.DisableControls;

        GridGain.SumList.ClearSumValues;
	GridGainPeriod.SumList.ClearSumValues;

   	mdGain.EmptyTable;
        mdGainPeriod.EmptyTable;

        Chart.Series[0].Clear;

        gain_count        := 0;
        step_record       := 1000;
        record_count      := 0;
        summ_period       := 0;
        period_no         := 0;
        period_no_column  := 0;
        period_days       := 0;
        min_gain          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
        max_gain          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
        unacc_flag        := DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger;;
        reg_date          := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;

        //поиск номера колонки "Номер периода"
        for i := 0 to GridGainPeriod.Columns.Count - 1 do
                if (GridGainPeriod.Columns.Items[i].FieldName = 'PERIOD_NO') then
                 	period_no_column := i;

        //группировка по дням
        if (cbGroupCriterion.ItemIndex = 0) then
                GridGainPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер дня'
        //группировка по неделям
        else if (cbGroupCriterion.ItemIndex = 1) then
                GridGainPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер недели'
        //группировка по месяцам
        else if (cbGroupCriterion.ItemIndex = 2) then
                GridGainPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер месяца'
        //группировка по годам
        else if (cbGroupCriterion.ItemIndex = 3) then
                GridGainPeriod.Columns.Items[period_no_column].Title.Caption := 'Номер года';

        //получение данных о текущем периоде
        GetPeriodInfo(reg_date, period_no, period, period_days);

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
                //доходы
        	mdGain.Append;
                mdGain.FieldByName('UNACCOUNTED').AsInteger := DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger;
                mdGain.FieldByName('GAIN_ID').AsInteger     := DataMod.IB_Cursor.FieldByName('GAIN_ID').AsInteger;
                mdGain.FieldByName('REG_DATE').AsDateTime   := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
                mdGain.FieldByName('GAIN_TYPE').AsString    := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdGain.FieldByName('SUMM').AsFloat          := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                mdGain.FieldByName('COMMENT').AsString      := DataMod.IB_Cursor.FieldByName('COMMENT').AsString;
                mdGain.Post;

                reg_date := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;

                //доходы за период
                if (((cbGroupCriterion.ItemIndex = 0) and (period_no <> DayOfTheYear(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 1) and (period_no <> WeekOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 2) and (period_no <> MonthOf(reg_date)))
                or  ((cbGroupCriterion.ItemIndex = 3) and (period_no <> YearOf(reg_date))))
                then
                begin
                        //если за период есть хотя бы один доход без признака
                        //"не учитывать при группировке за период"
                        if (summ_period > 0) then
                        begin
                                mdGainPeriod.Append;
                                mdGainPeriod.FieldByName('UNACCOUNTED').AsInteger := unacc_flag;
                                mdGainPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                                mdGainPeriod.FieldByName('PERIOD').AsString       := period;
                                mdGainPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                                mdGainPeriod.FieldByName('GAIN_COUNT').AsInteger  := gain_count;
                                mdGainPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                                //средний доход за период
                                if (not mdGainPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                                        mdGainPeriod.FieldByName('AVG_SUMM').AsFloat := mdGainPeriod.FieldByName('SUMM').AsFloat / mdGainPeriod.FieldByName('DAYS_PERIOD').AsInteger
                                else
                                        mdGainPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                                mdGainPeriod.FieldByName('MIN_GAIN').AsFloat      := min_gain;
                                mdGainPeriod.FieldByName('MAX_GAIN').AsFloat      := max_gain;
                                mdGainPeriod.Post;

                                Chart.Series[0].Add(summ_period, period, clInactiveCaption);
                        end;

                        gain_count  := 0;
                        summ_period := 0;
                        unacc_flag  := 0;
                        min_gain    := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                        max_gain    := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        //получение данных о текущем периоде
                        GetPeriodInfo(reg_date, period_no, period, period_days);
                end;

                //доход с признаком "не учитывать при группировке за период"
                if (DataMod.IB_Cursor.FieldByName('UNACCOUNTED').AsInteger = 1) then
                        unacc_flag := 1
                else
                begin
                        if (DataMod.IB_Cursor.FieldByName('SUMM').AsFloat < min_gain) then
                                min_gain := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        if (DataMod.IB_Cursor.FieldByName('SUMM').AsFloat > max_gain) then
                                max_gain := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

                        inc(gain_count);
                        summ_period := summ_period + DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                end;

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

        //доходы за период
        if ((not mdGain.IsEmpty) and (summ_period > 0)) then
        begin
                mdGainPeriod.Append;
                mdGainPeriod.FieldByName('UNACCOUNTED').AsInteger := unacc_flag;
                mdGainPeriod.FieldByName('PERIOD_NO').AsInteger   := period_no;
                mdGainPeriod.FieldByName('PERIOD').AsString       := period;
                mdGainPeriod.FieldByName('DAYS_PERIOD').AsInteger := period_days;
                mdGainPeriod.FieldByName('GAIN_COUNT').AsInteger  := gain_count;
                mdGainPeriod.FieldByName('SUMM').AsFloat          := summ_period;

                //средний доход за период
                if (not mdGainPeriod.FieldByName('DAYS_PERIOD').IsNull) then
                        mdGainPeriod.FieldByName('AVG_SUMM').AsFloat := mdGainPeriod.FieldByName('SUMM').AsFloat / mdGainPeriod.FieldByName('DAYS_PERIOD').AsInteger
                else
                        mdGainPeriod.FieldByName('AVG_SUMM').AsFloat := 0;

                mdGainPeriod.FieldByName('MIN_GAIN').AsFloat      := min_gain;
                mdGainPeriod.FieldByName('MAX_GAIN').AsFloat      := max_gain;
                mdGainPeriod.Post;

                Chart.Series[0].Add(summ_period, period, clInactiveCaption);
        end;

        mdGain.First;
        mdGainPeriod.First;
        frmMain.StatusBar.Panels[1].Text := GetLongHint(Application.Hint);

        GridGain.DataSource.DataSet.EnableControls;
        GridGainPeriod.DataSource.DataSet.EnableControls;
end;

procedure TfrmGain.pnlFilterResize(Sender: TObject);
begin
        cbGainType.Width              := pnlFilter.Width  - 20;
        cbGroupCriterion.Width        := pnlFilter.Width  - 20;
        edComment.Width               := pnlFilter.Width  - 20;

        edPeriodBegin.Width           := pnlFilter.Width  - 80;
        edPeriodEnd.Width             := pnlFilter.Width  - 80;
        sbStartPeriodBegin.Left       := pnlFilter.Width  - 50;
        sbEndPeriodBegin.Left         := pnlFilter.Width  - 30;
        sbStartPeriodEnd.Left         := pnlFilter.Width  - 50;
        sbEndPeriodEnd.Left           := pnlFilter.Width  - 30;
        cdPeriod.Width                := pnlFilter.Width  - 20;

        pnlExclude.Height             := pnlFilter.Height - 265;
        GridGainType.Columns[1].Width := pnlFilter.Width  - 40;
end;

procedure TfrmGain.GridGainSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridGain = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridGain.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridGain.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridGain.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdGain.SortOnFields(fields, false, desc);
end;

procedure TfrmGain.GridGainPeriodSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridGainPeriod = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridGainPeriod.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridGainPeriod.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridGainPeriod.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdGainPeriod.SortOnFields(fields, false, desc);
end;

procedure TfrmGain.GridGainGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
       if (mdGain.FieldByName('GAIN_ID').IsNull) then
                Background := $FFFFFF
        else
        if ((DayOf(mdGain.FieldByName('REG_DATE').AsDateTime) mod 2) = 0) then
		Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmGain.GridGainPeriodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
        if (mdGainPeriod.FieldByName('UNACCOUNTED').AsInteger = 0) then
                Background := $00FFDDDD
        else
		Background := $00FFC4C4;
end;

procedure TfrmGain.mdGainAfterScroll(DataSet: TDataSet);
begin
        if (Pages.ActivePageIndex <> 0) then
	        exit;

        fChildInfo.haAddPattern := not mdGain.IsEmpty;
        fChildInfo.haEdit       := not mdGain.IsEmpty;
        fChildInfo.haDelete     := not mdGain.IsEmpty and fCanGainDelete;
end;

procedure TfrmGain.cbGainTypeChange(Sender: TObject);
begin
        lblError.Visible := false;

        if (not fGetGainList) then
                exit;

        //проверка корректности заполнения поля даты
        if ((TryGetDateTime(edPeriodBegin.Text)) and (TryGetDateTime(edPeriodEnd.Text))
        and ((edPeriodBegin.Value) <= (edPeriodEnd.Value)))then
                GetGainList

        else
        begin
                mdGain.EmptyTable;
                mdGainPeriod.EmptyTable;
                fChildInfo.haAddPattern := false;
                fChildInfo.haEdit       := false;
                lblError.Visible        := true;
                GridGain.SumList.ClearSumValues;
                GridGainPeriod.SumList.ClearSumValues;

                Chart.Title.Text.Clear;
                Chart.Title.Text.Add('Доходы за период');
                Chart.Title.Text.Add(format('Группировка по %s', [cbGroupCriterion.Text]));
                Chart.Title.Text.Add(format('Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]));
                Chart.Series[0].Clear;
        end;
end;

procedure TfrmGain.mdGainCalcFields(DataSet: TDataSet);
var
        day_of_week: byte;
        res: string[2];
begin
        if ((mdGain.FieldByName('GAIN_ID').IsNull) or (mdGain.FieldByName('REG_DATE').IsNull)) then
                exit;

        day_of_week := DayOfTheWeek(mdGain.FieldByName('REG_DATE').AsDateTime);

        case day_of_week of
                1: res := 'пн';
                2: res := 'вт';
                3: res := 'ср';
                4: res := 'чт';
                5: res := 'пт';
                6: res := 'сб';
                7: res := 'вс';
        end;

        mdGain.FieldByName('DATE_OF_WEEK').AsString := res;
end;

procedure TfrmGain.PagesChange(Sender: TObject);
begin
        //доходы
        if (Pages.ActivePageIndex = 0) then
	begin
                cbGroupCriterion.Enabled := false;
                fChildInfo.haAdd         := true;

                if (mdGain.IsEmpty) then
                begin
                        fChildInfo.haAddPattern  := false;
                        fChildInfo.haEdit        := false;
                end

                else
                begin
                        fChildInfo.haAddPattern  := true;
                        fChildInfo.haEdit        := true;
                end;

                fChildInfo.haDelete      := fCanGainDelete;
                fChildInfo.haRefresh     := true;
	end

        //доходы за период
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

procedure TfrmGain.GridGainTypeCellClick(Column: TColumnEh);
begin
        if (Column.FieldName <> 'EXCLUDE') then
                exit;

        mdGainType.Edit;
        if (mdGainType.FieldByName('EXCLUDE').AsBoolean = true) then
                mdGainType.FieldByName('EXCLUDE').AsBoolean := false
        else
                mdGainType.FieldByName('EXCLUDE').AsBoolean := true;
        mdGainType.Post;
        
        GetGainList;
end;

procedure TfrmGain.cbDopParamClick(Sender: TObject);
var
        rec_no: integer;
begin
        if (cbDopParam.Checked) then
        begin
                pnlExclude.Visible := true;
                exit;
        end;

        pnlExclude.Visible := false;
        rec_no := mdGainType.RecNo;

        GridGainType.DataSource.DataSet.DisableControls;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                mdGainType.Edit;
                mdGainType.FieldByName('EXCLUDE').AsBoolean := true;
                mdGainType.Post;
                mdGainType.Next;
        end;

        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        if (not lblError.Visible) then
                GetGainList;
end;

//все
procedure TfrmGain.pmAllClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdGainType.RecNo;

        GridGainType.DataSource.DataSet.DisableControls;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                mdGainType.Edit;
                mdGainType.FieldByName('EXCLUDE').AsBoolean := true;
                mdGainType.Post;
                mdGainType.Next;
        end;

        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        GetGainList;
end;

//ничего
procedure TfrmGain.pmNonClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdGainType.RecNo;

        GridGainType.DataSource.DataSet.DisableControls;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                mdGainType.Edit;
                mdGainType.FieldByName('EXCLUDE').AsBoolean := false;
                mdGainType.Post;
                mdGainType.Next;
        end;

        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        GetGainList;
end;

//все, кроме текущего
procedure TfrmGain.pmAllWithoutClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdGainType.RecNo;

        GridGainType.DataSource.DataSet.DisableControls;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                mdGainType.Edit;
                mdGainType.FieldByName('EXCLUDE').AsBoolean := mdGainType.RecNo <> rec_no;
                mdGainType.Post;

                mdGainType.Next;
        end;

        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        GetGainList;
end;

//ничего, кроме текущего
procedure TfrmGain.pmNonWithoutClick(Sender: TObject);
var
        rec_no: integer;
begin
        rec_no := mdGainType.RecNo;

        GridGainType.DataSource.DataSet.DisableControls;
        mdGainType.First;
        while (not (mdGainType.Eof)) do
        begin
                mdGainType.Edit;
                mdGainType.FieldByName('EXCLUDE').AsBoolean := mdGainType.RecNo = rec_no;
                mdGainType.Post;

                mdGainType.Next;
        end;

        mdGainType.RecNo := rec_no;
        GridGainType.DataSource.DataSet.EnableControls;

        GetGainList;
end;

//обновить
procedure TfrmGain.pmGainTypeRefreshClick(Sender: TObject);
begin
        GetGainTypeList;
        GetGainList;
end;

procedure TfrmGain.sbStartPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmGain.sbEndPeriodBeginClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов.');
                exit;
	end;

        edPeriodBegin.Value := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;
        cdPeriod.ItemIndex  := 0;
end;

procedure TfrmGain.sbStartPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов.');
                exit;
	end;

        edPeriodEnd.Value  := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;
        cdPeriod.ItemIndex := 0;
end;

procedure TfrmGain.sbEndPeriodEndClick(Sender: TObject);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения доходов.');
                exit;
	end;

        edPeriodEnd.Value  := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmGain.btnGainOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridGain.Columns.Count - 1 do
                GridGain.Columns[i].OptimizeWidth;
end;

procedure TfrmGain.btnGainPeriodOptimizeWidthClick(Sender: TObject);
var
        i: integer;
begin
        for i := 0 to GridGainPeriod.Columns.Count - 1 do
                GridGainPeriod.Columns[i].OptimizeWidth;
end;

//получение данных о текущем периоде
procedure TfrmGain.GetPeriodInfo
(
            reg_date:    TDate;
        var period_no:   word;
        var period:      string;
        var period_days: word
);
begin
        //группировка по дням
        if (cbGroupCriterion.ItemIndex = 0) then
        begin
                period_no    := DayOfTheYear(reg_date);
                period       := format('%s', [DateToStr(reg_date)]);
                period_days  := 1;
        end

        //группировка по неделям
        else if (cbGroupCriterion.ItemIndex = 1) then
        begin
                period_no    := WeekOf(reg_date);
                period       := format('%s - %s', [DateToStr(StartOfTheWeek(reg_date)), DateToStr(EndOfTheWeek(reg_date))]);
                period_days  := 7;
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

//доход за текущий месяц
procedure TfrmGain.CurrentMonthGain;
var
        i: integer;
        str: string;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT SUM(SUMM) MONTH_SUMM'
        + ' FROM GAINS'
        + ' WHERE REG_DATE BETWEEN ''' + DateToStr(StartOfTheMonth(Now)) + ''' AND ''' + DateToStr(EndOfTheMonth(Now)) + '''';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении суммы доходов за текущий месяц.');
                exit;
	end;

        str := format('%s %d: ', [GetMonthStr(MonthOf(Now)), YearOf(Now)]);

        if (DataMod.IB_Cursor.FieldByName('MONTH_SUMM').IsNull) then
                //разделитель целой и дробной части берется из настройки операционной системы
                str := str + '0' + DecimalSeparator + '00 руб.'
        else
                str := str + format('%f руб.', [DataMod.IB_Cursor.FieldByName('MONTH_SUMM').AsFloat]);
                
        for i := 0 to GridGain.Columns.Count - 1 do
                if (GridGain.Columns.Items[i].FieldName = 'GAIN_TYPE') then
                	GridGain.Columns[i].Footer.Value :=  str;

        DataMod.IB_Cursor.Close;
end;

procedure TfrmGain.cdPeriodChange(Sender: TObject);
begin
        if ((not fGetGainList) or (cdPeriod.ItemIndex = 0)) then
                exit;

        fGetGainList := false;

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

        fGetGainList := true;

        //----------------------------------------------------------------------
        //далее такой же обработчик как у "FormShow"
        GetGainTypeList;
        GetGainList;
        CurrentMonthGain;
end;

procedure TfrmGain.edPeriodBeginChange(Sender: TObject);
begin
        if ((edPeriodBegin.Focused) or (edPeriodEnd.Focused)) then
                cdPeriod.ItemIndex := 0;

        cbGainTypeChange(nil);
end;

end.
