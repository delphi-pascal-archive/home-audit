//������ ��� �������� ������� � �������� �����
unit uChild;

interface

uses
	Classes, Forms;

type

TChildActions = (
        childFilterPanel,
	childAdd,
        childAddPattern,
        childEdit,
        childDelete,
        childRefresh,
        childToExcel
);

//�������� ��� ���� MDI Child ���������
PChildInfo = ^TChildInfo;
TChildInfo = record
	//Bof: boolean;       //������� ��� ������� ������ - ������
	//Eof: boolean;       //������� ��� ������� ������ - ���������
        haFilterPanelOn: boolean; //����������� ������ �������� �������
        haAdd: boolean;           //������� ����������� ��������� ������
        haAddPattern: boolean;    //������� ����������� ��������� ������ �� �������
        haEdit: boolean;          //������� ����������� ������������� ������
        haDelete: boolean;        //������� ����������� ������� ������
        haRefresh: boolean;       //������� ����������� ��������� ������
	Actions: array[TChildActions] of TNotifyEvent;
end;

//������� ������ ��� �������� ������� ��������� ����
procedure NewChildInfo(var p: PChildInfo); overload;
procedure NewChildInfo(var p: PChildInfo; frm: TForm); overload;

implementation

procedure NewChildInfo(var p: PChildInfo);
var
	i: TChildActions;
begin
	new(p);
	for i := low(TChildActions) to high(TChildActions) do
		p.Actions[i] := nil;
end;

procedure NewChildInfo(var p: PChildInfo; frm: TForm);
begin
	NewChildInfo(p);
	frm.Tag := integer(p);
end;

end.
