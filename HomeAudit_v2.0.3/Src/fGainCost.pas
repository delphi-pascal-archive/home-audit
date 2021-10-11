//Доходы и расходы
unit fGainCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uChild, EasyGraph, ExtCtrls, RXSplit, DBCtrlsEh, StdCtrls, Grids,
  DBGridEh, Mask, Buttons, DB, RxMemDS;

type
  TfrmGainCost = class(TForm)
    pnlEGraph: TPanel;
    pnlFilter: TPanel;
    lblPeriod: TLabel;
    lblPeriodStart: TLabel;
    lblPeriodEnd: TLabel;
    lblError: TLabel;
    sbEndPeriodBegin: TSpeedButton;
    sbEndPeriodEnd: TSpeedButton;
    sbStartPeriodBegin: TSpeedButton;
    sbStartPeriodEnd: TSpeedButton;
    pnlFilterTop: TPanel;
    edPeriodBegin: TDBDateTimeEditEh;
    edPeriodEnd: TDBDateTimeEditEh;
    RxSplitter: TRxSplitter;
    mdCost: TRxMemoryData;
    mdCostREG_DATE: TDateField;
    mdCostSUMM: TFloatField;
    dsCost: TDataSource;
    mdGain: TRxMemoryData;
    mdGainREG_DATE: TDateField;
    mdGainSUMM: TFloatField;
    dsGain: TDataSource;
    cdPeriod: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcFilterPanelExecute(Sender: TObject);
    procedure pnlFilterResize(Sender: TObject);
    procedure edPeriodBeginChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbStartPeriodBeginClick(Sender: TObject);
    procedure sbEndPeriodBeginClick(Sender: TObject);
    procedure sbStartPeriodEndClick(Sender: TObject);
    procedure sbEndPeriodEndClick(Sender: TObject);
    procedure cdPeriodChange(Sender: TObject);
  private
    fChildInfo: PChildInfo;
    fDrawDiagram: boolean;
    //компонент для графического представления данных
    fEGraph: TEasyGraph;
    fHintList: TStringList;
    procedure LoadFromIni;
    procedure SaveToIni;
    procedure OnMouseHint(Sender: TObject; id: Integer);

    //получение списка доходов
    procedure GetGainList;
    //запрос в FireBird (доходы)
    function QueryFromFireBirdGain: boolean;
    //копирование данных во временную таблицу (доходы)
    procedure CopyToMemoryDataGain;

    //получение списка расходов
    procedure GetCostList;
    //запрос в FireBird (расходы)
    function QueryFromFireBirdCost: boolean;
    //копирование данных во временную таблицу (расходы)
    procedure CopyToMemoryDataCost;

    //перерисовывает диаграмму
    procedure RedrawDiag(eg: TEasyGraph);
  public
    { Public declarations }
  end;

var
  frmGainCost: TfrmGainCost;

implementation

uses
        dmHomeAudit,
        uCommon,
        DateUtils;

{$R *.dfm}

procedure TfrmGainCost.FormCreate(Sender: TObject);
begin
        //cтруктуру для обслуживания из главной формы
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := AcFilterPanelExecute;

        mdGain.Active := true;
        mdCost.Active := true;

        fDrawDiagram := false;
        LoadFromIni;
        cdPeriod.ItemIndex  := 0;

        edPeriodBegin.Value := StartOfTheWeek(Now);
        edPeriodEnd.Value   := Now;

        fDrawDiagram := true;

        pnlFilter.Visible  := fChildInfo.haFilterPanelOn;
	RxSplitter.Visible := fChildInfo.haFilterPanelOn;

        //графического представления данных
        fHintList := TStringList.Create;
	fEGraph := TEasyGraph.Create(pnlEGraph);
	fEGraph.OnMouseHint := OnMouseHint;
	fEGraph.Align := alClient;
	pnlEGraph.InsertControl(fEGraph);
	fEGraph.HelpContext := 0; //потому что для навигации используется правая кнопка мыши
	HelpContext := 5380;
end;

procedure TfrmGainCost.FormShow(Sender: TObject);
begin
        GetGainList;
        GetCostList;

        //диаграмма
        try
	        RedrawDiag(fEGraph);
        except
              	Hint := 'Не удалось создать диаграмму доходов и расходов';
        end;
end;

procedure TfrmGainCost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        SaveToIni;
        mdGain.Active := false;
        mdCost.Active := false;
        Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	INI
//
//------------------------------------------------------------------------------

//загрузка параметров из ini-файла
procedure TfrmGainCost.LoadFromIni;
var
	sect: string;
begin
	sect := 'GainCost';
	fChildInfo.haFilterPanelOn := OptionsIni.ReadBool(sect, 'FilterPanelOn', true);
	pnlFilter.Width            := OptionsIni.ReadInteger(sect, 'FilterPanelWidth', 190);
end;

