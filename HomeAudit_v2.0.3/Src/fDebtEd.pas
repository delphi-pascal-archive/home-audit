//������������� ������
unit fDebtEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrlsEh, Mask, LMDCalendarEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, ToolEdit, CurrEdit;

type
  TfrmDebtEd = class(TForm)
    lblDebtType: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    gbDebt: TGroupBox;
    lblDebtDate: TLabel;
    cbDebtDate: TDBDateTimeEditEh;
    lblDebtSumm: TLabel;
    lblDebtCommen: TLabel;
    edDebtComment: TDBEditEh;
    gbPays: TGroupBox;
    lblPayDate: TLabel;
    lblPaySumm: TLabel;
    lblPayCommen: TLabel;
    cbPayDate: TDBDateTimeEditEh;
    edPayComment: TDBEditEh;
    edPaySumm: TDBNumberEditEh;
    edDebtSumm: TDBNumberEditEh;
    cbDebtType: TDBComboBoxEh;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Add(ds: TDataSource);
    procedure Edit(ds: TDataSource; debt_id: integer);
  end;

var
  frmDebtEd: TfrmDebtEd;

implementation

uses
	dmHomeAudit,
        uCommon;

{$R *.dfm}

procedure TfrmDebtEd.FormCreate(Sender: TObject);
begin
        cbDebtDate.Value := Now;
        cbPayDate.Value  := Now;
end;

procedure TfrmDebtEd.Add(ds: TDataSource);
var
	max_id, mr: integer;
