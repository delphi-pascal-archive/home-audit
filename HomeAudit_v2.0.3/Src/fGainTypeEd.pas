//Корректировка видов доходов
unit fGainTypeEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrlsEh, Mask, LMDCalendarEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, ToolEdit, CurrEdit;

type
  TfrmGainTypeEd = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    edName: TDBEditEh;
    lblName: TLabel;
    procedure btnOKClick(Sender: TObject);
  private
  
  public
    procedure Add(ds: TDataSource);
    procedure Edit(ds: TDataSource; Gain_type_id: integer);
  end;

var
  frmGainTypeEd: TfrmGainTypeEd;

implementation

uses
	dmHomeAudit,
        uCommon;

{$R *.dfm}

procedure TfrmGainTypeEd.Add(ds: TDataSource);
var
	max_id, mr: integer;
begin
	Caption := Caption + ' (добавление)';

	mr := ShowModal;
        if (mr = mrCancel) then
                exit;

        max_id := 0;
        //получение максимального GAIN_TYPE_ID
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(GAIN_TYPE_ID) MAX_ID FROM GAIN_TYPE';
        //MsgBox(DataMod.IB_Cursor.SQL.Text);

        //запуск запроса
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при нахождении максимального GAIN_TYPE_ID.');
                exit;
        end;

        //таблица GAINS непуста
        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_id := DataMod.IB_Cursor.FieldByName('MAX_ID').AsInteger;

        DataMod.IB_Cursor.Close;

        //добавляем запись в базу данных
        DataMod.IB_Cursor.SQL.Text := 'INSERT INTO GAIN_TYPE('
                + '  GAIN_TYPE_ID'
                + ', NAME)'
        + ' VALUES('
                + IntToStr(max_id + 1)
                + ', ''' + edName.Text + ''')';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
        DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при добавлении записи в таблицу видов доходов.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //добавляем запись в грид
        ds.DataSet.Append;
        ds.DataSet.FieldByName('GAIN_TYPE_ID').AsInteger := max_id + 1;
        ds.DataSet.FieldByName('NAME').AsString          := edName.Text;
        ds.DataSet.Post;
end;

procedure TfrmGainTypeEd.Edit(ds: TDataSource; gain_type_id: integer);
var
	mr: integer;
begin
        edName.Text := ds.DataSet.FieldByName('NAME').AsString;

	Caption := Caption + ' (редактирование)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        DataMod.IB_Cursor.SQL.Text := 'UPDATE GAIN_TYPE SET'
                + ' NAME = ''' + edName.Text + ''''
        + ' WHERE GAIN_TYPE_ID  = ' + IntToStr(gain_type_id);

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //запуск запроса
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('Ошибка при редактировании записи в таблице видов доходов.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //редактируем запись в грид
        ds.DataSet.Edit;
        ds.DataSet.FieldByName('NAME').AsString := edName.Text;
        ds.DataSet.Post;
end;

procedure TfrmGainTypeEd.btnOKClick(Sender: TObject);
var
	ch: string;
        pos: word;
begin
        if (edName.Text = '') then
		StopClose(self, 'Вы забыли указать вид доходов.' + #13 + #13 + 'Нажмите [ОК] для перехода к полю.', edName)

        //проверка, что комментарий небольше 30 символов
        else if (Length(edName.Text) > 30) then
        	StopClose(self, 'Наименование вида доходов должено быть небольше 30 символов.' + #13 + #13 + 'Нажмите [ОК] для перехода к полю.', edName);
end;

end.
