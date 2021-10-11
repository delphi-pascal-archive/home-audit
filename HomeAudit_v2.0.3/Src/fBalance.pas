//Баланс
unit fBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDEdit, StdCtrls, Mask, ToolEdit, CurrEdit,
  ComCtrls, ExtCtrls, DB, RxMemDS, Grids, DBGridEh, DBCtrlsEh;

type
  TfrmBalance = class(TForm)
    pnlBottom: TPanel;
    btnOK: TButton;
    Pages: TPageControl;
    tsCurrentBalance: TTabSheet;
    lblGain: TLabel;
    lblCost: TLabel;
    lblBalance: TLabel;
    tsDayBalance: TTabSheet;
    GridBalance: TDBGridEh;
    mdBalance: TRxMemoryData;
    dsBalance: TDataSource;
    mdBalanceREG_DATE: TDateField;
    mdBalanceBALANCE: TFloatField;
    edGain: TDBNumberEditEh;
    edCost: TDBNumberEditEh;
    edBalance: TDBNumberEditEh;
    lblDebt: TLabel;
    edDebt: TDBNumberEditEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridBalanceSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalance: TfrmBalance;

implementation

uses
	dmHomeAudit,
        uCommon,
        DateUtil,
        DateUtils;

{$R *.dfm}

procedure TfrmBalance.FormCreate(Sender: TObject);
begin
        Pages.ActivePageIndex := 0;
        mdBalance.Active      := true;
end;

procedure TfrmBalance.FormShow(Sender: TObject);
var
        gain,
        cost,
        debt,
        balance: double;

        reg_date,
        min_gain_date,
        min_cost_date,
        min_date,
        max_gain_date,
        max_cost_date,
        max_date: TDate;

        day, balance_day: word;
begin
        //текущий баланс
        gain    := 0;
        cost    := 0;
        debt    := 0;
        balance := 0;

        //TODO: закомментировано - переведено на процедуру "BALANCE_ON_DATE"

        //доходы
        {DataMod.IB_Cursor.SQL.Text := 'SELECT SUM(SUMM) SUMM FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении суммы дохода.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                gain := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

        DataMod.IB_Cursor.Close;

        //расходы
        DataMod.IB_Cursor.SQL.Text := 'SELECT SUM(SUMM) SUMM FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении суммы расхода.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                cost := DataMod.IB_Cursor.FieldByName('SUMM').AsFloat;

        DataMod.IB_Cursor.Close;

        //текущий баланс
        balance := gain - cost;}


        DataMod.IB_Cursor.SQL.Text := 'SELECT GAIN, COST, DEBT, BALANCE FROM BALANCE_ON_DATE(''' + DateToStr(Now) + ''')';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении суммы дохода.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
        begin
                gain    := DataMod.IB_Cursor.FieldByName('GAIN').AsFloat;
                cost    := DataMod.IB_Cursor.FieldByName('COST').AsFloat;
                debt    := DataMod.IB_Cursor.FieldByName('DEBT').AsFloat;
                balance := DataMod.IB_Cursor.FieldByName('BALANCE').AsFloat;
        end;

        DataMod.IB_Cursor.Close;

        edGain.Value    := gain;
        edCost.Value    := cost;
        edDebt.Value    := debt;
        edBalance.Value := balance;

        //----------------------------------------------------------------------
        //баланс на дату месяца
        min_gain_date := now;
        min_cost_date := now;
        min_date      := now;
        max_gain_date := now;
        max_cost_date := now;
        max_date      := now;

        //первый день внесения доходов
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении первого дня внесения доходов.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                min_gain_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDateTime;

        DataMod.IB_Cursor.Close;

        //первый день внесения расходов
        DataMod.IB_Cursor.SQL.Text := 'SELECT MIN(REG_DATE) MIN_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении последнего дня внесения расходов.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                min_cost_date := DataMod.IB_Cursor.FieldByName('MIN_DATE').AsDateTime;

        DataMod.IB_Cursor.Close;

        if (min_gain_date < min_cost_date) then
                min_date := min_gain_date
        else
                min_date := min_cost_date;


        //последний день внесения доходов
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM GAINS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении последнего дня внесения доходов.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_gain_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDateTime;

        DataMod.IB_Cursor.Close;

        //последний день внесения расходов
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(REG_DATE) MAX_DATE FROM COSTS';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('Ошибка при вычислении последнего дня внесения расходов.');
                exit;
	end;

        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_cost_date := DataMod.IB_Cursor.FieldByName('MAX_DATE').AsDateTime;

        DataMod.IB_Cursor.Close;

        if (max_gain_date > max_cost_date) then
                max_date := max_gain_date
        else
                max_date := max_cost_date;

        //----------------------------------------------------------------------
        if (min_date > max_date) then
        begin
                WarningBox('Минимальная дата больше максимальной даты.' + #13 +
                'Построение баланса на дату месяца невозможно.');
                exit;
        end;

        balance_day := OptionsIni.ReadInteger('Options', 'BalanceDay', 1);
        reg_date    := StartOfTheMonth(min_date) + balance_day - 1;

        if (reg_date < min_date) then
                reg_date := IncDate(reg_date, 0, 1, 0);

        GridBalance.DataSource.DataSet.DisableControls;
        GridBalance.SumList.ClearSumValues;
        mdBalance.EmptyTable;
        while (reg_date <= max_date) do
        begin
                DataMod.IB_Cursor.SQL.Text := 'SELECT BALANCE FROM BALANCE_ON_DATE(''' + DateToStr(reg_date) + ''')';

                //MsgBox(DataMod.IB_Cursor.SQL.Text);
                //запуск запроса
                try
	                DataMod.IB_Cursor.Open;
                except
        	        WarningBox('Ошибка при вычислении баланса на дату месяца.');
                        exit;
	        end;

                mdBalance.Append;
                mdBalance.FieldByName('REG_DATE').AsDateTime := reg_date;
                mdBalance.FieldByName('BALANCE').AsFloat     := DataMod.IB_Cursor.FieldByName('BALANCE').AsFloat;
                mdBalance.Post;

                DataMod.IB_Cursor.Close;

                reg_date := IncDate(reg_date, 0, 1, 0);
        end;

        //mdBalance.First;
        GridBalance.DataSource.DataSet.EnableControls;
end;

procedure TfrmBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        mdBalance.Active := false;
        Action := caFree;
end;

procedure TfrmBalance.btnOKClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmBalance.GridBalanceSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridBalance = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridBalance.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridBalance.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridBalance.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdBalance.SortOnFields(fields, false, desc);
end;

end.
