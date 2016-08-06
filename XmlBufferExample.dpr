(*
 * https://github.com/delphiunderground/wwsapi
 * Copyright (C) 2016 Vincent Hardy <vincent.hardy.be@gmail.com>
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License version
 * 3.0 as published by the Free Software Foundation.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, see
 * http://www.gnu.org/licenses/.
 *)

{$APPTYPE CONSOLE}
program XmlBufferExample;

//This example shows some use of the xml buffer APIs.
//Original C++ code from Microsoft :
//https://msdn.microsoft.com/en-us/library/windows/desktop/dd819131(v=vs.85).aspx

uses
  Windows, Sysutils,
  webservices in 'webservices.pas';

Procedure PrintError(errorCode:HRESULT; error:PWS_ERROR);
var
  hr:HRESULT;
  errorCount,i:ULONG;
  str:WS_STRING;
  s:string;
begin
  writeln(Format('Failure: errorCode=0x8%.x',[errorCode]));

  if (errorCode=E_INVALIDARG) or (errorCode=WS_E_INVALID_OPERATION) then
  begin
    // Correct use of the APIs should never generate these errors
    writeln('The error was due to an invalid use of an API. This is likely due to a bug in the program.');
    exit;
  end;

  hr:=NOERROR;
  if (error<>nil) then
  begin
    hr:=WsGetErrorProperty(error, WS_ERROR_PROPERTY_STRING_COUNT, @errorCount, sizeof(errorCount));
    if (hr=NOERROR) then
      for i:=0 to errorCount-1 do
      begin
        hr:=WsGetErrorString(error, i, @str);
        if (hr=NOERROR) then
        begin
          s:=copy(str.chars,1,str.length);
          writeln(s);
        end else
          errorCount:=i; //exit for
      end;
  end;
  if (hr<>NOERROR) then
    writeln(Format('Could not get error string (errorCode=0x8%.x)',[hr]));
end;


var
  hr:HRESULT;
  error:PWS_ERROR;
  heap:PWS_HEAP;
  buffer:PWS_XML_BUFFER;
  writer:PWS_XML_WRITER;
  reader:PWS_XML_READER;
  newXml:pointer;
  newXmlLength:ULONG;
  xml:ansistring;
  ExitCode:integer;
begin
  error:=nil;
  heap:=nil;
  buffer:=nil;
  writer:=nil;
  reader:=nil;
  newXml:=nil;
  newXmlLength:=0;

  // Create an error object for storing rich error information
  hr := WsCreateError(nil,
                      0,
                      @error);

  if (hr=NOERROR) then
  begin
    // Create a heap to store deserialized data
    hr := WsCreateHeap(2048,   //maxSize
                       512,    //trimSize
                       nil,
                       0,
                       @heap,
                       error);
  end;

  if hr=NOERROR then
  begin
    // Create an XML writer
    hr := WsCreateWriter(nil,
                         0,
                         @writer,
                         error);
  end;

  if hr=NOERROR then
  begin
    // Create an XML reader
    hr := WsCreateReader(nil,
                         0,
                         @reader,
                         error);
  end;

  // Some xml to read and write
  xml:='<a><b>1</b><c>2</c></a>';

  if hr=NOERROR then
  begin
    hr:=WsReadXmlBufferFromBytes(reader,
                                 nil,
                                 nil,
                                 0,
                                 PAnsiChar(xml), //@xml[1],
                                 length(xml),
                                 heap,
                                 @buffer,
                                 error);

  end;

  if hr=NOERROR then
  begin
    hr:=WsWriteXmlBufferToBytes(writer,
                                buffer,
                                nil,
                                nil,
                                0,
                                heap,
                                @newXml,
                                @newXmlLength,
                                error);
  end;

  if hr=NOERROR then
  begin
    writeln('new xml :');
    writeln(copy(PAnsiChar(newXml),1,newXmlLength));
    writeln;
    ExitCode:=0;
  end else
  begin
    PrintError(hr,error);
    ExitCode:=-1;
  end;

  if writer<>nil then WsFreeWriter(writer);
  if reader<>nil then WsFreeReader(reader);
  if heap<>nil then WsFreeHeap(heap);
  if error<>nil then WsFreeError(error);

  halt(exitcode);
end.