begin
        cbDebtType.ItemIndex := 0;

        gbPays.Enabled       := false;
        cbPayDate.Enabled    := false;
        edPaySumm.Enabled    := false;
        edPayComment.Enabled := false;
        
	Caption := Caption + ' (����������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        max_id := 0;
        //��������� ������������� DEBT_ID
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(DEBT_ID) MAX_ID FROM DEBTS';
        //MsgBox(DataMod.IB_Cursor.SQL.Text);

        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������������� DEBT_ID.');
                exit;
        end;

        //������� DEBTS �������
        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_id := DataMod.IB_Cursor.FieldByName('MAX_ID').AsInteger;

        DataMod.IB_Cursor.Close;

        //��������� ������ � ���� ������
        DataMod.IB_Cursor.SQL.Text := 'INSERT INTO DEBTS('
                + '  DEBT_ID'
                + ', DEBT_TYPE'
                + ', DEBT_DATE'
                + ', DEBT_SUMM'
                + ', DEBT_COMMENT)'
        + ' VALUES('
                + IntToStr(max_id + 1)
                + ', ' + IntToStr(cbDebtType.ItemIndex)
                + ', ''' + cbDebtDate.Text + ''''
                + ', ' + Sep2Dot(FloatToStr(edDebtSumm.Value))
                + ', ''' + edDebtComment.Text + ''')';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
        DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������ � ������� ������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //��������� ������ � ����        
        ds.DataSet.Append;
        ds.DataSet.FieldByName('DEBT_ID').AsInteger     := max_id + 1;
        ds.DataSet.FieldByName('DEBT_TYPE').AsString    := cbDebtType.Text;
        ds.DataSet.FieldByName('DEBT_DATE').AsDateTime  := cbDebtDate.Value;
        ds.DataSet.FieldByName('DEBT_SUMM').AsFloat     := edDebtSumm.Value;
        ds.DataSet.FieldByName('DEBT_COMMENT').AsString := edDebtComment.Text;
        ds.DataSet.Post;
end;

procedure TfrmDebtEd.Edit(ds: TDataSource; debt_id: integer);
var
	mr: integer;
begin
        cbDebtType.Enabled    := false;
        cbDebtType.ReadOnly   := true;
        cbDebtType.TabStop    := false;

        gbDebt.Enabled        := false;
        cbDebtDate.Enabled    := false;
        edDebtSumm.Enabled    := false;
        edDebtComment.Enabled := false;

        cbDebtType.Text    := ds.DataSet.FieldByName('DEBT_TYPE').AsString;

        cbDebtDate.Value   := ds.DataSet.FieldByName('DEBT_DATE').AsDateTime;
        edDebtSumm.Value   := ds.DataSet.FieldByName('DEBT_SUMM').AsFloat;
        edDebtComment.Text := ds.DataSet.FieldByName('DEBT_COMMENT').AsString;

        if (not ds.DataSet.FieldByName('PAY_DATE').IsNull) then
                cbPayDate.Value := ds.DataSet.FieldByName('PAY_DATE').AsDateTime
        else
                cbPayDate.Value := Now;

        if (not ds.DataSet.FieldByName('PAY_SUMM').IsNull) then
                edPaySumm.Value := ds.DataSet.FieldByName('PAY_SUMM').AsFloat;

        edPayComment.Text  := ds.DataSet.FieldByName('PAY_COMMENT').AsString;

	Caption := Caption + ' (��������������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        DataMod.IB_Cursor.SQL.Text := 'UPDATE DEBTS SET'
                + '  DEBT_TYPE      = ' + IntToStr(cbDebtType.ItemIndex)
                //+ ', DEBT_DATE      = ''' + cbDebtDate.Text + ''''
                //+ ', DEBT_SUMM      = ' + Sep2Dot(FloatToStr(edDebtSumm.Value))
                //+ ', DEBT_COMMENT   = ''' + edDebtComment.Text + ''''
                + ', PAY_DATE       = ''' + cbPayDate.Text + ''''
                + ', PAY_SUMM       = ' + Sep2Dot(FloatToStr(edPaySumm.Value))
                + ', PAY_COMMENT    = ''' + edPayComment.Text + ''''
        + ' WHERE DEBT_ID  = ' + IntToStr(debt_id);

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� �������������� ������ � ������� ������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //����������� ������ � ����
        ds.DataSet.Edit;
        ds.DataSet.FieldByName('DEBT_TYPE').AsString    := cbDebtType.Text;
        ds.DataSet.FieldByName('DEBT_DATE').AsDateTime  := cbDebtDate.Value;
        ds.DataSet.FieldByName('DEBT_SUMM').AsFloat     := edDebtSumm.Value;
        ds.DataSet.FieldByName('DEBT_COMMENT').AsString := edDebtComment.Text;
        ds.DataSet.FieldByName('PAY_DATE').AsDateTime   := cbPayDate.Value;
        ds.DataSet.FieldByName('PAY_SUMM').AsFloat      := edPaySumm.Value;
        ds.DataSet.FieldByName('PAY_COMMENT').AsString  := edPayComment.Text;
        ds.DataSet.Post;
end;

procedure TfrmDebtEd.btnOKClick(Sender: TObject);
var
	ch: string;
        pos: word;
begin
        //�������� �� ������� � ������������
        if (cbDebtType.Text = '') then
		StopClose(self, '�� ������ ������� ��� ����a.' + #13#13 + '������� [��] ��� �������� � ����.', cbDebtType)
	else if ((cbDebtDate.Enabled) and (not (TryGetDate(cbDebtDate.Text))))  then
		StopClose(self, '�� ������� ������� ���� �����.' + #13#13 + '������� [��] ��� �������� � ����.', cbDebtDate)

        else if (edDebtSumm.Text = '') then
		StopClose(self, '�� ������ ������� ����� �����.' + #13#13 + '������� [��] ��� �������� � ����.', edDebtSumm)
        else if (edDebtSumm.Value <= 0) then
		StopClose(self, '����� ����� ������ ���� �������������.' + #13#13 + '������� [��] ��� �������� � ����.', edDebtSumm)

	else if ((cbPayDate.Enabled) and (not (TryGetDate(cbPayDate.Text))))  then
		StopClose(self, '�� ������� ������� ���� �������.' + #13#13 + '������� [��] ��� �������� � ����.', cbPayDate)

        else if ((edPaySumm.Enabled) and (edPaySumm.Text = '')) then
		StopClose(self, '�� ������ ������� ����� �������.' + #13#13 + '������� [��] ��� �������� � ����.', edPaySumm)
        else if ((edPaySumm.Enabled) and (edPaySumm.Value <= 0)) then
		StopClose(self, '����� ������� ������ ���� �������������.' + #13#13 + '������� [��] ��� �������� � ����.', edPaySumm)

        //��������, ��� �������� �������� 100 ��������
        else if (Length(edDebtComment.Text) > 100) then
        	StopClose(self, '�������� ����� ������ ���� �������� 100 ��������.' + #13#13 + '������� [��] ��� �������� � ����.', edDebtComment)
        else if (Length(edPayComment.Text) > 100) then
        	StopClose(self, '�������� ������� ������ ���� �������� 100 ��������.' + #13#13 + '������� [��] ��� �������� � ����.', edPayComment)

        //�������� �� ����������� � �������� ����������� ��������
	else if (CheckCorrectString(edDebtComment.Text, ch, pos)) then
		StopClose(self, format('� �������� ����� ����������� ������������ ������: %s (�������: %d)%s%s������� [��] ��� �������� � ����.',[ch, pos, #13, #13]), edDebtComment)
        else if (CheckCorrectString(edPayComment.Text, ch, pos)) then
		StopClose(self, format('� �������� ������� ����������� ������������ ������: %s (�������: %d)%s%s������� [��] ��� �������� � ����.',[ch, pos, #13, #13]), edPayComment)

        //���� ����� ����� ���� ��������
        else if ((cbDebtDate.Value) > (cbPayDate.Value)) then
                StopClose(self, '���� ����� �� ����� ���� ����� ���� ��������.' + #13#13 + '������� [��] ��� �������� � ����.', cbPayDate)

        //����� ����� ������ ����� �������
        else if (edDebtSumm.Value < edPaySumm.Value) then
		StopClose(self, '����� ����� �� ����� ���� ������ ����� �������.' + #13#13 + '������� [��] ��� �������� � ����.', edPaySumm);
end;

end.
