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

unit uSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, inifiles, JclStrings;

type
  TUSBDeviceInfo = record
    PID : integer;
    VID : integer;
    Signature : byte;
  end;

  function Root() : string;
  function GetFileNamePrefix(filenum : integer) : string;
  function GetUSBDeviceInfo() :  TUSBDeviceInfo;
  function GetHomePageURL() : String;
  function GetHelpeURL() : String;
  
implementation

function Root() : string;
begin
  result := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
end;

function GetFileNamePrefix(filenum : integer) : string;
var
  ini1 : TIniFile;
begin
  ini1 := TINiFile.Create(root + 'siglab.ini');
  result := ini1.ReadString('system','default_fileprefix','untitled');
  StrReplace(result, '$', InttoStr(filenum),[rfReplaceAll, rfIgnoreCase]);
  freeandnil(ini1);
end;

function GetUSBDeviceInfo() :  TUSBDeviceInfo;
var
  ini1 : TIniFile;
begin
  ini1 := TINiFile.Create(root + 'siglab.ini');
  result.PID := ini1.ReadInteger('device','pid',0);
  result.VID := ini1.ReadInteger('device','vid',0);
  result.Signature := ini1.ReadInteger('device','signature',0);
  freeandnil(ini1);
end;

function GetHomePageURL() : String;
var
  ini1 : TIniFile;
begin
  ini1 := TINiFile.Create(root + 'siglab.ini');
  result := ini1.ReadString('system','homepage','');
  freeandnil(ini1);
end;

function GetHelpeURL() : String;
var
  ini1 : TIniFile;
begin
  ini1 := TINiFile.Create(root + 'siglab.ini');
  result := ini1.ReadString('system','helppage',GetHomePageURL);
  freeandnil(ini1);
end;

end.
