(*
 * Webservices Pascal Interface Unit
 *
 * Copyright (C) 2016 Vincent Hardy <vincent.hardy.be@gmail.com>
 *
 * You may retrieve the latest version of this file at
 * https://github.com/delphiunderground/wwsapi
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

unit webservices;

{$ALIGN ON}

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses
  windows;

const
  WEBSERVICES_DLL = 'WebServices.dll';

type
  //size_t is also defined in delphi XE
  //C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\source\rtl\posix\Posix.SysTypes.pas
  {$IFDEF WIN64}
  size_t = Int64;
  {$ELSE}
  size_t = integer;
  {$ENDIF}
  PULONG = ^ULONG;
  PBoolean = ^Boolean;
  PPointer = ^Pointer;
  

  //WS_ERROR (for example) is an opaque type used to reference to an error object.
  //It is not defined in this pascal code. See :
  //http://stackoverflow.com/questions/27233389/how-to-translate-an-empty-c-struct-inside-struct-to-delphi


//  HANDLES
  PWS_XML_READER = pointer;
  PPWS_XML_READER = ^PWS_XML_READER;
  PWS_XML_WRITER = pointer;
  PPWS_XML_WRITER = ^PWS_XML_WRITER;
  PWS_XML_BUFFER = pointer;
  PPWS_XML_BUFFER = ^PWS_XML_BUFFER;
  PWS_ERROR = pointer;
  PPWS_ERROR = ^PWS_ERROR;
  PWS_HEAP = pointer;
  PPWS_HEAP = ^PWS_HEAP;


//  ENUM DEFINITIONS

type
  WS_XML_READER_PROPERTY_ID = integer;
  WS_XML_CANONICALIZATION_ALGORITHM = integer;
  WS_XML_CANONICALIZATION_PROPERTY_ID = integer;
  WS_XML_WRITER_PROPERTY_ID = integer;
  WS_XML_BUFFER_PROPERTY_ID = integer;
  WS_XML_TEXT_TYPE = integer;
  WS_XML_NODE_TYPE = integer;
  WS_MOVE_TO = integer;
  WS_VALUE_TYPE = integer;
  WS_XML_READER_INPUT_TYPE = integer;
  WS_XML_READER_ENCODING_TYPE = integer;
  WS_CHARSET = integer;
  WS_XML_WRITER_ENCODING_TYPE = integer;
  WS_XML_WRITER_OUTPUT_TYPE = integer;
  WS_ERROR_PROPERTY_ID = integer;

const
//  XML Reader enum
//
//   Each xml reader property is identified by an ID and has an associated
//  value.
//
  //type = WS_XML_READER_PROPERTY_ID
  WS_XML_READER_PROPERTY_MAX_DEPTH                              = 0;
  WS_XML_READER_PROPERTY_ALLOW_FRAGMENT                         = 1;
  WS_XML_READER_PROPERTY_MAX_ATTRIBUTES                         = 2;
  WS_XML_READER_PROPERTY_READ_DECLARATION                       = 3;
  WS_XML_READER_PROPERTY_CHARSET                                = 4;
  WS_XML_READER_PROPERTY_ROW                                    = 5;
  WS_XML_READER_PROPERTY_COLUMN                                 = 6;
  WS_XML_READER_PROPERTY_UTF8_TRIM_SIZE                         = 7;
  WS_XML_READER_PROPERTY_STREAM_BUFFER_SIZE                     = 8;
  WS_XML_READER_PROPERTY_IN_ATTRIBUTE                           = 9;
  WS_XML_READER_PROPERTY_STREAM_MAX_ROOT_MIME_PART_SIZE         = 10;
  WS_XML_READER_PROPERTY_STREAM_MAX_MIME_HEADERS_SIZE           = 11;
  WS_XML_READER_PROPERTY_MAX_MIME_PARTS                         = 12;
  WS_XML_READER_PROPERTY_ALLOW_INVALID_CHARACTER_REFERENCES     = 13;
  WS_XML_READER_PROPERTY_MAX_NAMESPACES                         = 14;


//  XML Canonicalization enum
//
//   Defines the values for the XML canonicalization algorithms.
//
  //type = WS_XML_CANONICALIZATION_ALGORITHM
  WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM                   = 0;
  WS_EXCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM     = 1;
  WS_INCLUSIVE_XML_CANONICALIZATION_ALGORITHM                   = 2;
  WS_INCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM     = 3;


//  XML Canonicalization enum
//
//   Each XML canonicalization property is identified by an ID and has an associated
//  value.
//
  //type = WS_XML_CANONICALIZATION_PROPERTY_ID
  WS_XML_CANONICALIZATION_PROPERTY_ALGORITHM              = 0;
  WS_XML_CANONICALIZATION_PROPERTY_INCLUSIVE_PREFIXES     = 1;
  WS_XML_CANONICALIZATION_PROPERTY_OMITTED_ELEMENT        = 2;
  WS_XML_CANONICALIZATION_PROPERTY_OUTPUT_BUFFER_SIZE     = 3;


//  XML Writer enum
//
//   Each xml writer property is identified by an ID and has an associated value.
//
  //type = WS_XML_WRITER_PROPERTY_ID
  WS_XML_WRITER_PROPERTY_MAX_DEPTH                              = 0;
  WS_XML_WRITER_PROPERTY_ALLOW_FRAGMENT                         = 1;
  WS_XML_WRITER_PROPERTY_MAX_ATTRIBUTES                         = 2;
  WS_XML_WRITER_PROPERTY_WRITE_DECLARATION                      = 3;
  WS_XML_WRITER_PROPERTY_INDENT                                 = 4;
  WS_XML_WRITER_PROPERTY_BUFFER_TRIM_SIZE                       = 5;
  WS_XML_WRITER_PROPERTY_CHARSET                                = 6;
  WS_XML_WRITER_PROPERTY_BUFFERS                                = 7;
  WS_XML_WRITER_PROPERTY_BUFFER_MAX_SIZE                        = 8;
  WS_XML_WRITER_PROPERTY_BYTES                                  = 9;
  WS_XML_WRITER_PROPERTY_IN_ATTRIBUTE                           = 10;
  WS_XML_WRITER_PROPERTY_MAX_MIME_PARTS_BUFFER_SIZE             = 11;
  WS_XML_WRITER_PROPERTY_INITIAL_BUFFER                         = 12;
  WS_XML_WRITER_PROPERTY_ALLOW_INVALID_CHARACTER_REFERENCES     = 13;
  WS_XML_WRITER_PROPERTY_MAX_NAMESPACES                         = 14;
  WS_XML_WRITER_PROPERTY_BYTES_WRITTEN                          = 15;
  WS_XML_WRITER_PROPERTY_BYTES_TO_CLOSE                         = 16;
  WS_XML_WRITER_PROPERTY_COMPRESS_EMPTY_ELEMENTS                = 17;
  WS_XML_WRITER_PROPERTY_EMIT_UNCOMPRESSED_EMPTY_ELEMENTS       = 18;


//  XML Buffer enum
//
//   Each xml buffer property is identified by an ID and has an associated
//  value.
//
  //type = WS_XML_BUFFER_PROPERTY_ID = integer;
  //empty typedef enum


//  XML Node enum
//
//   Indicates the type of WS_XML_TEXT structure.
//
  //type = WS_XML_TEXT_TYPE
  WS_XML_TEXT_TYPE_UTF8          = 1;
  WS_XML_TEXT_TYPE_UTF16         = 2;
  WS_XML_TEXT_TYPE_BASE64        = 3;
  WS_XML_TEXT_TYPE_BOOL          = 4;
  WS_XML_TEXT_TYPE_INT32         = 5;
  WS_XML_TEXT_TYPE_INT64         = 6;
  WS_XML_TEXT_TYPE_UINT64        = 7;
  WS_XML_TEXT_TYPE_FLOAT         = 8;
  WS_XML_TEXT_TYPE_DOUBLE        = 9;
  WS_XML_TEXT_TYPE_DECIMAL       = 10;
  WS_XML_TEXT_TYPE_GUID          = 11;
  WS_XML_TEXT_TYPE_UNIQUE_ID     = 12;
  WS_XML_TEXT_TYPE_DATETIME      = 13;
  WS_XML_TEXT_TYPE_TIMESPAN      = 14;
  WS_XML_TEXT_TYPE_QNAME         = 15;
  WS_XML_TEXT_TYPE_LIST          = 16;


//  XML Node enum
//
//   Indicates the type of WS_XML_NODE structure.
//
  //type = WS_XML_NODE_TYPE
  WS_XML_NODE_TYPE_ELEMENT         = 1;
  WS_XML_NODE_TYPE_TEXT            = 2;
  WS_XML_NODE_TYPE_END_ELEMENT     = 3;
  WS_XML_NODE_TYPE_COMMENT         = 4;
  WS_XML_NODE_TYPE_CDATA           = 6;
  WS_XML_NODE_TYPE_END_CDATA       = 7;
  WS_XML_NODE_TYPE_EOF             = 8;
  WS_XML_NODE_TYPE_BOF             = 9;


//  XML Buffer enum
//
//   This enumeration identifies the various ways to move about an xml document.
//
  //type = WS_MOVE_TO
  WS_MOVE_TO_ROOT_ELEMENT         = 0;
  WS_MOVE_TO_NEXT_ELEMENT         = 1;
  WS_MOVE_TO_PREVIOUS_ELEMENT     = 2;
  WS_MOVE_TO_CHILD_ELEMENT        = 3;
  WS_MOVE_TO_END_ELEMENT          = 4;
  WS_MOVE_TO_PARENT_ELEMENT       = 5;
  WS_MOVE_TO_NEXT_NODE            = 6;
  WS_MOVE_TO_PREVIOUS_NODE        = 7;
  WS_MOVE_TO_FIRST_NODE           = 8;
  WS_MOVE_TO_BOF                  = 9;
  WS_MOVE_TO_EOF                  = 10;
  WS_MOVE_TO_CHILD_NODE           = 11;


//  XML Node enum
//
//   An enumeration of the different types of fixed-size primitives.
//
  //type = WS_VALUE_TYPE
  WS_BOOL_VALUE_TYPE         = 0;
  WS_INT8_VALUE_TYPE         = 1;
  WS_INT16_VALUE_TYPE        = 2;
  WS_INT32_VALUE_TYPE        = 3;
  WS_INT64_VALUE_TYPE        = 4;
  WS_UINT8_VALUE_TYPE        = 5;
  WS_UINT16_VALUE_TYPE       = 6;
  WS_UINT32_VALUE_TYPE       = 7;
  WS_UINT64_VALUE_TYPE       = 8;
  WS_FLOAT_VALUE_TYPE        = 9;
  WS_DOUBLE_VALUE_TYPE       = 10;
  WS_DECIMAL_VALUE_TYPE      = 11;
  WS_DATETIME_VALUE_TYPE     = 12;
  WS_TIMESPAN_VALUE_TYPE     = 13;
  WS_GUID_VALUE_TYPE         = 14;
  WS_DURATION_VALUE_TYPE     = 15;


//  XML Reader enum
//
//   Indicates the type of WS_XML_READER_INPUT structure.
//
  //type = WS_XML_READER_INPUT_TYPE
  WS_XML_READER_INPUT_TYPE_BUFFER     = 1;
  WS_XML_READER_INPUT_TYPE_STREAM     = 2;


//  XML Reader enum
//
//   Indicates the type of WS_XML_READER_ENCODING structure.
//
  //type = WS_XML_READER_ENCODING_TYPE
  WS_XML_READER_ENCODING_TYPE_TEXT       = 1;
  WS_XML_READER_ENCODING_TYPE_BINARY     = 2;
  WS_XML_READER_ENCODING_TYPE_MTOM       = 3;
  WS_XML_READER_ENCODING_TYPE_RAW        = 4;


//  XML Writer enum

  //type = WS_CHARSET
  WS_CHARSET_AUTO        = 0;
  WS_CHARSET_UTF8        = 1;
  WS_CHARSET_UTF16LE     = 2;
  WS_CHARSET_UTF16BE     = 3;


//  XML Writer enum
//
//   Indicates the type of WS_XML_WRITER_ENCODING structure.
//  
  //type = WS_XML_WRITER_ENCODING_TYPE
  WS_XML_WRITER_ENCODING_TYPE_TEXT       = 1;
  WS_XML_WRITER_ENCODING_TYPE_BINARY     = 2;
  WS_XML_WRITER_ENCODING_TYPE_MTOM       = 3;
  WS_XML_WRITER_ENCODING_TYPE_RAW        = 4;


//  XML Writer enum
//
//   Indicates the type of WS_XML_WRITER_OUTPUT structure.
//
  //type = WS_XML_WRITER_OUTPUT_TYPE
  WS_XML_WRITER_OUTPUT_TYPE_BUFFER     = 1;
  WS_XML_WRITER_OUTPUT_TYPE_STREAM     = 2;


//  Errors enum
//
//   A set of property values associated with the error.  They are set
//  and retrieved using WsGetErrorProperty and WsSetErrorProperty.
//
  //type = WS_ERROR_PROPERTY_ID
  WS_ERROR_PROPERTY_STRING_COUNT            = 0;
  WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE     = 1;
  WS_ERROR_PROPERTY_LANGID                  = 2;


type
//  STRUCT DEFINITIONS


//  XML Node structure
//
//   Represents a string that optionally has (WS_XML_DICTIONARY) dictionary
//   information associated with it.  The xml APIs use WS_XML_STRINGs to identify prefixes,
//  localNames and namespaces.
//
  WS_XML_STRING = record
    length:ULONG;
    bytes:PByte;
    dictionary:pointer; //in fact, PWS_XML_DICTIONARY but not yet declared here
    id:ULONG;
  end;

  PWS_XML_STRING = ^WS_XML_STRING;


//  XML Node structure
//
//   Represents a set of unique strings.  This information is used by the binary
//  encoding to write a more compact xml document.
//
  WS_XML_DICTIONARY = record
    guid:TGUID;
    strings:PWS_XML_STRING;
    stringCount:ULONG;
    isConst:BOOL;
  end;

  PWS_XML_DICTIONARY = ^WS_XML_DICTIONARY;


//  XML Node structure
//
//   A structure used to specify an XML name (of an element or an attribute) as
//  a local name, namespace pair.
//
  WS_XML_QNAME = record
    localName:WS_XML_STRING;
    ns:WS_XML_STRING;
  end;

  PWS_XML_QNAME = ^WS_XML_QNAME;


//  XML Buffer structure
//
//   Represents a position within an XML Buffer.  The current position within
//  a reader or writer may be obtained by calling WsGetReaderPosition or
//   WsGetWriterPosition.  The current position within a reader or writer
//  may be set by calling WsSetReaderPosition or WsSetWriterPosition.
//
//   Using WsRemoveNode to remove a node that corresponds to or contains a
//  position will cause subsequent use of the position to fail.  The position itself
//  remains valid, but operations that depend on that position will fail.
//
//   Positions may be used as long as the containing XML buffer is valid.  Using a position
//  after its corresponding buffer has been deleted will exhibit undefined behavior.
//
  WS_XML_NODE_POSITION = record
    buffer:PWS_XML_BUFFER;
    node:pointer;
  end;

  PWS_XML_NODE_POSITION = ^WS_XML_NODE_POSITION;


//  XML Reader structure
//
//   Specifies a reader specific setting.
//
  WS_XML_READER_PROPERTY = record
    id:WS_XML_READER_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;


//  XML Canonicalization structure
//
//   An array of XML prefixes that should be treated as
//  inclusive prefixes during exclusive XML canonicalization.  The
//  treatment of inclusive prefixes is defined in
//   (http://tools.ietf.org/html/rfc3741) RFC 3741.
//
  WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES = record
    prefixCount:ULONG;
    prefixes:PWS_XML_STRING;
  end;

  PWS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES = ^WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES;


//  XML Canonicalization structure
//
//   Specifies a setting that controls how XML canonicalization is done.
//
  WS_XML_CANONICALIZATION_PROPERTY = record
    id:WS_XML_CANONICALIZATION_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;

  PWS_XML_CANONICALIZATION_PROPERTY = ^WS_XML_CANONICALIZATION_PROPERTY;


//  XML Writer structure
//
//   Specifies a writer specific setting.
//
  WS_XML_WRITER_PROPERTY = record
    id:WS_XML_WRITER_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;

  PWS_XML_WRITER_PROPERTY = ^WS_XML_WRITER_PROPERTY;


//  XML Buffer structure
//
//   Specifies an xml buffer specific setting.
//
  WS_XML_BUFFER_PROPERTY = record
    id:WS_XML_BUFFER_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;

  PWS_XML_BUFFER_PROPERTY = ^WS_XML_BUFFER_PROPERTY;


//  XML Node structure
//
//   Represents a node of text content in xml.
//
  WS_XML_TEXT = record
    textType:WS_XML_TEXT_TYPE;
  end;

  PWS_XML_TEXT = ^WS_XML_TEXT;


//  XML Node structure
//
//   Represents text encoded as UTF-8 bytes.
//
  WS_XML_UTF8_TEXT = record
    text:WS_XML_TEXT;
    value:WS_XML_STRING;
  end;

  PWS_XML_UTF8_TEXT = ^WS_XML_UTF8_TEXT;


//  XML Node structure
//
//   Represents text encoded as UTF-16 bytes.
//
  WS_XML_UTF16_TEXT = record
    text:WS_XML_TEXT;
    bytes:PByte;
    byteCount:ULONG;
  end;

  PWS_XML_UTF16_TEXT = ^WS_XML_UTF16_TEXT;


//  XML Node structure
//
//   Represents base64 encoded data. (e.g. The three bytes { 0, 0, 0 } represent the text "AAAA".)
//
  WS_XML_BASE64_TEXT = record
    text:WS_XML_TEXT;
    bytes:PByte;
    length:ULONG;
  end;

  PWS_XML_BASE64_TEXT = ^WS_XML_BASE64_TEXT;


//  XML Node structure
//
//   A boolean that represents the text "true" or "false".
//
  WS_XML_BOOL_TEXT = record
    text:WS_XML_TEXT;
    value:BOOL;
  end;

  PWS_XML_BOOL_TEXT = ^WS_XML_BOOL_TEXT;


//  XML Node structure
//
//   Represents a signed 32 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_INT32_TEXT = record
    text:WS_XML_TEXT;
    value:longint;
  end;

  PWS_XML_INT32_TEXT = ^WS_XML_INT32_TEXT;


//  XML Node structure
//
//   Represents a signed 64 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_INT64_TEXT = record
    text:WS_XML_TEXT;
    value:int64;
  end;

  PWS_XML_INT64_TEXT = ^WS_XML_INT64_TEXT;


//  XML Node structure
//
//   Represents an unsigned 64 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_UINT64_TEXT = record
    text:WS_XML_TEXT;
    value:int64;    //Is there an unsigned Int64 in Delphi ?
  end;

  PWS_XML_UINT64_TEXT = ^WS_XML_UINT64_TEXT;


//  XML Node structure
//
//   Represents a 4 byte floating point value.  (e.g. The value 0.0 represents the text "0")
//
  WS_XML_FLOAT_TEXT = record
    text:WS_XML_TEXT;
    value:single;
  end;

  PWS_XML_FLOAT_TEXT = ^WS_XML_FLOAT_TEXT;


//  XML Node structure
//
//   Represents an 8 byte floating point value.  (e.g. The value 0.0 represents the text "0")
//
  WS_XML_DOUBLE_TEXT = record
    text:WS_XML_TEXT;
    value:double;
  end;

  PWS_XML_DOUBLE_TEXT = ^WS_XML_DOUBLE_TEXT;


//  XML Node structure
//
//   Represents a 12 byte fixed point value.  (e.g. The value 1.23 represents the text "1.23")
//
  WS_XML_DECIMAL_TEXT = record
    text:WS_XML_TEXT;
    value:currency;     //not sure Delphi Currency is then same as C++ DECIMAL - Extended is 10 bytes
  end;

  PWS_XML_DECIMAL_TEXT = ^WS_XML_DECIMAL_TEXT;


//  XML Node structure
//
//   Represents a guid formatted as the text "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
//
  WS_XML_GUID_TEXT = record
    text:WS_XML_TEXT;
    value:TGUID;
  end;

  PWS_XML_GUID_TEXT = ^WS_XML_GUID_TEXT;


//  XML Node structure
//
//   Represents a guid formatted as the text "urn:uuid:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
//
  WS_XML_UNIQUE_ID_TEXT = record
    text:WS_XML_TEXT;
    value:TGUID;
  end;


//  Utilities structure
//
//   An array of unicode characters and a length.
//
  WS_STRING = record
    length:ULONG;
    chars:PWideChar;
  end;

  PWS_STRING = ^WS_STRING;


//  Utilities structure
//  A structure used to serialize and deserialize an array of bytes.
  WS_BYTES = record
    length:ULONG;
    bytes:PByte;
  end;

  PWS_BYTES = ^WS_BYTES;


//  XML Reader structure
//
//   Specifies where the reader should obtain the bytes that comprise the xml document.
//
  WS_XML_READER_INPUT = record
    inputType : WS_XML_READER_INPUT_TYPE;
  end;

  PWS_XML_READER_INPUT = ^WS_XML_READER_INPUT;


//  XML Reader structure
//
//   This structure is the base type for all the different kinds of reader encodings.
//
  WS_XML_READER_ENCODING = record
    encodingType : WS_XML_READER_ENCODING_TYPE;
  end;

  PWS_XML_READER_ENCODING = ^WS_XML_READER_ENCODING;


//  POINTER DEFINITIONS
  PWS_XML_WRITER_ENCODING = pointer; //TODO
  PWS_XML_READER_PROPERTY = pointer; //TODO
  PWS_ERROR_PROPERTY = pointer;      //TODO
  PWS_ASYNC_CONTEXT = pointer;       //TODO
  PWS_HEAP_PROPERTY = pointer;       //TODO



//  CALLBACK DEFINITIONS

//  XML Reader callback
//
//   A user-defined callback used by the WS_XML_READER
//   to read from some source into a buffer.
//
WS_READ_CALLBACK = function(
  callbackState : pointer;
  bytes : pointer;
  maxSize : ULONG;
  ActualSize : PULONG;
  asyncContext : PWS_ASYNC_CONTEXT;
  error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used by the WS_XML_WRITER
//   to write a buffer to some destination.
//
WS_WRITE_CALLBACK = function(
  callbackState : pointer;
  buffer : PWS_BYTES;
  count : ULONG;
  asyncContext : PWS_ASYNC_CONTEXT;
  error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used by WsPushBytes to request that data be written.
//
WS_PUSH_BYTES_CALLBACK = function(
  callbackState : pointer;
  writeCallback : WS_WRITE_CALLBACK;
  writeCallbackState : pointer;
  asyncContext : PWS_ASYNC_CONTEXT;
  error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used by WsPullBytes to request
//  the data that should be written.
//
WS_PULL_BYTES_CALLBACK = function(
  callbackState : pointer;
  bytes : pointer;
  maxSize : ULONG;
  ActualSize : PULONG;
  asyncContext : PWS_ASYNC_CONTEXT;
  error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used in WS_XML_WRITER_BINARY_ENCODING
//   that determines whether the string can be written in an optimized form.
//
WS_DYNAMIC_STRING_CALLBACK = function(
  callbackState : pointer;
  str : PWS_XML_STRING;
  found : Pboolean;
  id : PULONG;
  error : PWS_ERROR):HRESULT; stdcall;


//  FUNCTION DEFINITIONS


//  XML Canonicalization function
//
//   Starts canonicalization on the specified XML reader.
//
function WsStartReaderCanonicalization(
          reader : PWS_XML_READER;
          writeCallback : WS_WRITE_CALLBACK;
          writeCallbackState : pointer;
          properties : PWS_XML_CANONICALIZATION_PROPERTY;
          propertyCount : ULONG;
          error : PWS_ERROR):HRESULT; stdcall;


//  XML Canonicalization function
//
//   Stops XML canonicalization started by the preceding WsStartReaderCanonicalization call.
//
function WsEndReaderCanonicalization(
          reader : PWS_XML_READER;
          error : PWS_ERROR):HRESULT; stdcall;


//  XML Canonicalization function
//
//   Starts canonicalization on the specified XML writer.
//
function WsStartWriterCanonicalization(
          writer : PWS_XML_WRITER;
          writeCallback : WS_WRITE_CALLBACK;
          writeCallbackState : pointer;
          properties : PWS_XML_CANONICALIZATION_PROPERTY;
          propertyCount : ULONG;
          error : PWS_ERROR):HRESULT; stdcall;


//  XML Canonicalization function
//
//   Stops XML canonicalization started by the preceding WsStartWriterCanonicalization call.
//
function WsEndWriterCanonicalization(writer : PWS_XML_WRITER;
                                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Creates an XML Buffer which can be used to process xml data in-memory.  It can be
//  navigated through, written to, and read from.
//
function WsCreateXmlBuffer(heap : PWS_HEAP;
                           properties : PWS_XML_BUFFER_PROPERTY;
                           propertyCount : ULONG;
                           buffer : PPWS_XML_BUFFER;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Removes the node at the specified position from the xml buffer.  If positioned
//  on an element it will remove the element including all of its children and its
//  corresponding end element, otherwise it will remove a single node.
//
//   The use of any API with a WS_XML_READER or WS_XML_WRITER that
//  currently depends on this position or a child of this position will fail. The
//   WS_XML_READER or WS_XML_WRITER must be repositioned
//  before using further.
//
//   It will return WS_E_INVALID_OPERATION if the node is positioned on an end
//  element or the root of the document.
//
//   Calling WsSetReaderPosition or WsSetWriterPosition after calling WsRemoveNode will fail.
//
function WsRemoveNode(nodePosition : PWS_XML_NODE_POSITION;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Writes a WS_XML_BUFFER to a writer.
//
function WsWriteXmlBuffer(writer : PWS_XML_WRITER;
                          xmlBuffer : PWS_XML_BUFFER;
                          error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Reads the current node from a reader into a WS_XML_BUFFER.
//
function WsReadXmlBuffer(reader : PWS_XML_READER;
                         heap : PWS_HEAP;
                         xmlBuffer : PPWS_XML_BUFFER;
                         error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Uses a writer to convert a WS_XML_BUFFER to an encoded set of bytes.
//
function WsWriteXmlBufferToBytes(
          writer : PWS_XML_WRITER;
          xmlBuffer : PWS_XML_BUFFER;
          encoding : PWS_XML_WRITER_ENCODING;
          properties : PWS_XML_WRITER_PROPERTY;
          propertyCount : ULONG;
          heap : PWS_HEAP;
          bytes : PPointer;
          byteCount : PULONG;
          error : PWS_ERROR):HRESULT; stdcall;


//  XML Buffer function
//
//   Uses a reader to convert a set of encoded bytes to a WS_XML_BUFFER.
//
function WsReadXmlBufferFromBytes(
          reader : PWS_XML_READER;
          encoding : PWS_XML_READER_ENCODING;
          properties : PWS_XML_READER_PROPERTY;
          propertyCount : ULONG;
          bytes : pointer;
          byteCount : ULONG;
          heap : PWS_HEAP;
          xmlBuffer : PPWS_XML_BUFFER;
          error : PWS_ERROR):HRESULT; stdcall;


//  Errors function
//
//   Creates an error object that can passed to functions to in order to
//  record rich error information.
//
function WsCreateError(properties    : PWS_ERROR_PROPERTY;
                       propertyCount : ULONG;
                       error         : PPWS_ERROR):HRESULT; stdcall;


//  Errors function
//
//   Retrieves an error string from an error object.
//
function WsGetErrorString(error : PWS_ERROR;
                          index : ULONG;
                          str   : PWS_STRING):HRESULT; stdcall;


//  Errors function
//
//   Retrieve a property of the error.
//
function WsGetErrorProperty(error      : PWS_ERROR;
                            id         : WS_ERROR_PROPERTY_ID;
                            buffer     : pointer;
                            bufferSize : ULONG):HRESULT; stdcall;


//  Errors function
//
//   Free the error object created by WsCreateError.
//
procedure WsFreeError(error : PWS_ERROR); stdcall;


//  Heap function
//
//   Create a heap object.
//
function WsCreateHeap(maxSize : size_t;
                      trimSize : size_t;
                      properties : PWS_HEAP_PROPERTY;
                      propertyCount : ULONG;
                      heap : PPWS_HEAP;
                      error : PWS_ERROR):HRESULT; stdcall;


//  Heap function
//
//   This frees the heap object, and the memory associated with any allocations
//  made on it using WsAlloc.
//
procedure WsFreeHeap(heap : PWS_HEAP); stdcall;


//  XML Reader function
//
//   Creates an instance of a WS_XML_READER.  Use WsSetInput or WsSetInputToBuffer
//   to choose the encoding of the reader and to indicate the source of the input.
//
function WsCreateReader(properties : PWS_XML_READER_PROPERTY;
                        propertyCount : ULONG;
                        reader : PPWS_XML_READER;
                        error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Sets the encoding and input sources for the reader.
//
function WsSetInput(reader : PWS_XML_READER;
                    encoding : PWS_XML_READER_ENCODING;
                    input : PWS_XML_READER_INPUT;
                    properties : PWS_XML_READER_PROPERTY;
                    propertyCount : ULONG;
                    error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Releases the memory associated with the WS_XML_READER object.
//
procedure WsFreeReader(reader : PWS_XML_READER); stdcall;


//  XML Reader function
//
//   Ensures that the reader has at least a specified amount of data available to it for reading.
//
function WsFillReader(reader : PWS_XML_READER;
                      minSize : ULONG;
                      asyncContext : PWS_ASYNC_CONTEXT;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Creates an instance of a WS_XML_WRITER.  Use WsSetOutput or WsSetOutputToBuffer
//   to choose the encoding of the writer and to indicate where to direct the output.
//
function WsCreateWriter(properties : PWS_XML_WRITER_PROPERTY;
                        propertyCount : ULONG;
                        writer : PPWS_XML_WRITER;
                        error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Releases the memory associated with the WS_XML_WRITER object.
//
procedure WsFreeWriter(writer : PWS_XML_WRITER); stdcall;


//  ERROR DEFINITIONS
const
  WS_S_ASYNC                            = $003D0000;
  WS_S_END                              = $003D0001;
  WS_E_INVALID_FORMAT                   = $803D0000;
  WS_E_OBJECT_FAULTED                   = $803D0001;
  WS_E_NUMERIC_OVERFLOW                 = $803D0002;
  WS_E_INVALID_OPERATION                = HRESULT($803D0003);
  WS_E_OPERATION_ABORTED                = $803D0004;
  WS_E_ENDPOINT_ACCESS_DENIED           = $803D0005;
  WS_E_OPERATION_TIMED_OUT              = $803D0006;
  WS_E_OPERATION_ABANDONED              = $803D0007;
  WS_E_QUOTA_EXCEEDED                   = $803D0008;
  WS_E_NO_TRANSLATION_AVAILABLE         = $803D0009;
  WS_E_SECURITY_VERIFICATION_FAILURE    = $803D000A;
  WS_E_ADDRESS_IN_USE                   = $803D000B;
  WS_E_ADDRESS_NOT_AVAILABLE            = $803D000C;
  WS_E_ENDPOINT_NOT_FOUND               = $803D000D;
  WS_E_ENDPOINT_NOT_AVAILABLE           = $803D000E;
  WS_E_ENDPOINT_FAILURE                 = $803D000F;
  WS_E_ENDPOINT_UNREACHABLE             = $803D0010;
  WS_E_ENDPOINT_ACTION_NOT_SUPPORTED    = $803D0011;
  WS_E_ENDPOINT_TOO_BUSY                = $803D0012;
  WS_E_ENDPOINT_FAULT_RECEIVED          = $803D0013;
  WS_E_ENDPOINT_DISCONNECTED            = $803D0014;
  WS_E_PROXY_FAILURE                    = $803D0015;
  WS_E_PROXY_ACCESS_DENIED              = $803D0016;
  WS_E_NOT_SUPPORTED                    = $803D0017;
  WS_E_PROXY_REQUIRES_BASIC_AUTH        = $803D0018;
  WS_E_PROXY_REQUIRES_DIGEST_AUTH       = $803D0019;
  WS_E_PROXY_REQUIRES_NTLM_AUTH         = $803D001A;
  WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH    = $803D001B;
  WS_E_SERVER_REQUIRES_BASIC_AUTH       = $803D001C;
  WS_E_SERVER_REQUIRES_DIGEST_AUTH      = $803D001D;
  WS_E_SERVER_REQUIRES_NTLM_AUTH        = $803D001E;
  WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH   = $803D001F;
  WS_E_INVALID_ENDPOINT_URL             = $803D0020;
  WS_E_OTHER                            = $803D0021;
  WS_E_SECURITY_TOKEN_EXPIRED           = $803D0022;
  WS_E_SECURITY_SYSTEM_FAILURE          = $803D0023;


implementation


function WsStartReaderCanonicalization; external WEBSERVICES_DLL name 'WsStartReaderCanonicalization';
function WsEndReaderCanonicalization; external WEBSERVICES_DLL name 'WsEndReaderCanonicalization';
function WsStartWriterCanonicalization; external WEBSERVICES_DLL name 'WsStartWriterCanonicalization';
function WsEndWriterCanonicalization; external WEBSERVICES_DLL name 'WsEndWriterCanonicalization';
function WsCreateXmlBuffer; external WEBSERVICES_DLL name 'WsCreateXmlBuffer';
function WsRemoveNode; external WEBSERVICES_DLL name 'WsRemoveNode';
function WsWriteXmlBuffer; external WEBSERVICES_DLL name 'WsWriteXmlBuffer';
function WsReadXmlBuffer; external WEBSERVICES_DLL name 'WsReadXmlBuffer';
function WsWriteXmlBufferToBytes; external WEBSERVICES_DLL name 'WsWriteXmlBufferToBytes';
function WsReadXmlBufferFromBytes; external WEBSERVICES_DLL name 'WsReadXmlBufferFromBytes';
function WsCreateError; external WEBSERVICES_DLL name 'WsCreateError';
function WsGetErrorString; external WEBSERVICES_DLL name 'WsGetErrorString';
function WsGetErrorProperty; external WEBSERVICES_DLL name 'WsGetErrorProperty';
procedure WsFreeError; external WEBSERVICES_DLL name 'WsFreeError';
function WsCreateHeap; external WEBSERVICES_DLL name 'WsCreateHeap';
procedure WsFreeHeap; external WEBSERVICES_DLL name 'WsFreeHeap';
function WsCreateReader; external WEBSERVICES_DLL name 'WsCreateReader';
function WsSetInput; external WEBSERVICES_DLL name 'WsSetInput';
procedure WsFreeReader; external WEBSERVICES_DLL name 'WsFreeReader';
function WsFillReader; external WEBSERVICES_DLL name 'WsFillReader';
function WsCreateWriter; external WEBSERVICES_DLL name 'WsCreateWriter';
procedure WsFreeWriter; external WEBSERVICES_DLL name 'WsFreeWriter';


end.
