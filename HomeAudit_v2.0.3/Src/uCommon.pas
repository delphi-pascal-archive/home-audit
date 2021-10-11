//ћодуль с функци€ми
//јвтор: ƒюгуров —ергей ћихайлович
//2010 - 2011
unit uCommon;

interface

uses
	Forms,
        StdCtrls,
        Controls,
        SysUtils,
        Windows,
        IniFiles,
        ComCtrls,
        ExtCtrls,
        elTree;

//показывает сообщение об ошибке
procedure ErrorBox(msg: string);
//показывает предупреждение
procedure WarningBox(msg: string);
//показывает сообщение с информацией
procedure MsgBox(msg: string);
//выдаетс€ запрос с двум€ кнопками "ƒа" и "Ќет"
//возвращает IDYES или IDNO
function YesNoBox(msg: string; Flags: Cardinal = MB_ICONQUESTION): integer;
//показывает окно с сообщением об ошибке
//приостанавливает закрытие модальной формы frm
//при передаче control - выставл€ет на него фокус
procedure StopClose(frm: TForm; msg: string; Control: TWinControl);
//перемещает фокус на нужный контрол
function SetActiveControl(Control: TWinControl): boolean;
//задание значение в комбобокс
procedure SetComboBox(var cb: TComboBox; str: string);
//задание пути к ini-файлу
function GetDefaultIniFileName: string;
//пытаетс€ из строки получить дату
function TryGetDate(str: string): boolean;
//пытаетс€ из строки получить дату врем€
function TryGetDateTime(str: string): boolean;
//пытаетс€ из строки получить целое число
function TryGetInt(str: string): boolean;
//пытаетс€ из строки получить число с правающей точкой
function TryGetDouble(str: string): boolean;
//проверка на присутствие в строке запрещенных символов
function CheckCorrectString(str: string; var ch: string; var pos: word): boolean;
//замен€ет decimalseparator на точку
function Sep2Dot(str: string): string;
//замен€ет точку на decimalseparator
function Dot2Sep(str: string): string;
//возвращает строку вида 2010-09-20_23-55-10
function SetDateTimeFileName: string;
//возвращает название мес€ца по его номеру в году
function GetMonthStr(month: word): string;

var
	OptionsIniFileName: string;
	OptionsIni: TCustomIniFile;

implementation

uses
	StrUtils,
        DateUtils;

procedure ErrorBox(msg: string);
begin
	Application.MessageBox(PChar (msg), PChar(Application.Title),
		MB_ICONERROR or MB_OK);
end;

procedure WarningBox(msg: string);
begin
	Application.MessageBox(PChar(msg), PChar(Application.Title),
		MB_ICONWARNING or MB_OK);
end;

procedure MsgBox(msg: string);
begin
	Application.MessageBox(PChar(msg), PChar(Application.Title),
		MB_ICONINFORMATION);
end;

function YesNoBox(msg: string; Flags: Cardinal = MB_ICONQUESTION): integer;
begin
	Result := Application.MessageBox(PChar(msg), PChar(Application.Title),
		MB_YESNO + Flags);
end;

procedure StopClose(frm: TForm; msg: string; Control: TWinControl);
begin
	if (frm <> nil) then
		frm.ModalResult := mrNone;

	Application.MessageBox(PChar(msg), PChar(Application.Title),
		MB_OK+MB_ICONEXCLAMATION);

	if (Control <> nil) then
        	//TODO: почему-то команда SetActiveControl не отрабатывает
		//SetActiveControl(Control);
                Control.SetFocus;
end;

function SetActiveControl(Control: TWinControl): boolean;
var
	Page: TPageControl;
begin
	result := false;
	try
		if (Control  = nil) or (Control.Parent = nil) or (Control.Parent is TForm) then
			exit;

		Control.Parent.Visible := true;
		SetActiveControl(Control.Parent);

		if (Control is TTabSheet) then
		begin
			Page := TPageControl(Control.Parent);
			Page.ActivePage := TTabSheet(Control);
		end;

		if (Control.Parent is TPage) then
			if (Control.Parent.Parent is TNotebook) then
                        	TNotebook(Control.Parent.Parent).ActivePage := TPage(Control.Parent).Caption;

		if Control.Enabled and Control.Visible then
		begin
			Control.SetFocus;
			result := true;
		end;
	finally
	end;
end;

//заполн€ет TDBComboBox параметрами из ini-файла
//запись параметров через ";"
//например: 1,25;1,26;1,29
procedure SetComboBox(var cb: TComboBox; str: string);
var
	i: integer;
        item: string;
