//О программе
unit fAbout;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, TeEngine, Series, TeeProcs, Chart, jpeg;

type

TfrmAbout = class(TForm)
    lblEMail: TLabel;
    lblCopyright: TLabel;
    lblVersion: TLabel;
    lblEMail1: TLabel;
    Bevel: TBevel;
    btnOk: TButton;
    pnlTop: TPanel;
    lblProductName: TLabel;
    Logo: TImage;
    procedure lblEMail1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

implementation

uses
	ShellApi,
        uCommon;

{$R *.dfm}

procedure TfrmAbout.FormShow(Sender: TObject);
begin
        lblVersion.Caption := 'Версия: 2.0.3';
        lblVersion.Hint    := 'февраль 2012' + #13 + 'Дата последней сборки: 15-02-2012';
end;

procedure TfrmAbout.lblEMail1Click(Sender: TObject);
begin
	ShellExecute (0, 'open', 'mailto:scorpion235@mail.ru.ru', nil, nil, SW_SHOWNORMAL);
end;

end.