//сохранение параметров в ini-файл
procedure TfrmGainCost.SaveToIni;
var
	sect: string;
begin
	sect := 'GainCost';
	OptionsIni.WriteBool(sect, 'FilterPanelOn', fChildInfo.haFilterPanelOn);
	OptionsIni.WriteInteger(sect, 'FilterPanelWidth', pnlFilter.Width);
end;

//панель фильтрации
procedure TfrmGainCost.AcFilterPanelExecute(Sender: TObject);
begin
        fChildInfo.haFilterPanelOn := not fChildInfo.haFilterPanelOn;
	RxSplitter.Visible         := fChildInfo.haFilterPanelOn;
	pnlFilter.Visible 	   := fChildInfo.haFilterPanelOn;
end;

procedure TfrmGainCost.OnMouseHint(Sender: TObject; id: Integer);
begin
	Hint := fHintList.Strings[id];
end;

procedure TfrmGainCost.pnlFilterResize(Sender: TObject);
begin
        edPeriodBegin.Width     := pnlFilter.Width  - 80;
        edPeriodEnd.Width       := pnlFilter.Width  - 80;
        sbStartPeriodBegin.Left := pnlFilter.Width  - 50;
        sbEndPeriodBegin.Left   := pnlFilter.Width  - 30;
        sbStartPeriodEnd.Left   := pnlFilter.Width  - 50;
        sbEndPeriodEnd.Left     := pnlFilter.Width  - 30;
        cdPeriod.Width          := pnlFilter.Width  - 20;
end;

