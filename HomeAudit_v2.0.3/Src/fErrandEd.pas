//������������� ������������
unit fErrandEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrlsEh, Mask, LMDCalendarEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, ToolEdit, CurrEdit;

type
  TfrmErrandEd = class(TForm)
    lblDate: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    edErrandID: TDBEditEh;
    lblCommen: TLabel;
    cbBDate: TDBDateTimeEditEh;
    Label1: TLabel;
    cbEDate: TDBDateTimeEditEh;
    edComment: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Add(ds: TDataSource);
    procedure Edit(ds: TDataSource; errand_id: integer);
  end;

var
  frmErrandEd: TfrmErrandEd;

implementation

uses
	dmHomeAudit,
        uCommon,
        fErrand;

{$R *.dfm}

procedure TfrmErrandEd.FormCreate(Sender: TObject);
begin
        cbBDate.Value := Now - 1;
        cbEDate.Value := Now;
end;

procedure TfrmErrandEd.Add(ds: TDataSource);
var
	max_id, mr: integer;
begin
	Caption := Caption + ' (����������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        max_id := 0;
        //��������� ������������� ERRAND_ID
        DataMod.IB_Cursor.SQL.Text := 'SELECT MAX(ERRAND_ID) MAX_ID FROM ERRANDS';
        //MsgBox(DataMod.IB_Cursor.SQL.Text);

        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������������� ERRAND_ID.');
                exit;
        end;

        //������� ERRANDS �������
        if (DataMod.IB_Cursor.RecordCount > 0) then
                max_id := DataMod.IB_Cursor.FieldByName('MAX_ID').AsInteger;

        DataMod.IB_Cursor.Close;

        //��������� ������ � ���� ������
        DataMod.IB_Cursor.SQL.Text := 'INSERT INTO ERRANDS('
                + '  ERRAND_ID'
                + ', BDATE'
                + ', EDATE'
                + ', COMMENT)'
        + ' VALUES('
                + IntToStr(max_id + 1)
                + ', ''' + cbBDate.Text + ''''
                + ', ''' + cbEDate.Text + ''''
                + ', ''' + edComment.Text + ''')';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
        DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� ���������� ������ � ������� ������������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //��������� ������ � ����
        ds.DataSet.Append;
        ds.DataSet.FieldByName('ERRAND_ID').AsInteger := max_id + 1;
        ds.DataSet.FieldByName('BDATE').AsDateTime    := cbBDate.Value;
        ds.DataSet.FieldByName('EDATE').AsDateTime    := cbEDate.Value;
        ds.DataSet.FieldByName('COMMENT').AsString    := edComment.Text;
        ds.DataSet.Post;
end;

procedure TfrmErrandEd.Edit(ds: TDataSource; errand_id: integer);
var
	mr: integer;
begin
        cbBDate.Value   := ds.DataSet.FieldByName('BDATE').AsDateTime;
        cbEDate.Value   := ds.DataSet.FieldByName('EDATE').AsDateTime;
        edComment.Text  := ds.DataSet.FieldByName('COMMENT').AsString;
        edErrandID.Text := IntToStr(errand_id);

	Caption := Caption + ' (��������������)';
	mr := ShowModal;

        if (mr = mrCancel) then
                exit;

        DataMod.IB_Cursor.SQL.Text := 'UPDATE ERRANDS SET'
                + '  BDATE       = ''' + cbBDate.Text + ''''
                + ', EDATE       = ''' + cbEDate.Text + ''''
                + ', COMMENT        = ''' + edComment.Text + ''''
        + ' WHERE ERRAND_ID  = ' + IntToStr(errand_id);

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
                DataMod.IB_Cursor.Open;
        except
                WarningBox('������ ��� �������������� ������ � ������� ������������.');
                exit;
        end;

        DataMod.IB_Cursor.Close;
        DataMod.IB_Transaction.Commit;

        //����������� ������ � ����
        ds.DataSet.Edit;
        ds.DataSet.FieldByName('BDATE').AsDateTime    := cbBDate.Value;
        ds.DataSet.FieldByName('EDATE').AsDateTime    := cbEDate.Value;
        ds.DataSet.FieldByName('COMMENT').AsString    := edComment.Text;
        ds.DataSet.Post;
end;

procedure TfrmErrandEd.btnOKClick(Sender: TObject);
var
	ch: string;
        pos: word;
begin
        //�������� �� ������� � ������������
	if (not (TryGetDate(cbBDate.Text))) then
		StopClose(self, '�� ������� ������� ���� ������ ������������.' + #13#13 + '������� [��] ��� �������� � ����.', cbBDate)
        else if (not (TryGetDate(cbEDate.Text))) then
		StopClose(self, '�� ������� ������� ���� ��������� ������������.' + #13#13 + '������� [��] ��� �������� � ����.', cbEDate)

        //��������, ��� �������� �������� 100 ��������
        else if (Length(edComment.Text) > 100) then
        	StopClose(self, '�������� ������ ���� �������� 100 ��������.' + #13#13 + '������� [��] ��� �������� � ����.', edComment)

        //�������� �� ����������� � �������� ����������� ��������
        else if (CheckCorrectString(edComment.Text, ch, pos)) then
		StopClose(self, format('� �������� ����������� ������������ ������: %s (�������: %d)%s%s������� [��] ��� �������� � ����.',[ch, pos, #13, #13]), edComment)

        //�������� ������������ ����� ���
        else if (cbBDate.Value > cbEDate.Value) then
                StopClose(self, '���� ������ ������������ �� ����� ���� ������ ���� ���������.' + #13#13 + '������� [��] ��� �������� � ����.', cbBDate)
        else
        begin
                //�������� ����������� � ������� ���������
                DataMod.IB_Cursor.SQL.Clear;
                DataMod.IB_Cursor.SQL.Add('SELECT FIRST(1) ERRAND_ID'
                        + ' , BDATE'
                        + ' , EDATE'
                + ' FROM ERRANDS'
                + ' WHERE ((BDATE <= ''' + cbBDate.Text + ''' AND EDATE >= ''' + cbBDate.Text + ''')'
                + ' OR     (BDATE <= ''' + cbEDate.Text + ''' AND EDATE >= ''' + cbEDate.Text + '''))');

                //�� ���������� � ������������� �������
                if (edErrandID.Text <> '') then
                        DataMod.IB_Cursor.SQL.Add(' AND ERRAND_ID <> ' + edErrandID.Text);

                //MsgBox(DataMod.IB_Cursor.SQL.Text);
                //������ �������
                try
	                DataMod.IB_Cursor.Open;
                except
        	        WarningBox('������ ��� �������� ����������� �������� ������������.');
                        exit;
	        end;

                if DataMod.IB_Cursor.RecordCount > 0 then
                        StopClose(self, format('����������� �������� � �������������%s(ID #%d, ������: %s - %s)%s%s������� [��] ��� �������� � ����.',
                        [#13,
                         DataMod.IB_Cursor.FieldByName('ERRAND_ID').AsInteger,
                         DataMod.IB_Cursor.FieldByName('BDATE').AsString,
                         DataMod.IB_Cursor.FieldByName('EDATE').AsString,
                         #13,
                         #13
                        ]), edComment);

                DataMod.IB_Cursor.Close;
        end;
end;

end.
