//HomeAudit
//Авторские права © 2010-2012 Дюгуров Сергей Михайлович
program HomeAudit;

uses
  Forms,
  fMain in 'Src\fMain.pas' {frmMain},
  dmHomeAudit in 'Src\dmHomeAudit.pas' {DataMod: TDataModule},
  fAbout in 'Src\fAbout.pas' {frmAbout},
  uChild in 'Src\uChild.pas',
  uCommon in 'Src\uCommon.pas',
  fCost in 'Src\fCost.pas' {frmCost},
  fCostEd in 'Src\fCostEd.pas' {frmCostEd},
  fCostType in 'Src\fCostType.pas' {frmCostType},
  fCostTypeEd in 'Src\fCostTypeEd.pas' {frmCostTypeEd},
  fOptions in 'Src\fOptions.pas' {frmOptions},
  fGainType in 'Src\fGainType.pas' {frmGainType},
  fGainTypeEd in 'Src\fGainTypeEd.pas' {frmGainTypeEd},
  fGain in 'Src\fGain.pas' {frmGain},
  fGainEd in 'Src\fGainEd.pas' {frmGainEd},
  fBalance in 'Src\fBalance.pas' {frmBalance},
  fGainCost in 'Src\fGainCost.pas' {frmGainCost},
  EasyGraph in 'Src\EasyGraph.pas',
  fDebt in 'Src\fDebt.pas' {frmDebt},
  fDebtEd in 'Src\fDebtEd.pas' {frmDebtEd},
  fErrand in 'Src\fErrand.pas' {frmErrand},
  fErrandEd in 'Src\fErrandEd.pas' {frmErrandEd};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Домашний аудит';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataMod, DataMod);
  Application.CreateForm(TfrmErrandEd, frmErrandEd);
  Application.Run;
end.
