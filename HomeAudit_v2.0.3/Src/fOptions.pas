//Настройки
unit fOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RtColorPicker, ComCtrls, ExtCtrls, RXSpin,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomBrowseEdit, LMDBrowseEdit, Mask, DBCtrlsEh;

type
  TfrmOptions = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Pages: TPageControl;
    Gain: TTabSheet;
    cbCanGainDelete: TCheckBox;
    tsCost: TTabSheet;
    tsBackUp: TTabSheet;
    cbBackUp: TCheckBox;
    cbCanCostDelete: TCheckBox;
    tsBalance: TTabSheet;
    lblBalance: TLabel;
    cbBalanceDay: TDBComboBoxEh;
    lblBalance1: TLabel;
    tsDebt: TTabSheet;
    cbCanDebtDelete: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
private
    procedure LoadFromIni;
    procedure SaveToIni;
public
    { Public declarations }
end;

implementation

uses
        uCommon;

{$R *.dfm}

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
        Pages.ActivePageIndex := 0;
   	LoadFromIni;
end;

procedure TfrmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

//------------------------------------------------------------------------------
//
//	INI
//
//------------------------------------------------------------------------------

//загрузка параметров из ini-файла
procedure TfrmOptions.LoadFromIni;
var
	sect: string;
begin
	sect := 'Options';
        cbCanGainDelete.Checked := OptionsIni.ReadBool(sect, 'CanGainDelete', true);
        cbCanCostDelete.Checked := OptionsIni.ReadBool(sect, 'CanCostDelete', true);
        cbCanDebtDelete.Checked := OptionsIni.ReadBool(sect, 'CanDebtDelete', true);
        cbBackUp.Checked        := OptionsIni.ReadBool(sect, 'BackUp', false);
        cbBalanceDay.Text       := OptionsIni.ReadString(sect, 'BalanceDay', '1');
end;

//сохранение параметров в ini-файл
procedure TfrmOptions.SaveToIni;
var
	sect: string;
begin
	sect := 'Options';
        OptionsIni.WriteBool(sect, 'CanGainDelete', cbCanGainDelete.Checked);
        OptionsIni.WriteBool(sect, 'CanCostDelete', cbCanCostDelete.Checked);
        OptionsIni.WriteBool(sect, 'CanDebtDelete', cbCanDebtDelete.Checked);
        OptionsIni.WriteBool(sect, 'BackUp', cbBackUp.Checked);
        OptionsIni.WriteString(sect, 'BalanceDay', cbBalanceDay.Text);
end;

procedure TfrmOptions.btnOKClick(Sender: TObject);
begin
	SaveToIni;
end;

end.
