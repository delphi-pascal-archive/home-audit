//Корректировка расходов
unit fCostEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrlsEh, Mask, LMDCalendarEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, ToolEdit, CurrEdit;

type
  TfrmCostEd = class(TForm)
    lblDate: TLabel;
    cbCostType: TDBComboBoxEh;
    lblCostType: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    lblSumm: TLabel;
    edComment: TDBEditEh;
    lblCommen: TLabel;
    cbDate: TDBDateTimeEditEh;
    edSumm: TDBNumberEditEh;
    cbUnaccounted: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    //задание списка видов расходов
    procedure SetCostTypeList(cb: TDBComboBoxEh);
  public
    procedure Add(ds: TDataSource);
    procedure Edit(ds: TDataSource; cost_id: integer);
  end;

var
  frmCostEd: TfrmCostEd;

implementation

uses
	dmHomeAudit,
        uCommon,
        fCost;

{$R *.dfm}

procedure TfrmCostEd.FormCreate(Sender: TObject);
begin
        cbDate.Value := Now;
	SetCostTypeList(cbCostType);
end;

//задание списка видов расходов
procedure TfrmCostEd.SetCostTypeList(cb: TDBComboBoxEh);
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
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	cb.Items.Add(DataMod.IB_Cursor.FieldByName('NAME').AsString);
                cb.KeyItems.Add(DataMod.IB_Cursor.FieldByName('COST_TYPE_ID').AsString);
                DataMod.IB_Cursor.Next;
        end;

        cb.ItemIndex := 0;
        DataMod.IB_Cursor.Close;
end;

procedure TfrmCostEd.Add(ds: TDataSource);
var
	max_id, mr: integer;
begin
	Caption := Caption + ' (добавление)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        max_id := 0;
        //получение максимального COST_ID
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(COST_ID) MAX_ID FROM COSTS';
        //MsgBox(DataMod.IB_Cursor.SQL.Text);

        //запуск запроса
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при нахождении максимального COST_ID.');
                exit;
        end;

        //таблица COSTS непуста
        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_id := DataMod.IB_Cursor.FieldByName('MAX_ID').AsInteger;

        DataMod.IB_Cursor.Close;

        //добавляем запись в базу данных
        DataMod.IB_Cursor.SQL.Text := 'INSERT INTO COSTS('
                + '  COST_ID'
                + ', REG_DATE'
                + ', COST_TYPE_ID'
                + ', SUMM'
                + ', COMMENT'
                + ', UNACCOUNTED)'
        + ' VALUES('
                + IntToStr(max_id + 1)
                + ', ''' + cbDate.Text + ''''
                + ', ' + cbCostType.KeyItems.Strings[cbCostType.ItemIndex]
                + ', ' + Sep2Dot(FloatToStr(edSumm.Value))
                + ', ''' + edComment.Text + ''''
                + ', ' + IntToStr(integer(cbUnaccounted.Checked)) + ')'; //сложное преобразование

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
        DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при добавлении записи в таблицу расходов.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //добавляем запись в грид
        ds.DataSet.Append;
        ds.DataSet.FieldByName('UNACCOUNTED').AsInteger := integer(cbUnaccounted.Checked);
        ds.DataSet.FieldByName('ERRAND').AsInteger      := 0;
        ds.DataSet.FieldByName('COST_ID').AsInteger     := max_id + 1;
        ds.DataSet.FieldByName('REG_DATE').AsDateTime   := cbDate.Value;
        ds.DataSet.FieldByName('COST_TYPE').AsString    := cbCostType.Text;
        ds.DataSet.FieldByName('SUMM').AsFloat          := edSumm.Value;
        ds.DataSet.FieldByName('COMMENT').AsString      := edComment.Text;
        ds.DataSet.Post;
end;

procedure TfrmCostEd.Edit(ds: TDataSource; cost_id: integer);
var
	mr: integer;
begin
        cbDate.Value          := ds.DataSet.FieldByName('REG_DATE').AsDateTime;
        cbCostType.Text       := ds.DataSet.FieldByName('COST_TYPE').AsString;
        edSumm.Value          := ds.DataSet.FieldByName('SUMM').AsFloat;
        edComment.Text        := ds.DataSet.FieldByName('COMMENT').AsString;
        cbUnaccounted.Checked := boolean(ds.DataSet.FieldByName('UNACCOUNTED').AsInteger);

	Caption := Caption + ' (редактирование)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        DataMod.IB_Cursor.SQL.Text := 'UPDATE COSTS SET'
                + '  REG_DATE       = ''' + cbDate.Text + ''''
                + ', COST_TYPE_ID   = ' + cbCostType.KeyItems.Strings[cbCostType.ItemIndex]
                + ', SUMM           = ' + Sep2Dot(FloatToStr(edSumm.Value))
                + ', COMMENT        = ''' + edComment.Text + ''''
                + ', UNACCOUNTED    = ' + IntToStr(integer(cbUnaccounted.Checked)) //сложное преобразование
        + ' WHERE COST_ID  = ' + IntToStr(cost_id);

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при редактировании записи в таблице расходов.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //редактируем запись в грид
        ds.DataSet.Edit;
        ds.DataSet.FieldByName('REG_DATE').AsDateTime   := cbDate.Value;
        ds.DataSet.FieldByName('COST_TYPE').AsString    := cbCostType.Text;
        ds.DataSet.FieldByName('SUMM').AsFloat          := edSumm.Value;
        ds.DataSet.FieldByName('COMMENT').AsString      := edComment.Text;
        ds.DataSet.FieldByName('UNACCOUNTED').AsInteger := integer(cbUnaccounted.Checked);
        ds.DataSet.Post;
end;

procedure TfrmCostEd.btnOKClick(Sender: TObject);
var
	ch: string;
        pos: word;
begin
        //проверка на пустоту и корректность
	if (not (TryGetDate(cbDate.Text))) then
		StopClose(self, 'Вы неверно указали дату.' + #13#13 + 'Нажмите [ОК] для перехода к полю.', cbDate)
        else if (cbCostType.Text = '') then
		StopClose(self, 'Вы забыли указать вид расходов.' + #13#13 + 'Нажмите [ОК] для перехода к полю.', cbCostType)

        else if (edSumm.Text = '') then
		StopClose(self, 'Вы забыли указать сумму.' + #13#13 + 'Нажмите [ОК] для перехода к полю.', edSumm)
        else if (edSumm.Value <= 0) then
		StopClose(self, 'Сумма должна быть положительной.' + #13#13 + 'Нажмите [ОК] для перехода к полю.', edSumm)

        //проверка, что описание небольше 100 символов
        else if (Length(edComment.Text) > 100) then
        	StopClose(self, 'Описание должно быть небольше 100 символов.' + #13#13 + 'Нажмите [ОК] для перехода к полю.', edComment)

        //проверка на присутствие в описание запрещенных символов
	else if (CheckCorrectString(edComment.Text, ch, pos)) then
		StopClose(self, format('В описании использован недопустимый символ: %s (позиция: %d)%s%sНажмите [ОК] для перехода к полю.',[ch, pos, #13, #13]), edComment);
end;

end.
