//���� �������
unit fGainType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild;

type
  TfrmGainType = class(TForm)
    GridGainType: TDBGridEh;
    mdGainType: TRxMemoryData;
    dsGainType: TDataSource;
    pmGainType: TPopupMenu;
    pmGainTypeAdd: TMenuItem;
    pmGainTypeEdit: TMenuItem;
    pmGainTypeDelete: TMenuItem;
    N1: TMenuItem;
    pmGainTypeRefresh: TMenuItem;
    mdGainTypeNAME: TStringField;
    mdGainTypeGAIN_TYPE_ID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcAddExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure GridGainTypeSortMarkingChanged(Sender: TObject);
    procedure mdGainTypeAfterScroll(DataSet: TDataSet);
  private
    fChildInfo: PChildInfo;
    //��������� ������ ����� �������
    procedure GetGainTypeList;
    //������ � FireBird
    function QueryFromFireBird: boolean;
    //����������� ������ �� ��������� �������
    procedure CopyToMemoryData;
  public
    { Public declarations }
  end;

var
  frmGainType: TfrmGainType;

implementation

uses
	dmHomeAudit,
        fGainTypeEd,
        uCommon;

{$R *.dfm}

procedure TfrmGainType.FormCreate(Sender: TObject);
begin
        //c�������� ��� ������������ �� ������� �����
	NewChildInfo(fChildInfo, self);
        fChildInfo.Actions[childFilterPanel] := nil;
        fChildInfo.Actions[childAdd]         := AcAddExecute;
        fChildInfo.Actions[childEdit]        := AcEditExecute;
        fChildInfo.Actions[childDelete]      := AcDeleteExecute;
	fChildInfo.Actions[childRefresh]     := AcRefreshExecute;
        fChildInfo.haAdd        := true;
        fChildInfo.haAddPattern := false;
        fChildInfo.haRefresh    := true;

        mdGainType.Active := true;
end;

procedure TfrmGainType.FormShow(Sender: TObject);
begin
        GetGainTypeList;
end;

procedure TfrmGainType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	mdGainType.Active := false;
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	���������� ��������
//
//------------------------------------------------------------------------------

//�������� ������
procedure TfrmGainType.AcAddExecute(Sender: TObject);
var
	GainTypeEd: TfrmGainTypeEd;
begin
	GainTypeEd := TfrmGainTypeEd.Create(Application);
	if GainTypeEd = nil then
		exit;

	GainTypeEd.Add(dsGainType);
	GainTypeEd.Free;
end;

//������������� ������
procedure TfrmGainType.AcEditExecute(Sender: TObject);
var
	GainTypeEd: TfrmGainTypeEd;
begin
	//�������������� ����������
        if (mdGainType.IsEmpty) then
        	exit;

	GainTypeEd := TfrmGainTypeEd.Create(Application);
	if GainTypeEd = nil then
		exit;

	GainTypeEd.Edit(dsGainType, mdGainType.FieldByName('GAIN_TYPE_ID').AsInteger);
	GainTypeEd.Free;
end;

//������� ������
procedure TfrmGainType.AcDeleteExecute(Sender: TObject);
begin
	//�������� ����������
        if (mdGainType.IsEmpty) then
        	exit;

	//������ ������������� ��������
        if (YesNoBox(format('������� ��� ������ (ID #%d)?', [mdGainType.FieldByName('Gain_TYPE_ID').AsInteger])) = IDYES) then
	begin
          	//��������
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM GAIN_TYPE WHERE GAIN_TYPE_ID = ' + mdGainType.FieldByName('GAIN_TYPE_ID').AsString;

                //MsgBox(DataMod.IB_Cursor.SQL.Text);
        	//������ �������
        	try
	        	DataMod.IB_Cursor.Open;
        	except
                	ErrorBox('�� ������� ������� ������ �������.' + #13 +
                	'��������, ������ ������������ � ������ ��������.');
                        
                	exit;
		end;

                DataMod.IB_Cursor.Close;
	        DataMod.IB_Transaction.Commit;

                mdGainType.Delete;
        end;
end;

//�������� ������
procedure TfrmGainType.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//���������� ����������
        if (mdGainType.IsEmpty) then
        	exit;

        for i := 0 to GridGainType.Columns.Count - 1 do
        	GridGainType.Columns[i].Title.SortMarker := smNoneEh;

	GetGainTypeList;
end;

//------------------------------------------------------------------------------
//��������� ������ ����� �������
procedure TfrmGainType.GetGainTypeList;
begin
	//MsgBox('GetGainTypeList');
        if (QueryFromFireBird) then
	        CopyToMemoryData;

end;

//������ � FireBird
function TfrmGainType.QueryFromFireBird: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT GAIN_TYPE_ID'
                + ', NAME'
        + ' FROM GAIN_TYPE'
        + ' ORDER BY GAIN_TYPE_ID';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('������ ��� ���������� ������� ����� �������.');
                exit;
	end;

        result := true;
end;

//����������� ������ �� ��������� �������
procedure TfrmGainType.CopyToMemoryData;
begin
	GridGainType.DataSource.DataSet.DisableControls;
        GridGainType.SumList.ClearSumValues;
   	mdGainType.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdGainType.Append;
                mdGainType.FieldByName('GAIN_TYPE_ID').AsInteger := DataMod.IB_Cursor.FieldByName('GAIN_TYPE_ID').AsInteger;
                mdGainType.FieldByName('NAME').AsString          := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdGainType.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdGainType.First;

        GridGainType.DataSource.DataSet.EnableControls;
end;

procedure TfrmGainType.GridGainTypeSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridGainType = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridGainType.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridGainType.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridGainType.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdGainType.SortOnFields(fields, false, desc);
end;

procedure TfrmGainType.mdGainTypeAfterScroll(DataSet: TDataSet);
begin
        fChildInfo.haEdit   := not mdGainType.IsEmpty;
        fChildInfo.haDelete := not mdGainType.IsEmpty;
end;     

end.
