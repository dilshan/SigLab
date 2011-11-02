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

program siglab;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uSystem in 'uSystem.pas',
  uAbout in 'uAbout.pas' {frmAbout};

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SigLab';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
