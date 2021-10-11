//HomeAudit - основная форма
//Авторские права © 2010-2012 Дюгуров Сергей Михайлович

//Автор: Дюгуров Сергей Михайлович
//E-mail: scorpion235@mail.ru
//Среда разработки: Delphi 6.0 Service Pack 2
//Начало разработки:    2010-08-23
//Окончание разработки: 2012-02-15
//Дополнительные библиотеки: RxLib, EhLib, xlReport, ElTree, IBO, Toolbar97, IBO, EasyGraph

//Написание хороших программ требует
//ума, вкуса и терпения
//                        Страуструп

unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB97Tlbr, TB97Ctls, TB97, StdActns, ActnList, ImgList, Menus,
  ComCtrls, elTree, uChild, VCLUnZip, VCLZip, StdCtrls, TB97Tlwn;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    mnmWork: TMenuItem;
    mnmCost: TMenuItem;
    mnmOptions: TMenuItem;
    mnmSplitter3: TMenuItem;
    mnmExit: TMenuItem;
    mnmView: TMenuItem;
    mnmFilterPanel: TMenuItem;
    mnmData: TMenuItem;
    mnmAdd: TMenuItem;
    mnmEdit: TMenuItem;
    mnmDelete: TMenuItem;
    mnmSplitter5: TMenuItem;
    mnmRefresh: TMenuItem;
    mnmWindow: TMenuItem;
    mnmCascade: TMenuItem;
    mnmHorizontal: TMenuItem;
    mnmVertical: TMenuItem;
    mnmMinimizeAll: TMenuItem;
    mnmArrange: TMenuItem;
    mnmClose: TMenuItem;
    mnmHelp: TMenuItem;
    mnmAbout: TMenuItem;
    ImageList: TImageList;
    StandartActions: TActionList;
    AcCost: TAction;
    AcShowHideWindow: TAction;
    AcWindowCascade: TWindowCascade;
    AcWindowTileHorizontal: TWindowTileHorizontal;
    AcWindowTileVertical: TWindowTileVertical;
    AcWindowArrange: TWindowArrange;
    AcWindowMinimizeAll: TWindowMinimizeAll;
    AcWindowClose: TWindowClose;
    AcOptions: TAction;
    AcExit: TAction;
    AcAbout: TAction;
    ChildActions: TActionList;
    AcAdd: TAction;
    AcEdit: TAction;
    AcDelete: TAction;
    AcRefresh: TAction;
    AcToExcel: TAction;
    AcFilterPanel: TAction;
    DockTop: TDock97;
    MainToolbar: TToolbar97;
    btnRefresh: TToolbarButton97;
    btnAdd: TToolbarButton97;
    btnEdit: TToolbarButton97;
    ToolbarSep4: TToolbarSep97;
    btnDelete: TToolbarButton97;
    btnCost: TToolbarButton97;
    btnFilterBar: TToolbarButton97;
    ToolbarSep5: TToolbarSep97;
    StatusBar: TStatusBar;
    AcCostType: TAction;
    mnmManual: TMenuItem;
    mnmCostType: TMenuItem;
    btnCostType: TToolbarButton97;
    Zip: TVCLZip;
    AcGain: TAction;
    AcGainType: TAction;
    mnmGain: TMenuItem;
    mnmGainType: TMenuItem;
    btnGainType: TToolbarButton97;
    btnGain: TToolbarButton97;
    ToolbarSep1: TToolbarSep97;
    AcBalance: TAction;
    mnmBalance: TMenuItem;
    ToolbarSep3: TToolbarSep97;
    btnBalance: TToolbarButton97;
    AcGainCost: TAction;
    mnmGainCost: TMenuItem;
    btnGainCost: TToolbarButton97;
    AcDebt: TAction;
    mnmDebt: TMenuItem;
    btnDebt: TToolbarButton97;
    ToolbarSep2: TToolbarSep97;
    AcAddPattern: TAction;
    btnAddPattern: TToolbarButton97;
    mnmAddPattern: TMenuItem;
    AcErrand: TAction;
    mnmErrand: TMenuItem;
    btnErrand: TToolbarButton97;
    mnmSplitter1: TMenuItem;
    mnmSplitter2: TMenuItem;
    procedure ChildActionsUpdate(Action: TBasicAction;
      var Handled: Boolean);
    //универсальный обработчик событий для дочерних окон
    procedure AcChildActionExecute(Sender: TObject);
    procedure AcCostExecute(Sender: TObject);
    procedure AcOptionsExecute(Sender: TObject);
    procedure AcExitExecute(Sender: TObject);
    procedure AcAboutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcCostTypeExecute(Sender: TObject);
    procedure AcGainExecute(Sender: TObject);
    procedure AcGainTypeExecute(Sender: TObject);
    procedure AcBalanceExecute(Sender: TObject);
    procedure AcGainCostExecute(Sender: TObject);
    procedure AcDebtExecute(Sender: TObject);
    procedure AcErrandExecute(Sender: TObject);
  private
    procedure ExecuteChildAction(Sender: TObject; ac: TChildActions);
    procedure DisplayHint(Sender: TObject);
    function  Connection: boolean;
    procedure BuckUpDataBase;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
        dmHomeAudit,
        uCommon,
        fGain,
        fGainType,
        fCost,
        fCostType,
        fGainCost,
        fDebt,
        fErrand,
        fBalance,
        fOptions,
        fAbout,
        DateUtils;