procedure TfrmGainCost.edPeriodBeginChange(Sender: TObject);
begin
        lblError.Visible := false;

        if ((edPeriodBegin.Focused) or (edPeriodEnd.Focused)) then
                cdPeriod.ItemIndex := 0;

	if (not fDrawDiagram) then
                exit;


        //проверка корректности заполнения поля даты
        if ((TryGetDateTime(edPeriodBegin.Text)) and (TryGetDateTime(edPeriodEnd.Text))
        and ((edPeriodBegin.Value) <= (edPeriodEnd.Value)))then
        begin
                GetGainList;
                GetCostList;

                //диаграмма
                try
                        RedrawDiag(fEGraph);
                except
                        Hint := 'Не удалось создать диаграмму доходов и расходов';
                end;
        end

        else
        begin
                mdCost.EmptyTable;
                mdGain.EmptyTable;
                lblError.Visible := true;
                fHintList.Clear;
                fEGraph.Caption := format('Диаграмма доходов и расходов'#13'Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]);
                fEGraph.Clear;
        end;
end;

//------------------------------------------------------------------------------
//получение списка доходов
procedure TfrmGainCost.GetGainList;
begin
        if (QueryFromFireBirdGain) then
	        CopyToMemoryDataGain;
end;

//запрос в FireBird (доходы)
function TfrmGainCost.QueryFromFireBirdGain: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT REG_DATE'
                + ', SUM(SUMM) SUMM'
        + ' FROM GAINS'
        + ' WHERE REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + ''''
        + ' GROUP BY REG_DATE'
        + ' ORDER BY REG_DATE';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании доходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (доходы)
procedure TfrmGainCost.CopyToMemoryDataGain;
begin
        mdGain.EmptyTable;

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
                //доходы
        	mdGain.Append;
                mdGain.FieldByName('REG_DATE').AsDateTime := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
                mdGain.FieldByName('SUMM').AsFloat        := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                mdGain.Post;

                DataMod.IB_Cursor.Next;
        end;

        DataMod.IB_Cursor.Close;
end;

//------------------------------------------------------------------------------
//получение списка расходов
procedure TfrmGainCost.GetCostList;
begin
        if (QueryFromFireBirdCost) then
	        CopyToMemoryDataCost;
end;

//запрос в FireBird (расходы)
function TfrmGainCost.QueryFromFireBirdCost: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT REG_DATE'
                + ', SUM(SUMM) SUMM'
        + ' FROM COSTS'
        + ' WHERE REG_DATE BETWEEN ''' + edPeriodBegin.Text + ''' AND ''' + edPeriodEnd.Text + ''''
        + ' GROUP BY REG_DATE'
        + ' ORDER BY REG_DATE';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании расходов.');
                exit;
	end;

        result := true;
end;

//копирование данных во временную таблицу (расходы)
procedure TfrmGainCost.CopyToMemoryDataCost;
begin
        mdCost.EmptyTable;

        while (not (DataMod.IB_Cursor.Eof)) do
        begin
                //расходы
        	mdCost.Append;
                mdCost.FieldByName('REG_DATE').AsDateTime := DataMod.IB_Cursor.FieldByName('REG_DATE').AsDateTime;
                mdCost.FieldByName('SUMM').AsFloat        := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;
                mdCost.Post;

                DataMod.IB_Cursor.Next;
        end;

        DataMod.IB_Cursor.Close;
end;

//------------------------------------------------------------------------------
//перерисовывает диаграмму
procedure TfrmGainCost.RedrawDiag(eg: TEasyGraph);
var
	hint: string;
        hint_id: integer;
begin
	if ((mdGain = nil) or (mdCost = nil) or (eg = nil)) then
		exit;

	fHintList.Clear;
	eg.Caption := format('Диаграмма доходов и расходов'#13'Период: %s - %s', [edPeriodBegin.Text, edPeriodEnd.Text]);

	//подготовим питы
	eg.Clear;
        eg.Pits.Add;
	eg.Pits[0].fMinHeight := 100;
	eg.Pits[0].DrawStyle  := dsValues;
        eg.Pits.Add;
	eg.Pits[1].fMinHeight := 100;
	eg.Pits[1].DrawStyle  := dsValues;

	//подготовим легенду
	eg.Legend.Clear;
        eg.Legend.Add(clRed, 'Расходы', '');
        eg.Legend.Add(clSkyBlue, 'Доходы', '');

        //рисуем доходы
   	mdGain.First;
        while (not (mdGain.Eof)) do
        begin
                //подсказка
                hint    := format('Доход за %s на %f руб.', [mdGain.FieldByName('REG_DATE').AsString, mdGain.FieldByName('SUMM').AsFloat]);
                hint_id := fHintList.Add(hint);

                eg.Add(0, mdGain.FieldByName('REG_DATE').AsDateTime - 0.49, mdGain.FieldByName('REG_DATE').AsDateTime + 0.49, mdGain.FieldByName('SUMM').AsFloat, galValue, clSkyBlue, hint_id);
                mdGain.Next;
        end;

        //рисуем расходы
   	mdCost.First;
        while (not (mdCost.Eof)) do
        begin
	        //подсказка
        	hint    := format('Расход за %s на %f руб.', [mdCost.FieldByName('REG_DATE').AsString, mdCost.FieldByName('SUMM').AsFloat]);
		hint_id := fHintList.Add(hint);

                eg.Add(1, mdCost.FieldByName('REG_DATE').AsDateTime - 0.49, mdCost.FieldByName('REG_DATE').AsDateTime + 0.49, mdCost.FieldByName('SUMM').AsFloat, galValue, clRed, hint_id);
                mdCost.Next;
        end;

        eg.FitToWindow;
end;

procedure TfrmGainCost.sbStartPeriodBeginClick(Sender: TObject);
var
        min_gain_date,
        min_cost_date: TDate;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов/расходов.');
                exit;
	end;

        min_gain_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;


        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов/расходов.');
                exit;
	end;

        min_cost_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;


        if (min_gain_date < min_cost_date) then
                edPeriodBegin.Value := min_gain_date
        else
                edPeriodBegin.Value := min_cost_date;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmGainCost.sbEndPeriodBeginClick(Sender: TObject);
var
        max_gain_date,
        max_cost_date: TDate;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения доходов/расходов.');
                exit;
	end;

        max_gain_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;


        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения доходов/расходов.');
                exit;
	end;

        max_cost_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;


        if (max_gain_date > max_cost_date) then
                edPeriodBegin.Value := max_gain_date
        else
                edPeriodBegin.Value := max_cost_date;

        cdPeriod.ItemIndex := 0;
end;

procedure TfrmGainCost.sbStartPeriodEndClick(Sender: TObject);
var
        min_gain_date,
        min_cost_date: TDate;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов/расходов.');
                exit;
	end;

        min_gain_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;


        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании первого дня внесения доходов/расходов.');
                exit;
	end;

        min_cost_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDate;


        if (min_gain_date < min_cost_date) then
                edPeriodEnd.Value := min_gain_date
        else
                edPeriodEnd.Value := min_cost_date;

        cdPeriod.ItemIndex := 0;
end;

procedure TfrmGainCost.sbEndPeriodEndClick(Sender: TObject);
var
        max_gain_date,
        max_cost_date: TDate;
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения доходов/расходов.');
                exit;
	end;

        max_gain_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;


        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при формировании последнего дня внесения доходов/расходов.');
                exit;
	end;

        max_cost_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDate;


        if (max_gain_date > max_cost_date) then
                edPeriodEnd.Value := max_gain_date
        else
                edPeriodEnd.Value := max_cost_date;

        if (Sender <> nil) then
                cdPeriod.ItemIndex := 0;
end;

procedure TfrmGainCost.cdPeriodChange(Sender: TObject);
begin
        if (cdPeriod.ItemIndex = 0) then
                exit;

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

        //----------------------------------------------------------------------
        //далее такой же обработчик как у "FormShow"
        GetGainList;
        GetCostList;

        //диаграмма
        try
	        RedrawDiag(fEGraph);
        except
              	Hint := 'Не удалось создать диаграмму доходов и расходов';
        end;
end;

end.
