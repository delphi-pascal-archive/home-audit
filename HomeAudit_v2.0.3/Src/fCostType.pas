//���� ��������
unit fCostType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, RxMemDS, Grids, DBGridEh, RXSplit, DBCtrlsEh,
  StdCtrls, Mask, ExtCtrls, uChild;

type
  TfrmCostType = class(TForm)
    GridCostType: TDBGridEh;
    mdCostType: TRxMemoryData;
    dsCostType: TDataSource;
    pmCostType: TPopupMenu;
    pmCostTypeAdd: TMenuItem;
    pmCostTypeEdit: TMenuItem;
    pmCostTypeDelete: TMenuItem;
    N1: TMenuItem;
    pmCostTypeRefresh: TMenuItem;
    mdCostTypeCOST_TYPE_ID: TIntegerField;
    mdCostTypeNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcAddExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure GridCostTypeSortMarkingChanged(Sender: TObject);
    procedure mdCostTypeAfterScroll(DataSet: TDataSet);
  private
    fChildInfo: PChildInfo;
    //��������� ������ ����� ��������
    procedure GetCostTypeList;
    //������ � FireBird
    function QueryFromFireBird: boolean;
    //����������� ������ �� ��������� �������
    procedure CopyToMemoryData;
  public
    { Public declarations }
  end;

var
  frmCostType: TfrmCostType;

implementation

uses
	dmHomeAudit,
        fCostTypeEd,
        uCommon;

{$R *.dfm}

procedure TfrmCostType.FormCreate(Sender: TObject);
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

        mdCostType.Active := true;
end;

procedure TfrmCostType.FormShow(Sender: TObject);
begin
        GetCostTypeList;
end;

procedure TfrmCostType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	mdCostType.Active := false;
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	���������� ��������
//
//------------------------------------------------------------------------------

//�������� ������
procedure TfrmCostType.AcAddExecute(Sender: TObject);
var
	CostTypeEd: TfrmCostTypeEd;
begin
	CostTypeEd := TfrmCostTypeEd.Create(Application);
	if CostTypeEd = nil then
		exit;

	CostTypeEd.Add(dsCostType);
	CostTypeEd.Free;
end;

//������������� ������
procedure TfrmCostType.AcEditExecute(Sender: TObject);
var
	CostTypeEd: TfrmCostTypeEd;
begin
	//�������������� ����������
        if (mdCostType.IsEmpty) then
        	exit;

	CostTypeEd := TfrmCostTypeEd.Create(Application);
	if CostTypeEd = nil then
		exit;

	CostTypeEd.Edit(dsCostType, mdCostType.FieldByName('COST_TYPE_ID').AsInteger);
	CostTypeEd.Free;
end;

//������� ������
procedure TfrmCostType.AcDeleteExecute(Sender: TObject);
begin
	//�������� ����������
        if (mdCostType.IsEmpty) then
        	exit;

	//������ ������������� ��������
        if (YesNoBox(format('������� ��� ������� (ID #%d)?', [mdCostType.FieldByName('COST_TYPE_ID').AsInteger])) = IDYES) then
	begin
          	//��������
        	DataMod.IB_Cursor.SQL.Text := 'DELETE FROM COST_TYPE WHERE COST_TYPE_ID = ' + mdCostType.FieldByName('COST_TYPE_ID').AsString;

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

                mdCostType.Delete;
        end;
end;

//�������� ������
procedure TfrmCostType.AcRefreshExecute(Sender: TObject);
var
	i: word;
begin
	//���������� ����������
        if (mdCostType.IsEmpty) then
        	exit;

        for i := 0 to GridCostType.Columns.Count - 1 do
        	GridCostType.Columns[i].Title.SortMarker := smNoneEh;

	GetCostTypeList;
end;

//------------------------------------------------------------------------------
//��������� ������ ����� ��������
procedure TfrmCostType.GetCostTypeList;
begin
	//MsgBox('GetCostTypeList');
        if (QueryFromFireBird) then
	        CopyToMemoryData;

end;

//������ � FireBird
function TfrmCostType.QueryFromFireBird: boolean;
begin
	result := false;

        DataMod.IB_Cursor.SQL.Text := 'SELECT COST_TYPE_ID'
                + ', NAME'
        + ' FROM COST_TYPE'
        + ' ORDER BY COST_TYPE_ID';

        //MsgBox(DataMod.IB_Cursor.SQL.Text);
        //������ �������
        try
	        DataMod.IB_Cursor.Open;
        except
        	WarningBox('������ ��� ���������� ������� ����� ��������.');
                exit;
	end;

        result := true;
end;

//����������� ������ �� ��������� �������
procedure TfrmCostType.CopyToMemoryData;
begin
	GridCostType.DataSource.DataSet.DisableControls;
        GridCostType.SumList.ClearSumValues;
   	mdCostType.EmptyTable;
        while (not (DataMod.IB_Cursor.Eof)) do
        begin
        	mdCostType.Append;
                mdCostType.FieldByName('COST_TYPE_ID').AsInteger := DataMod.IB_Cursor.FieldByName('COST_TYPE_ID').AsInteger;
                mdCostType.FieldByName('NAME').AsString          := DataMod.IB_Cursor.FieldByName('NAME').AsString;
                mdCostType.Post;
                DataMod.IB_Cursor.Next;
        end;
        DataMod.IB_Cursor.Close;
        mdCostType.First;

        GridCostType.DataSource.DataSet.EnableControls;
end;

procedure TfrmCostType.GridCostTypeSortMarkingChanged(Sender: TObject);
var
	fields: String;
	i, count: Integer;
	desc: Boolean;
begin
	if GridCostType = nil then
		exit;

	desc   := false;
	fields := '';
	count  := GridCostType.SortMarkedColumns.Count;
	for i  := 0 to count - 1 do
	begin
		if Length(fields) > 0 then
			fields := fields + '; ';
		fields := fields + GridCostType.SortMarkedColumns.Items[i].FieldName;
		if (i = 0) then
			desc := smUpEh = GridCostType.SortMarkedColumns.Items[i].Title.SortMarker;
	end;
	mdCostType.SortOnFields(fields, false, desc);
end;

procedure TfrmCostType.mdCostTypeAfterScroll(DataSet: TDataSet);
begin
        fChildInfo.haEdit   := not mdCostType.IsEmpty;
        fChildInfo.haDelete := not mdCostType.IsEmpty;
end;     

end.
