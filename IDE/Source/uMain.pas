//  SigLab Integrated Development Environment.
//  Copyright © 2011 Dilshan R Jayakody.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPStyleActnCtrls, ActnList, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, ImgList, ComCtrls, SynEdit, StdCtrls, ExtCtrls, SynEditTypes,
  SynEditHighlighter, SynHighlighterPas, JvExComCtrls, JvStatusBar,
  dws2Comp, dws2Exprs, JvExStdCtrls, JvHtControls, JvComponentBase,
  JvHidControllerClass, uSystem, dws2Debugger, SynCompletionProposal,
  SynEditPrint, Menus, dws2ComConnector, AppEvnts, JvAppInst;

const

  APP_NAME : string = 'SigLab';
  FILE_EXT : string = '.sgl';

type
  TfrmMain = class(TForm)
    actMain: TActionManager;
    mnuNew: TAction;
    mnuOpen: TAction;
    mnuSave: TAction;
    mnuSaveAs: TAction;                    
    imgMain: TImageList;
    mnuExit: TAction;
    barMenu1: TActionMainMenuBar;
    mnuPrint: TAction;
    mnuCopy: TAction;
    mnuPaste: TAction;
    mnuCut: TAction;
    mnuUndo: TAction;
    mnuSelectAll: TAction;
    barTool1: TActionToolBar;
    SynPasSyn1: TSynPasSyn;
    mnuRun: TAction;
    mnuStop: TAction;
    mnuCompile: TAction;
    mnuClearLog: TAction;
    mnuSaveLog: TAction;
    stbMain: TJvStatusBar;
    pnlDevice: TPanel;
    lblInfo1: TLabel;
    mnuHelp: TAction;
    mnuWeb: TAction;
    mnuAbout: TAction;
    dlgSaveFile: TSaveDialog;
    dlgOpenFile: TOpenDialog;
    mnuRedo: TAction;
    dws1: TDelphiWebScriptII;
    imgStatus: TImage;
    imglStatus: TImageList;
    mnuDebug: TAction;
    mnuStepOver: TAction;
    hidcon1: TJvHidDeviceController;
    Panel1: TPanel;
    txtEdit: TSynEdit;
    JvHTListBox1: TJvHTListBox;
    Splitter1: TSplitter;
    dwsDebugger1: Tdws2SimpleDebugger;
    dws_hid_io1: Tdws2Unit;
    synList: TSynCompletionProposal;
    synParam: TSynCompletionProposal;
    save_log: TSaveDialog;
    editor_print: TSynEditPrint;
    print_dialog1: TPrintDialog;
    popup_editor1: TPopupMenu;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Cut1: TMenuItem;
    N1: TMenuItem;
    SelectAll1: TMenuItem;
    N2: TMenuItem;
    Compile1: TMenuItem;
    dws2ComConnector1: Tdws2ComConnector;
    ApplicationEvents1: TApplicationEvents;
    mnuGNU_GPL: TAction;
    JvAppInstances1: TJvAppInstances;
    procedure FormCreate(Sender: TObject);
    procedure txtEditChange(Sender: TObject);
    procedure mnuNewExecute(Sender: TObject);
    function SaveFile(filename : string) : Boolean;
    function SaveTextFile() : Boolean;
    procedure mnuSaveExecute(Sender: TObject);
    function CloseFile() : Boolean;
    procedure mnuOpenExecute(Sender: TObject);
    procedure mnuSaveAsExecute(Sender: TObject);
    procedure mnuCopyExecute(Sender: TObject);
    procedure mnuCopyUpdate(Sender: TObject);
    procedure mnuCutUpdate(Sender: TObject);
    procedure mnuCutExecute(Sender: TObject);
    procedure mnuPasteExecute(Sender: TObject);
    procedure SetDeviceStatus(isOnline : Boolean);
    procedure mnuSelectAllExecute(Sender: TObject);
    procedure mnuUndoExecute(Sender: TObject);
    procedure mnuRedoExecute(Sender: TObject);
    procedure mnuUndoUpdate(Sender: TObject);
    procedure mnuRedoUpdate(Sender: TObject);
    procedure mnuExitExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuCompileExecute(Sender: TObject);
    procedure mnuRunExecute(Sender: TObject);
    procedure actMainUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ResetEditor();
    procedure hidcon1DeviceChange(Sender: TObject);
    function hidcon1Enumerate(HidDev: TJvHidDevice;
      const Idx: Integer): Boolean;
    procedure DoHidRead(HidDev: TJvHidDevice; ReportID: Byte; const Data: Pointer; Size: Word);
    procedure LoadHIDDevice(hdev : TJvHidDevice);
    procedure UnloadDevice();
    procedure hidcon1Removal(HidDev: TJvHidDevice);
    procedure mnuRunUpdate(Sender: TObject);
    procedure mnuCompileUpdate(Sender: TObject);
    procedure mnuDebugExecute(Sender: TObject);
    procedure mnuStepOverExecute(Sender: TObject);
    procedure dwsDebugger1Debug(Prog: TProgram; Expr: TExpr);
    procedure txtEditSpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
    procedure dwsDebugger1DebugStop(MainProg: TProgram);
    procedure mnuStopExecute(Sender: TObject);
    procedure mnuDebugUpdate(Sender: TObject);
    procedure dws_hid_io1FunctionsWritePortEval(Info: TProgramInfo);
    procedure ClearHIDBuffer();
    function WriteToHID(Command : byte; Value : byte; Port : Integer) : Boolean;
    procedure dws_hid_io1FunctionsReadPortEval(Info: TProgramInfo);
    procedure dws_hid_io1FunctionsWriteDirectionEval(Info: TProgramInfo);
    procedure dws_hid_io1FunctionsReadDirectionEval(Info: TProgramInfo);
    procedure dws_hid_io1FunctionsPrintEval(Info: TProgramInfo);
    procedure JvHTListBox1DblClick(Sender: TObject);
    procedure txtEditEnter(Sender: TObject);
    procedure ClearEditorMarkers();
    procedure synParamExecute(Kind: TSynCompletionType; Sender: TObject;
      var CurrentInput: String; var x, y: Integer;
      var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dws_hid_io1FunctionsExecEval(Info: TProgramInfo);
    procedure dws_hid_io1FunctionsShiftRightEval(Info: TProgramInfo);
    procedure dws_hid_io1FunctionsToggleBitEval(Info: TProgramInfo);
    procedure mnuSaveLogExecute(Sender: TObject);
    procedure mnuSaveLogUpdate(Sender: TObject);
    procedure mnuClearLogExecute(Sender: TObject);
    procedure mnuClearLogUpdate(Sender: TObject);
    procedure dws_hid_io1FunctionsSleepEval(Info: TProgramInfo);
    procedure mnuPrintExecute(Sender: TObject);
    procedure mnuPrintUpdate(Sender: TObject);
    procedure dws_hid_io1FunctionsMsgBoxEval(Info: TProgramInfo);
    procedure mnuAboutExecute(Sender: TObject);
    procedure mnuWebExecute(Sender: TObject);
    procedure mnuHelpExecute(Sender: TObject);
    procedure LogRuntimeError(err_ : String);
    procedure OpenComdLineFile(inparam : string);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure mnuGNU_GPLExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvAppInstances1CmdLineReceived(Sender: TObject;
      CmdLine: TStrings);
  private
    _script_prog : TProgram;
    CFreq : Int64;
    _dev_info : TUSBDeviceInfo;
    _hid_device : TJvHidDevice;
    _debug_move_next : Boolean;
    _editor_marker : integer;
    _active_debug_line : integer;
    _hid_buffer : array [0..64] of Byte;
    _hid_return : array [0..4] of Byte;
    info_list : TStringList;
    tmp_list : TStringList;
    procedure WriteToHIDBuffer(Command : byte; Value : byte; Port : Integer);
  public
    _filename : string;
    _filepath : string;
    _filename_counter : integer;
    _is_modified : boolean;
  end;

var
  frmMain: TfrmMain;

implementation
uses
  jclAnsiStrings, StrUtils, Shellapi, JclLogic, uAbout;

{$R *.dfm}

procedure TfrmMain.ClearHIDBuffer();
var
  pos : integer;
begin
  for pos := 0 to 64 do
    _hid_buffer[pos] := 0;
  for pos := 0 to 4 do
    _hid_return[pos] :=0;
end;

procedure TfrmMain.LogRuntimeError(err_ : String);
begin
  JvHTListBox1.Items.Add('<font color = $000000F9>'+err_+'</font>');
end;

procedure TfrmMain.WriteToHIDBuffer(Command : byte; Value : byte; Port : Integer);
begin
  _hid_buffer[1] := _dev_info.Signature;
  _hid_buffer[2] := Command;
  _hid_buffer[3] := Value;
  _hid_buffer[4] := Port;
end;

function TfrmMain.WriteToHID(Command : byte; Value : byte; Port : Integer) : Boolean;
var
  WriteLen, WriteCount: Cardinal;
begin
  WriteToHIDBuffer(Command, Value, Port);
  WriteCount := 0;
  WriteLen := _hid_device.Caps.OutputReportByteLength;
  result := _hid_device.WriteFile(_hid_buffer, WriteLen, WriteCount);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  pos : integer;
begin
  info_list := TStringList.Create;
  QueryPerformanceFrequency(CFreq);
  if (CFreq = 0) then
    CFreq := 1;    
  _filename_counter := 1;
  _filepath := '';
  _filename := GetFileNamePrefix(_filename_counter) + FILE_EXT;
  _is_modified := false;
  _editor_marker := -1;
  _dev_info := GetUSBDeviceInfo;
  SetDeviceStatus(false);
  _debug_move_next := false;
  _active_debug_line := -1;
  Caption := APP_NAME + ' - ' + _filename;
  ResetEditor;
  ClearHIDBuffer;
  synList.InsertList.LoadFromFile(Root+'funclist.ilist');
  synList.ItemList.LoadFromFile(Root+'funclist.elist');
  info_list.LoadFromFile(Root+'funclist.ilist');
  for pos := 0 to info_list.Count - 1 do
    info_list.Strings[pos] := uppercase(info_list.Strings[pos]);
  tmp_list := TStringList.Create;
  synParam.EndOfTokenChr := '';
end;

procedure TfrmMain.SetDeviceStatus(isOnline : Boolean);
var
  tmp_ : TIcon;
begin
  tmp_ := TIcon.Create;
  if (isOnline) then begin
    imglStatus.GetIcon(1,tmp_);
    lblInfo1.Caption := 'Device connected';
  end else begin
    imglStatus.GetIcon(0,tmp_);
    lblInfo1.Caption := 'Device not found';
  end;
  imgStatus.Picture.Icon:= tmp_;
end;

procedure TfrmMain.txtEditChange(Sender: TObject);
begin
  if(not _is_modified) then begin
    _is_modified := true;
    Caption := Caption + '*';
  end;
end;

function TfrmMain.CloseFile() : Boolean;
var
  ret_ : integer;
begin
  result := true;
  if(_is_modified) then begin
    ret_ := MessageBox(handle, pchar('The text in the '+_filename+' file has changed.'#13#13'Do you wan to save the changes?'), PChar(Application.Title), MB_YESNOCANCEL + MB_ICONQUESTION);
    if(ret_ = 2) then
      result := false
    else if(ret_ = 6) then begin
      if(not SaveTextFile) then
        result := false;
    end;
  end;
end;

procedure TfrmMain.ResetEditor();
begin
  ClearEditorMarkers;
  txtEdit.Lines.Clear;
  txtEdit.InsertMode := true;
  mnuStop.Enabled := false;
  mnuStepOver.Enabled := false;
end;

procedure TfrmMain.mnuNewExecute(Sender: TObject);
begin
  if (CloseFile) then begin
    ResetEditor();
    _filepath := '';
    _filename := GetFileNamePrefix(_filename_counter) + FILE_EXT;
    Caption := APP_NAME + ' - ' + _filename;
    _is_modified := false;
  end;
end;

function TfrmMain.SaveFile(filename : string) : Boolean;
begin
  result := false;
  try
    txtEdit.Lines.SaveToFile(filename);
    _filepath := filename;
    _filename := ExtractFileName(_filepath);
    Caption := APP_NAME + ' - ' + _filename;
    _is_modified := false;
    result := true;
  except
    on E: Exception do
      MessageBox(handle, pchar('Unable to save file '+ExtractFileName(filename)+#13#13+E.Message), pchar(Application.Title), MB_OK+MB_ICONERROR);
  end;
end;

function TfrmMain.SaveTextFile() : Boolean;
begin
  result := false;
  if(_filepath = '') then begin
    dlgSaveFile.FileName := _filename;
    if(dlgSaveFile.Execute) then
      result := SaveFile(dlgSaveFile.FileName);
  end else
    result := SaveFile(_filepath);
end;

procedure TfrmMain.mnuSaveExecute(Sender: TObject);
begin
  SaveTextFile;
end;

procedure TfrmMain.mnuOpenExecute(Sender: TObject);
begin
  if ((CloseFile) and (dlgOpenFile.Execute)) then begin
    try
      ResetEditor();
      txtEdit.Lines.LoadFromFile(dlgOpenFile.FileName);
      _filepath := dlgOpenFile.FileName;
      _filename := ExtractFileName(_filepath);
      Caption := APP_NAME + ' - ' + _filename;
      _is_modified := false;
    except
      on E: Exception do
        MessageBox(handle, pchar('Unable to open file '+ExtractFileName(dlgOpenFile.FileName)+#13#13+E.Message), pchar(Application.Title), MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure TfrmMain.mnuSaveAsExecute(Sender: TObject);
begin
  dlgSaveFile.FileName := _filename;
    if(dlgSaveFile.Execute) then
      SaveFile(dlgSaveFile.FileName);
end;

procedure TfrmMain.mnuCopyExecute(Sender: TObject);
begin
  txtEdit.CopyToClipboard;
end;

procedure TfrmMain.mnuCopyUpdate(Sender: TObject);
begin
  mnuCopy.Enabled := (txtEdit.SelLength > 0);
end;

procedure TfrmMain.mnuCutUpdate(Sender: TObject);
begin
  mnuCut.Enabled := (txtEdit.SelLength > 0);
end;

procedure TfrmMain.mnuCutExecute(Sender: TObject);
begin
  txtEdit.CutToClipboard;
end;

procedure TfrmMain.mnuPasteExecute(Sender: TObject);
begin
  txtEdit.PasteFromClipboard;
end;

procedure TfrmMain.mnuSelectAllExecute(Sender: TObject);
begin
  txtEdit.SelectAll;
end;

procedure TfrmMain.mnuUndoExecute(Sender: TObject);
begin
  txtEdit.Undo;
end;

procedure TfrmMain.mnuRedoExecute(Sender: TObject);
begin
  txtEdit.Redo;
end;

procedure TfrmMain.mnuUndoUpdate(Sender: TObject);
begin
  mnuUndo.Enabled := txtEdit.CanUndo;
end;

procedure TfrmMain.mnuRedoUpdate(Sender: TObject);
begin
  mnuRedo.Enabled := txtEdit.CanRedo;
end;

procedure TfrmMain.mnuExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := CloseFile;
  if(CanClose and (Assigned(_script_prog) and (_script_prog.IsDebugging))) then begin
    try
      _script_prog.Stop;
      _debug_move_next := true;
    finally
    end;
  end;
end;

procedure TfrmMain.mnuCompileExecute(Sender: TObject);
var
  pos_ : integer;
begin
  try
    _script_prog.Free;
  finally
    _script_prog := nil;
  end;
  ClearEditorMarkers;
  _debug_move_next := false;
  _editor_marker := -1;
  mnuStop.Enabled := false;
  mnuStepOver.Enabled := false;
  _active_debug_line := -1;
  JvHTListBox1.Items.Clear;
  JvHTListBox1.Items.Add('<b>Compiling</b>: '+_filename+'...');
  _script_prog := dws1.Compile(txtEdit.Text);
  for pos_ := 0 to _script_prog.Msgs.Count - 1 do
    JvHTListBox1.Items.Add('  '+_script_prog.Msgs[pos_].AsInfo);
  if(Sender <> nil) then
    JvHTListBox1.Items.Add('<b>Compiled</b>');
end;

procedure TfrmMain.mnuRunExecute(Sender: TObject);
var
  time_start, time_stop : Int64; pos_ : integer;
begin
  mnuCompileExecute(nil);
  if (not Assigned(_script_prog)) then
    exit;
  if (_script_prog.Msgs.HasCompilerErrors) then
    exit;
  mnuStop.Enabled := true;
  mnuStepOver.Enabled := false;
  mnuCompile.Enabled := false;
  _script_prog.Debugger := nil;
  JvHTListBox1.Items.Add('<b>Executing</b>: '+_filename+'...');
  QueryPerformanceCounter(time_start);
  try
    _script_prog.Execute;
  finally
    QueryPerformanceCounter(time_stop);
    if(_script_prog.Msgs.HasExecutionErrors) then begin
      for pos_ := 0 to _script_prog.Msgs.Count - 1 do
        LogRuntimeError(_script_prog.Msgs[pos_].AsInfo);
    end;
    mnuCompile.Enabled := true;
    mnuStop.Enabled := false;
    JvHTListBox1.Items.Add('<font color = $00006432>'+format('Script execution complete in %.3f sec.', [(time_stop - time_start)/CFreq])+'</font>');
  end;
end;

procedure TfrmMain.actMainUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  stbMain.Panels[1].Text := ' '+ inttostr(txtEdit.CaretX) + ':'+inttostr(txtEdit.CaretY);
  if (txtEdit.InsertMode) then
    stbMain.Panels[2].Text := 'Insert'
  else
    stbMain.Panels[2].Text := 'Overwrite';
end;

procedure TfrmMain.hidcon1DeviceChange(Sender: TObject);
var
  hid_dev : TJvHidDevice;
begin
  while(hidcon1.CheckOut(hid_dev)) do begin
    hid_dev.NumInputBuffers := 128;
    hid_dev.NumOverlappedBuffers := 128;
    if((hid_dev.Attributes.VendorID = _dev_info.VID) and (hid_dev.Attributes.ProductID =  _dev_info.PID)) then
      LoadHIDDevice(hid_dev);
  end;
end;

function TfrmMain.hidcon1Enumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
var
  hid_dev : TJvHidDevice;
begin
  hidcon1.CheckOutByIndex(hid_dev, Idx);
  hid_dev.NumInputBuffers := 128;
  hid_dev.NumOverlappedBuffers := 128;
  if((hid_dev.Attributes.VendorID = _dev_info.VID) and (hid_dev.Attributes.ProductID =  _dev_info.PID)) then
    LoadHIDDevice(hid_dev);
  Result := True;
end;

procedure TfrmMain.LoadHIDDevice(hdev : TJvHidDevice);
begin
  if (Assigned(_hid_device)) then
    _hid_device.OnData := nil;
  _hid_device := nil;
  try
    _hid_device := hdev;
    _hid_device.OnData := DoHidRead;
    SetDeviceStatus(true);
  except
    on E: Exception do
      MessageBox(handle, pchar('Unable to load SigLab interface device'+#13#13+E.Message), pchar(Application.Title), MB_OK+MB_ICONERROR);
  end;
end;

procedure TfrmMain.UnloadDevice();
begin
  if (Assigned(_hid_device)) then
    _hid_device.OnData := nil;
  hidcon1.CheckIn(_hid_device);
  _hid_device := nil;
  SetDeviceStatus(false);
end;

procedure TfrmMain.DoHidRead(HidDev: TJvHidDevice; ReportID: Byte; const Data: Pointer; Size: Word);
var
  pos : integer;
begin
  for pos := 0 to Size - 1 do
    _hid_return[pos] := Cardinal(PChar(Data)[pos]);
  if(_hid_return[0] = _dev_info.Signature + 1) then
    dec(_hid_return[0]);
end;

procedure TfrmMain.hidcon1Removal(HidDev: TJvHidDevice);
begin
  if((HidDev.Attributes.VendorID = _dev_info.VID) and (HidDev.Attributes.ProductID =  _dev_info.PID)) then
    UnloadDevice;
end;

procedure TfrmMain.mnuRunUpdate(Sender: TObject);
begin
  mnuRun.Enabled := (Assigned(_hid_device) and (trim(txtEdit.Text) <> ''));
end;

procedure TfrmMain.mnuCompileUpdate(Sender: TObject);
begin
  mnuCompile.Enabled := (trim(txtEdit.Text) <> '');
end;

procedure TfrmMain.mnuDebugExecute(Sender: TObject);
begin
  mnuCompileExecute(nil);
  if (not Assigned(_script_prog)) then
    exit;
  if (_script_prog.Msgs.HasCompilerErrors) then
    exit;
  mnuCompile.Enabled := false;
  mnuStop.Enabled := true;
  mnuStepOver.Enabled := true;
  _script_prog.Debugger := dwsDebugger1;
  JvHTListBox1.Items.Add('<b>Debugging</b>: '+_filename+'...');
  try
    _script_prog.Execute;
  except
    mnuCompile.Enabled := true;
    mnuStop.Enabled := false;
    mnuStepOver.Enabled := false;
  end;
end;

procedure TfrmMain.mnuStepOverExecute(Sender: TObject);
begin
  _debug_move_next := true;
end;

procedure TfrmMain.dwsDebugger1Debug(Prog: TProgram; Expr: TExpr);
begin
  _active_debug_line := Expr.Pos.Line;
  txtEdit.InvalidateGutterLine(_active_debug_line);
  txtEdit.InvalidateLine(_active_debug_line);
  txtEdit.CaretXY := BufferCoord(Expr.Pos.Col, Expr.Pos.Line);
  txtEdit.InvalidateGutterLine(_active_debug_line);
  txtEdit.InvalidateLine(_active_debug_line);
  while (not _debug_move_next) do begin
    Application.ProcessMessages;
    self.Refresh;
    if (not Assigned(_hid_device)) then begin
      _script_prog.Stop;
      break;
    end;
  end;
  _debug_move_next := false;
end;

procedure TfrmMain.txtEditSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
begin
  if((_editor_marker>-1) and (Line = _editor_marker)) then begin
    Special := TRUE;
    FG := clWhite;
    BG := clRed;  
  end;
  if((_active_debug_line > -1) and (Line = _active_debug_line)) then begin
    Special := TRUE;
    FG := clWhite;
    BG := clBlue;
  end;
end;

procedure TfrmMain.dwsDebugger1DebugStop(MainProg: TProgram);
begin
  txtEdit.InvalidateGutterLine(_active_debug_line);
  txtEdit.InvalidateLine(_active_debug_line);
  _active_debug_line:= -1;
  _debug_move_next := false;
  mnuCompile.Enabled := true;
  mnuStop.Enabled := false;
  mnuStepOver.Enabled := false;
  JvHTListBox1.Items.Add('<font color = $00006432>Debug session completed</font>');
end;

procedure TfrmMain.mnuStopExecute(Sender: TObject);
begin
  try
    if (Assigned(_script_prog)) then begin
      _script_prog.Stop;
      if (_script_prog.IsDebugging) then
        _debug_move_next := true;
    end;
  finally
    _editor_marker := -1;
  end;
end;

procedure TfrmMain.mnuDebugUpdate(Sender: TObject);
begin
  mnuDebug.Enabled := (Assigned(_hid_device) and (trim(txtEdit.Text) <> ''));
  if(Assigned(_script_prog) and mnuDebug.Enabled) then
    mnuDebug.Enabled := not _script_prog.IsDebugging;
end;

procedure TfrmMain.dws_hid_io1FunctionsWritePortEval(Info: TProgramInfo);
begin
  if(Assigned(_hid_device)) then begin
    if(Info['PortNumber']>255) then
      raise Exception.Create('Port number '+ VarToStr(Info['PortNumber'])+' is out of the range');
    if(Info['PortValue']>255) then
      raise Exception.Create('Port value '+ VarToStr(Info['PortValue'])+' is out of the range');
    Info['Result'] := WriteToHID(1, Info['PortValue'], Info['PortNumber']);
  end else
    Info['Result'] := false;
end;

procedure TfrmMain.dws_hid_io1FunctionsReadPortEval(Info: TProgramInfo);
begin
  if(Assigned(_hid_device)) then begin
    if(Info['PortNumber']>255) then
      raise Exception.Create('Port number '+ VarToStr(info['PortNumber'])+' is out of the range');
    _hid_return[0] :=0;
    _hid_return[1] :=0;
    Info['Result'] := WriteToHID(3, 0, Info['PortNumber']);
    while(not((_hid_return[0] = _dev_info.Signature) and (_hid_return[1] = 3))) do
      Application.ProcessMessages;
    Info['Result'] := _hid_return[2];
  end else
    Info['Result'] := -1;
end;

procedure TfrmMain.dws_hid_io1FunctionsWriteDirectionEval(
  Info: TProgramInfo);
begin
    if(Assigned(_hid_device)) then begin
    if(Info['PortNumber']>255) then
      raise Exception.Create('Port number '+ VarToStr(Info['PortNumber'])+' is out of the range');
    if(Info['DirectionValue']>255) then
      raise Exception.Create('Direction value '+ VarToStr(Info['DirectionValue'])+' is out of the range');
    Info['Result'] := WriteToHID(2, Info['DirectionValue'], Info['PortNumber']);
  end else
    Info['Result'] := false;
end;

procedure TfrmMain.dws_hid_io1FunctionsReadDirectionEval(
  Info: TProgramInfo);
begin
  if(Assigned(_hid_device)) then begin
    if(Info['PortNumber']>255) then
      raise Exception.Create('Port number '+ VarToStr(Info['PortNumber'])+' is out of the range');
    _hid_return[0] :=0;
    _hid_return[1] :=0;
    Info['Result'] := WriteToHID(4, 0, Info['PortNumber']);
    while(not((_hid_return[0] = _dev_info.Signature) and (_hid_return[1] = 4))) do
      Application.ProcessMessages;
    Info['Result'] := _hid_return[2];
  end else
    Info['Result'] := -1;
end;

procedure TfrmMain.dws_hid_io1FunctionsPrintEval(Info: TProgramInfo);
begin
  JvHTListBox1.Items.Add('  <font color = $009F1400>'+VarToStr(Info['v'])+'</font>');
end;

procedure TfrmMain.JvHTListBox1DblClick(Sender: TObject);
var
  decode_string : string;
  tmp_, x_pos, y_pos : integer;

  function GetParamValue(instr : string; section : string) : integer;
  var
    tmp2_ : integer; stmp : string;
  begin
    result := -1;
    tmp2_ := StrIPos(section+':', instr);
    if(tmp2_>0) then begin
      inc(tmp2_,Length(section)+1);
      if(PosEx(',',instr, tmp2_)>0) then
        stmp := trim(StrMid(instr, tmp2_, PosEx(',',instr, tmp2_)-tmp2_))
      else
        stmp := trim(StrRight(instr, Length(instr)-tmp2_));
      if((stmp<>'') and (StrToIntDef(stmp,-1) <> -1)) then
        result := StrToint(stmp);
    end;
  end;

begin
  if(JvHTListBox1.ItemIndex > -1) then begin
    decode_string := JvHTListBox1.PlainItems[JvHTListBox1.ItemIndex];
    if(decode_string[Length(decode_string)] = ']') then begin
      tmp_ := StrLastPos('[',decode_string);
      if(tmp_ > 0) then begin
        decode_string := lowercase(trim(StrMid(decode_string, tmp_+1, (Length(decode_string) - tmp_)-1)));
        if(decode_string <> '') then begin
          x_pos := GetParamValue(decode_string, 'line');
          y_pos := GetParamValue(decode_string, 'column');
          txtEdit.InvalidateGutterLine(x_pos);
          txtEdit.InvalidateLine(x_pos);
          _editor_marker := x_pos;
          txtEdit.CaretXY := BufferCoord(y_pos, x_pos);
          txtEdit.InvalidateGutterLine(x_pos);
          txtEdit.InvalidateLine(x_pos);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.ClearEditorMarkers();
begin
  if(_editor_marker > -1) then begin
    txtEdit.InvalidateGutterLine(_editor_marker);
    txtEdit.InvalidateLine(_editor_marker);
    _editor_marker := -1;
  end;
end;

procedure TfrmMain.txtEditEnter(Sender: TObject);
begin
  ClearEditorMarkers;
end;

procedure TfrmMain.synParamExecute(Kind: TSynCompletionType;
  Sender: TObject; var CurrentInput: String; var x, y: Integer;
  var CanExecute: Boolean);
var
  pos_x, loc_, p_counter, start_pos, save_pos : Integer; found_ : Boolean;
  str_, lookup, info_txt : String; 
begin
  found_ := false;
  loc_ := 0;
  pos_x := txtEdit.CaretX;
  str_ := txtEdit.LineText;
  if pos_x > Length(str_) then
    pos_x := Length(str_)
  else
    dec(pos_x);
  while ((pos_x > 0) and not(found_)) do begin
    if (str_[pos_x] = ',') then begin
      inc(loc_);
      dec(pos_x);
    end else if str_[pos_x] = ')' then begin
      p_counter := 1;
      dec(pos_x);
      while (pos_x > 0) and (p_counter > 0) do begin
        if str_[pos_x] = ')' then
          inc(p_counter)
        else if str_[pos_x] = '(' then
          dec(p_counter);
        dec(pos_x);
      end;
      if pos_x > 0 then
        dec(pos_x);
    end else if str_[pos_x] = '(' then begin
      start_pos := pos_x;
      while((pos_x > 0)and(not(str_[pos_x] in TSynValidStringChars))) do
        dec(pos_x);
      if(pos_x >0) then begin
        save_pos := pos_x;
        while((pos_x > 0)and(str_[pos_x] in TSynValidStringChars)) do
          dec(pos_x);
        inc(pos_x);
        lookup := uppercase(Copy(str_, pos_x, (save_pos - pos_x) + 1));
        found_ := (info_list.IndexOf(lookup) > -1);
        if (not found_) then begin
          pos_x := start_pos;
          dec(pos_x);
        end;
      end;
    end else
      dec(pos_x);
  end;
  if(found_) then begin
    synParam.Form.CurrentIndex := loc_;
    if(lookup <> synParam.PreviousToken) then begin
      synParam.ItemList.Clear;
      info_txt := synList.ItemList.Strings[info_list.IndexOf(lookup)];
      info_txt := StrRight(info_txt, (Length(info_txt) - (StrFind('{-B}(', info_txt)+4)));
      info_txt := StrLeft(info_txt, Pos(')',info_txt)-1);
      if (trim(info_txt)<>'') then begin
        StrReplace(info_txt,';',',',[rfReplaceAll, rfIgnoreCase]);
        tmp_list.Clear;
        StrToStrings(info_txt,',',tmp_list);
        info_txt := '';
        for loc_ := 0 to tmp_list.Count - 1 do begin
          if(loc_ > 0) then
            info_txt := info_txt + ',';
          if(loc_ = (tmp_list.Count - 1)) then
            tmp_list.Strings[loc_] := '"'+ trim(tmp_list.Strings[loc_]) + '"'
          else
            tmp_list.Strings[loc_] := '"'+ trim(tmp_list.Strings[loc_]) + ';"';
          info_txt := info_txt + tmp_list.Strings[loc_];
        end;
        synParam.ItemList.Add(info_txt);
      end;
    end;
  end else
    synParam.ItemList.Clear;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeandnil(tmp_list);
end;

procedure TfrmMain.dws_hid_io1FunctionsExecEval(Info: TProgramInfo);
begin
  Info['Result'] := (ShellExecute(0,'open', pchar(VarToStr(Info['FilePath'])),'','',Info['WindowState'])<=32);
end;

procedure TfrmMain.dws_hid_io1FunctionsShiftRightEval(Info: TProgramInfo);
begin
  Info['Result'] := Sar(Info['Num'], Info['Count']);
end;

procedure TfrmMain.dws_hid_io1FunctionsToggleBitEval(Info: TProgramInfo);
begin
  Info['Result'] := OrdToBinary(Integer(Info['Num']));
end;

procedure TfrmMain.mnuSaveLogExecute(Sender: TObject);
var
  tmp_list : TStringList; pos: Integer;

  function GetNextUntitledFileName() : String;
  begin
    pos := 0;
    repeat
      inc(pos);
    until(not(FileExists('untitled'+inttostr(pos)+'.txt')));
    result := 'untitled'+inttostr(pos)+'.txt';
  end;

begin
  save_log.FileName := GetNextUntitledFileName;
  if(save_log.Execute) then begin
    tmp_list := TStringList.Create;
    for pos := 0 to JvHTListBox1.Count - 1 do
      tmp_list.Add(JvHTListBox1.PlainItems[pos]);
    tmp_list.SaveToFile(save_log.FileName);
    freeandnil(tmp_list);
  end;
end;

procedure TfrmMain.mnuSaveLogUpdate(Sender: TObject);
begin
  mnuSaveLog.Enabled := (JvHTListBox1.Items.Count > 0);
end;

procedure TfrmMain.mnuClearLogExecute(Sender: TObject);
begin
  if(MessageBox(handle,pchar('Clear all the contents of log panel?'),PChar(Application.Title),MB_YESNO+MB_ICONQUESTION)=6) then
    JvHTListBox1.Items.Clear;
end;

procedure TfrmMain.mnuClearLogUpdate(Sender: TObject);
begin
  mnuClearLog.Enabled := (JvHTListBox1.Items.Count > 0);
end;

procedure TfrmMain.dws_hid_io1FunctionsSleepEval(Info: TProgramInfo);
begin
  Sleep(Info['MS']);    //TODO: need to use sleep(1) with limit loop to avoid IDE freezing 
end;

procedure TfrmMain.mnuPrintExecute(Sender: TObject);
begin
  if(print_dialog1.Execute) then begin
    editor_print.SynEdit := txtEdit;
    editor_print.Copies := print_dialog1.Copies;
    editor_print.Print;
  end;
end;

procedure TfrmMain.mnuPrintUpdate(Sender: TObject);
begin
  mnuPrint.Enabled := (trim(txtEdit.Text)<>'');
end;

procedure TfrmMain.dws_hid_io1FunctionsMsgBoxEval(Info: TProgramInfo);
begin
  Info['Result'] := MessageBox(handle, pchar(VarToStr(Info['Msg'])), pchar(Application.Title),MB_ICONINFORMATION+Info['Buttons']);
end;

procedure TfrmMain.mnuAboutExecute(Sender: TObject);
var
  fm_about : TfrmAbout;
begin
  fm_about := TfrmAbout.Create(self);
  fm_about.ShowModal;
  freeandnil(fm_about);
end;

procedure TfrmMain.mnuWebExecute(Sender: TObject);
begin
  ShellExecute(handle,'open',pchar(GetHomePageURL),'','',1);
end;

procedure TfrmMain.mnuHelpExecute(Sender: TObject);
begin
  ShellExecute(handle,'open',pchar(GetHelpeURL),'','',1);
end;

procedure TfrmMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if(Assigned(_script_prog) and (mnuStop.Enabled)) then
    LogRuntimeError('Fatal Error: '+e.Message)
  else
    MessageBox(handle,pchar('Critical error is occurred in the SigLab Development System'#13#13+e.Message),pchar(Application.Title),MB_OK+MB_ICONHAND);
end;

procedure TfrmMain.mnuGNU_GPLExecute(Sender: TObject);
begin
  ShellExecute(handle,'open',pchar(root+'gpl.html'),'','',1);
end;

procedure TfrmMain.OpenComdLineFile(inparam : string);
begin
  try
    ResetEditor();
    dlgOpenFile.FileName := inparam;
    txtEdit.Lines.LoadFromFile(inparam);
    _filepath := inparam;
    _filename := ExtractFileName(_filepath);
    Caption := APP_NAME + ' - ' + _filename;
    _is_modified := false;
  except
    on E: Exception do
      MessageBox(handle, pchar('Unable to open file '+ExtractFileName(dlgOpenFile.FileName)+#13#13+E.Message), pchar(Application.Title), MB_OK+MB_ICONERROR);
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if(ParamCount > 0) then begin
    if(fileexists(paramstr(1))and(lowercase(ExtractFileExt(paramstr(1)))=FILE_EXT)) then
      OpenComdLineFile(paramstr(1));
  end;
end;

procedure TfrmMain.JvAppInstances1CmdLineReceived(Sender: TObject;
  CmdLine: TStrings);
var
  str_ : string;
begin
  if(CmdLine.Count > 0) then begin
    str_ := trim(cmdLine.Strings[0]);
    if(lowercase(str_) = lowercase(_filepath)) then
      exit;
    if(fileexists(str_)and(lowercase(ExtractFileExt(str_))=FILE_EXT)and(CloseFile)) then
      OpenComdLineFile(str_);
  end;
end;

end.