{$R *.dfm}

//создание формы
procedure TfrmMain.FormCreate(Sender: TObject);
begin
        Application.OnHint := DisplayHint;

        AcFilterPanel.Tag  := integer(childFilterPanel);
	AcAdd.Tag          := integer(childAdd);
        AcAddPattern.Tag   := integer(childAddPattern);
	AcEdit.Tag         := integer(childEdit);
	AcDelete.Tag       := integer(childDelete);
	AcRefresh.Tag      := integer(childRefresh);
	AcToExcel.Tag      := integer(childToExcel);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
        if (not Connection) then
        begin
         	Close;
                exit;
        end;

        BuckUpDataBase;

        //TfrmCost.Create(self).Show;
end;

//закрытие формы
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        DataMod.IB_Connection.Disconnect;
        Action := caFree;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
        StatusBar.Panels[1].Text := GetLongHint(Application.Hint);
end;

//------------------------------------------------------------------------------
//
//	Actions
//
//------------------------------------------------------------------------------

procedure TfrmMain.ExecuteChildAction(Sender: TObject; ac: TChildActions);
var
	info: PChildInfo;
begin
	if ActiveMDIChild = nil then
		exit;

	info := PChildInfo(ActiveMDIChild.Tag);
	if Assigned (info.Actions[ac]) then
	if (info <> nil) then
		info.Actions[ac](Sender);
end;

//универсальный обработчик событий для дочерних окон
procedure TfrmMain.AcChildActionExecute(Sender: TObject);
var
	child_action: TChildActions;
	action: TAction;
begin
	if not (Sender is TAction) then
		exit;

	Action       := TAction(Sender);
	child_action := TChildActions(action.Tag);
	ExecuteChildAction(action, child_action);
end;

procedure TfrmMain.ChildActionsUpdate(Action: TBasicAction; var Handled: Boolean);
var
	info: PChildInfo;
	b: boolean;
begin
	Handled := true;

	info := nil;
	if (ActiveMDIChild <> nil) then
		info := PChildInfo(ActiveMDIChild.Tag);
	b := info <> nil;
	if (b) then
	begin
        	AcFilterPanel.Enabled := Assigned(info.Actions[childFilterPanel]) and info.haRefresh;
		AcFilterPanel.Checked := info.haFilterPanelOn;
		AcAdd.Enabled	      := Assigned(info.Actions[childAdd])     and info.haAdd;
                AcAddPattern.Enabled  := Assigned(info.Actions[childAdd])     and info.haAddPattern;
		AcEdit.Enabled	      := Assigned(info.Actions[childEdit])    and info.haEdit;
		AcDelete.Enabled      := Assigned(info.Actions[childDelete])  and info.haDelete;
		AcRefresh.Enabled     := Assigned(info.Actions[childRefresh]) and info.haRefresh;
                AcToExcel.Enabled     := Assigned(info.Actions[childToExcel]);
	end

        else
        begin
        	AcFilterPanel.Enabled := false;
		AcFilterPanel.Checked := false;
            	AcAdd.Enabled	      := false;
                AcAddPattern.Enabled  := false;
		AcEdit.Enabled	      := false;
		AcDelete.Enabled      := false;
		AcRefresh.Enabled     := false;
                AcToExcel.Enabled     := false;
        end;
