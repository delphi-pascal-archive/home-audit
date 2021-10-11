//������������� �������
unit fGainEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrlsEh, Mask, LMDCalendarEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, ToolEdit, CurrEdit;

type
  TfrmGainEd = class(TForm)
    lblDate: TLabel;
    cbGainType: TDBComboBoxEh;
    lblGainType: TLabel;
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
    //������� ������ ����� �������
    procedure SetGainTypeList(cb: TDBComboBoxEh);
  public
    procedure Add(ds: TDataSource);
    procedure Edit(ds: TDataSource; gain_id: integer);
  end;

var
  frmGainEd: TfrmGainEd;

implementation

uses
	dmHomeAudit,
        uCommon;

{$R *.dfm}

procedure TfrmGainEd.FormCreate(Sender: TObject);
begin
        cbDate.Value := Now;
	SetGainTypeList(cbGainType);
end;

//������� ������ ����� �������
procedure TfrmGainEd.SetGainTypeList(cb: TDBComboBoxEh);
begin
        DataMod.IB_Cursor.SQL.Text := 'SELECT GAIN_TYPE_ID, NAME'
	+ ' FROM GAIN_TYPE'
	+ ' ORDER BY NAME';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('������ ��� ���������� ������ ����� �������.');
                exit;
	end;

        //���������� ����� �������  > 100
        if (DataMod.IB_Cursor.RecordCount > 100) then
        begin
                WarningBox('���������� ����� ������� ����� 100.' + #13 +
                '���� "���� �������" ����� ����������.' + #13#13 +
                '���������� � ������������.');
                cb.Enabled := false;
           	DataMod.IB_Cursor.Close;
                exit;
        end;

        cb.Items.Clear;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	cb.Items.Add(DataMod.IB_Cursor.FieldByName('NAME').AsString);
                cb.KeyItems.Add(DataMod.IB_Cursor.FieldByName('GAIN_TYPE_ID').AsString);
                DataMod.IB_Cursor.Next;
        end;

        cb.ItemIndex := 0;
        DataMod.IB_Cursor.Close;
end;

procedure TfrmGainEd.Add(ds: TDataSource);
var
	max_id, mr: integer;
begin
	Caption := Caption + ' (����������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        max_id := 0;
        //��������� ������������� GAIN_ID
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(GAIN_ID) MAX_ID FROM GAINS';
        //MsgBox(DataMod.IB_Cursor.SQL.Text);

        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������������� GAIN_ID.');
                exit;
        end;

        //������� GAINS �������
        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_id := DataMod.IB_Cursor.FieldByName('MAX_ID').AsInteger;

        DataMod.IB_Cursor.Close;

        //��������� ������ � ���� ������
        DataMod.IB_Cursor.SQL.Text := 'INSERT INTO GAINS('
                + '  GAIN_ID'
                + ', REG_DATE'
                + ', GAIN_TYPE_ID'
                + ', SUMM'
                + ', COMMENT'
                + ', UNACCOUNTED)'
        + ' VALUES('
                + IntToStr(max_id + 1)
                + ', ''' + cbDate.Text + ''''
                + ', ' + cbGainType.KeyItems.Strings[cbGainType.ItemIndex]
                + ', ' + Sep2Dot(FloatToStr(edSumm.Value))
                + ', ''' + edComment.Text + ''''
                + ', ' + IntToStr(integer(cbUnaccounted.Checked)) + ')'; //������� ��������������

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
        DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������ � ������� �������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //��������� ������ � ����
        ds.DataSet.Append;
        ds.DataSet.FieldByName('GAIN_ID').AsInteger     := max_id + 1;
        ds.DataSet.FieldByName('REG_DATE').AsDateTime   := cbDate.Value;
        ds.DataSet.FieldByName('GAIN_TYPE').AsString    := cbGainType.Text;
        ds.DataSet.FieldByName('SUMM').AsFloat          := edSumm.Value;
        ds.DataSet.FieldByName('COMMENT').AsString      := edComment.Text;
        ds.DataSet.FieldByName('UNACCOUNTED').AsInteger := integer(cbUnaccounted.Checked);
        ds.DataSet.Post;
end;

procedure TfrmGainEd.Edit(ds: TDataSource; gain_id: integer);
var
	mr: integer;
begin
        cbDate.Value          := ds.DataSet.FieldByName('REG_DATE').AsDateTime;
        cbGainType.Text       := ds.DataSet.FieldByName('GAIN_TYPE').AsString;
        edSumm.Value          := ds.DataSet.FieldByName('SUMM').AsFloat;
        edComment.Text        := ds.DataSet.FieldByName('COMMENT').AsString;
        cbUnaccounted.Checked := boolean(ds.DataSet.FieldByName('UNACCOUNTED').AsInteger);

	Caption := Caption + ' (��������������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        DataMod.IB_Cursor.SQL.Text := 'UPDATE GAINS SET'
                + '  REG_DATE       = ''' + cbDate.Text + ''''
                + ', GAIN_TYPE_ID   = ' + cbGainType.KeyItems.Strings[cbGainType.ItemIndex]
                + ', SUMM           = ' + Sep2Dot(FloatToStr(edSumm.Value))
                + ', COMMENT        = ''' + edComment.Text + ''''
                + ', UNACCOUNTED    = ' + IntToStr(integer(cbUnaccounted.Checked)) //������� ��������������
        + ' WHERE GAIN_ID  = ' + IntToStr(gain_id);

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� �������������� ������ � ������� �������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //����������� ������ � ����
        ds.DataSet.Edit;
        ds.DataSet.FieldByName('REG_DATE').AsDateTime   := cbDate.Value;
        ds.DataSet.FieldByName('GAIN_TYPE').AsString    := cbGainType.Text;
        ds.DataSet.FieldByName('SUMM').AsFloat          := edSumm.Value;
        ds.DataSet.FieldByName('COMMENT').AsString      := edComment.Text;
        ds.DataSet.FieldByName('UNACCOUNTED').AsInteger := integer(cbUnaccounted.Checked);
        ds.DataSet.Post;
end;

procedure TfrmGainEd.btnOKClick(Sender: TObject);
var
	ch: string;
        pos: word;
begin
        //�������� �� ������� � ������������
	if (not (TryGetDate(cbDate.Text))) then
		StopClose(self, '�� ������� ������� ����.' + #13#13 + '������� [��] ��� �������� � ����.', cbDate)
        else if (cbGainType.Text = '') then
		StopClose(self, '�� ������ ������� ��� �������.' + #13#13 + '������� [��] ��� �������� � ����.', cbGainType)
        else if (edSumm.Text = '') then
		StopClose(self, '�� ������ ������� �����.' + #13#13 + '������� [��] ��� �������� � ����.', edSumm)
        else if (edSumm.Value <= 0) then
		StopClose(self, '����� ������ ���� �������������.' + #13#13 + '������� [��] ��� �������� � ����.', edSumm)

        //��������, ��� �������� �������� 100 ��������
        else if (Length(edComment.Text) > 100) then
        	StopClose(self, '�������� ������ ���� �������� 100 ��������.' + #13#13 + '������� [��] ��� �������� � ����.', edComment)

        //�������� �� ����������� � �������� ����������� ��������
	else if (CheckCorrectString(edComment.Text, ch, pos)) then
		StopClose(self, format('� �������� ����������� ������������ ������: %s (�������: %d)%s%s������� [��] ��� �������� � ����.',[ch, pos, #13, #13]), edComment);
end;

end.