begin
	if (str = '') then
        	exit;

        item := '';
        cb.Items.Clear;

	for i := 1 to length(str) do
		if (str[i] <> ';') then
                	item := item + str[i]
                        
                else
                 	if (item <> '') then
                        begin
                        	cb.Items.Add(item);
	                        item := '';
                        end;

	if (item <> '') then
        	cb.Items.Add(item);
end;

//задание пути к ini-файлу
function GetDefaultIniFileName: string;
var
	path: string;
begin
	path   := ExpandFileName (ParamStr(0));
	result := ChangeFileExt(path, '.ini');
end;

//пытаетс€ из строки получить дату
function TryGetDate(str: String): boolean;
begin
	result := true;

	try
		StrToDate(str);
	except on EConvertError do
		result := false;
	end;
end;

//пытаетс€ из строки получить дату врем€
function TryGetDateTime(str: String): boolean;
begin
	result := true;

	try
		StrToDateTime(str);
	except on EConvertError do
		result := false;
	end;
end;

//пытаетс€ из строки получить целое число
function TryGetInt(str: String): boolean;
begin
   	result := true;

	try
		StrToInt(str);
	except on EConvertError do
		result := false;
	end;
end;

//пытаетс€ из строки получить число с правающей точкой
function TryGetDouble(str: String): boolean;
begin
    	result := true;

	try
		StrToFloat(str);
	except on EConvertError do
		result := false;
	end;
end;

//проверка на присутствие в строке запрещенных символов
function CheckCorrectString(str: String; var ch: string; var pos: word): boolean;
var
	i: word;
begin
        result := false;
        ch  := '';
        pos := 0;
        
	for i := 1 to length(str) do
        if (str[i] = '''') then
        begin
        	result := true;
        	ch     := str[i];
                pos    := i;
                break;
        end;
end;

//замен€ет decimalseparator на точку
function Sep2Dot(str: string): string;
var
        i, count: word;
begin
	count := 0;
        for i := 1 to length(str) do
        begin
                if (str[i] = DecimalSeparator) then
                begin
                        str[i] := '.';
                    	inc(count);
                end;
	end;

        if (count = 0) then
        	str := str + '.00';

	result := str;
end;

//замен€ет точку на decimalseparator
function Dot2Sep(str: string): string;
var
        i: word;
begin
        for i := 1 to length(str) do
                if (str[i] = '.') then
                        str[i] := DecimalSeparator;

	result := str;
end;

//возвращает строку вида 2010-09-20_23-55-10
function SetDateTimeFileName: string;
var
	year, month, day,
        hour, min, sec, msec: word;
        year_str, month_str, day_str,
        hour_str, min_str, sec_str: string;
begin
	result := '';

	DecodeDate(Now, Year, Month, Day);
    	DecodeTime(Now, Hour, Min, Sec, MSec);

        if (year < 10) then
            	year_str := '0' + IntToStr(year)
        else
                year_str := IntToStr(year);

        if (month < 10) then
            	month_str := '0' + IntToStr(month)
        else
                month_str := IntToStr(month);

        if (day < 10) then
            	day_str := '0' + IntToStr(day)
        else
                day_str := IntToStr(day);

        if (hour < 10) then
            	hour_str := '0' + IntToStr(hour)
        else
                hour_str := IntToStr(hour);

        if (min < 10) then
            	min_str := '0' + IntToStr(min)
        else
                min_str := IntToStr(min);

        if (sec < 10) then
            	sec_str := '0' + IntToStr(sec)
        else
                sec_str := IntToStr(sec);

        //result := format('%s-%s-%s_%s-%s-%s', [year_str, month_str, day_str, hour_str, min_str, sec_str])
        result := format('%s-%s-%s', [year_str, month_str, day_str])
end;

//возвращает название мес€ца по его номеру в году
function GetMonthStr(month: word): string;
begin
        if ((month < 1) or (month > 12)) then
        begin
                result := '';
                exit;
        end;

        case month of
                1:  result := '€нварь';
                2:  result := 'февраль';
                3:  result := 'март';
                4:  result := 'апрель';
                5:  result := 'май';
                6:  result := 'июнь';
                7:  result := 'июль';
                8:  result := 'август';
                9:  result := 'сент€брь';
                10: result := 'окт€брь';
                11: result := 'но€брь';
                12: result := 'декабрь';
        end;
end;

initialization
	OptionsIniFileName := GetDefaultIniFileName;
        OptionsIni         := TIniFile.Create(OptionsIniFileName)
finalization
	OptionsIni.Free;

end.