end;

//подключение к базе данных
function TfrmMain.Connection: boolean;
begin
	result := false;

	with (DataMod.IB_Connection) do
	begin
        	Path     := GetCurrentDir + '\DataBase\HomeAudit.fdb';
        	Username := 'SYSDBA';
        	Password := 'masterkey'
     	end;

     	//подключение к базе данных
     	try
     	   	DataMod.IB_Connection.Connect;

     	//обработчик исключений
     	except
           	ErrorBox('Не удалось подключиться к базе данных.' + #13#13 +
                         'Причины:' + #13 +
                         '1. Не установлен или не запущен Firebird Server.' + #13 +
                         '2. Файл "' + DataMod.IB_Connection.Path + '" не был найден.');
           	exit;
     	end;

        StatusBar.Panels[0].Text := 'База данных: ' + GetCurrentDir + '\DataBase\HomeAudit.fdb';
        result := true;
end;

//создание резервной копии базы данных
procedure TfrmMain.BuckUpDataBase;
var
        zip_name,
        file_name: string;
begin
        
        if (not (OptionsIni.ReadBool('Options', 'BackUp', false))) then
                exit;

        zip_name    := GetCurrentDir + format('\DataBase\HomeAudit_%s.rar', [SetDateTimeFileName]);
        file_name   := GetCurrentDir + '\DataBase\HOMEAUDIT.FDB';

        Zip.ZipName := zip_name;
        Zip.FilesList.Add(file_name);
        Zip.Zip;

        MsgBox('Резервная копия успешно создана:' + #13 + zip_name);
end;

//Доходы
procedure TfrmMain.AcGainExecute(Sender: TObject);
var
        frm: TfrmGain;
begin
  	frm := TfrmGain.Create(self);
        frm.Show;
end;

//Расходы
procedure TfrmMain.AcCostExecute(Sender: TObject);
var
        frm: TfrmCost;
begin
  	frm := TfrmCost.Create(self);
        frm.Show;
end;

//Доходы и расходы
procedure TfrmMain.AcGainCostExecute(Sender: TObject);
var
        frm: TfrmGainCost;
begin
  	frm := TfrmGainCost.Create(self);
        frm.Show;
end;

//Долги
procedure TfrmMain.AcDebtExecute(Sender: TObject);
var
        frm: TfrmDebt;
begin
  	frm := TfrmDebt.Create(self);
        frm.Show;
end;

//Командировки
procedure TfrmMain.AcErrandExecute(Sender: TObject);
var
        frm: TfrmErrand;
begin
  	frm := TfrmErrand.Create(self);
        frm.Show;
end;

//Текущий баланс
procedure TfrmMain.AcBalanceExecute(Sender: TObject);
var
	frm: TfrmBalance;
begin
	frm := TfrmBalance.Create(self);
        frm.ShowModal;
end;

//Настройки
procedure TfrmMain.AcOptionsExecute(Sender: TObject);
var
	frm: TfrmOptions;
begin
	frm := TfrmOptions.Create(self);
        frm.ShowModal;
end;

procedure TfrmMain.AcExitExecute(Sender: TObject);
begin
        Close;
end;

//Справочник доходов
procedure TfrmMain.AcGainTypeExecute(Sender: TObject);
var
        frm: TfrmGainType;
begin
  	frm := TfrmGainType.Create(self);
        frm.Show;
end;

//Справочник расходов
procedure TfrmMain.AcCostTypeExecute(Sender: TObject);
var
        frm: TfrmCostType;
begin
  	frm := TfrmCostType.Create(self);
        frm.Show;
end;

//О программе
procedure TfrmMain.AcAboutExecute(Sender: TObject);
var
	frm: TfrmAbout;
begin
	frm := TfrmAbout.Create(self);
        frm.ShowModal;
end;

end.
