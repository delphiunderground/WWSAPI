(*
 * Windows Webservices (WWSAPI) Pascal Interface Unit
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
  windows, wcrypt2, ncrypt;

type
  //size_t is also defined in delphi XE
  //C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\source\rtl\posix\Posix.SysTypes.pas
  {$IFDEF WIN64}
  size_t = Int64;
  {$ELSE}
  size_t = integer;
  {$ENDIF}
  PPWideChar = ^PWideChar;
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
  PWS_CHANNEL = pointer;
  PPWS_CHANNEL = ^PWS_CHANNEL;
  PWS_OPERATION_CONTEXT = pointer;
  PWS_ERROR = pointer;
  PPWS_ERROR = ^PWS_ERROR;
  PWS_HEAP = pointer;
  PPWS_HEAP = ^PWS_HEAP;
  PWS_MESSAGE = pointer;


//  ENUM TYPE

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
  WS_CALLBACK_MODEL = integer;
  WS_ENCODING = integer;
  WS_CHANNEL_STATE = integer;
  WS_RECEIVE_OPTION = integer;
  WS_CHANNEL_BINDING = integer;
  WS_CHANNEL_TYPE = integer;                 //or longword
  WS_TRANSFER_MODE = integer;                //or longword
  WS_HTTP_PROXY_SETTING_MODE = integer;      //or longword
  WS_CHANNEL_PROPERTY_ID = integer;
  WS_COOKIE_MODE = integer;
  WS_OPERATION_CONTEXT_PROPERTY_ID = integer;
  WS_ENDPOINT_IDENTITY_TYPE = integer;
  WS_ENDPOINT_ADDRESS_EXTENSION_TYPE = integer;
  WS_ERROR_PROPERTY_ID = integer;
  WS_EXCEPTION_CODE = integer;               // or longword
  WS_FAULT_ERROR_PROPERTY_ID = integer;
  WS_FAULT_DISCLOSURE = integer;
  WS_HEAP_PROPERTY_ID = integer;
  WS_LISTENER_STATE = integer;
  WS_LISTENER_PROPERTY_ID = integer;
  WS_IP_VERSION = integer;
  WS_MESSAGE_STATE = integer;
  WS_MESSAGE_INITIALIZATION = integer;
  WS_REPEATING_HEADER_OPTION = integer;
  WS_HEADER_TYPE = integer;
  WS_ADDRESSING_VERSION = integer;
  WS_ENVELOPE_VERSION = integer;
  WS_MESSAGE_PROPERTY_ID = integer;
  WS_SECURITY_BINDING_TYPE = integer;
  WS_HTTP_HEADER_AUTH_TARGET = integer;
  WS_WINDOWS_INTEGRATED_AUTH_PACKAGE = integer;
  WS_SECURITY_HEADER_VERSION = integer;      //or longword
  WS_TRUST_VERSION = integer;                //or longword
  WS_REQUEST_SECURITY_TOKEN_ACTION = integer;
  WS_SECURE_CONVERSATION_VERSION = integer;  //or longword
  WS_SECURE_PROTOCOL = integer;              //or longword
  WS_SECURITY_TIMESTAMP_USAGE = integer;
  WS_SECURITY_HEADER_LAYOUT = integer;
  WS_SECURITY_ALGORITHM_PROPERTY_ID = integer;
  WS_SECURITY_ALGORITHM_ID = integer;
  WS_PROTECTION_LEVEL = integer;
  WS_SECURITY_PROPERTY_ID = integer;
  WS_SECURITY_KEY_TYPE = integer;
  WS_SECURITY_ALGORITHM_SUITE_NAME = integer;
  WS_SECURITY_TOKEN_REFERENCE_MODE = integer;
  WS_SECURITY_KEY_ENTROPY_MODE = integer;
  WS_EXTENDED_PROTECTION_POLICY = integer;
  WS_EXTENDED_PROTECTION_SCENARIO = integer;
  WS_SECURITY_BINDING_PROPERTY_ID = integer;
  WS_CERT_CREDENTIAL_TYPE = integer;
  WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE = integer;
  WS_USERNAME_CREDENTIAL_TYPE = integer;
  WS_SECURITY_TOKEN_PROPERTY_ID = integer;
  WS_SECURITY_KEY_HANDLE_TYPE = integer;
  WS_MESSAGE_SECURITY_USAGE = integer;
  WS_SECURITY_CONTEXT_PROPERTY_ID = integer;
  WS_XML_SECURITY_TOKEN_PROPERTY_ID = integer;
  WS_SAML_AUTHENTICATOR_TYPE = integer;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID = integer;
  WS_TYPE = integer;
  WS_FIELD_MAPPING = integer;
  WS_TYPE_MAPPING = integer;
  WS_READ_OPTION = integer;
  WS_WRITE_OPTION = integer;
  WS_SERVICE_CANCEL_REASON = integer;
  WS_OPERATION_STYLE = integer;
  WS_PARAMETER_TYPE = integer;
  WS_SERVICE_ENDPOINT_PROPERTY_ID = integer;
  WS_METADATA_EXCHANGE_TYPE = integer;
  WS_SERVICE_PROPERTY_ID = integer;
  WS_SERVICE_HOST_STATE = integer;
  WS_SERVICE_PROXY_STATE = integer;
  WS_PROXY_PROPERTY_ID = integer;
  WS_CALL_PROPERTY_ID = integer;
  WS_TRACE_API = integer;
  WS_URL_SCHEME_TYPE = integer;
  WS_DATETIME_FORMAT = integer;
  WS_METADATA_STATE = integer;
  WS_METADATA_PROPERTY_ID = integer;
  WS_POLICY_STATE = integer;
  WS_POLICY_PROPERTY_ID = integer;
  WS_SECURITY_BINDING_CONSTRAINT_TYPE = integer;
  WS_POLICY_EXTENSION_TYPE = integer;
  WS_BINDING_TEMPLATE_TYPE = integer;


//  PASCAL POINTER DEFINITIONS

  PWS_XML_DICTIONARY             = ^WS_XML_DICTIONARY;
  PPWS_XML_DICTIONARY            = ^PWS_XML_DICTIONARY;
  PWS_XML_STRING                 = ^WS_XML_STRING;
  PPWS_XML_STRING                = ^PWS_XML_STRING;
  PWS_XML_QNAME                  = ^WS_XML_QNAME;
  PWS_XML_NODE_POSITION          = ^WS_XML_NODE_POSITION;
  PWS_XML_READER_PROPERTY        = ^WS_XML_READER_PROPERTY;
  PWS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES = ^WS_XML_CANONICALIZATION_INCLUSIVE_PREFIXES;
  PWS_XML_CANONICALIZATION_PROPERTY = ^WS_XML_CANONICALIZATION_PROPERTY;
  PWS_XML_WRITER_PROPERTY        = ^WS_XML_WRITER_PROPERTY;
  PWS_XML_BUFFER_PROPERTY        = ^WS_XML_BUFFER_PROPERTY;
  PWS_XML_TEXT                   = ^WS_XML_TEXT;
  PPWS_XML_TEXT                  = ^PWS_XML_TEXT;
  PWS_XML_UTF8_TEXT              = ^WS_XML_UTF8_TEXT;
  PWS_XML_UTF16_TEXT             = ^WS_XML_UTF16_TEXT;
  PWS_XML_BASE64_TEXT            = ^WS_XML_BASE64_TEXT;
  PWS_XML_BOOL_TEXT              = ^WS_XML_BOOL_TEXT;
  PWS_XML_INT32_TEXT             = ^WS_XML_INT32_TEXT;
  PWS_XML_INT64_TEXT             = ^WS_XML_INT64_TEXT;
  PWS_XML_UINT64_TEXT            = ^WS_XML_UINT64_TEXT;
  PWS_XML_FLOAT_TEXT             = ^WS_XML_FLOAT_TEXT;
  PWS_XML_DOUBLE_TEXT            = ^WS_XML_DOUBLE_TEXT;
  PWS_XML_DECIMAL_TEXT           = ^WS_XML_DECIMAL_TEXT;
  PWS_XML_GUID_TEXT              = ^WS_XML_GUID_TEXT;
  PWS_XML_UNIQUE_ID_TEXT         = ^WS_XML_UNIQUE_ID_TEXT;
  PWS_DATETIME                   = ^WS_DATETIME;
  PWS_XML_DATETIME_TEXT          = ^WS_XML_DATETIME_TEXT;
  PWS_TIMESPAN                   = ^WS_TIMESPAN;
  PWS_XML_TIMESPAN_TEXT          = ^WS_XML_TIMESPAN_TEXT;
  PWS_XML_QNAME_TEXT             = ^WS_XML_QNAME_TEXT;
  PWS_XML_LIST_TEXT              = ^WS_XML_LIST_TEXT;
  PWS_XML_ELEMENT_NODE           = ^WS_XML_ELEMENT_NODE;
  PWS_XML_TEXT_NODE              = ^WS_XML_TEXT_NODE;
  PWS_XML_NODE                   = ^WS_XML_NODE;
  PPWS_XML_NODE                  = ^PWS_XML_NODE;
  PWS_XML_ATTRIBUTE              = ^WS_XML_ATTRIBUTE;
  PPWS_XML_ATTRIBUTE             = ^PWS_XML_ATTRIBUTE;
  PWS_XML_COMMENT_NODE           = ^WS_XML_COMMENT_NODE;
  PWS_XML_READER_INPUT           = ^WS_XML_READER_INPUT;
  PWS_XML_READER_BUFFER_INPUT    = ^WS_XML_READER_BUFFER_INPUT;
  PWS_XML_READER_STREAM_INPUT    = ^WS_XML_READER_STREAM_INPUT;
  PWS_XML_READER_ENCODING        = ^WS_XML_READER_ENCODING;
  PWS_XML_READER_TEXT_ENCODING   = ^WS_XML_READER_TEXT_ENCODING;
  PWS_XML_READER_BINARY_ENCODING = ^WS_XML_READER_BINARY_ENCODING;
  PWS_STRING                     = ^WS_STRING;
  PPWS_STRING                    = ^PWS_STRING;
  PWS_XML_READER_MTOM_ENCODING   = ^WS_XML_READER_MTOM_ENCODING;
  PWS_XML_READER_RAW_ENCODING    = ^WS_XML_READER_RAW_ENCODING;
  PWS_XML_WRITER_ENCODING        = ^WS_XML_WRITER_ENCODING;
  PWS_XML_WRITER_TEXT_ENCODING   = ^WS_XML_WRITER_TEXT_ENCODING;
  PWS_XML_WRITER_BINARY_ENCODING = ^WS_XML_WRITER_BINARY_ENCODING;
  PWS_XML_WRITER_MTOM_ENCODING   = ^WS_XML_WRITER_MTOM_ENCODING;
  PWS_XML_WRITER_RAW_ENCODING    = ^WS_XML_WRITER_RAW_ENCODING;
  PWS_XML_WRITER_OUTPUT          = ^WS_XML_WRITER_OUTPUT;
  PWS_XML_WRITER_BUFFER_OUTPUT   = ^WS_XML_WRITER_BUFFER_OUTPUT;
  PWS_XML_WRITER_STREAM_OUTPUT   = ^WS_XML_WRITER_STREAM_OUTPUT;
  PWS_XML_WRITER_PROPERTIES      = ^WS_XML_WRITER_PROPERTIES;
  PWS_XML_READER_PROPERTIES      = ^WS_XML_READER_PROPERTIES;
  PWS_ASYNC_STATE                = ^WS_ASYNC_STATE;
  PWS_ASYNC_OPERATION            = ^WS_ASYNC_OPERATION;
  PWS_CHANNEL_PROPERTY           = ^WS_CHANNEL_PROPERTY;
  PWS_CUSTOM_HTTP_PROXY          = ^WS_CUSTOM_HTTP_PROXY;
  PWS_CHANNEL_PROPERTIES         = ^WS_CHANNEL_PROPERTIES;
  PWS_CUSTOM_CHANNEL_CALLBACKS   = ^WS_CUSTOM_CHANNEL_CALLBACKS;
  PWS_HTTP_HEADER_MAPPING        = ^WS_HTTP_HEADER_MAPPING;
  PPWS_HTTP_HEADER_MAPPING       = ^PWS_HTTP_HEADER_MAPPING;
  PWS_HTTP_MESSAGE_MAPPING       = ^WS_HTTP_MESSAGE_MAPPING;
  PWS_ELEMENT_DESCRIPTION        = ^WS_ELEMENT_DESCRIPTION;
  PWS_MESSAGE_DESCRIPTION        = ^WS_MESSAGE_DESCRIPTION;
  PPWS_MESSAGE_DESCRIPTION       = ^PWS_MESSAGE_DESCRIPTION;
  PWS_CHANNEL_ENCODER            = ^WS_CHANNEL_ENCODER;
  PWS_CHANNEL_DECODER            = ^WS_CHANNEL_DECODER;
  PWS_HTTP_REDIRECT_CALLBACK_CONTEXT = ^WS_HTTP_REDIRECT_CALLBACK_CONTEXT;
  PWS_ENDPOINT_IDENTITY          = ^WS_ENDPOINT_IDENTITY;
  PWS_ENDPOINT_ADDRESS           = ^WS_ENDPOINT_ADDRESS;
  PWS_DNS_ENDPOINT_IDENTITY      = ^WS_DNS_ENDPOINT_IDENTITY;
  PWS_UPN_ENDPOINT_IDENTITY      = ^WS_UPN_ENDPOINT_IDENTITY;
  PWS_SPN_ENDPOINT_IDENTITY      = ^WS_SPN_ENDPOINT_IDENTITY;
  PWS_BYTES                      = ^WS_BYTES;
  PWS_RSA_ENDPOINT_IDENTITY      = ^WS_RSA_ENDPOINT_IDENTITY;
  PWS_CERT_ENDPOINT_IDENTITY     = ^WS_CERT_ENDPOINT_IDENTITY;
  PWS_UNKNOWN_ENDPOINT_IDENTITY  = ^WS_UNKNOWN_ENDPOINT_IDENTITY;
  PWS_ERROR_PROPERTY             = ^WS_ERROR_PROPERTY;
  PWS_FAULT_REASON               = ^WS_FAULT_REASON;
  PWS_FAULT_CODE                 = ^WS_FAULT_CODE;
  PWS_FAULT                      = ^WS_FAULT;
  PWS_FAULT_DETAIL_DESCRIPTION   = ^WS_FAULT_DETAIL_DESCRIPTION;
  PWS_HEAP_PROPERTY              = ^WS_HEAP_PROPERTY;
  PWS_HEAP_PROPERTIES            = ^WS_HEAP_PROPERTIES;
  PWS_LISTENER_PROPERTY          = ^WS_LISTENER_PROPERTY;
  PWS_DISALLOWED_USER_AGENT_SUBSTRINGS = ^WS_DISALLOWED_USER_AGENT_SUBSTRINGS;
  PWS_LISTENER_PROPERTIES        = ^WS_LISTENER_PROPERTIES;
  PWS_HOST_NAMES                 = ^WS_HOST_NAMES;
  PWS_CUSTOM_LISTENER_CALLBACKS  = ^WS_CUSTOM_LISTENER_CALLBACKS;
  PWS_MESSAGE_PROPERTY           = ^WS_MESSAGE_PROPERTY;
  PWS_MESSAGE_PROPERTIES         = ^WS_MESSAGE_PROPERTIES;
  PWS_SECURITY_ALGORITHM_PROPERTY = ^WS_SECURITY_ALGORITHM_PROPERTY;
  PWS_SECURITY_ALGORITHM_SUITE   = ^WS_SECURITY_ALGORITHM_SUITE;
  PWS_SECURITY_PROPERTY          = ^WS_SECURITY_PROPERTY;
  PWS_SECURITY_PROPERTIES        = ^WS_SECURITY_PROPERTIES;
  PWS_SECURITY_BINDING_PROPERTY  = ^WS_SECURITY_BINDING_PROPERTY;
  PWS_SECURITY_BINDING_PROPERTIES = ^WS_SECURITY_BINDING_PROPERTIES;
  PWS_SERVICE_SECURITY_IDENTITIES = ^WS_SERVICE_SECURITY_IDENTITIES;
  PWS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT = ^WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT;
  PWS_CERT_CREDENTIAL            = ^WS_CERT_CREDENTIAL;
  PWS_SUBJECT_NAME_CERT_CREDENTIAL = ^WS_SUBJECT_NAME_CERT_CREDENTIAL;
  PWS_THUMBPRINT_CERT_CREDENTIAL = ^WS_THUMBPRINT_CERT_CREDENTIAL;
  PWS_CUSTOM_CERT_CREDENTIAL     = ^WS_CUSTOM_CERT_CREDENTIAL;
  PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = ^WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  PWS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = ^WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  PWS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = ^WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  PWS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = ^WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  PWS_USERNAME_CREDENTIAL        = ^WS_USERNAME_CREDENTIAL;
  PWS_STRING_USERNAME_CREDENTIAL = ^WS_STRING_USERNAME_CREDENTIAL;
  PWS_SECURITY_KEY_HANDLE        = ^WS_SECURITY_KEY_HANDLE;
  PWS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE = ^WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE;
  PWS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE = ^WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE;
  PWS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE = ^WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE;
  PWS_SECURITY_BINDING           = ^WS_SECURITY_BINDING;
  PPWS_SECURITY_BINDING          = ^PWS_SECURITY_BINDING;
  PWS_SSL_TRANSPORT_SECURITY_BINDING = ^WS_SSL_TRANSPORT_SECURITY_BINDING;
  PWS_TCP_SSPI_TRANSPORT_SECURITY_BINDING = ^WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING;
  PWS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING = ^WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING;
  PWS_HTTP_HEADER_AUTH_SECURITY_BINDING = ^WS_HTTP_HEADER_AUTH_SECURITY_BINDING;
  PWS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING = ^WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING;
  PWS_USERNAME_MESSAGE_SECURITY_BINDING = ^WS_USERNAME_MESSAGE_SECURITY_BINDING;
  PWS_SECURITY_DESCRIPTION       = ^WS_SECURITY_DESCRIPTION;
  PWS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING = ^WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING;
  PWS_SECURITY_CONTEXT_PROPERTY  = ^WS_SECURITY_CONTEXT_PROPERTY;
  PWS_XML_SECURITY_TOKEN_PROPERTY = ^WS_XML_SECURITY_TOKEN_PROPERTY;
  PWS_XML_TOKEN_MESSAGE_SECURITY_BINDING = ^WS_XML_TOKEN_MESSAGE_SECURITY_BINDING;
  PWS_SAML_AUTHENTICATOR         = ^WS_SAML_AUTHENTICATOR;
  PWS_CERT_SIGNED_SAML_AUTHENTICATOR = ^WS_CERT_SIGNED_SAML_AUTHENTICATOR;
  PWS_SAML_MESSAGE_SECURITY_BINDING = ^WS_SAML_MESSAGE_SECURITY_BINDING;
  PWS_REQUEST_SECURITY_TOKEN_PROPERTY = ^WS_REQUEST_SECURITY_TOKEN_PROPERTY;
  PWS_ANY_ATTRIBUTE              = ^WS_ANY_ATTRIBUTE;
  PWS_ANY_ATTRIBUTES             = ^WS_ANY_ATTRIBUTES;
  PWS_BOOL_DESCRIPTION           = ^WS_BOOL_DESCRIPTION;
  PWS_GUID_DESCRIPTION           = ^WS_GUID_DESCRIPTION;
  PWS_DATETIME_DESCRIPTION       = ^WS_DATETIME_DESCRIPTION;
  PWS_DURATION                   = ^WS_DURATION;
  PWS_DURATION_DESCRIPTION       = ^WS_DURATION_DESCRIPTION;
  PWS_TIMESPAN_DESCRIPTION       = ^WS_TIMESPAN_DESCRIPTION;
  PWS_UNIQUE_ID_DESCRIPTION      = ^WS_UNIQUE_ID_DESCRIPTION;
  PWS_STRING_DESCRIPTION         = ^WS_STRING_DESCRIPTION;
  PWS_XML_STRING_DESCRIPTION     = ^WS_XML_STRING_DESCRIPTION;
  PWS_XML_QNAME_DESCRIPTION      = ^WS_XML_QNAME_DESCRIPTION;
  PWS_CHAR_ARRAY_DESCRIPTION     = ^WS_CHAR_ARRAY_DESCRIPTION;
  PWS_BYTE_ARRAY_DESCRIPTION     = ^WS_BYTE_ARRAY_DESCRIPTION;
  PWS_UTF8_ARRAY_DESCRIPTION     = ^WS_UTF8_ARRAY_DESCRIPTION;
  PWS_WSZ_DESCRIPTION            = ^WS_WSZ_DESCRIPTION;
  PWS_INT8_DESCRIPTION           = ^WS_INT8_DESCRIPTION;
  PWS_UINT8_DESCRIPTION          = ^WS_UINT8_DESCRIPTION;
  PWS_INT16_DESCRIPTION          = ^WS_INT16_DESCRIPTION;
  PWS_UINT16_DESCRIPTION         = ^WS_UINT16_DESCRIPTION;
  PWS_INT32_DESCRIPTION          = ^WS_INT32_DESCRIPTION;
  PWS_UINT32_DESCRIPTION         = ^WS_UINT32_DESCRIPTION;
  PWS_INT64_DESCRIPTION          = ^WS_INT64_DESCRIPTION;
  PWS_UINT64_DESCRIPTION         = ^WS_UINT64_DESCRIPTION;
  PWS_FLOAT_DESCRIPTION          = ^WS_FLOAT_DESCRIPTION;
  PWS_DOUBLE_DESCRIPTION         = ^WS_DOUBLE_DESCRIPTION;
  PWS_DECIMAL_DESCRIPTION        = ^WS_DECIMAL_DESCRIPTION;
  PWS_BYTES_DESCRIPTION          = ^WS_BYTES_DESCRIPTION;
  PWS_ENUM_VALUE                 = ^WS_ENUM_VALUE;
  PWS_ENUM_DESCRIPTION           = ^WS_ENUM_DESCRIPTION;
  PWS_ITEM_RANGE                 = ^WS_ITEM_RANGE;
  PWS_DEFAULT_VALUE              = ^WS_DEFAULT_VALUE;
  PWS_FIELD_DESCRIPTION          = ^WS_FIELD_DESCRIPTION;
  PPWS_FIELD_DESCRIPTION         = ^PWS_FIELD_DESCRIPTION;
  PWS_UNION_FIELD_DESCRIPTION    = ^WS_UNION_FIELD_DESCRIPTION;
  PPWS_UNION_FIELD_DESCRIPTION   = ^PWS_UNION_FIELD_DESCRIPTION;
  PWS_STRUCT_DESCRIPTION         = ^WS_STRUCT_DESCRIPTION;
  PPWS_STRUCT_DESCRIPTION        = ^PWS_STRUCT_DESCRIPTION;
  PWS_UNION_DESCRIPTION          = ^WS_UNION_DESCRIPTION;
  PWS_ENDPOINT_ADDRESS_DESCRIPTION = ^WS_ENDPOINT_ADDRESS_DESCRIPTION;
  PWS_FAULT_DESCRIPTION          = ^WS_FAULT_DESCRIPTION;
  PWS_VOID_DESCRIPTION           = ^WS_VOID_DESCRIPTION;
  PWS_CUSTOM_TYPE_DESCRIPTION    = ^WS_CUSTOM_TYPE_DESCRIPTION;
  PWS_ATTRIBUTE_DESCRIPTION      = ^WS_ATTRIBUTE_DESCRIPTION;
  PWS_PARAMETER_DESCRIPTION      = ^WS_PARAMETER_DESCRIPTION;
  PWS_OPERATION_DESCRIPTION      = ^WS_OPERATION_DESCRIPTION;
  PPWS_OPERATION_DESCRIPTION     = ^PWS_OPERATION_DESCRIPTION;
  PWS_CONTRACT_DESCRIPTION       = ^WS_CONTRACT_DESCRIPTION;
  PWS_SERVICE_CONTRACT           = ^WS_SERVICE_CONTRACT;
  PWS_SERVICE_PROPERTY           = ^WS_SERVICE_PROPERTY;
  PWS_SERVICE_ENDPOINT_PROPERTY  = ^WS_SERVICE_ENDPOINT_PROPERTY;
  PWS_SERVICE_PROPERTY_ACCEPT_CALLBACK = ^WS_SERVICE_PROPERTY_ACCEPT_CALLBACK;
  PWS_SERVICE_METADATA_DOCUMENT  = ^WS_SERVICE_METADATA_DOCUMENT;
  PPWS_SERVICE_METADATA_DOCUMENT = ^PWS_SERVICE_METADATA_DOCUMENT;
  PWS_SERVICE_METADATA           = ^WS_SERVICE_METADATA;
  PWS_SERVICE_PROPERTY_CLOSE_CALLBACK = ^WS_SERVICE_PROPERTY_CLOSE_CALLBACK;
  PWS_SERVICE_ENDPOINT_METADATA  = ^WS_SERVICE_ENDPOINT_METADATA;
  PWS_SERVICE_ENDPOINT           = ^WS_SERVICE_ENDPOINT;
  PWS_PROXY_PROPERTY             = ^WS_PROXY_PROPERTY;
  PWS_PROXY_MESSAGE_CALLBACK_CONTEXT = ^WS_PROXY_MESSAGE_CALLBACK_CONTEXT;
  PWS_CALL_PROPERTY              = ^WS_CALL_PROPERTY;
  PWS_URL                        = ^WS_URL;
  PWS_HTTP_URL                   = ^WS_HTTP_URL;
  PWS_HTTPS_URL                  = ^WS_HTTPS_URL;
  PWS_NETTCP_URL                 = ^WS_NETTCP_URL;
  PWS_SOAPUDP_URL                = ^WS_SOAPUDP_URL;
  PWS_NETPIPE_URL                = ^WS_NETPIPE_URL;
  PWS_UNIQUE_ID                  = ^WS_UNIQUE_ID;
  PWS_BUFFERS                    = ^WS_BUFFERS;
  PWS_METADATA_ENDPOINT          = ^WS_METADATA_ENDPOINT;
  PWS_METADATA_ENDPOINTS         = ^WS_METADATA_ENDPOINTS;
  PWS_METADATA_PROPERTY          = ^WS_METADATA_PROPERTY;
  PWS_POLICY_PROPERTY            = ^WS_POLICY_PROPERTY;
  PWS_POLICY_PROPERTIES          = ^WS_POLICY_PROPERTIES;
  PWS_SECURITY_BINDING_PROPERTY_CONSTRAINT = ^WS_SECURITY_BINDING_PROPERTY_CONSTRAINT;
  PWS_SECURITY_BINDING_CONSTRAINT = ^WS_SECURITY_BINDING_CONSTRAINT;
  PPWS_SECURITY_BINDING_CONSTRAINT = ^PWS_SECURITY_BINDING_CONSTRAINT;
  PWS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT = ^WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT;
  PWS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT = ^WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT;
  PWS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT = ^WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT;
  PWS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT = ^WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT;
  PWS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT = ^WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT;
  PWS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT = ^WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT;
  PWS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT = ^WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT;
  PWS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT = ^WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT;
  PWS_SECURITY_PROPERTY_CONSTRAINT = ^WS_SECURITY_PROPERTY_CONSTRAINT;
  PWS_SECURITY_CONSTRAINTS       = ^WS_SECURITY_CONSTRAINTS;
  PWS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT = ^WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT;
  PWS_CHANNEL_PROPERTY_CONSTRAINT = ^WS_CHANNEL_PROPERTY_CONSTRAINT;
  PWS_POLICY_EXTENSION           = ^WS_POLICY_EXTENSION;
  PPWS_POLICY_EXTENSION          = ^PWS_POLICY_EXTENSION;
  PWS_ENDPOINT_POLICY_EXTENSION  = ^WS_ENDPOINT_POLICY_EXTENSION;
  PWS_POLICY_CONSTRAINTS         = ^WS_POLICY_CONSTRAINTS;
  PWS_HTTP_POLICY_DESCRIPTION    = ^WS_HTTP_POLICY_DESCRIPTION;
  PWS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_POLICY_DESCRIPTION = ^WS_HTTP_SSL_POLICY_DESCRIPTION;
  PWS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_HTTP_HEADER_AUTH_POLICY_DESCRIPTION = ^WS_HTTP_HEADER_AUTH_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_HEADER_AUTH_POLICY_DESCRIPTION = ^WS_HTTP_SSL_HEADER_AUTH_POLICY_DESCRIPTION;
  PWS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_USERNAME_POLICY_DESCRIPTION = ^WS_HTTP_SSL_USERNAME_POLICY_DESCRIPTION;
  PWS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_KERBEROS_APREQ_POLICY_DESCRIPTION = ^WS_HTTP_SSL_KERBEROS_APREQ_POLICY_DESCRIPTION;
  PWS_TCP_POLICY_DESCRIPTION     = ^WS_TCP_POLICY_DESCRIPTION;
  PWS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_TCP_SSPI_POLICY_DESCRIPTION = ^WS_TCP_SSPI_POLICY_DESCRIPTION;
  PWS_TCP_SSPI_USERNAME_POLICY_DESCRIPTION = ^WS_TCP_SSPI_USERNAME_POLICY_DESCRIPTION;
  PWS_TCP_SSPI_KERBEROS_APREQ_POLICY_DESCRIPTION = ^WS_TCP_SSPI_KERBEROS_APREQ_POLICY_DESCRIPTION;
  PWS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION = ^WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION;
  PWS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION = ^WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION;
  PWS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION = ^WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION = ^WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION;
  PWS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION = ^WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION;
  PWS_HTTP_BINDING_TEMPLATE      = ^WS_HTTP_BINDING_TEMPLATE;
  PWS_TCP_BINDING_TEMPLATE       = ^WS_TCP_BINDING_TEMPLATE;
  PWS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE = ^WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
  PWS_HTTP_SSL_BINDING_TEMPLATE  = ^WS_HTTP_SSL_BINDING_TEMPLATE;
  PWS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE = ^WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE;
  PWS_HTTP_HEADER_AUTH_BINDING_TEMPLATE = ^WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE;
  PWS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE = ^WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
  PWS_TCP_SSPI_BINDING_TEMPLATE  = ^WS_TCP_SSPI_BINDING_TEMPLATE;
  PWS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE = ^WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE;
  PWS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE = ^WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE;
  PWS_HTTP_SSL_USERNAME_BINDING_TEMPLATE = ^WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE;
  PWS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE = ^WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE;
  PWS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE = ^WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE;
  PWS_TCP_SSPI_USERNAME_BINDING_TEMPLATE = ^WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE;
  PWS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE = ^WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE;
  PWS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE = ^WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE;
  PWS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE = ^WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE;
  PWS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE = ^WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE;
  PWS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE = ^WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE;
  PWS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE = ^WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE;
  PWS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE = ^WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE;

  PWS_SECURITY_TOKEN             = pointer;  //opaque handle representing a security token.
  PWS_POLICY                     = pointer;  //opaque type used to reference a metadata input policy.


//  CALLBACK DEFINITIONS

//  Async Model callback
//
//   The type of a callback used in the Async Model.
//
  WS_ASYNC_CALLBACK=procedure(errorCode : HRESULT;
                              callbackModel : WS_CALLBACK_MODEL;
                              callbackState : pointer); stdcall;


//  Async Model structure
//
//   Used with the Async Model to specify the async callback and
//  a pointer which will be passed to the async callback.
//
  WS_ASYNC_CONTEXT = record
    callback:WS_ASYNC_CALLBACK;
    callbackState:pointer;
  end;

  PWS_ASYNC_CONTEXT = ^WS_ASYNC_CONTEXT;


//  XML Reader callback
//
//   A user-defined callback used by the WS_XML_READER
//   to read from some source into a buffer.
//
  WS_READ_CALLBACK = function(callbackState : pointer;
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
  WS_WRITE_CALLBACK = function(callbackState : pointer;
                               buffer : PWS_BYTES;
                               count : ULONG;
                               asyncContext : PWS_ASYNC_CONTEXT;
                               error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used by WsPushBytes to request that data be written.
//
  WS_PUSH_BYTES_CALLBACK = function(callbackState : pointer;
                                    writeCallback : WS_WRITE_CALLBACK;
                                    writeCallbackState : pointer;
                                    asyncContext : PWS_ASYNC_CONTEXT;
                                    error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer callback
//
//   A user-defined callback used by WsPullBytes to request
//  the data that should be written.
//
  WS_PULL_BYTES_CALLBACK = function(callbackState : pointer;
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
  WS_DYNAMIC_STRING_CALLBACK = function(callbackState : pointer;
                                        str : PWS_XML_STRING;
                                        found : PBOOL;
                                        id : PULONG;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Async Model callback
//
//   Used with the WsAsyncExecute to specify the next
//  function to invoke in a series of async operations.
//
  WS_ASYNC_FUNCTION = function(hr : HRESULT;
                               callbackModel : WS_CALLBACK_MODEL;
                               callbackState : pointer;
                               next : PWS_ASYNC_OPERATION;
                               asyncContext : PWS_ASYNC_CONTEXT;
                               error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsCreateChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_CREATE_CHANNEL_CALLBACK = function(channelType : WS_CHANNEL_TYPE;
                                        channelParameters : pointer;
                                        channelParametersSize : ULONG;
                                        channelInstance : ppointer;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsFreeChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_FREE_CHANNEL_CALLBACK = procedure(channelInstance : pointer); stdcall;


//  Channel callback
//
//   This callback handles the WsResetChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_RESET_CHANNEL_CALLBACK = function(channelInstance : pointer;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsAbortChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_ABORT_CHANNEL_CALLBACK = function(channelInstance : pointer;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsOpenChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_OPEN_CHANNEL_CALLBACK = function(channelInstance : pointer;
                                      endpointAddress : PWS_ENDPOINT_ADDRESS;
                                      asyncContext : PWS_ASYNC_CONTEXT;
                                      error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsCloseChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_CLOSE_CHANNEL_CALLBACK = function(channelInstance : pointer;
                                       asyncContext : PWS_ASYNC_CONTEXT;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsSetChannelProperty call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_SET_CHANNEL_PROPERTY_CALLBACK = function(channelInstance : pointer;
                                              id : WS_CHANNEL_PROPERTY_ID;
                                              value : pointer;
                                              valueSize : ULONG;
                                              error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsGetChannelProperty call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_GET_CHANNEL_PROPERTY_CALLBACK = function(channelInstance : pointer;
                                              id : WS_CHANNEL_PROPERTY_ID;
                                              value : pointer;
                                              valueSize : ULONG;
                                              error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsReadMessageStart call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_READ_MESSAGE_START_CALLBACK = function(channelInstance : pointer;
                                            message_ : PWS_MESSAGE;
                                            asyncContext : PWS_ASYNC_CONTEXT;
                                            error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsReadMessageEnd call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_READ_MESSAGE_END_CALLBACK = function(channelInstance : pointer;
                                          message_ : PWS_MESSAGE;
                                          asyncContext : PWS_ASYNC_CONTEXT;
                                          error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsWriteMessageStart call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_WRITE_MESSAGE_START_CALLBACK = function(channelInstance : pointer;
                                             message_ : PWS_MESSAGE;
                                             asyncContext : PWS_ASYNC_CONTEXT;
                                             error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsWriteMessageEnd call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_WRITE_MESSAGE_END_CALLBACK = function(channelInstance : pointer;
                                           message_ : PWS_MESSAGE;
                                           asyncContext : PWS_ASYNC_CONTEXT;
                                           error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsAbandonMessage call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_ABANDON_MESSAGE_CALLBACK = function(channelInstance : pointer;
                                         message_ : PWS_MESSAGE;
                                         error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles the WsShutdownSessionChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK = function(channelInstance : pointer;
                                                  asyncContext : PWS_ASYNC_CONTEXT;
                                                  error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles creating an encoder instance.
//
  WS_CREATE_ENCODER_CALLBACK = function(createContext : pointer;
                                        writeCallback : WS_WRITE_CALLBACK;
                                        writeContext : pointer;
                                        encoderContext : ppointer;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to get the content type of the message.
//
  WS_ENCODER_GET_CONTENT_TYPE_CALLBACK = function(encoderContext : pointer;
                                                  contentType : PWS_STRING;
                                                  newContentType : PWS_STRING;
                                                  contentEncoding : PWS_STRING;
                                                  error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to start encoding a message.
//
  WS_ENCODER_START_CALLBACK = function(encoderContext : pointer;
                                       asyncContext : PWS_ASYNC_CONTEXT;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to encode a message.
//
  WS_ENCODER_ENCODE_CALLBACK = function(encoderContext : pointer;
                                        buffers : PWS_BYTES;
                                        count : ULONG;
                                        asyncContext : PWS_ASYNC_CONTEXT;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to encode the end of a message.
//
  WS_ENCODER_END_CALLBACK = function(encoderContext : pointer;
                                     asyncContext : PWS_ASYNC_CONTEXT;
                                     error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles freeing an encoder instance.
//
  WS_FREE_ENCODER_CALLBACK = procedure(encoderContext : pointer); stdcall;


//  Channel callback
//
//   This callback handles creating an decoder instance.
//
  WS_CREATE_DECODER_CALLBACK = function(createContext : pointer;
                                        readCallback : WS_READ_CALLBACK;
                                        readContext : pointer;
                                        decoderContext : ppointer;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to get the content type of the message.
//
  WS_DECODER_GET_CONTENT_TYPE_CALLBACK = function(decoderContext : pointer;
                                                  contentType : PWS_STRING;
                                                  contentEncoding : PWS_STRING;
                                                  newContentType : PWS_STRING;
                                                  error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to start decoding a message.
//
  WS_DECODER_START_CALLBACK = function(encoderContext : pointer;
                                       asyncContext : PWS_ASYNC_CONTEXT;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to decode a message.
//
  WS_DECODER_DECODE_CALLBACK = function(encoderContext : pointer;
                                        buffer : pointer;
                                        maxLength : ULONG;
                                        length : PULONG;
                                        asyncContext : PWS_ASYNC_CONTEXT;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback is invoked to decode the end of a message.
//
  WS_DECODER_END_CALLBACK = function(encoderContext : pointer;
                                     asyncContext : PWS_ASYNC_CONTEXT;
                                     error : PWS_ERROR):HRESULT; stdcall;


//  Channel callback
//
//   This callback handles freeing an decoder instance.
//
  WS_FREE_DECODER_CALLBACK = procedure(decoderContext : pointer); stdcall;


//  Channel callback
//
//   This callback is invoked when a message is about to be automatically
//  redirected to another service utilizing HTTP auto redirect functionality
//  as described in RFC2616. If the redirection should not be allowed, this
//  callback should return S_FALSE or an error value. Otherwise the auto
//  HTTP redirection will proceed.
//
  WS_HTTP_REDIRECT_CALLBACK = function(state : pointer;
                                       originalUrl : PWS_STRING;
                                       newUrl : PWS_STRING):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsCreateListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_CREATE_LISTENER_CALLBACK = function(channelType : WS_CHANNEL_TYPE;
                                         listenerParameters : pointer;
                                         listenerParametersSize : ULONG;
                                         listenerInstance : ppointer;
                                         error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsFreeListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_FREE_LISTENER_CALLBACK = procedure(listenerInstance : pointer); stdcall;


//  Listener callback
//
//   This callback handles the WsResetListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_RESET_LISTENER_CALLBACK = function(listenerInstance : pointer;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsOpenListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_OPEN_LISTENER_CALLBACK = function(listenerInstance : pointer;
                                       url : PWS_STRING;
                                       asyncContext : PWS_ASYNC_CONTEXT;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsCloseListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_CLOSE_LISTENER_CALLBACK = function(listenerInstance : pointer;
                                        asyncContext : PWS_ASYNC_CONTEXT;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsGetListenerProperty call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_GET_LISTENER_PROPERTY_CALLBACK = function(listenerInstance : pointer;
                                               id : WS_LISTENER_PROPERTY_ID;
                                               value : pointer;
                                               valueSize : ULONG;
                                               error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsSetListenerProperty call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_SET_LISTENER_PROPERTY_CALLBACK = function(listenerInstance : pointer;
                                               id : WS_LISTENER_PROPERTY_ID;
                                               value : pointer;
                                               valueSize : ULONG;
                                               error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsAcceptChannel call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_ACCEPT_CHANNEL_CALLBACK = function(listenerInstance : pointer;
                                        channelInstance : pointer;
                                        asyncContext : PWS_ASYNC_CONTEXT;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsAbortListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_ABORT_LISTENER_CALLBACK = function(listenerInstance : pointer;
                                        error : PWS_ERROR):HRESULT; stdcall;


//  Listener callback
//
//   This callback handles the WsCreateChannelForListener call
//  for a WS_CUSTOM_CHANNEL_BINDING.
//
  WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK = function(listenerInstance : pointer;
                                                     channelParameters : pointer;
                                                     channelParametersSize : ULONG;
                                                     channelInstance : ppointer;
                                                     error : PWS_ERROR):HRESULT; stdcall;


//  Message callback
//
//   This callback is used as a notification that the message is done using
//  the WS_XML_READER supplied to WsReadEnvelopeStart
//   or the WS_XML_WRITER supplied to WsWriteEnvelopeStart.
//
  WS_MESSAGE_DONE_CALLBACK = procedure(doneCallbackState : pointer); stdcall;


//  Security Channel Settings callback
//
//   This callback is invoked when a connection to an HTTP server was established and
//  headers were sent.
//
  WS_CERTIFICATE_VALIDATION_CALLBACK = function(certContext : PCCERT_CONTEXT;
                                                state : pointer):HRESULT; stdcall;


//  Security Credentials callback
//
//  Callback for providing a certificate to the security runtime.  This
//  callback is specified as part of the WS_CUSTOM_CERT_CREDENTIAL,
//  which in turn may be specified as part of a security binding that requires a
//  certificate credential. The runtime will invoke this callback when the channel
//  (client-side) or the listener (server-side) is opened.
//
//  Cert ownership: If this callback returns a success HRESULT, the caller
//  (namely, the security runtime) will take ownership of the returned
//  certificate, and will free it when the containing channel no longer
//  needs it.  If this callback returns a failure HRESULT, the caller will
//  NOT take ownership of, or even look at, the value returned in the out
//  parameter 'cert'.
//
  WS_GET_CERT_CALLBACK = function(getCertCallbackState : pointer;
                                  targetAddress : PWS_ENDPOINT_ADDRESS;
                                  viaUri : PWS_STRING;
                                  cert : PPCCERT_CONTEXT;
                                  error : PWS_ERROR):HRESULT; stdcall;


//  Security Credentials callback
//
//  The callback to notify the client of the list of certificate issuers
//  that are acceptable to the server.  With some protocols such as SSL,
//  the server may optionally send such an issuer list to help the client
//  choose a certificate.
//
//  This callback is an optional part of the WS_CUSTOM_CERT_CREDENTIAL.
//  If the (possibly NULL) certificate returned by the WS_GET_CERT_CALLBACK is
//  accepted by the server, then this callback is never invoked.  If the
//  server rejects it and sends back an issuer list, then this callback
//  will be invoked.  The client may then choose a certificate based on
//  the issuer list and supply that certificate when the channel is opened
//  next and WS_GET_CERT_CALLBACK is invoked again.
//
//  The parameters supplied during this callback are valid only for the
//  duration of the callback.
//
  WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK = function(
                      certIssuerListNotificationCallbackState : pointer;
                      issuerList : pointer;
                      //Typed pointer is not required
                      //struct _SecPkgContext_IssuerListInfoEx* (Schannel.h (include Schnlsp.h))
                      error : PWS_ERROR):HRESULT; stdcall;


//  Security Credentials callback
//
//  Application supplied callback for validating a username/password pair
//  on the receiver side.  When a WS_USERNAME_MESSAGE_SECURITY_BINDING
//  containing this callback is included in the security description, this callback
//  is invoked for each received message at the server.  This callback is expected
//  to return S_OKif the username/password pair was successfully validated, S_FALSE
//  when the pair could not be validated and an error value if an unexpected error occurred.
//  Returning any result other than S_OK from this callback will result in
//  the associated receive message failing with a security error.
//
//  As with all security callbacks, the application should expect to
//  receive this callback any time between channel/listener open and close,
//  but it will never be invoked when a channel is not open.  In the
//  current drop, this callback is always invoked synchronously.  In the
//  next drop, this callback will be invoked synchronously for synchronous
//  message receives and asynchronously for asynchronous message receives,
//  but it will always be invoked (WS_SHORT_CALLBACK) short
//  when it is invoked asynchronously.
//
  WS_VALIDATE_PASSWORD_CALLBACK = function(
                      passwordValidatorCallbackState : pointer;
                      username : PWS_STRING;
                      password : PWS_STRING;
                      asyncContext : PWS_ASYNC_CONTEXT;
                      error : PWS_ERROR):HRESULT; stdcall;


//  Security Bindings callback
//
//   Application supplied callback for validating a SAML assertion.  If a
//  received SAML assertion passes the signature verification checks that
//  ensure the SAML was issued by a trusted issuer, then this callback is
//  invoked to enable the application to do additional validation on the
//  XML form of the SAML assertion.  This callback is expected to return
//  S_OK if the SAML assertion was successfully validated, S_FALSE when
//  the assertion could not be validated and an error value if an
//  unexpected error occurred.  Returning any result other than S_OK from
//  this callback will result in the associated receive message failing
//  with a security error.
//
//   As with all security callbacks, the application should expect to
//  receive this callback any time between listener open and close, but it
//  will never be invoked when a listener is not open.
//
  WS_VALIDATE_SAML_CALLBACK = function(samlValidatorCallbackState : pointer;
                                       samlAssertion : PWS_XML_BUFFER;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  Serialization callback
//
//   This callback is invoked to compare two durations.
//
  WS_DURATION_COMPARISON_CALLBACK = function(duration1 : PWS_DURATION;
                                             duration2 : PWS_DURATION;
                                             result : PINT;
                                             error : PWS_ERROR):HRESULT; stdcall;


//  Serialization callback
//
//   This callback is invoked to read an value when WS_CUSTOM_TYPE
//   has been specified.  This allows reading of XML constructs which do not easily
//  map to the core serialization model.
//
  WS_READ_TYPE_CALLBACK = function(reader : PWS_XML_READER;
                                   typeMapping : WS_TYPE_MAPPING;
                                   descriptionData : pointer;
                                   heap : PWS_HEAP;
                                   value : pointer;
                                   valueSize : ULONG;
                                   error : PWS_ERROR):HRESULT; stdcall;


//  Serialization callback
//
//   This callback is invoked to write an element when WS_CUSTOM_TYPE
//   has been specified.  This allows writing of XML constructs which do not easily
//  map to the core serialization model.
//
  WS_WRITE_TYPE_CALLBACK = function(writer : PWS_XML_WRITER;
                                    typeMapping : WS_TYPE_MAPPING;
                                    descriptionData : pointer;
                                    value : pointer;
                                    valueSize : ULONG;
                                    error : PWS_ERROR):HRESULT; stdcall;


//  Serialization callback
//
//   This callback is invoked before a value that is handled
//  by a WS_CUSTOM_TYPE is serialized in order to
//  determine if the value is the default value.  Support
//  for default values is enabled by specifying
//  when WS_FIELD_OPTIONAL in the WS_FIELD_DESCRIPTION.
//
  WS_IS_DEFAULT_VALUE_CALLBACK = function(descriptionData : pointer;
                                          value : pointer;
                                          defaultValue : pointer;
                                          valueSize : ULONG;
                                          isDefault : PBOOL;
                                          error : PWS_ERROR):HRESULT; stdcall;


//  Contract callback
//
//   It is invoked when a WS_MESSAGE is received on an endpoint configured
//  with a WS_SERVICE_CONTRACT which has defaultMessageHandlerCallback set.
//
//   The incoming WS_MESSAGE, the serviceProxy along with other parameters
//  is made available to the callback through WS_OPERATION_CONTEXT.
//
  WS_SERVICE_MESSAGE_RECEIVE_CALLBACK = function(context : PWS_OPERATION_CONTEXT;
                                                 asyncContext : PWS_ASYNC_CONTEXT;
                                                 error : PWS_ERROR):HRESULT; stdcall;


//  Call cancellation callback
//
//   This callback is invoked by service model to notify a cancellation of an
//  async service operation call as a result of an aborted shutdown of service host.
//
  WS_OPERATION_CANCEL_CALLBACK = procedure(reason : WS_SERVICE_CANCEL_REASON;
                                           state : pointer); stdcall;


//  Call cancellation callback
//
//   This callback is invoked by service model to allow application to cleanup
//  state that was registered with cancellation callback.
//
  WS_OPERATION_FREE_STATE_CALLBACK = procedure(state : pointer); stdcall;


//  Contract callback
//
//   This callback is invoked by service model to delegate to the service
//  operation call. This callback is generated by (Web Service Compiler Tool) wsutil.exe
//   for every service operation. It is defined on the WS_OPERATION_DESCRIPTION for each
//  service operation.
//
  WS_SERVICE_STUB_CALLBACK = function(context : PWS_OPERATION_CONTEXT;
                                      frame : pointer;
                                      callback : pointer;
                                      asyncContext : PWS_ASYNC_CONTEXT;
                                      error : PWS_ERROR):HRESULT; stdcall;


//  Service Host callback
//
//   This callback is invoked when a channel is accepted on an endpoint
//  listener by service host.
//
//   For (Contract) session based service contract, this notification signifies session initiation.
//  Thus an application state scoped for the session can be created within this callback.
//
  WS_SERVICE_ACCEPT_CHANNEL_CALLBACK = function(context : PWS_OPERATION_CONTEXT;
                                                channelState : ppointer;
                                                asyncContext : PWS_ASYNC_CONTEXT;
                                                error : PWS_ERROR):HRESULT; stdcall;


//  Service Host callback
//
//   This callback is invoked when a channel is closed/or aborted on an endpoint.
//  This callback is called right before we are about to close the channel.
//
//   For normal operation when service host is running and the client cleanly
//  closed the channel, this implies that we have received a session closure
//  from the client and we are about to close the channel.
//
//   The other scenario is when service host is going through an Abort Shutdown
//  or during the processing of the message an unrecoverable error condition is
//  met, as a result of this we attempt to abort and then close the channel.
//  In this case as well right before the abort we will call upon this callback.
//
//   For (Contract) session based service contract, this notification
//  signifies session tear down. Thus an application state scoped for the session
//  can be destroyed within this callback.
//
  WS_SERVICE_CLOSE_CHANNEL_CALLBACK = function(
                             context : PWS_OPERATION_CONTEXT;
                             asyncContext : PWS_ASYNC_CONTEXT):HRESULT; stdcall;


//  Service Authorization callback
//
//   This callback is invoked when headers of the incoming message
//  are received and the body is not processed.
//
  WS_SERVICE_SECURITY_CALLBACK = function(context : PWS_OPERATION_CONTEXT;
                                          authorized : PBOOL;
                                          error : PWS_ERROR):HRESULT; stdcall;


//  Service Proxy callback
//
//   The callback is invoked when the headers of the input message are
//  about to be sent through, or when an output message headers are just received.
//
  WS_PROXY_MESSAGE_CALLBACK = function(message_ : PWS_MESSAGE;
                                       heap : PWS_HEAP;
                                       state : pointer;
                                       error : PWS_ERROR):HRESULT; stdcall;


//  STRUCT DEFINITIONS

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


//  XML Node structure
//
//   Represents a string that optionally has (WS_XML_DICTIONARY) dictionary
//   information associated with it.  The xml APIs use WS_XML_STRINGs to identify prefixes,
//  localNames and namespaces.
//
  WS_XML_STRING = record
    length:ULONG;
    bytes:PByte;
    dictionary:PWS_XML_DICTIONARY;
    id:ULONG;
  end;


//  XML Node structure
//
//   A structure used to specify an XML name (of an element or an attribute) as
//  a local name, namespace pair.
//
  WS_XML_QNAME = record
    localName:WS_XML_STRING;
    ns:WS_XML_STRING;
  end;


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


//  XML Canonicalization structure
//
//   Specifies a setting that controls how XML canonicalization is done.
//
  WS_XML_CANONICALIZATION_PROPERTY = record
    id:WS_XML_CANONICALIZATION_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;


//  XML Writer structure
//
//   Specifies a writer specific setting.
//
  WS_XML_WRITER_PROPERTY = record
    id:WS_XML_WRITER_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;


//  XML Buffer structure
//
//   Specifies an xml buffer specific setting.
//
  WS_XML_BUFFER_PROPERTY = record
    id:WS_XML_BUFFER_PROPERTY_ID;
    value:pointer;
    valueSize:ULONG;
  end;


//  XML Node structure
//
//   Represents a node of text content in xml.
//
  WS_XML_TEXT = record
    textType:WS_XML_TEXT_TYPE;
  end;


//  XML Node structure
//
//   Represents text encoded as UTF-8 bytes.
//
  WS_XML_UTF8_TEXT = record
    text:WS_XML_TEXT;
    value:WS_XML_STRING;
  end;


//  XML Node structure
//
//   Represents text encoded as UTF-16 bytes.
//
  WS_XML_UTF16_TEXT = record
    text:WS_XML_TEXT;
    bytes:PByte;
    byteCount:ULONG;
  end;


//  XML Node structure
//
//   Represents base64 encoded data. (e.g. The three bytes { 0, 0, 0 } represent the text "AAAA".)
//
  WS_XML_BASE64_TEXT = record
    text:WS_XML_TEXT;
    bytes:PByte;
    length:ULONG;
  end;


//  XML Node structure
//
//   A boolean that represents the text "true" or "false".
//
  WS_XML_BOOL_TEXT = record
    text:WS_XML_TEXT;
    value:BOOL;
  end;


//  XML Node structure
//
//   Represents a signed 32 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_INT32_TEXT = record
    text:WS_XML_TEXT;
    value:longint;
  end;


//  XML Node structure
//
//   Represents a signed 64 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_INT64_TEXT = record
    text:WS_XML_TEXT;
    value:int64;
  end;


//  XML Node structure
//
//   Represents an unsigned 64 bit integer.  (e.g. The value 255 represents the text "255")
//
  WS_XML_UINT64_TEXT = record
    text:WS_XML_TEXT;
    value:int64;    //Is there an unsigned Int64 in Delphi ?
  end;


//  XML Node structure
//
//   Represents a 4 byte floating point value.  (e.g. The value 0.0 represents the text "0")
//
  WS_XML_FLOAT_TEXT = record
    text:WS_XML_TEXT;
    value:single;
  end;


//  XML Node structure
//
//   Represents an 8 byte floating point value.  (e.g. The value 0.0 represents the text "0")
//
  WS_XML_DOUBLE_TEXT = record
    text:WS_XML_TEXT;
    value:double;
  end;


//  XML Node structure
//
//   Represents a 12 byte fixed point value.  (e.g. The value 1.23 represents the text "1.23")
//
  WS_XML_DECIMAL_TEXT = record
    text:WS_XML_TEXT;
    value:currency;     //not sure Delphi Currency is the same as C++ DECIMAL
  end;


//  XML Node structure
//
//   Represents a guid formatted as the text "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
//
  WS_XML_GUID_TEXT = record
    text:WS_XML_TEXT;
    value:TGUID;
  end;


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
//   This structure is used to represent dates and times.
//
//   Represents dates and times with values ranging from 12:00:00 midnight,
//  January 1, 0001 Anno Domini (Common Era) through 11:59:59 P.M.,
//  December 31, 9999 A.D. (C.E.) to an accuracy of 100 nanoseconds.
//
//   The functions WsDateTimeToFileTime and WsFileTimeToDateTime
//   can be used to convert a WS_DATETIME to and from a FILETIME.
//
  WS_DATETIME = record
    ticks:int64;  //Theorically unsigned! Is there an unsigned Int64 in Delphi ?
    format:WS_DATETIME_FORMAT;
  end;


//  XML Node structure
//
//   Represents a datetime formatted as an
//   (http://www.w3.org/TR/xmlschema-2/#dateTime) xsd:dateTime.
//
//   Negative datetime values are not supported.
//
  WS_XML_DATETIME_TEXT = record
   text:WS_XML_TEXT;
   value:WS_DATETIME;
  end;


//  Utilities structure
//
//   Represents a signed 64-bit time interval in 100 nanosecond units.
//
  WS_TIMESPAN = record
    ticks:int64;
  end;


//  XML Node structure
//
//   Represents a time span formatted as the text "[+|-][d?.]HH:mm:ss[.fffffff]"
//
//  .d is a series of digits representing the day.
//
//  .HH is a two digit number representing the hour of the day, from to 0 to 23.
//
//  .mm is a two digit number representing the minute of the hour, from to 0 to 59.
//
//  .ss is a two digit number representing the second of the minute, from to 0 to 59.
//
//  .fffffff is up to 7 decimal digits representing the fraction of a second.
//
  WS_XML_TIMESPAN_TEXT = record
    text:WS_XML_TEXT;
    value:WS_TIMESPAN;
  end;


//  XML Node structure
//
//   Represents a qname formatted as the text "prefix:localName"
//
  WS_XML_QNAME_TEXT = record
    text:WS_XML_TEXT;
    prefix:PWS_XML_STRING;
    localName:PWS_XML_STRING;
    ns:PWS_XML_STRING;
  end;


//  XML Node structure
//
//   Represents a list of text values separated by a single whitespace character.
//
//   (e.g. The list { { WS_XML_TEXT_TYPE_INT32 }, 123},
//  { { WS_XML_TEXT_TYPE_BOOL }, 1 } represents the text "123 true")
//
  WS_XML_LIST_TEXT = record
    text:WS_XML_TEXT;
    itemCount:ULONG;
    items:PPWS_XML_TEXT;
  end;


//  XML Node structure
//
//   An xml node is unit of data in xml.  This structure is the base type
//  for all the different kinds of nodes.
//
  WS_XML_NODE = record
    nodeType : WS_XML_NODE_TYPE;
  end;


//  XML Node structure
//
//   Represents an attribute (e.g. <a:purchaseOrder xmlns:a="http://tempuri.org" id="5">)
//
  WS_XML_ATTRIBUTE = record
    singleQuote:Byte;
    isXmlNs:Byte;
    prefix:PWS_XML_STRING;
    localName:PWS_XML_STRING;
    ns:PWS_XML_STRING;
    value:PWS_XML_TEXT;
  end;


//  XML Node structure
//
//   Represents a start element in xml (e.g.
//  "<a:purchaseOrder xmlns:a="http://tempuri.org" id="5">")
//
  WS_XML_ELEMENT_NODE = record
    node:WS_XML_NODE;
    prefix:PWS_XML_STRING;
    localName:PWS_XML_STRING;
    ns:PWS_XML_STRING;
    attributeCount:ULONG;
    attributes:PPWS_XML_ATTRIBUTE;
    isEmpty:BOOL;
  end;


//  XML Node structure
//
//   Represents an element, attribute, or CDATA content.
//
  WS_XML_TEXT_NODE = record
    node:WS_XML_NODE;
    text:PWS_XML_TEXT;
  end;


//  XML Node structure
//
//   Represents a comment.  (e.g. "<!--The message follows-->")
//
  WS_XML_COMMENT_NODE = record
    node:WS_XML_NODE;
    value:WS_XML_STRING;
  end;


//  XML Reader structure
//
//   Specifies where the reader should obtain the bytes that comprise the xml document.
//
  WS_XML_READER_INPUT = record
    inputType:WS_XML_READER_INPUT_TYPE;
  end;


//  XML Reader structure
//
//   Specifies that the source of the xml input is a buffer.
//
  WS_XML_READER_BUFFER_INPUT = record
    input:WS_XML_READER_INPUT;
    encodedData:pointer;
    encodedDataSize:ULONG;
  end;


//  XML Reader structure
//
//   Specifies that the source of the xml should be obtained from a callback.
//
  WS_XML_READER_STREAM_INPUT = record
    input:WS_XML_READER_INPUT;
    readCallback:WS_READ_CALLBACK;
    readCallbackState:pointer;
  end;


//  XML Reader structure
//
//   This structure is the base type for all the different kinds of reader encodings.
//
  WS_XML_READER_ENCODING = record
    encodingType : WS_XML_READER_ENCODING_TYPE;
  end;


//  XML Reader structure
//
//   Used to indicate that the reader should interpret the bytes it reads as textual xml.
//
  WS_XML_READER_TEXT_ENCODING = record
    encoding : WS_XML_READER_ENCODING;
    charSet : WS_CHARSET;
  end;


//  XML Reader structure
//
//   Used to indicate that the reader should interpret the bytes it reads as binary xml.
//
  WS_XML_READER_BINARY_ENCODING = record
    encoding : WS_XML_READER_ENCODING;
    staticDictionary : PWS_XML_DICTIONARY;
    dynamicDictionary : PWS_XML_DICTIONARY;
  end;


//  Utilities structure
//
//   An array of unicode characters and a length.
//
  WS_STRING = record
    length:ULONG;
    chars:PWideChar;
  end;


//  XML Reader structure
//
//   Used to indicate that the reader should interpret the bytes it reads as in MTOM format.
//
  WS_XML_READER_MTOM_ENCODING = record
    encoding : WS_XML_READER_ENCODING;
    textEncoding : PWS_XML_READER_ENCODING;
    readMimeHeader : BOOL;
    startInfo : WS_STRING;
    boundary : WS_STRING;
    startUri : WS_STRING;
  end;


//  XML Reader structure
//
//   Used to indicate that the reader should surface the bytes of the document as base64 encoded characters.
//
  WS_XML_READER_RAW_ENCODING = record
    encoding : WS_XML_READER_ENCODING;
  end;


//  XML Writer structure
//
//   This structure is the base type for all the different kinds of writer encodings.
//
  WS_XML_WRITER_ENCODING = record
    encodingType : WS_XML_WRITER_ENCODING_TYPE;
  end;


//  XML Writer structure
//
//   Used to indicate that the reader should emit bytes as textual xml.
//
  WS_XML_WRITER_TEXT_ENCODING = record
    encoding : WS_XML_WRITER_ENCODING;
    charSet : WS_CHARSET;
  end;


//  XML Writer structure
//
//   Used to indicate that the writer should emit bytes as binary xml.
//
  WS_XML_WRITER_BINARY_ENCODING = record
    encoding : WS_XML_WRITER_ENCODING;
    staticDictionary : PWS_XML_DICTIONARY;
    dynamicStringCallback : WS_DYNAMIC_STRING_CALLBACK;
    dynamicStringCallbackState : pointer;
  end;


//  XML Writer structure
//
//   Used to indicate that the reader should emit bytes in MTOM format.
//  The MTOM format will represent bytes written to it as binary mime
//  parts rather than embedded base64 encoded text.
//
  WS_XML_WRITER_MTOM_ENCODING = record
    encoding : WS_XML_WRITER_ENCODING;
    textEncoding : PWS_XML_WRITER_ENCODING;
    writeMimeHeader : BOOL;
    boundary : WS_STRING;
    startInfo : WS_STRING;
    startUri : WS_STRING;
    maxInlineByteCount : ULONG;
  end;


//  XML Writer structure
//
//   Used to indicate that the writer should emit bytes from decoded base64 characters.
//
  WS_XML_WRITER_RAW_ENCODING = record
    encoding : WS_XML_WRITER_ENCODING;
  end;


//  XML Writer structure
//
//   Specifies where the writer should emit the bytes that comprise the xml document.
//
  WS_XML_WRITER_OUTPUT = record
    outputType : WS_XML_WRITER_OUTPUT_TYPE;
  end;


//  XML Writer structure
//
//   Specifies that the generated bytes should be placed in a buffer.
//
  WS_XML_WRITER_BUFFER_OUTPUT = record
    output : WS_XML_WRITER_OUTPUT;
  end;


//  XML Writer structure
//
//   Specifies that the generated bytes should be sent to callback.
//
  WS_XML_WRITER_STREAM_OUTPUT = record
    output : WS_XML_WRITER_OUTPUT;
    writeCallback : WS_WRITE_CALLBACK;
    writeCallbackState : pointer;
  end;


//  XML Writer structure
//
//   A structure that is used to specify a set of WS_XML_WRITER_PROPERTYs.
//
  WS_XML_WRITER_PROPERTIES = record
    properties : PWS_XML_WRITER_PROPERTY;
    propertyCount : ULONG;
  end;


//  XML Reader structure
//
//   A structure that is used to specify a set of WS_XML_READER_PROPERTYs.
//
  WS_XML_READER_PROPERTIES = record
    properties : PWS_XML_READER_PROPERTY;
    propertyCount : ULONG;
  end;


//  Async Model structure
//
//   Used by WsAsyncExecute to manage the state of an asynchronous operation.
//
  WS_ASYNC_STATE = record
    internal0 : pointer;
    internal1 : pointer;
    internal2 : pointer;
    internal3 : pointer;
    internal4 : pointer;
  end;


//  Async Model structure
//
//   Used with the WsAsyncExecute to specify the next function
//  to invoke in a series of async operations.
//
  WS_ASYNC_OPERATION = record
    function_ : WS_ASYNC_FUNCTION;    //function is a reserved word in Pascal
  end;


//  Channel structure
//
//   Specifies a channel specific setting.
//
  WS_CHANNEL_PROPERTY = record
    id : WS_CHANNEL_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Channel structure
//
//   A structure that is used to specify the custom proxy for the channel, using
//  the WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY.
//
  WS_CUSTOM_HTTP_PROXY = record
    servers : WS_STRING;
    bypass : WS_STRING;
  end;


//  Channel structure
//
//   A structure that is used to specify a set of WS_CHANNEL_PROPERTYs.
//
  WS_CHANNEL_PROPERTIES  = record
    properties : PWS_CHANNEL_PROPERTY;
    propertyCount : ULONG;
  end;


//  Channel structure
//
//   A structure that is used to specify a set of callbacks
//  that form the implementation of a custom channel.
//
  WS_CUSTOM_CHANNEL_CALLBACKS = record
    createChannelCallback : WS_CREATE_CHANNEL_CALLBACK;
    freeChannelCallback : WS_FREE_CHANNEL_CALLBACK;
    resetChannelCallback : WS_RESET_CHANNEL_CALLBACK;
    openChannelCallback : WS_OPEN_CHANNEL_CALLBACK;
    closeChannelCallback : WS_CLOSE_CHANNEL_CALLBACK;
    abortChannelCallback : WS_ABORT_CHANNEL_CALLBACK;
    getChannelPropertyCallback : WS_GET_CHANNEL_PROPERTY_CALLBACK;
    setChannelPropertyCallback : WS_SET_CHANNEL_PROPERTY_CALLBACK;
    writeMessageStartCallback : WS_WRITE_MESSAGE_START_CALLBACK;
    writeMessageEndCallback : WS_WRITE_MESSAGE_END_CALLBACK;
    readMessageStartCallback : WS_READ_MESSAGE_START_CALLBACK;
    readMessageEndCallback : WS_READ_MESSAGE_END_CALLBACK;
    abandonMessageCallback : WS_ABANDON_MESSAGE_CALLBACK;
    shutdownSessionChannelCallback : WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK;
  end;


//  Channel structure
//
//   Specifies an individual header that is mapped as part of WS_HTTP_MESSAGE_MAPPING.
//
  WS_HTTP_HEADER_MAPPING = record
    headerName : WS_XML_STRING;
    headerMappingOptions : ULONG;
  end;


//  Channel structure
//
//   Specifies information about how an HTTP request or response should be
//  represented in a message object.
//
  WS_HTTP_MESSAGE_MAPPING = record
    requestMappingOptions : ULONG;
    responseMappingOptions : ULONG;
    requestHeaderMappings : PPWS_HTTP_HEADER_MAPPING;
    requestHeaderMappingCount : ULONG;
    responseHeaderMappings : PPWS_HTTP_HEADER_MAPPING;
    responseHeaderMappingCount : ULONG;
  end;


//  Serialization structure
//
//   Represents a mapping between a C data type and an XML element.
//
  WS_ELEMENT_DESCRIPTION = record
    elementLocalName : PWS_XML_STRING;
    elementNs : PWS_XML_STRING;
    type_ : WS_TYPE;
    typeDescription : pointer;
  end;


//  Channel structure
//
//   The description of the format of a message.
//
  WS_MESSAGE_DESCRIPTION = record
    action : PWS_XML_STRING;
    bodyElementDescription : PWS_ELEMENT_DESCRIPTION;
  end;


//  Channel structure
//
//   A structure that is used to specify a set of callbacks
//  that can transform the content type and encoded bytes of a sent message.
//
  WS_CHANNEL_ENCODER = record
    createContext : pointer;
    createEncoderCallback : WS_CREATE_ENCODER_CALLBACK;
    encoderGetContentTypeCallback : WS_ENCODER_GET_CONTENT_TYPE_CALLBACK;
    encoderStartCallback : WS_ENCODER_START_CALLBACK;
    encoderEncodeCallback : WS_ENCODER_ENCODE_CALLBACK;
    encoderEndCallback : WS_ENCODER_END_CALLBACK;
    freeEncoderCallback : WS_FREE_ENCODER_CALLBACK;
  end;


//  Channel structure
//
//   A structure that is used to specify a set of callbacks
//  that can transform the content type and encoded bytes of a received message.
//
  WS_CHANNEL_DECODER = record
    createContext : pointer;
    createDecoderCallback : WS_CREATE_DECODER_CALLBACK;
    decoderGetContentTypeCallback : WS_DECODER_GET_CONTENT_TYPE_CALLBACK;
    decoderStartCallback : WS_DECODER_START_CALLBACK;
    decoderDecodeCallback : WS_DECODER_DECODE_CALLBACK;
    decoderEndCallback : WS_DECODER_END_CALLBACK;
    freeDecoderCallback : WS_FREE_DECODER_CALLBACK;
  end;


//  Channel structure
//
//   Specifies the callback function and state for controlling the HTTP auto redirection behavior.
//
//   See also, WS_HTTP_REDIRECT_CALLBACK_CONTEXT
//   and WS_CHANNEL_PROPERTY_HTTP_REDIRECT_CALLBACK_CONTEXT.
//
  WS_HTTP_REDIRECT_CALLBACK_CONTEXT = record
    callback : WS_HTTP_REDIRECT_CALLBACK;
    state : pointer;
  end;


//  Endpoint Identity structure
//
//   The base type for all endpoint identities.
//
  WS_ENDPOINT_IDENTITY = record
    identityType : WS_ENDPOINT_IDENTITY_TYPE;
  end;


//  Endpoint Address structure
//
//   Represents the network address of an endpoint.
//
  WS_ENDPOINT_ADDRESS = record
    url : WS_STRING;
    headers : PWS_XML_BUFFER;
    extensions : PWS_XML_BUFFER;
    identity : PWS_ENDPOINT_IDENTITY;
  end;


//  Endpoint Identity structure
//
//   Type for specifying an endpoint identity represented by a DNS name.
//
  WS_DNS_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    dns : WS_STRING;
  end;


//  Endpoint Identity structure
//
//   Type for specifying an endpoint identity represented by a UPN (user principal name).
//
  WS_UPN_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    upn : WS_STRING;
  end;


//  Endpoint Identity structure
//
//   Type for specifying an endpoint identity represented by an SPN (service principal name).
//
  WS_SPN_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    spn : WS_STRING;
  end;


//  Utilities structure
//  A structure used to serialize and deserialize an array of bytes.
  WS_BYTES = record
    length:ULONG;
    bytes:PByte;
  end;


//  Endpoint Identity structure
//
//   Type for RSA endpoint identity.
//
  WS_RSA_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    modulus : WS_BYTES;
    exponent : WS_BYTES;
  end;


//  Endpoint Identity structure
//
//   Type for certificate endpoint identity
//
  WS_CERT_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    rawCertificateData : WS_BYTES;
  end;


//  Endpoint Identity structure
//
//   Type for unknown endpoint identity.  This type is only used to represent
//  an endpoint identity type that was deserialized but was not understood.
//
  WS_UNKNOWN_ENDPOINT_IDENTITY = record
    identity : WS_ENDPOINT_IDENTITY;
    element : PWS_XML_BUFFER;
  end;


//  Errors structure
//
//   Specifies an error specific setting.
//
  WS_ERROR_PROPERTY = record
    id : WS_ERROR_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Faults structure
//
//   A fault reason is a human-readable description of the failure conveyed
//  by the fault.  This structure is used within the WS_FAULT structure.
//  For more information about faults, see Faults.
//
  WS_FAULT_REASON = record
    text : WS_STRING;
    lang : WS_STRING;
  end;


//  Faults structure
//
//   A fault code identifies the type of failure conveyed by a fault message.
//  This structure is used within the WS_FAULT structure.
//  For more information about faults, see Faults.
//
  WS_FAULT_CODE = record
    value : WS_XML_QNAME;
    subCode : PWS_FAULT_CODE;
  end;


//  Faults structure
//
//   A Fault is a value carried in the body of a message which conveys a
//  processing failure.  Faults are modeled using the WS_FAULT structure.
//  See Faults for more information.
//
  WS_FAULT = record
    code : PWS_FAULT_CODE;
    reasons : PWS_FAULT_REASON;
    reasonCount : ULONG;
    actor : WS_STRING;
    node : WS_STRING;
    detail : PWS_XML_BUFFER;
  end;


//  Faults structure
//
//   A description of the detail element of a fault message.
//
  WS_FAULT_DETAIL_DESCRIPTION = record
    action : PWS_XML_STRING;
    detailElementDescription : PWS_ELEMENT_DESCRIPTION;
  end;


//  Heap structure
//
//   Specifies a heap specific setting.
//
  WS_HEAP_PROPERTY = record
    id : WS_HEAP_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Heap structure
//
//   A structure that is used to specify a set of WS_HEAP_PROPERTYs.
//
  WS_HEAP_PROPERTIES = record
    properties : PWS_HEAP_PROPERTY;
    propertyCount : ULONG;
  end;


//  Listener structure
//
//   Specifies a listener specific setting.
//
  WS_LISTENER_PROPERTY = record
    id : WS_LISTENER_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Listener structure
//
//   Specifies the list of blocked UserAgent sub-string's. This is
//  used with the WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT
//   listener property.
//
  WS_DISALLOWED_USER_AGENT_SUBSTRINGS = record
    subStringCount : ULONG;
    subStrings : PPWS_STRING;
  end;


//  Listener structure
//
//   A structure that is used to specify a set of WS_LISTENER_PROPERTYs.
//
  WS_LISTENER_PROPERTIES = record
    properties : PWS_LISTENER_PROPERTY;
    propertyCount : ULONG;
  end;


//  Listener structure
//
//   A structure containing a list of host names.
//
  WS_HOST_NAMES = record
    hostNames : PWS_STRING;
    hostNameCount : ULONG;
  end;


//  Listener structure
//
//   A structure that is used to specify a set of callbacks
//  that form the implementation of a custom
//  listener.
//
  WS_CUSTOM_LISTENER_CALLBACKS = record
    createListenerCallback : WS_CREATE_LISTENER_CALLBACK;
    freeListenerCallback : WS_FREE_LISTENER_CALLBACK;
    resetListenerCallback : WS_RESET_LISTENER_CALLBACK;
    openListenerCallback : WS_OPEN_LISTENER_CALLBACK;
    closeListenerCallback : WS_CLOSE_LISTENER_CALLBACK;
    abortListenerCallback : WS_ABORT_LISTENER_CALLBACK;
    getListenerPropertyCallback : WS_GET_LISTENER_PROPERTY_CALLBACK;
    setListenerPropertyCallback : WS_SET_LISTENER_PROPERTY_CALLBACK;
    createChannelForListenerCallback : WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK;
    acceptChannelCallback : WS_ACCEPT_CHANNEL_CALLBACK;
  end;


//  Message structure
//
//   Specifies a message specific setting.
//
  WS_MESSAGE_PROPERTY = record
    id : WS_MESSAGE_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Message structure
//
//   A structure that is used to specify a set of WS_MESSAGE_PROPERTYs.
//
  WS_MESSAGE_PROPERTIES = record
    properties : PWS_MESSAGE_PROPERTY;
    propertyCount : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies a crypto algorithm setting.
//
  WS_SECURITY_ALGORITHM_PROPERTY = record
    id : WS_SECURITY_ALGORITHM_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Security Channel Settings structure
//
//  Defines the security algorithms and key lengths to be used with
//  WS-Security.  This setting is relevant to message security bindings
//  and mixed-mode security bindings.
//
  WS_SECURITY_ALGORITHM_SUITE = record
    canonicalizationAlgorithm : WS_SECURITY_ALGORITHM_ID;
    digestAlgorithm : WS_SECURITY_ALGORITHM_ID;
    symmetricSignatureAlgorithm : WS_SECURITY_ALGORITHM_ID;
    asymmetricSignatureAlgorithm : WS_SECURITY_ALGORITHM_ID;
    encryptionAlgorithm : WS_SECURITY_ALGORITHM_ID;
    keyDerivationAlgorithm : WS_SECURITY_ALGORITHM_ID;
    symmetricKeyWrapAlgorithm : WS_SECURITY_ALGORITHM_ID;
    asymmetricKeyWrapAlgorithm : WS_SECURITY_ALGORITHM_ID;
    minSymmetricKeyLength : ULONG;
    maxSymmetricKeyLength: ULONG;
    minAsymmetricKeyLength : ULONG;
    maxAsymmetricKeyLength : ULONG;
    properties : PWS_SECURITY_ALGORITHM_PROPERTY;
    propertyCount : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies a channel-wide security setting.
//
  WS_SECURITY_PROPERTY = record
    id : WS_SECURITY_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies an array of channel-wide security settings.
//
  WS_SECURITY_PROPERTIES = record
    properties : PWS_SECURITY_PROPERTY;
    propertyCount : ULONG;
  end;


//  Security Binding Settings structure
//
//   Specifies a security binding specific setting.
//
  WS_SECURITY_BINDING_PROPERTY = record
    id : WS_SECURITY_BINDING_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies an array of security binding settings.
//
  WS_SECURITY_BINDING_PROPERTIES = record
    properties : PWS_SECURITY_BINDING_PROPERTY;
    propertyCount : ULONG;
  end;


//  Extended Protection structure
//
//   A list of Server Principal Names (SPNs) that are used to validate Extended Protection.
//
//   Only available on the server.
//
  WS_SERVICE_SECURITY_IDENTITIES = record
    serviceIdentities : PWS_STRING;
    serviceIdentityCount : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies the callback function and state for validating the HTTP certificate.
//
//   See also WS_SECURITY_BINDING_PROPERTY_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT.
//
  WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT = record
    callback : WS_CERTIFICATE_VALIDATION_CALLBACK;
    state : pointer;
  end;


//  Security Credentials structure
//
//  The abstract base type for all certificate credential types.
//
  WS_CERT_CREDENTIAL = record
    credentialType : WS_CERT_CREDENTIAL_TYPE;
  end;


//  Security Credentials structure
//
//  The type for specifying a certificate credential using the
//  certificate's subject name, store location and store name.  The
//  specified credential is loaded when the containing channel or listener
//  is opened.
//
  WS_SUBJECT_NAME_CERT_CREDENTIAL = record
    credential : WS_CERT_CREDENTIAL;
    storeLocation : ULONG;
    storeName : WS_STRING;
    subjectName : WS_STRING;
  end;


//  Security Credentials structure
//
//  The type for specifying a certificate credential using the
//  certificate's thumbprint, store location and store name.  The
//  specified credential is loaded when the containing channel or listener
//  is opened.
//
//  The thumbprint is the best option for specifying a certificate when
//  subject name based specification is expected to be ambiguous due to
//  the presence of multiple certificates with matching subject names in
//  the cert store being specified.
//
  WS_THUMBPRINT_CERT_CREDENTIAL = record
    credential : WS_CERT_CREDENTIAL;
    storeLocation : ULONG;
    storeName : WS_STRING;
    thumbprint : WS_STRING;
  end;


//  Security Credentials structure
//
//  The type for specifying a certificate credential that is to be
//  supplied by a callback to the application.  This callback is invoked
//  to get the certificate during WsOpenChannel on the client
//  side and during WsOpenListener on the server side.  It is
//  always invoked (WS_SHORT_CALLBACK) short.
//
  WS_CUSTOM_CERT_CREDENTIAL = record
    credential : WS_CERT_CREDENTIAL;
    getCertCallback : WS_GET_CERT_CALLBACK;
    getCertCallbackState : pointer;
    certIssuerListNotificationCallback : WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK;
    certIssuerListNotificationCallbackState : pointer;
  end;


//  Security Credentials structure
//
//  The abstract base type for all credential types used with Windows
//  Integrated Authentication.
//
  WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = record
    credentialType : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE;
  end;


//  Security Credentials structure
//
//   Type for supplying a Windows credential as username, password, domain strings.
//
  WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = record
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
    username : WS_STRING;
    password : WS_STRING;
    domain : WS_STRING;
  end;


//  Security Credentials structure
//
//   Type for supplying a Windows Integrated Authentication credential based on the current Windows identity.
//  If this credential subtype is used for a security binding, the current thread token on the thread that calls
//   WsOpenChannel or WsOpenServiceProxy is used as the Windows
//  identity when sending messages or making service calls. WsAcceptChannel and WsOpenServiceHost do not support this credential type when called
//  from an impersonating thread.
//
  WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = record
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Security Credentials structure
//
//  Type for supplying a Windows Integrated Authentication credential as an opaque handle created by
//  SspiPromptForCredentials and the related family of APIs.  This feature
//  is available only on Windows 7 and later.
//
  WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL = record
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
    opaqueAuthIdentity : pointer;
  end;


//  Security Credentials structure
//
//  The abstract base type for all username/password credentials.
//
//  Note that WS_USERNAME_CREDENTIAL and its concrete subtypes
//  are used with the WS-Security WS_USERNAME_MESSAGE_SECURITY_BINDING.
//  They are best suitable for application-level username/password pairs, such as
//  those used for online customer accounts.  The usernames and passwords specified
//  are not interpreted by the security runtime, and are merely carried
//  client-to-server for authentication by the specified server-side
//  username/password validator specified by the application.
//
//  In contrast, the WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL and
//  its concrete subtypes are used for Windows Integrated Authentication
//  and the security bindings that use it.
//
  WS_USERNAME_CREDENTIAL = record
    credentialType : WS_USERNAME_CREDENTIAL_TYPE;
  end;


//  Security Credentials structure
//
//  The type for supplying a username/password pair as strings.
//
  WS_STRING_USERNAME_CREDENTIAL = record
    credential : WS_USERNAME_CREDENTIAL;
    username : WS_STRING;
    password : WS_STRING;
  end;


//  Security Bindings structure
//
//  The abstract base type for all types that specify a cryptographic key.
//  Such a key is typically specified for a generic XML security token or
//  a custom security token.
//
  WS_SECURITY_KEY_HANDLE = record
    keyHandleType : WS_SECURITY_KEY_HANDLE_TYPE;
  end;


//  Security Bindings structure
//
//  The type for specifying a symmetric cryptographic key as raw bytes.
//
  WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE = record
    keyHandle : WS_SECURITY_KEY_HANDLE;
    rawKeyBytes : WS_BYTES;
  end;


//  Security Bindings structure
//
//  The type for specifying asymmetric cryptographic keys as a CryptoNG
//  NCRYPT_KEY_HANDLE.
//
//  When this structure is used in an API (such as with
//   (WsCreateXmlSecurityToken) XML token creation) and subsequent
//   (WS_XML_TOKEN_MESSAGE_SECURITY_BINDING) use of that XML
//  token for a channel), the application is responsible for making
//  sure that the NCRYPT_KEY_HANDLE remains valid as long as the key is in
//  use.  The application is also responsible for freeing the handle when
//  it is no longer in use.
//
//  This type is supported only on Windows Vista and later platforms.
//
  WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE = record
    keyHandle : WS_SECURITY_KEY_HANDLE;
    asymmetricKey : NCRYPT_KEY_HANDLE;
  end;


//  Security Bindings structure
//
//  The type for specifying asymmetric cryptographic keys as CAPI 1.0 key
//  handles.
//
//  When this structure is used in an API (such as
//  with (WsCreateXmlSecurityToken) XML token creation and subsequent
//   (WS_XML_TOKEN_MESSAGE_SECURITY_BINDING) use of that XML
//  token for a channel), the application is responsible for making
//  sure that the HCRYPTPROV remains valid as long as the key is in
//  use.  The application is also responsible for freeing the handle when
//  it is no longer in use.
//
//  This type is supported only on pre-Windows Vista platforms: for
//  Windows Vista and later, please use WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE.
//
  WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE = record
    keyHandle : WS_SECURITY_KEY_HANDLE;
    provider : HCRYPTPROV;
    keySpec : ULONG;
  end;


//  Security Bindings structure
//
//  The abstract base type for all security bindings.  One or more
//  concrete subtypes of this are specified in the
//   (WS_SECURITY_DESCRIPTION) security description that is
//  supplied during channel and listener creation.  Each concrete subtype
//  of this corresponds to a security protocol and a way of using it to
//  provide authentication and/or protection to a channel.
//
//  Each security binding subtype instance in the security description
//  contributes one security token at runtime.  Thus, the fields of this
//  type can be viewed as specifying a security token, how to obtain it,
//  how to use it for channel security, and how to modify its behavior
//  using the optional settings.
//
  WS_SECURITY_BINDING = record
    bindingType : WS_SECURITY_BINDING_TYPE;
    properties : PWS_SECURITY_BINDING_PROPERTY;
    propertyCount : ULONG;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of SSL/TLS
//  protocol based transport security.
//
//   This security binding is supported only with the
//   WS_HTTP_CHANNEL_BINDING.
//
//   With this security binding, the following security binding property may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_CERT_FAILURES_TO_IGNORE (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_DISABLE_CERT_REVOCATION_CHECK (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_REQUIRE_SSL_CLIENT_CERT (server side only)
//
//
  WS_SSL_TRANSPORT_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    localCertCredential : PWS_CERT_CREDENTIAL;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of the Windows
//  Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO)
//  with the TCP transport. A specific SSP package may be chosen using
//  the security binding property
//   WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE;
//  if that property is not specified, SPNEGO is used by default.  The use
//  of NTLM is strongly discouraged due to its security weakness
//  (specifically, lack of server authentication).  If NTLM is to be
//  allowed, the security binding property WS_SECURITY_BINDING_PROPERTY_REQUIRE_SERVER_AUTH
//   must be set to FALSE.
//
//   This security binding operates at the transport security level and is
//  supported only with the WS_TCP_CHANNEL_BINDING.  The
//  TCP/Windows SSPI combination uses the wire form defined by the
//   (http://msdn.microsoft.com/en-us/library/cc219293.aspx) NegotiateStream
//   protocol and the (http://msdn.microsoft.com/en-us/library/cc236723.aspx) .Net Message Framing specification.
//
//   On the client side, the security identity of the target server is
//  specified using the identity field of the WS_ENDPOINT_ADDRESS
//   parameter supplied during WsOpenChannel.  If the identity is a
//   WS_SPN_ENDPOINT_IDENTITY or a WS_UPN_ENDPOINT_IDENTITY,
//  that string identity value is used directly with the SSP.  If the identity is a
//   WS_DNS_ENDPOINT_IDENTITY and the value of its dns field is
//  'd1', or if no identity is specified in the WS_ENDPOINT_ADDRESS
//   and the host component (according to Section 3.2.2 of
//   (http://tools.ietf.org/html/rfc2396) RFC2396) the address URI
//  is 'd1', then the form 'host/d1' is used as the server SPN.
//  Specifying any other WS_ENDPOINT_IDENTITY subtype in
//   WS_ENDPOINT_ADDRESS will cause WsOpenChannel to fail.
//
//   With this security binding, the following security binding properties may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE
//  . WS_SECURITY_BINDING_PROPERTY_REQUIRE_SERVER_AUTH (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOW_ANONYMOUS_CLIENTS (server side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOWED_IMPERSONATION_LEVEL (client side only)
//
  WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of the Windows
//  Integrated Authentication protocol (such as Kerberos, NTLM or SPNEGO)
//  with the named pipe transport. A specific SSP package may be chosen using
//  the security binding property WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE;
//  if that property is not specified, SPNEGO is used by default.
//
//   This security binding operates at the transport security level and is
//  supported only with the WS_NAMEDPIPE_CHANNEL_BINDING.  The
//  NamedPipe/Windows SSPI combination uses the wire form defined by the
//   (http://msdn.microsoft.com/en-us/library/cc219293.aspx) NegotiateStream
//   protocol and the (http://msdn.microsoft.com/en-us/library/cc236723.aspx) .Net Message Framing specification.
//
//   On the client side, the security identity of the target server is
//  specified using the identity field of the WS_ENDPOINT_ADDRESS
//   parameter supplied during WsOpenChannel.
//
//   The (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding supports only this one transport security binding and does not support any message security bindings.
//
//   With this security binding, the following security binding properties may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE
//  . WS_SECURITY_BINDING_PROPERTY_REQUIRE_SERVER_AUTH (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOW_ANONYMOUS_CLIENTS (server side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOWED_IMPERSONATION_LEVEL (client side only)
//
  WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of HTTP header authentication against a target service or a HTTP proxy server
//  based on the basic, digest ( (http://tools.ietf.org/html/rfc2617) RFC 2617) and the SPNEGO ( (http://tools.ietf.org/html/rfc4559) RFC4559) protocols.
//  Since this security binding operates at the HTTP header level, it is supported only with the WS_HTTP_CHANNEL_BINDING.
//  By default, this security binding is used for the target service. However WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_TARGET
//   security binding property can be specified to use it for a HTTP proxy server. This binding provides client authentication, but not message protection
//  since the HTTP body is unaffected by this binding. While this security binding can be used alone, such usage is not recommended;
//  more typically, HTTP header authentication is done in conjunction with transport level security provided by a security binding such as the
//   WS_SSL_TRANSPORT_SECURITY_BINDING. To use this binding without SSL, the the security description property
//   WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL must be explicitly set to WS_PROTECTION_LEVEL_NONE.
//
//   With this security binding, the following security binding properties may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_SCHEME
//  . WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_TARGET (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_BASIC_REALM (server side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_REALM (server side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_DOMAIN (server side only)
//
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of the Kerberos
//  AP_REQ ticket as a direct (i.e., without establishing a session)
//  security token with WS-Security.
//
//   Only one instance of this binding may be present in a (WS_SECURITY_DESCRIPTION) security description.
//  This security binding is not supported with the (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding.
//
//   With this security binding, the following security binding properties may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOWED_IMPERSONATION_LEVEL (client side only)
//
//  . WS_SECURITY_BINDING_PROPERTY_ALLOW_ANONYMOUS_CLIENTS (server side only)
//
//   Client side on Vista and above, using this binding with HTTP will result in the message being sent using chunked transfer.
//
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of an application
//  supplied username / password pair as a direct (i.e., one-shot)
//  security token.  This security binding may be used only with message
//  security.  It provides client authentication, but not traffic signing
//  or encryption.  So, it is used in conjunction with another transport
//  security or message security binding that provides message protection.
//
//   Only one instance of this binding may be present in a (WS_SECURITY_DESCRIPTION) security description and
//  this security binding is not supported with the (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding.
//
//   With this security binding, no security binding properties may be specified.
//
  WS_USERNAME_MESSAGE_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    clientCredential : PWS_USERNAME_CREDENTIAL;
    passwordValidator : WS_VALIDATE_PASSWORD_CALLBACK;
    passwordValidatorCallbackState : pointer;
  end;


//  Security Description structure
//
//   The top-level structure used to specify the security requirements for
//  a (WsCreateChannel) channel (on the client side) or a
//   (WsCreateListener) listener (on the server side).
//
  WS_SECURITY_DESCRIPTION = record
    securityBindings : PPWS_SECURITY_BINDING;
    securityBindingCount : ULONG;
    properties : PWS_SECURITY_PROPERTY;
    propertyCount : ULONG;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of a security context
//  token negotiated between the client and server using
//  WS-SecureConversation. This security binding may be used only with
//  message security. It is used to establish a message-level security
//  context. Another set of one or more security bindings, specified in the
//  bootstrapSecurityDescription field, is used to the bootstrap the context.
//
//   Only one instance of this binding may be present in a (WS_SECURITY_DESCRIPTION) security description and
//  this security binding is not supported with the (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding.
//
//   When this binding is used, the channel must complete the receive of at least one
//  message before it can be used to send messages.
//
//   With this security binding, the following security binding properties may be specified:
//
//  . WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_SIZE
//  . WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_ENTROPY_MODE
//  . WS_SECURITY_BINDING_PROPERTY_MESSAGE_PROPERTIES
//  . WS_SECURITY_BINDING_PROPERTY_SECURE_CONVERSATION_VERSION
//  . WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_SUPPORT_RENEW
//  . WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_RENEWAL_INTERVAL
//  . WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_ROLLOVER_INTERVAL
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    bootstrapSecurityDescription : PWS_SECURITY_DESCRIPTION;
  end;


//  Security Context structure
//
//   Defines a property of a WS_SECURITY_CONTEXT
  WS_SECURITY_CONTEXT_PROPERTY = record
    id : WS_SECURITY_CONTEXT_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Security Channel Settings structure
//
//   Specifies a property for an XML security token.
//
  WS_XML_SECURITY_TOKEN_PROPERTY = record
    id : WS_XML_SECURITY_TOKEN_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of a security
//  token that is already available to the application in XML form.  The
//  security token that is supplied by the application in this binding is
//  presented to a service in a WS-Security header according to the
//  bindingUsage specified.  This security binding may be included in a
//   (WS_SECURITY_DESCRIPTION) security description only on the
//  client side.
//
//   This security binding is not supported with the (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding.
//
//   Although this binding can be used with any token available in XML
//  form, this is commonly used in (Federation) federation
//  scenarios.  For example, a client side token provider such as
//  CardSpace may be used to get a token from a security token service,
//  and that token may then be presented to a Web Service using this
//  security binding.
//
//   Security note: As with other security tokens and credentials, the
//  application is in charge of the risk assessment decision to disclose a
//  given XML token (supplied by the application in a
//   (WS_SECURITY_DESCRIPTION) security description) to a given
//  server (supplied by the application when
//   (WsOpenChannel) opening the channel).  In particular, the
//  application should consider the threat that the server might use the
//  XML token it receives from the client, in turn, to pretend to be the
//  client to a 3rd party.  For this threat, the following mitigations
//  exist: (A) the server authentication process makes sure that the
//  message (and hence the token) is sent only to a server that can speak
//  for the address specified by the client application; (B) keyless
//  (bearer) tokens are typically usable only at one server (e.g.,
//  contoso.com gains little from passing on a contoso.com
//  username/password token to another site -- the application security
//  design should make sure this property holds); (C) symmetric keyed
//  tokens are unusable at any server that doesn't share the same
//  symmetric key; (D) asymmetric keyed tokens will sign the timestamp and
//  the 'To' header, limiting their applicability to the intended 'To' for
//  a narrow time duration.
//
//   With this security binding, no security binding properties may be specified:
//
  WS_XML_TOKEN_MESSAGE_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    xmlToken : PWS_SECURITY_TOKEN;
  end;


//  Security Bindings structure
//
//   The abstract base type for all SAML authenticators used on the server
//  side to validate incoming SAML tokens.
//
  WS_SAML_AUTHENTICATOR = record
    authenticatorType : WS_SAML_AUTHENTICATOR_TYPE;
  end;


//  Security Bindings structure
//
//   The type for specifying a SAML token authenticator based on an array
//  of expected issuer certificates.  When an authenticator of this type
//  is used, an incoming SAML token will be accepted if only if it has a
//  valid XML signature created with any one of the specified X.509
//  certificates.  Thus, the specified X.509 certificates represent a
//  'allow list' of trusted SAML issuers.
//
//   No revocation or chain trust checks are done by the runtime on the
//  specified certificates: so, it is up to the application to make sure
//  that the certificates are valid before they are specified in this
//  structure.
//
//   As indicated above, the validation of the received SAML is limited to
//  making sure that it was signed correctly by one of the specified
//  certificates.  The application may then extract the SAML assertion
//  using WsGetMessageProperty with the key
//   WS_MESSAGE_PROPERTY_SAML_ASSERTION and do
//  additional validator or processing.
//
  WS_CERT_SIGNED_SAML_AUTHENTICATOR = record
    authenticator : WS_SAML_AUTHENTICATOR;
    trustedIssuerCerts : PPCCERT_CONTEXT;
    trustedIssuerCertCount : ULONG;
    decryptionCert : PCERT_CONTEXT;
    samlValidator : WS_VALIDATE_SAML_CALLBACK;
    samlValidatorCallbackState : pointer;
  end;


//  Security Bindings structure
//
//   The security binding subtype for specifying the use of a SAML
//  assertion as a message security token.  The SAML token is expected to
//  be presented to a service in a WS-Security header according to the
//  bindingUsage specified.  This security binding may be included in a
//   (WS_SECURITY_DESCRIPTION) security description only on the
//  server side.
//
//   Only one instance of this binding may be present in a (WS_SECURITY_DESCRIPTION) security description and
//  this security binding is not supported with the (WS_NAMEDPIPE_CHANNEL_BINDING) named pipe binding.
//
//   For a (Federation) federated security scenario that
//  involves getting a security token from an issuer and then presenting
//  it to a service, one may use WsRequestSecurityToken
//   together with the WS_XML_TOKEN_MESSAGE_SECURITY_BINDING on
//  the client side, and this binding on the server side.
//
//   The extent of validation performed on the received SAML depends on the
//  authenticator specified.  If additional validation is required, the
//  application may get the received SAML assertion using
//   WsGetMessageProperty with the key WS_MESSAGE_PROPERTY_SAML_ASSERTION
//   and do further processing.
//
//   With this security binding, no security binding properties may be specified:
//
  WS_SAML_MESSAGE_SECURITY_BINDING = record
    binding : WS_SECURITY_BINDING;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    authenticator : PWS_SAML_AUTHENTICATOR;
  end;


//  Security Channel Settings structure
//
//   Specifies a property for requesting a security token from an issuer.
//
  WS_REQUEST_SECURITY_TOKEN_PROPERTY = record
    id : WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Serialization structure
//
//   This type is used to store an attribute
//  that has not been directly mapped to a field.
//
  WS_ANY_ATTRIBUTE = record
    localName : WS_XML_STRING;
    ns : WS_XML_STRING;
    value : PWS_XML_TEXT;
  end;


//  Serialization structure
//
//   This type is used to store a set of attributes
//  that have not been directly mapped to field of
//  a structure.
//
  WS_ANY_ATTRIBUTES = record
    attributes : PWS_ANY_ATTRIBUTE;
    attributeCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_BOOL_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_BOOL_DESCRIPTION = record
    value : BOOL;
  end;


//  Serialization structure
//
//   This type description is used with WS_GUID_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_GUID_DESCRIPTION = record
    value : TGUID;
  end;


//  Serialization structure
//
//   This type description is used with WS_DATETIME_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
//   Only the ticks field of the WS_DATETIME is compared.
//
  WS_DATETIME_DESCRIPTION = record
    minValue : WS_DATETIME;
    maxValue : WS_DATETIME;
  end;


//  Utilities structure
//
//   Represents a (http://www.w3.org/TR/xmlschema-2/#duration) xsd:duration.
//
  WS_DURATION = record
    negative : BOOL;
    years : ULONG;
    months : ULONG;
    days : ULONG;
    hours : ULONG;
    minutes : ULONG;
    seconds : ULONG;
    milliseconds : ULONG;
    ticks : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_DURATION_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_DURATION_DESCRIPTION = record
    minValue : WS_DURATION;
    maxValue : WS_DURATION;
    comparer : WS_DURATION_COMPARISON_CALLBACK;
  end;


//  Serialization structure
//
//   This type description is used with WS_TIMESPAN_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_TIMESPAN_DESCRIPTION = record
    minValue : WS_TIMESPAN;
    maxValue : WS_TIMESPAN;
  end;


//  Serialization structure
//
//   This type description is used with WS_UNIQUE_ID_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UNIQUE_ID_DESCRIPTION = record
    minCharCount : ULONG;
    maxCharCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_STRING_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_STRING_DESCRIPTION = record
    minCharCount : ULONG;
    maxCharCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_XML_STRING_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_XML_STRING_DESCRIPTION = record
    minByteCount : ULONG;
    maxByteCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_XML_QNAME_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_XML_QNAME_DESCRIPTION = record
    minLocalNameByteCount : ULONG;
    maxLocalNameByteCount : ULONG;
    minNsByteCount : ULONG;
    maxNsByteCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_CHAR_ARRAY_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_CHAR_ARRAY_DESCRIPTION = record
    minCharCount : ULONG;
    maxCharCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_BYTE_ARRAY_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_BYTE_ARRAY_DESCRIPTION = record
    minByteCount : ULONG;
    maxByteCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_UTF8_ARRAY_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UTF8_ARRAY_DESCRIPTION = record
    minByteCount : ULONG;
    maxByteCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_WSZ_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_WSZ_DESCRIPTION = record
    minCharCount : ULONG;
    maxCharCount : ULONG;
  end;


//  Serialization structure
//
//   This type description is used with WS_INT8_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_INT8_DESCRIPTION = record
    minValue : ansichar;
    maxValue : ansichar;
  end;


//  Serialization structure
//
//   This type description is used with WS_UINT8_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UINT8_DESCRIPTION = record
    minValue : BYTE;
    maxValue : BYTE;
  end;


//  Serialization structure
//
//   This type description is used with WS_INT16_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_INT16_DESCRIPTION = record
    minValue : smallint;
    maxValue : smallint;
  end;


//  Serialization structure
//
//   This type description is used with WS_UINT16_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UINT16_DESCRIPTION = record
    minValue : word;
    maxValue : word;
  end;


//  Serialization structure
//
//   This type description is used with WS_INT32_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_INT32_DESCRIPTION = record
    minValue : longint;
    maxValue : longint;
  end;


//  Serialization structure
//
//   This type description is used with WS_UINT32_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UINT32_DESCRIPTION = record
    minValue : longword;
    maxValue : longword;
  end;


//  Serialization structure
//
//   This type description is used with WS_INT64_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_INT64_DESCRIPTION = record
    minValue : int64;
    maxValue : int64;
  end;


//  Serialization structure
//
//   This type description is used with WS_UINT64_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_UINT64_DESCRIPTION = record
    minValue : int64;    //Is there an unsigned Int64 in Delphi ?
    maxValue : int64;    //Is there an unsigned Int64 in Delphi ?
  end;


//  Serialization structure
//
//   This type description is used with WS_FLOAT_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_FLOAT_DESCRIPTION = record
    minValue : single;
    maxValue : single;
  end;


//  Serialization structure
//
//   This type description is used with WS_DOUBLE_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_DOUBLE_DESCRIPTION = record
    minValue : double;
    maxValue : double;
  end;


//  Serialization structure
//
//   This type description is used with WS_DECIMAL_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_DECIMAL_DESCRIPTION = record
    minValue : currency;  //not sure Delphi Currency is the same as C++ DECIMAL
    maxValue : currency;  //not sure Delphi Currency is the same as C++ DECIMAL
  end;


//  Serialization structure
//
//   This type description is used with WS_BYTES_TYPE and is optional.
//  It is used to specify constraints on the set of values
//  which can be deserialized.
//
  WS_BYTES_DESCRIPTION = record
    minByteCount : ULONG;
    maxByteCount : ULONG;
  end;


//  Serialization structure
//
//   Provides serialization information about a single value that
//  is part of an enumeration ( WS_ENUM_DESCRIPTION).
//
  WS_ENUM_VALUE = record
    value : integer;
    name : PWS_XML_STRING;
  end;


//  Serialization structure
//
//   This type description is used with WS_ENUM_TYPE and is required.
//  It provides information used in serializing and deserializing
//  values of an enumeration.
//
  WS_ENUM_DESCRIPTION = record
    values : PWS_ENUM_VALUE;
    valueCount : ULONG;
    maxByteCount : ULONG;
    nameIndices : PULONG;
  end;


//  Serialization structure
//
//   Defines the minimum and maximum number of items that may appear
//  when using WS_REPEATING_ELEMENT_FIELD_MAPPING,
//   WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING,
//  or WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING within
//  a WS_FIELD_DESCRIPTION.  The constraint is only
//  enforced during deserialization.
//
  WS_ITEM_RANGE = record
    minItemCount : ULONG;
    maxItemCount : ULONG;
  end;


//  Serialization structure
//
//   Defines a default value for a field.  This is used
//  in a WS_FIELD_DESCRIPTION.
//
  WS_DEFAULT_VALUE = record
    value : pointer;
    valueSize : ULONG;
  end;


//  Serialization structure
//
//   Used within a WS_STRUCT_DESCRIPTION to represent a field
//  of a structure that is mapped to XML content according to a particular
//   WS_FIELD_MAPPING.
//
  WS_FIELD_DESCRIPTION = record
    mapping : WS_FIELD_MAPPING;
    localName : PWS_XML_STRING;
    ns : PWS_XML_STRING;
    type_ : WS_TYPE;
    typeDescription : pointer;
    offset : ULONG;
    options : ULONG;
    defaultValue : PWS_DEFAULT_VALUE;
    countOffset : ULONG;
    itemLocalName : PWS_XML_STRING;
    itemNs : PWS_XML_STRING;
    itemRange : PWS_ITEM_RANGE;
  end;


//  Serialization structure
//
//   Represents serialization information about a field within a union.
//  See WS_UNION_DESCRIPTION.
//
  WS_UNION_FIELD_DESCRIPTION = record
    value : integer;
    field : WS_FIELD_DESCRIPTION;
  end;


//  Serialization structure
//
//   Information about C struct type, and how it maps to an XML element.
//  This is used with WS_STRUCT_TYPE.
//
  WS_STRUCT_DESCRIPTION = record
    size : ULONG;
    alignment : ULONG;
    fields : PPWS_FIELD_DESCRIPTION;
    fieldCount : ULONG;
    typeLocalName : PWS_XML_STRING;
    typeNs : PWS_XML_STRING;
    parentType : PWS_STRUCT_DESCRIPTION;
    subTypes : PPWS_STRUCT_DESCRIPTION;
    subTypeCount : ULONG;
    structOptions : ULONG;
  end;


//  Serialization structure
//
//   Information about the choices within a union type.
//  This is used with WS_UNION_TYPE.
//
  WS_UNION_DESCRIPTION = record
    size : ULONG;
    alignment : ULONG;
    fields : PPWS_UNION_FIELD_DESCRIPTION;
    fieldCount : ULONG;
    enumOffset : ULONG;
    noneEnumValue : integer;
    valueIndices : PULONG;
  end;


//  Serialization structure
//
//   Information about a mapping between an WS_ENDPOINT_ADDRESS
//   and an XML element.
//
  WS_ENDPOINT_ADDRESS_DESCRIPTION = record
    addressingVersion : WS_ADDRESSING_VERSION;
  end;


//  Serialization structure
//
//   Information about a mapping between an WS_FAULT and an XML element.
//
  WS_FAULT_DESCRIPTION = record
    envelopeVersion : WS_ENVELOPE_VERSION;
  end;


//  Serialization structure
//
//   Specifies information about a field which is neither serialized nor
//  deserialized.
//
//   This is used with WS_VOID_TYPE and WS_NO_FIELD_MAPPING
//   within a WS_FIELD_DESCRIPTION.
//
//   This type description is only required when WS_FIELD_POINTER is not
//  being used.
//
  WS_VOID_DESCRIPTION = record
    size : ULONG;
  end;


//  Serialization structure
//
//   Represents a custom mapping between a C data type and an XML element.
//  User-defined callbacks are invoked to do the actual reading and
//  writing.
//
  WS_CUSTOM_TYPE_DESCRIPTION = record
    size : ULONG;
    alignment : ULONG;
    readCallback : WS_READ_TYPE_CALLBACK;
    writeCallback : WS_WRITE_TYPE_CALLBACK;
    descriptionData : pointer;
    isDefaultValueCallback : WS_IS_DEFAULT_VALUE_CALLBACK;
  end;


//  Serialization structure
//
//   Represents a mapping between a C data type and an XML attribute.
//
  WS_ATTRIBUTE_DESCRIPTION = record
    attributeLocalName : PWS_XML_STRING;
    attributeNs : PWS_XML_STRING;
    type_ : WS_TYPE;
    typeDescription : pointer;
  end;


//  Service Operation structure
//
//   The index of the parameters in the incoming/outgoing messages field descriptions.
//
  WS_PARAMETER_DESCRIPTION = record
    parameterType : WS_PARAMETER_TYPE;
    inputMessageIndex : word;
    outputMessageIndex : word;
  end;


//  Service Operation structure
//
//   Metadata for the service operation.
//
  WS_OPERATION_DESCRIPTION = record
    versionInfo : ULONG;
    inputMessageDescription : PWS_MESSAGE_DESCRIPTION;
    outputMessageDescription : PWS_MESSAGE_DESCRIPTION;
    inputMessageOptions : ULONG;
    outputMessageOptions : ULONG;
    parameterCount : word;
    parameterDescription : PWS_PARAMETER_DESCRIPTION;
    stubCallback : WS_SERVICE_STUB_CALLBACK;
    style : WS_OPERATION_STYLE;
  end;


//  Contract structure
//
//   The metadata for a service contract for service model.
//
  WS_CONTRACT_DESCRIPTION = record
    operationCount : ULONG;
    operations : PPWS_OPERATION_DESCRIPTION;
  end;


//  Contract structure
//
//   Used to specify a service contract on an (WS_SERVICE_ENDPOINT) endpoint.
//
  WS_SERVICE_CONTRACT = record
    contractDescription : PWS_CONTRACT_DESCRIPTION;
    defaultMessageHandlerCallback : WS_SERVICE_MESSAGE_RECEIVE_CALLBACK;
    methodTable : pointer;
  end;


//  Service Host structure
//
//   Specifies a service specific setting.
//
  WS_SERVICE_PROPERTY = record
    id : WS_SERVICE_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Service Host structure
//
//   Specifies a service specific setting.
//
  WS_SERVICE_ENDPOINT_PROPERTY = record
    id : WS_SERVICE_ENDPOINT_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Service Host structure
//
//   Specifies the callback which is called when a channel is successfully accepted.
//
  WS_SERVICE_PROPERTY_ACCEPT_CALLBACK = record
    callback : WS_SERVICE_ACCEPT_CHANNEL_CALLBACK;
  end;


//  Service Metadata structure
//
//   Specifies the individual documents that make up the service metadata.
//
  WS_SERVICE_METADATA_DOCUMENT = record
    content : PWS_XML_STRING;
    name : PWS_STRING;
  end;


//  Service Metadata structure
//
//   Specifies the service metadata documents array. This can be a collection of
//  WSDL/XSD documents represented as an array of WS_STRING.
//
  WS_SERVICE_METADATA = record
    documentCount : ULONG;
    documents : PPWS_SERVICE_METADATA_DOCUMENT;
    serviceName : PWS_XML_STRING;
    serviceNs : PWS_XML_STRING;
  end;


//  Service Host structure
//
//   Specifies the callback which is called when a channel is about to be closed.
//  See, WS_SERVICE_CLOSE_CHANNEL_CALLBACK for details.
//
  WS_SERVICE_PROPERTY_CLOSE_CALLBACK = record
    callback : WS_SERVICE_CLOSE_CHANNEL_CALLBACK;
  end;


//  Service Metadata structure
//
//   Represents the port element for the endpoint. The port element is
//  generated for the service element as specified by serviceName and
//  serviceNs for WS_SERVICE_PROPERTY_METADATA property
//  on the WS_SERVICE_HOST.
//
//   Note, the port type will only be generated into the WSDL document if the service
//  element is indeed generated by the runtime.
//
  WS_SERVICE_ENDPOINT_METADATA = record
    portName : PWS_XML_STRING;
    bindingName : PWS_XML_STRING;
    bindingNs : PWS_XML_STRING;
  end;


//  Service Host structure
//
//   Represents an individual endpoint on a service host. The properties on the endpoint
//  are used to specify the address, binding and contract.
//
  WS_SERVICE_ENDPOINT = record
    address : WS_ENDPOINT_ADDRESS;
    channelBinding : WS_CHANNEL_BINDING;
    channelType : WS_CHANNEL_TYPE;
    securityDescription : PWS_SECURITY_DESCRIPTION;
    contract : PWS_SERVICE_CONTRACT;
    authorizationCallback : WS_SERVICE_SECURITY_CALLBACK;
    properties : PWS_SERVICE_ENDPOINT_PROPERTY;
    propertyCount : ULONG;
    channelProperties : WS_CHANNEL_PROPERTIES;
  end;


//  Service Proxy structure
//
//   Specifies a proxy property.
//
  WS_PROXY_PROPERTY = record
    id : WS_PROXY_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Service Proxy structure
//
//   Specifies the callback function and state for an application that wishes
//  to associate or inspect headers in an input or an output message respectively.
//
//   See also, WS_CALL_PROPERTY_SEND_MESSAGE_CONTEXT and
//   WS_CALL_PROPERTY_RECEIVE_MESSAGE_CONTEXT.
//
  WS_PROXY_MESSAGE_CALLBACK_CONTEXT = record
    callback : WS_PROXY_MESSAGE_CALLBACK;
    state : pointer;
  end;


//  Service Proxy structure
//
//   Specifies a proxy property.
//
  WS_CALL_PROPERTY = record
    id : WS_CALL_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Url structure
//
//   The abstract base type for all URL schemes used with WsDecodeUrl and WsEncodeUrl APIs.
//
  WS_URL = record
    scheme : WS_URL_SCHEME_TYPE;
  end;


//  Url structure
//
//   The URL subtype for specifying an http URL.
//
  WS_HTTP_URL = record
    url : WS_URL;
    host : WS_STRING;
    port : word;
    portAsString : WS_STRING;
    path : WS_STRING;
    query : WS_STRING;
    fragment : WS_STRING;
  end;


//  Url structure
//
//   The URL subtype for specifying an https URL.
//
  WS_HTTPS_URL = record
    url : WS_URL;
    host : WS_STRING;
    port : word;
    portAsString : WS_STRING;
    path : WS_STRING;
    query : WS_STRING;
    fragment : WS_STRING;
  end;


//  Url structure
//
//   The URL subtype for specifying an net.tcp URL.
//
  WS_NETTCP_URL = record
    url : WS_URL;
    host : WS_STRING;
    port : word;
    portAsString : WS_STRING;
    path : WS_STRING;
    query : WS_STRING;
    fragment : WS_STRING;
  end;


//  Url structure
//
//   The URL subtype for specifying an soap.udp URL.
//
  WS_SOAPUDP_URL = record
    url : WS_URL;
    host : WS_STRING;
    port : word;
    portAsString : WS_STRING;
    path : WS_STRING;
    query : WS_STRING;
    fragment : WS_STRING;
  end;


//  Url structure
//
//   The URL subtype for specifying a net.pipe URL.
//
  WS_NETPIPE_URL = record
    url : WS_URL;
    host : WS_STRING;
    port : word;
    portAsString : WS_STRING;
    path : WS_STRING;
    query : WS_STRING;
    fragment : WS_STRING;
  end;


//  Utilities structure
//
//   Represents a unique ID URI.
//
  WS_UNIQUE_ID = record
    uri : WS_STRING;
    guid : TGUID;
  end;


//  Utilities structure
//  A structure used to represent a discontiguous array of WS_BYTES.
  WS_BUFFERS = record
    bufferCount : ULONG;
    buffers : PWS_BYTES;
  end;


//  Metadata Import structure
//
//   Information about a single endpoint that was
//  read from metadata documents.
//
  WS_METADATA_ENDPOINT = record
    endpointAddress : WS_ENDPOINT_ADDRESS;
    endpointPolicy : PWS_POLICY;
    portName : PWS_XML_STRING;
    serviceName : PWS_XML_STRING;
    serviceNs : PWS_XML_STRING;
    bindingName : PWS_XML_STRING;
    bindingNs : PWS_XML_STRING;
    portTypeName : PWS_XML_STRING;
    portTypeNs : PWS_XML_STRING;
  end;


//  Metadata Import structure
//
//   Information about all endpoints that were
//  read from metadata documents.
//
  WS_METADATA_ENDPOINTS = record
    endpoints : PWS_METADATA_ENDPOINT;
    endpointCount : ULONG;
  end;


//  Metadata Import structure
//
//   Specifies a metadata object setting.
//
  WS_METADATA_PROPERTY = record
    id : WS_METADATA_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Metadata Import structure
//
//   Specifies a policy object setting.
//
  WS_POLICY_PROPERTY = record
    id : WS_POLICY_PROPERTY_ID;
    value : pointer;
    valueSize : ULONG;
  end;


//  Metadata Import structure
//
//   A structure that is used to specify a set of WS_POLICY_PROPERTYs.
//
  WS_POLICY_PROPERTIES = record
    properties : PWS_POLICY_PROPERTY;
    propertyCount : ULONG;
  end;


//  Metadata Import structure
//
//   This structure is used to specify a set of constraints
//  for a particular security binding property.
//  Any property constraints that are not specified will use
//  the default constraints.
//
  WS_SECURITY_BINDING_PROPERTY_CONSTRAINT = record
    id : WS_SECURITY_BINDING_PROPERTY_ID;
    allowedValues : pointer;
    allowedValuesSize : ULONG;
    securityBindingProperty : WS_SECURITY_BINDING_PROPERTY;
  end;


//  Metadata Import structure
//
//   The base class for all security binding constraint structures.
//
  WS_SECURITY_BINDING_CONSTRAINT = record
    type_ : WS_SECURITY_BINDING_CONSTRAINT_TYPE;
    propertyConstraints : PWS_SECURITY_BINDING_PROPERTY_CONSTRAINT;
    propertyConstraintCount : ULONG;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to the
//   WS_SSL_TRANSPORT_SECURITY_BINDING.
//
  WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    clientCertCredentialRequired : BOOL;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to the
//   WS_USERNAME_MESSAGE_SECURITY_BINDING.
//
  WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to the
//   WS_HTTP_HEADER_AUTH_SECURITY_BINDING.
//
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to the
//   WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING.
//
  WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
  end;


//  Metadata Import structure
//
//   A security binding constraint that can be used with
//   WS_XML_TOKEN_MESSAGE_SECURITY_BINDING.
//
  WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to the
//   WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING.
//
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;

//  Metadata Import structure
//
//   This structure is used to specify a set of constraints
//  for a particular request security token property.
//  Any property constraints that are not specified will use
//  the default constraints.
//
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT = record
    id : WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID;
    allowedValues : pointer;
    allowedValuesSize : ULONG;
    requestSecurityTokenProperty : WS_REQUEST_SECURITY_TOKEN_PROPERTY;
  end;


//  Metadata Import structure
//
//   A security binding constraint that can be used to extract information
//  about how to obtain an issued token from an issuing party.
//
  WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    claimConstraints : PWS_XML_STRING;
    claimConstraintCount : ULONG;
    requestSecurityTokenPropertyConstraints : PWS_REQUEST_SECURITY_TOKEN_PROPERTY_CONSTRAINT;
    requestSecurityTokenPropertyConstraintCount : ULONG;
    issuerAddress : PWS_ENDPOINT_ADDRESS;
    requestSecurityTokenTemplate : PWS_XML_BUFFER;
  end;


//  Metadata Import structure
//
//   This structure is used to specify a set of constraints
//  for a particular security property.
//  Any property constraints that are not specified will use
//  the default constraints.
//
  WS_SECURITY_PROPERTY_CONSTRAINT = record
    id : WS_SECURITY_PROPERTY_ID;
    allowedValues : pointer;
    allowedValuesSize : ULONG;
    securityProperty : WS_SECURITY_PROPERTY;
  end;


//  Metadata Import structure
//
//   This structure specifies the security related constraints
//  as part of WS_POLICY_CONSTRAINTS.
//
  WS_SECURITY_CONSTRAINTS = record
    securityPropertyConstraints : PWS_SECURITY_PROPERTY_CONSTRAINT;
    securityPropertyConstraintCount : ULONG;
    securityBindingConstraints : PPWS_SECURITY_BINDING_CONSTRAINT;
    securityBindingConstraintCount : ULONG;
  end;


//  Metadata Import structure
//
//   A security binding constraint that corresponds to
//  the WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING.
//
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT = record
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
    bootstrapSecurityConstraint : PWS_SECURITY_CONSTRAINTS;
  end;


//  Metadata Import structure
//
//   This structure is used to specify a set of constraints
//  for a particular channel property.
//  Any property constraints that are not specified will use
//  the default constraints.
//
  WS_CHANNEL_PROPERTY_CONSTRAINT = record
    id : WS_CHANNEL_PROPERTY_ID;
    allowedValues : pointer;
    allowedValuesSize : ULONG;
    channelProperty : WS_CHANNEL_PROPERTY;
  end;


//  Metadata Import structure
//
//   The base class for all policy extension structures. Policy extensions
//  are assertions that are directly handled by applications such as custom assertions.
//
  WS_POLICY_EXTENSION = record
    type_ : WS_POLICY_EXTENSION_TYPE;
  end;


//  Metadata Import structure
//
//   This structure is used to specify an endpoint policy extension.
//
  WS_ENDPOINT_POLICY_EXTENSION = record
    policyExtension : WS_POLICY_EXTENSION;
    assertionName : PWS_XML_STRING;
    assertionNs : PWS_XML_STRING;
    assertionValue : PWS_XML_BUFFER;
  end;


//  Metadata Import structure
//
//   This structure is used to specify policy constraints for a channel.
//
  WS_POLICY_CONSTRAINTS = record
    channelBinding : WS_CHANNEL_BINDING;
    channelPropertyConstraints : PWS_CHANNEL_PROPERTY_CONSTRAINT;
    channelPropertyConstraintCount : ULONG;
    securityConstraints : PWS_SECURITY_CONSTRAINTS;
    policyExtensions : PPWS_POLICY_EXTENSION;
    policyExtensionCount : ULONG;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding.
//
  WS_HTTP_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
//   See also,
//   WsCreateServiceProxyFromTemplate,
//   WsCreateServiceEndpointFromTemplate
  WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding.
//
  WS_HTTP_SSL_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
//   See also,
//   WsCreateServiceProxyFromTemplate,
//   WsCreateServiceEndpointFromTemplate
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding.
//
  WS_HTTP_HEADER_AUTH_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    httpHeaderAuthSecurityBinding : WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding with SSL transport security and
//  header authentication.
//
  WS_HTTP_SSL_HEADER_AUTH_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    httpHeaderAuthSecurityBinding : WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
//   See also,
//   WsCreateServiceProxyFromTemplate,
//   WsCreateServiceEndpointFromTemplate
  WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding with SSL transport security and
//  username/password message security.
//
  WS_HTTP_SSL_USERNAME_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
//   See also,
//   WsCreateServiceProxyFromTemplate,
//   WsCreateServiceEndpointFromTemplate
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding with SSL transport security
//  and KERBEROS AP_REQ message security.
//
  WS_HTTP_SSL_KERBEROS_APREQ_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying http channel binding.
//
  WS_TCP_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
//   See also,
//   WsCreateServiceProxyFromTemplate,
//   WsCreateServiceEndpointFromTemplate
  WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
  end;


//  Policy Support structure
//
//   Describes the policy specifying TCP channel binding with windows SSPI.
//
  WS_TCP_SSPI_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying TCP channel binding with windows SSPI transport
//  security and username/password message security.
//
  WS_TCP_SSPI_USERNAME_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying TCP channel binding with windows SSPI transport
//  security, and kerberos message security.
//
  WS_TCP_SSPI_KERBEROS_APREQ_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the templates generated accordingly to input policy setting.
//
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    bindingUsage : WS_MESSAGE_SECURITY_USAGE;
  end;


//  Policy Support structure
//
//   This type description is used with template APIs to describe
//  the security context related templates generated accordingly to input policy setting.
//
  WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION = record
    securityContextMessageSecurityBinding : WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
    securityProperties : WS_SECURITY_PROPERTIES;
  end;


//  Policy Support structure
//
//   Describes the policy specifying security context message binding using TCP channel binding
//  with windows SSPI transport security. The bootstrap channel uses TCP channel binding with
//  windows SSPI transport security and kerberos message security.
//
  WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying security context message binding using TCP channel binding with windows SSPI transport
//  security. The bootstrap channel uses TCP channel binding with windows SSPI transport
//  security and username/password message security.
//
  WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_SSPI_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying security context message binding over http channel binding, with SSL
//  transport security. The bootstrap channel uses http channel binding with SSL transport security
//  and username/password message security.
//
  WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   Describes the policy specifying security context message binding over http channel binding, with SSL
//  transport security. The bootstrap channel uses http channel binding with SSL transport security
//  and KERBEROS AP_REQ message security.
//
  WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_POLICY_DESCRIPTION;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION;
  end;


//  Policy Support structure
//
//   HTTP template structure to be filled in by application for http binding.
//
  WS_HTTP_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
  end;


//  Policy Support structure
//
//   TCP template structure to be filled in by application for TCP binding.
//
  WS_TCP_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of SSL/TLS
//  protocol based transport security.
//  See Also WS_SSL_TRANSPORT_SECURITY_BINDING
//   This security binding is supported only with WS_HTTP_CHANNEL_BINDING.
//
  WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    localCertCredential : PWS_CERT_CREDENTIAL;
  end;


//  Policy Support structure
//
//   SSL security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of HTP header authentication
//  protocol based security.
//  See also WS_HTTP_HEADER_AUTH_SECURITY_BINDING
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Policy Support structure
//
//   HTTP header authentication security template information to be filled in by application.
//  Associated with WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    httpHeaderAuthSecurityBinding : WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of Windows SSPI
//  protocol based transport security.
//
//   See also WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING.
//
  WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Policy Support structure
//
//   HTTP header authentication security template information to be filled in by application.
//  Associated with WS_TCP_SSPI_BINDING_TEMPLATE_TYPE.
//
  WS_TCP_SSPI_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Username/password security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    httpHeaderAuthSecurityBinding : WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of an application
//  supplied username / password pair as a direct (i.e., one-shot)
//  security token.  This security binding may be used only with message
//  security.  It provides client authentication, but not traffic signing
//  or encryption.  So, it is used in conjunction with another transport
//  security or message security binding that provides message protection.
//  See also WS_USERNAME_MESSAGE_SECURITY_BINDING
//
  WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    clientCredential : PWS_USERNAME_CREDENTIAL;
    passwordValidator : WS_VALIDATE_PASSWORD_CALLBACK;
    passwordValidatorCallbackState : pointer;
  end;


//  Policy Support structure
//
//   Username/password security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of the Kerberos
//  AP_REQ ticket as a direct (i.e., without establishing a session)
//  security token with WS-Security.
//  See also WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING
//
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
    clientCredential : PWS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL;
  end;


//  Policy Support structure
//
//   Username/password security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Username/password security template information to be filled in by application.
//  Associated with WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE.
//
  WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Username/password security template information to be filled in by application.
//  Associated with WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE.
//
  WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of an application
//  supplied security context security binding.  This security binding may
//  be used only with message security. So, it is used in conjunction with another transport
//  security or message security binding that provides message protection.
//
//   See also WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE = record
    securityBindingProperties : WS_SECURITY_BINDING_PROPERTIES;
  end;


//  Policy Support structure
//
//   The security binding template for specifying the use of an application
//  supplied security context security binding.  This security binding may
//  be used only with message security. So, it is used in conjunction with another transport
//  security binding that provides message protection. The security properties are
//  used to establish the secure conversation.
//
//   See also WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING
//
  WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE = record
    securityContextMessageSecurityBinding : WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE;
    securityProperties : WS_SECURITY_PROPERTIES;
  end;


//  Policy Support structure
//
//   Security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Security template information to be filled in by application.
//  Associated with WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE.
//
  WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sslTransportSecurityBinding : WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Security template information to be filled in by application.
//  Associated with WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE.
//
  WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    usernameMessageSecurityBinding : WS_USERNAME_MESSAGE_SECURITY_BINDING_TEMPLATE;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE;
  end;


//  Policy Support structure
//
//   Security template information to be filled in by application.
//  Associated with WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE.
//
  WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE = record
    channelProperties : WS_CHANNEL_PROPERTIES;
    securityProperties : WS_SECURITY_PROPERTIES;
    sspiTransportSecurityBinding : WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE;
    kerberosApreqMessageSecurityBinding : WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE;
    securityContextSecurityBinding : WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE;
  end;


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
//   Sets the reader to use a specified xml buffer as the input source.
//
function WsSetInputToBuffer(reader : PWS_XML_READER;
                            buffer : PWS_XML_BUFFER;
                            properties : PWS_XML_READER_PROPERTY;
                            propertyCount : ULONG;
                            error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Releases the memory associated with the WS_XML_READER object.
//
procedure WsFreeReader(reader : PWS_XML_READER); stdcall;


//  XML Reader function
//  Returns a property of the specified xml reader.
function WsGetReaderProperty(reader : PWS_XML_READER;
                             id : WS_XML_READER_PROPERTY_ID;
                             value : pointer;
                             valueSize : ULONG;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Returns the (WS_XML_NODE) node that the (WS_XML_READER) reader is currently positioned on.
//
function WsGetReaderNode(xmlReader : PWS_XML_READER;
                         node : PPWS_XML_NODE;
                         error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Ensures that the reader has at least a specified amount of data available to it for reading.
//
function WsFillReader(reader : PWS_XML_READER;
                      minSize : ULONG;
                      asyncContext : PWS_ASYNC_CONTEXT;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Advances the reader past a start element skipping any whitespace in front of it.
//
function WsReadStartElement(reader : PWS_XML_READER;
                            error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Advances the reader to the next start element skipping whitespace and comments if necessary.  Optionally,
//  it may also verify the localName and namespace of the element.
//
function WsReadToStartElement(reader : PWS_XML_READER;
                              localName : PWS_XML_STRING;
                              ns : PWS_XML_STRING;
                              found : PBOOL;
                              error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Moves the reader to the specified attribute so that its content may be read using ReadValue, ReadChars, or ReadBytes.
//
function WsReadStartAttribute(reader : PWS_XML_READER;
                              attributeIndex : ULONG;
                              error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Moves the reader back to the element node containing the attribute that was read.
//
function WsReadEndAttribute(reader : PWS_XML_READER;
                            error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Advances the reader to the next (WS_XML_NODE) node in the input stream.
//
function WsReadNode(reader : PWS_XML_READER;
                    error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Advances the reader in the input stream.  If the current node is an element,
//  all of the children of that element are skipped, and the reader is positioned
//  on the node following its end element.  Otherwise, the reader is positioned
//  on the next node in the same manner as WsReadNode.
//
function WsSkipNode(reader : PWS_XML_READER;
                    error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Checks that the current (WS_XML_NODE) node of reader is an end element,
//  and advances the reader to the next (WS_XML_NODE) node.
//
function WsReadEndElement(reader : PWS_XML_READER;
                          error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Searches the attributes of the current element for an attribute with the
//  specified name and namespace and returns its index which may be passed
//  to WsReadStartAttribute.
//
function WsFindAttribute(reader : PWS_XML_READER;
                         localName : PWS_XML_STRING;
                         ns : PWS_XML_STRING;
                         required : BOOL;
                         attributeIndex : PULONG;
                         error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads text from the reader and parses it according to the specified value type.
//
function WsReadValue(reader : PWS_XML_READER;
                     valueType : WS_VALUE_TYPE;
                     value : pointer;
                     valueSize : ULONG;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads a specified number of text characters from the reader.
//
function WsReadChars(reader : PWS_XML_READER;
                     chars : PWideChar;
                     maxCharCount : ULONG;
                     actualCharCount : PULONG;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads a specified number of text characters from the reader and returns them encoded in UTF-8.
//
function WsReadCharsUtf8(reader : PWS_XML_READER;
                         bytes : PByte;
                         maxByteCount : ULONG;
                         actualByteCount : PULONG;
                         error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads text from the reader and decodes the characters as bytes according to the base64 specification.
//
function WsReadBytes(reader : PWS_XML_READER;
                     bytes : pointer;
                     maxByteCount : ULONG;
                     actualByteCount : PULONG;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads a series of elements from the reader and interprets their
//  content according to the specified value type.
//
function WsReadArray(reader : PWS_XML_READER;
                     localName : PWS_XML_STRING;
                     ns : PWS_XML_STRING;
                     valueType: WS_VALUE_TYPE;
                     array_ : pointer;    //array is a reserved word in Pascal
                     arraySize : ULONG;
                     itemOffset : ULONG;
                     itemCount : ULONG;
                     actualItemCount : PULONG;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Returns the current position of the reader.  This can only be used on a reader
//  that is set to an XmlBuffer.
//
function WsGetReaderPosition(reader : PWS_XML_READER;
                             nodePosition : PWS_XML_NODE_POSITION;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Sets the current position of the reader.  The position must have been obtained by a call to
//   WsGetReaderPosition or WsGetWriterPosition.
//
function WsSetReaderPosition(reader : PWS_XML_READER;
                             nodePosition : PWS_XML_NODE_POSITION;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Moves the current position of the reader as specified by the moveTo parameter.
//
function WsMoveReader(reader : PWS_XML_READER;
                      moveTo : WS_MOVE_TO;
                      found : PBOOL;
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


//  XML Writer function
//
//   Sets the encoding and output callbacks for the writer.  The callbacks are used to
//  provides buffers to the writer and to perform asynchronous i/o.
//
function WsSetOutput(writer : PWS_XML_WRITER;
                     encoding : PWS_XML_WRITER_ENCODING;
                     output : PWS_XML_WRITER_OUTPUT;
                     properties : PWS_XML_WRITER_PROPERTY;
                     propertyCount : ULONG;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Sets the writer to emit xml data at the end of the specified buffer.
//
function WsSetOutputToBuffer(writer : PWS_XML_WRITER;
                             buffer : PWS_XML_BUFFER;
                             properties : PWS_XML_WRITER_PROPERTY;
                             propertyCount : ULONG;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//  Returns a property of the specified xml writer.
function WsGetWriterProperty(writer : PWS_XML_WRITER;
                             id : WS_XML_WRITER_PROPERTY_ID;
                             value : pointer;
                             valueSize : ULONG;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Instructs the writer to invoke the (WS_WRITE_CALLBACK) callback
//   specified in WS_XML_WRITER_STREAM_OUTPUT if sufficient data has been buffered.
//
function WsFlushWriter(writer : PWS_XML_WRITER;
                       minSize : ULONG;
                       asyncContext : PWS_ASYNC_CONTEXT;
                       error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes a start element to the writer.
//
function WsWriteStartElement(writer : PWS_XML_WRITER;
                             prefix : PWS_XML_STRING;
                             localName : PWS_XML_STRING;
                             ns : PWS_XML_STRING;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Forces the writer to commit the current element and prevent further attributes
//  from being written to the element.
//
function WsWriteEndStartElement(writer : PWS_XML_WRITER;
                                error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes an xmlns attribute to the current element.
//
function WsWriteXmlnsAttribute(writer : PWS_XML_WRITER;
                               prefix : PWS_XML_STRING;
                               ns : PWS_XML_STRING;
                               singleQuote : BOOL;
                               error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Starts writing an attribute to the current element.
//
function WsWriteStartAttribute(writer : PWS_XML_WRITER;
                               prefix : PWS_XML_STRING;
                               localName : PWS_XML_STRING;
                               ns : PWS_XML_STRING;
                               singleQuote : BOOL;
                               error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Finishes writing an attribute to the current element.
//
function WsWriteEndAttribute(writer : PWS_XML_WRITER;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes a primitive value to the writer.
//
function WsWriteValue(writer : PWS_XML_WRITER;
                      valueType : WS_VALUE_TYPE;
                      value : pointer;
                      valueSize : ULONG;
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


//  XML Writer function
//
//   Writes a series of elements to the writer.
//
function WsWriteArray(writer : PWS_XML_WRITER;
                      localName : PWS_XML_STRING;
                      ns : PWS_XML_STRING;
                      valueType : WS_VALUE_TYPE;
                      array_ : pointer;   //array is a reserved word in Pascal
                      arraySize : ULONG;
                      itemOffset : ULONG;
                      itemCount : ULONG;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes an xml qualified name to the writer.
//
function WsWriteQualifiedName(writer : PWS_XML_WRITER;
                              prefix : PWS_XML_STRING;
                              localName : PWS_XML_STRING;
                              ns : PWS_XML_STRING;
                              error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes a series of characters to an element or attribute.
//
function WsWriteChars(writer : PWS_XML_WRITER;
                      chars : PWideChar;
                      charCount : ULONG;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes a series of characters encoded as UTF-8 to an element or attribute.
//
function WsWriteCharsUtf8(writer : PWS_XML_WRITER;
                          bytes : PByte;
                          byteCount : ULONG;
                          error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes bytes to the writer in a format optimized for the encoding.  When writing
//  in a text encoding, it will emit the bytes encoded in base64.  When writing to
//  a binary format, it will emit the bytes directly.
//
function WsWriteBytes(writer : PWS_XML_WRITER;
                      bytes : pointer;
                      byteCount : ULONG;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Sets up a callback to be invoked to write bytes within an element.  In some encodings this can
//  be more efficient by eliminating a copy of the data.
//
function WsPushBytes(writer : PWS_XML_WRITER;
                     callback : WS_PUSH_BYTES_CALLBACK;
                     callbackState : pointer;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Sets up a callback to be invoked to obtain the bytes to be written within an element.
//  In some encodings this can be more efficient by eliminating a copy of the data.
//
function WsPullBytes(writer : PWS_XML_WRITER;
                     callback : WS_PULL_BYTES_CALLBACK;
                     callbackState : pointer;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes an end element to the writer.
//
function WsWriteEndElement(writer : PWS_XML_WRITER;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes the specified text the XML writer.
//
function WsWriteText(writer : PWS_XML_WRITER;
                     text : PWS_XML_TEXT;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Starts a CDATA section in the writer.
//
function WsWriteStartCData(writer : PWS_XML_WRITER;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Ends a CDATA section in the writer.
//
function WsWriteEndCData(writer : PWS_XML_WRITER;
                         error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Writes the specified node to the XML Writer.
//
function WsWriteNode(writer : PWS_XML_WRITER;
                     node : PWS_XML_NODE;
                     error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Returns a prefix to which the namespace is bound.
//
function WsGetPrefixFromNamespace(writer : PWS_XML_WRITER;
                                  ns : PWS_XML_STRING;
                                  required : BOOL;
                                  prefix :PPWS_XML_STRING;
                                  error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Returns the current position of the writer.  This can only be used on a
//  writer that is set to an XmlBuffer. When writing to a buffer, the position
//  represents the xml node before which new data will be placed.
//
function WsGetWriterPosition(writer : PWS_XML_WRITER;
                             nodePosition : PWS_XML_NODE_POSITION;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Sets the current position of the writer.  The position must have been obtained by a
//  call to WsGetReaderPosition or WsGetWriterPosition.
//
function WsSetWriterPosition(writer : PWS_XML_WRITER;
                             nodePosition : PWS_XML_NODE_POSITION;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Moves the current position of the writer as specified by the moveTo parameter.
//
function WsMoveWriter(writer : PWS_XML_WRITER;
                      moveTo : WS_MOVE_TO;
                      found : PBOOL;
                      error : PWS_ERROR):HRESULT; stdcall;


//  XML Node function
//
//   Removes leading and trailing whitespace from a sequence of characters.
//
function WsTrimXmlWhitespace(chars : PWideChar;
                             charCount : ULONG;
                             trimmedChars : PPWideChar;
                             trimmedCount : PULONG;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Node function
//
//   Verifies whether the input string is a valid XML NCName.
//
function WsVerifyXmlNCName(ncNameChars : PWideChar;
                           ncNameCharCount : ULONG;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Node function
//
//   Compares two WS_XML_STRING's for equality by performing an ordinal comparison
//  of the character values.
//
function WsXmlStringEquals(string1 : PWS_XML_STRING;
                           string2 : PWS_XML_STRING;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Returns the namespace to which the prefix is bound.
//
function WsGetNamespaceFromPrefix(reader : PWS_XML_READER;
                                  prefix : PWS_XML_STRING;
                                  required : BOOL;
                                  ns : PPWS_XML_STRING;
                                  error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Reads a qualified name and separates it into its prefix, localName
//  and namespace based on the current namespace scope of the XML_READER.
//  If the ns parameter is specified, then the namespace that the prefix
//  is bound to will be returned, or WS_E_INVALID_FORMAT
//   will be returned. The strings are placed in the specified heap.
//
function WsReadQualifiedName(reader : PWS_XML_READER;
                             heap : PWS_HEAP;
                             prefix : PWS_XML_STRING;
                             localName : PWS_XML_STRING;
                             ns : PWS_XML_STRING;
                             error : PWS_ERROR):HRESULT; stdcall;


//  XML Reader function
//
//   Finds the nearest xml attribute in scope with the specified localName and returns its value.
//  The returned value is placed on the specified heap.
//
function WsGetXmlAttribute(reader : PWS_XML_READER;
                           localName : PWS_XML_STRING;
                           heap : PWS_HEAP;
                           valueChars : PPWideChar;
                           valueCharCount : PULONG;
                           error : PWS_ERROR):HRESULT; stdcall;


//  XML Writer function
//
//   Copies the current node from the specified reader to the specified writer.
//
function WsCopyNode(writer : PWS_XML_WRITER;
                    reader : PWS_XML_READER;
                    error : PWS_ERROR):HRESULT; stdcall;


//  Async Model function
//
//   WsAsyncExecute is a helper that can be used to implement an asynchronous operation.
//
function WsAsyncExecute(asyncState : PWS_ASYNC_STATE;
                        operation : WS_ASYNC_FUNCTION;
                        callbackModel : WS_CALLBACK_MODEL;
                        callbackState : pointer;
                        asyncContext : PWS_ASYNC_CONTEXT;
                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Create a channel used to initiate a message exchange to some endpoint.
//
function WsCreateChannel(channelType : WS_CHANNEL_TYPE;
                         channelBinding : WS_CHANNEL_BINDING;
                         properties : PWS_CHANNEL_PROPERTY;
                         propertyCount : ULONG;
                         securityDescription : PWS_SECURITY_DESCRIPTION;
                         channel : PPWS_CHANNEL;
                         error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Open a channel to an endpoint.
//
function WsOpenChannel(channel : PWS_CHANNEL;
                       endpointAddress : PWS_ENDPOINT_ADDRESS;
                       asyncContext : PWS_ASYNC_CONTEXT;
                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Send a message on a channel using serialization to write the body element.
//
function WsSendMessage(channel : PWS_CHANNEL;
                       message_ : PWS_MESSAGE;
                       messageDescription : PWS_MESSAGE_DESCRIPTION;
                       writeOption : WS_WRITE_OPTION;
                       bodyValue : pointer;
                       bodyValueSize : ULONG;
                       asyncContext : PWS_ASYNC_CONTEXT;
                       error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Receive a message and deserialize the body of the message as a value.
//
function WsReceiveMessage(channel : PWS_CHANNEL;
                          message_ : PWS_MESSAGE;
                          messageDescriptions : PPWS_MESSAGE_DESCRIPTION;
                          messageDescriptionCount : ULONG;
                          receiveOption : WS_RECEIVE_OPTION;
                          readBodyOption : WS_READ_OPTION;
                          heap : PWS_HEAP;
                          value : pointer;
                          valueSize : ULONG;
                          index : PULONG;
                          asyncContext : PWS_ASYNC_CONTEXT;
                          error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Used to send a request message and receive a correlated reply message.
//
function WsRequestReply(channel : PWS_CHANNEL;
                        requestMessage : PWS_MESSAGE;
                        requestMessageDescription : PWS_MESSAGE_DESCRIPTION;
                        writeOption : WS_WRITE_OPTION;
                        requestBodyValue : pointer;
                        requestBodyValueSize : ULONG;
                        replyMessage : PWS_MESSAGE;
                        replyMessageDescription : PWS_MESSAGE_DESCRIPTION;
                        readOption : WS_READ_OPTION;
                        heap : PWS_HEAP;
                        value : pointer;
                        valueSize : ULONG;
                        asyncContext : PWS_ASYNC_CONTEXT;
                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Sends a message which is a reply to a received message.
//
function WsSendReplyMessage(channel : PWS_CHANNEL;
                            replyMessage : PWS_MESSAGE;
                            replyMessageDescription : PWS_MESSAGE_DESCRIPTION;
                            writeOption : WS_WRITE_OPTION;
                            replyBodyValue : pointer;
                            replyBodyValueSize : ULONG;
                            requestMessage : PWS_MESSAGE;
                            asyncContext : PWS_ASYNC_CONTEXT;
                            error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Sends a fault message given a WS_ERROR object.
//
function WsSendFaultMessageForError(channel : PWS_CHANNEL;
                                    replyMessage : PWS_MESSAGE;
                                    faultError : PWS_ERROR;
                                    faultErrorCode : HRESULT;
                                    faultDisclosure : WS_FAULT_DISCLOSURE;
                                    requestMessage : PWS_MESSAGE;
                                    asyncContext : PWS_ASYNC_CONTEXT;
                                    error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Retrieve a property of the channel.
//
function WsGetChannelProperty(channel : PWS_CHANNEL;
                              id : WS_CHANNEL_PROPERTY_ID;
                              value : pointer;
                              valueSize : ULONG;
                              error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Set a property of the channel.
//
function WsSetChannelProperty(channel : PWS_CHANNEL;
                              id : WS_CHANNEL_PROPERTY_ID;
                              value : pointer;
                              valueSize : ULONG;
                              error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Write out all the headers of the message to the channel, and prepare to write the body elements.
//
function WsWriteMessageStart(channel : PWS_CHANNEL;
                             message_ : PWS_MESSAGE;
                             asyncContext : PWS_ASYNC_CONTEXT;
                             error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Write the closing elements of the message to the channel.
//
function WsWriteMessageEnd(channel : PWS_CHANNEL;
                           message_ : PWS_MESSAGE;
                           asyncContext : PWS_ASYNC_CONTEXT;
                           error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Read the headers of the next message from the channel, and prepare to read the body elements.
//
function WsReadMessageStart(channel : PWS_CHANNEL;
                            message_ : PWS_MESSAGE;
                            asyncContext : PWS_ASYNC_CONTEXT;
                            error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Read the closing elements of a message from a channel.
//
function WsReadMessageEnd(channel : PWS_CHANNEL;
                          message_ : PWS_MESSAGE;
                          asyncContext : PWS_ASYNC_CONTEXT;
                          error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Close a channel.
//
function WsCloseChannel(channel : PWS_CHANNEL;
                        asyncContext : PWS_ASYNC_CONTEXT;
                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Abort all pending IO for a channel.
//
function WsAbortChannel(channel : PWS_CHANNEL;
                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Free a channel.
//
procedure WsFreeChannel(channel : PWS_CHANNEL); stdcall;


//  Channel function
//
//   Reset a channel so it can be reused.
//
function WsResetChannel(channel : PWS_CHANNEL;
                        error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Used to skip the remainder of a message for a channel.
//
function WsAbandonMessage(channel : PWS_CHANNEL;
                          message_ : PWS_MESSAGE;
                          error : PWS_ERROR):HRESULT; stdcall;


//  Channel function
//
//   Used to signal the end of messages for a session channel.
//
function WsShutdownSessionChannel(channel : PWS_CHANNEL;
                                  asyncContext : PWS_ASYNC_CONTEXT;
                                  error : PWS_ERROR):HRESULT; stdcall;


//  Context function
//
//   Returns a property of the specified operation context. It should be noted that the
//  validity of these property is limited to the lifetime of the operation context itself.
//  See Operation Context Lifetime and Threading for details around accessing
//  these properties and the lifetime of the operation context.
//
function WsGetOperationContextProperty(context : PWS_OPERATION_CONTEXT;
                                       id : WS_OPERATION_CONTEXT_PROPERTY_ID;
                                       value : pointer;
                                       valueSize : ULONG;
                                       error : PWS_ERROR):HRESULT; stdcall;


function WsGetDictionary(encoding : WS_ENCODING;
                         dictionary : PPWS_XML_DICTIONARY;
                         error : PWS_ERROR):HRESULT; stdcall;


//  Message function
//
//   Reads an extension of the WS_ENDPOINT_ADDRESS.
//
function WsReadEndpointAddressExtension(reader : PWS_XML_READER;
                                        endpointAddress : PWS_ENDPOINT_ADDRESS;
                                        extensionType : WS_ENDPOINT_ADDRESS_EXTENSION_TYPE;
                                        readOption : WS_READ_OPTION;
                                        heap : PWS_HEAP;
                                        value : pointer;
                                        valueSize : ULONG;
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
//   Add an error string to the error object.
//
function WsAddErrorString(error : PWS_ERROR;
                          string_ : PWS_STRING):HRESULT; stdcall;


//  Errors function
//
//   Retrieves an error string from an error object.
//
function WsGetErrorString(error : PWS_ERROR;
                          index : ULONG;
                          str   : PWS_STRING):HRESULT; stdcall;


//  Errors function
//
//   Copies the error object from source to destination.
//
function WsCopyError(source : PWS_ERROR;
                     destination : PWS_ERROR):HRESULT; stdcall;



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




const

//  ENUM DEFINITIONS

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


//  Async Model enum
//
//   Used to specify the threading behavior of a callback (for example, a WS_ASYNC_CALLBACK).
//
  //type = WS_CALLBACK_MODEL
  WS_SHORT_CALLBACK     = 0;
  WS_LONG_CALLBACK      = 1;


//  Channel enum
//
//   An enumeration of the different encodings (message formats).
  //type = WS_ENCODING
  WS_ENCODING_XML_BINARY_1             = 0;
  WS_ENCODING_XML_BINARY_SESSION_1     = 1;
  WS_ENCODING_XML_MTOM_UTF8            = 2;
  WS_ENCODING_XML_MTOM_UTF16BE         = 3;
  WS_ENCODING_XML_MTOM_UTF16LE         = 4;
  WS_ENCODING_XML_UTF8                 = 5;
  WS_ENCODING_XML_UTF16BE              = 6;
  WS_ENCODING_XML_UTF16LE              = 7;
  WS_ENCODING_RAW                      = 8;


//  Channel enum
//  An enumeration of the different states that a channel can be in.
  //type = WS_CHANNEL_STATE
  WS_CHANNEL_STATE_CREATED       = 0;
  WS_CHANNEL_STATE_OPENING       = 1;
  WS_CHANNEL_STATE_ACCEPTING     = 2;
  WS_CHANNEL_STATE_OPEN          = 3;
  WS_CHANNEL_STATE_FAULTED       = 4;
  WS_CHANNEL_STATE_CLOSING       = 5;
  WS_CHANNEL_STATE_CLOSED        = 6;


//  Channel enum
//
//   Specifies whether a message is required or not when receiving from a channel.
//
  //type = WS_RECEIVE_OPTION
  WS_RECEIVE_REQUIRED_MESSAGE     = 1;
  WS_RECEIVE_OPTIONAL_MESSAGE     = 2;


//  Channel enum
//
//   The channel binding indicates the protocol stack to use for the channel.
//
  //type = WS_CHANNEL_BINDING
  WS_HTTP_CHANNEL_BINDING          = 0;
  WS_TCP_CHANNEL_BINDING           = 1;
  WS_UDP_CHANNEL_BINDING           = 2;
  WS_CUSTOM_CHANNEL_BINDING        = 3;
  WS_NAMEDPIPE_CHANNEL_BINDING     = 4;


//  Channel enum
//
//   The channel type indicates the basic characteristics of the channel, such as whether it is
//  sessionful, and what directions of communication are supported.
//
  //type = WS_CHANNEL_TYPE

  WS_CHANNEL_TYPE_INPUT              = $1;
  WS_CHANNEL_TYPE_OUTPUT             = $2;
  WS_CHANNEL_TYPE_SESSION            = $4;
  WS_CHANNEL_TYPE_INPUT_SESSION      = WS_CHANNEL_TYPE_INPUT or WS_CHANNEL_TYPE_SESSION;
  WS_CHANNEL_TYPE_OUTPUT_SESSION     = WS_CHANNEL_TYPE_OUTPUT or WS_CHANNEL_TYPE_SESSION;
  WS_CHANNEL_TYPE_DUPLEX             = WS_CHANNEL_TYPE_INPUT or WS_CHANNEL_TYPE_OUTPUT;
  WS_CHANNEL_TYPE_DUPLEX_SESSION     = WS_CHANNEL_TYPE_INPUT or WS_CHANNEL_TYPE_OUTPUT or WS_CHANNEL_TYPE_SESSION;
  WS_CHANNEL_TYPE_REQUEST            = $8;
  WS_CHANNEL_TYPE_REPLY              = $10;


//  Channel enum
//
//   The transfer mode indicates whether messages that are sent or received are streamed or buffered.
//
  //type = WS_TRANSFER_MODE
  WS_STREAMED_INPUT_TRANSFER_MODE      = $1;
  WS_STREAMED_OUTPUT_TRANSFER_MODE     = $2;
  WS_BUFFERED_TRANSFER_MODE            = $0;
  WS_STREAMED_TRANSFER_MODE            = WS_STREAMED_INPUT_TRANSFER_MODE or WS_STREAMED_OUTPUT_TRANSFER_MODE;


//  Channel enum
//
//   Proxy setting indicates HTTP proxy setting for the channel with binding WS_HTTP_CHANNEL_BINDING.
//  This is specified as part of WS_CHANNEL_PROPERTY_HTTP_PROXY_SETTING_MODE channel property.
//
  //type = WS_HTTP_PROXY_SETTING_MODE
  WS_HTTP_PROXY_SETTING_MODE_AUTO       = $1;
  WS_HTTP_PROXY_SETTING_MODE_NONE       = $2;
  WS_HTTP_PROXY_SETTING_MODE_CUSTOM     = $3;


//  Channel enum
//
//   Each channel property is identified by an ID and has an associated
//  value.  If a property is not specified when the channel is created,
//  then its default value is used.
//
  //type =  WS_CHANNEL_PROPERTY_ID
  WS_CHANNEL_PROPERTY_MAX_BUFFERED_MESSAGE_SIZE                = 0;
  WS_CHANNEL_PROPERTY_MAX_STREAMED_MESSAGE_SIZE                = 1;
  WS_CHANNEL_PROPERTY_MAX_STREAMED_START_SIZE                  = 2;
  WS_CHANNEL_PROPERTY_MAX_STREAMED_FLUSH_SIZE                  = 3;
  WS_CHANNEL_PROPERTY_ENCODING                                 = 4;
  WS_CHANNEL_PROPERTY_ENVELOPE_VERSION                         = 5;
  WS_CHANNEL_PROPERTY_ADDRESSING_VERSION                       = 6;
  WS_CHANNEL_PROPERTY_MAX_SESSION_DICTIONARY_SIZE              = 7;
  WS_CHANNEL_PROPERTY_STATE                                    = 8;
  WS_CHANNEL_PROPERTY_ASYNC_CALLBACK_MODEL                     = 9;
  WS_CHANNEL_PROPERTY_IP_VERSION                               = 10;
  WS_CHANNEL_PROPERTY_RESOLVE_TIMEOUT                          = 11;
  WS_CHANNEL_PROPERTY_CONNECT_TIMEOUT                          = 12;
  WS_CHANNEL_PROPERTY_SEND_TIMEOUT                             = 13;
  WS_CHANNEL_PROPERTY_RECEIVE_RESPONSE_TIMEOUT                 = 14;
  WS_CHANNEL_PROPERTY_RECEIVE_TIMEOUT                          = 15;
  WS_CHANNEL_PROPERTY_CLOSE_TIMEOUT                            = 16;
  WS_CHANNEL_PROPERTY_ENABLE_TIMEOUTS                          = 17;
  WS_CHANNEL_PROPERTY_TRANSFER_MODE                            = 18;
  WS_CHANNEL_PROPERTY_MULTICAST_INTERFACE                      = 19;
  WS_CHANNEL_PROPERTY_MULTICAST_HOPS                           = 20;
  WS_CHANNEL_PROPERTY_REMOTE_ADDRESS                           = 21;
  WS_CHANNEL_PROPERTY_REMOTE_IP_ADDRESS                        = 22;
  WS_CHANNEL_PROPERTY_HTTP_CONNECTION_ID                       = 23;
  WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_CALLBACKS                 = 24;
  WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS                = 25;
  WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_INSTANCE                  = 26;
  WS_CHANNEL_PROPERTY_TRANSPORT_URL                            = 27;
  WS_CHANNEL_PROPERTY_NO_DELAY                                 = 28;
  WS_CHANNEL_PROPERTY_SEND_KEEP_ALIVES                         = 29;
  WS_CHANNEL_PROPERTY_KEEP_ALIVE_TIME                          = 30;
  WS_CHANNEL_PROPERTY_KEEP_ALIVE_INTERVAL                      = 31;
  WS_CHANNEL_PROPERTY_MAX_HTTP_SERVER_CONNECTIONS              = 32;
  WS_CHANNEL_PROPERTY_IS_SESSION_SHUT_DOWN                     = 33;
  WS_CHANNEL_PROPERTY_CHANNEL_TYPE                             = 34;
  WS_CHANNEL_PROPERTY_TRIM_BUFFERED_MESSAGE_SIZE               = 35;
  WS_CHANNEL_PROPERTY_ENCODER                                  = 36;
  WS_CHANNEL_PROPERTY_DECODER                                  = 37;
  WS_CHANNEL_PROPERTY_PROTECTION_LEVEL                         = 38;
  WS_CHANNEL_PROPERTY_COOKIE_MODE                              = 39;
  WS_CHANNEL_PROPERTY_HTTP_PROXY_SETTING_MODE                  = 40;
  WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY                        = 41;
  WS_CHANNEL_PROPERTY_HTTP_MESSAGE_MAPPING                     = 42;
  WS_CHANNEL_PROPERTY_ENABLE_HTTP_REDIRECT                     = 43;
  WS_CHANNEL_PROPERTY_HTTP_REDIRECT_CALLBACK_CONTEXT           = 44;
  WS_CHANNEL_PROPERTY_FAULTS_AS_ERRORS                         = 45;
  WS_CHANNEL_PROPERTY_ALLOW_UNSECURED_FAULTS                   = 46;
  WS_CHANNEL_PROPERTY_HTTP_SERVER_SPN                          = 47;
  WS_CHANNEL_PROPERTY_HTTP_PROXY_SPN                           = 48;
  WS_CHANNEL_PROPERTY_MAX_HTTP_REQUEST_HEADERS_BUFFER_SIZE     = 49;


//  Channel enum
//
//   A set of flags that control how mapped headers appear in an HTTP request or response.
//
  WS_HTTP_HEADER_MAPPING_COMMA_SEPARATOR         = $1;
  WS_HTTP_HEADER_MAPPING_SEMICOLON_SEPARATOR     = $2;
  WS_HTTP_HEADER_MAPPING_QUOTED_VALUE            = $4;


//  Channel enum
//
//   A set of flags that control how HTTP responses
//  are mapped to the message object.
//
  WS_HTTP_RESPONSE_MAPPING_STATUS_CODE     = $1;
  WS_HTTP_RESPONSE_MAPPING_STATUS_TEXT     = $2;


//  Channel enum
//
//   A set of flags that control how HTTP requests
//  are mapped to the message object.
//
  WS_HTTP_REQUEST_MAPPING_VERB     = $2;


//  Channel enum
//
//   An enumeration used to specify how to handle HTTP cookies.
//
  //type = WS_COOKIE_MODE
  WS_MANUAL_COOKIE_MODE     = 1;
  WS_AUTO_COOKIE_MODE       = 2;


//  Context enum
//
//   Each property represents a property available on the Context. Not all properties may be available
//  at a given point on a context. All context properties are available through WsGetOperationContextProperty.
//
  //type = WS_OPERATION_CONTEXT_PROPERTY_ID
  WS_OPERATION_CONTEXT_PROPERTY_CHANNEL                  = 0;
  WS_OPERATION_CONTEXT_PROPERTY_CONTRACT_DESCRIPTION     = 1;
  WS_OPERATION_CONTEXT_PROPERTY_HOST_USER_STATE          = 2;
  WS_OPERATION_CONTEXT_PROPERTY_CHANNEL_USER_STATE       = 3;
  WS_OPERATION_CONTEXT_PROPERTY_INPUT_MESSAGE            = 4;
  WS_OPERATION_CONTEXT_PROPERTY_OUTPUT_MESSAGE           = 5;
  WS_OPERATION_CONTEXT_PROPERTY_HEAP                     = 6;
  WS_OPERATION_CONTEXT_PROPERTY_LISTENER                 = 7;
  WS_OPERATION_CONTEXT_PROPERTY_ENDPOINT_ADDRESS         = 8;


//  Endpoint Identity enum
//
//   The type of the endpoint identity, used as a selector for subtypes of
//   WS_ENDPOINT_IDENTITY.
//
  //type = WS_ENDPOINT_IDENTITY_TYPE
  WS_DNS_ENDPOINT_IDENTITY_TYPE         = 1;
  WS_UPN_ENDPOINT_IDENTITY_TYPE         = 2;
  WS_SPN_ENDPOINT_IDENTITY_TYPE         = 3;
  WS_RSA_ENDPOINT_IDENTITY_TYPE         = 4;
  WS_CERT_ENDPOINT_IDENTITY_TYPE        = 5;
  WS_UNKNOWN_ENDPOINT_IDENTITY_TYPE     = 6;


//  Endpoint Identity enum
//
//   This identifies a type of extension within the extensions field of the
//   WS_ENDPOINT_ADDRESS.
//
  //type = WS_ENDPOINT_ADDRESS_EXTENSION_TYPE
  WS_ENDPOINT_ADDRESS_EXTENSION_METADATA_ADDRESS     = 1;


//  Errors enum
//
//   A set of property values associated with the error.  They are set
//  and retrieved using WsGetErrorProperty and WsSetErrorProperty.
//
  //type = WS_ERROR_PROPERTY_ID
  WS_ERROR_PROPERTY_STRING_COUNT            = 0;
  WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE     = 1;
  WS_ERROR_PROPERTY_LANGID                  = 2;


//  Errors enum
//
//   An enumeration of structured exception codes thrown by this component.  These
//  exceptions are fatal and should not be handled by the application.
//
  //type = WS_EXCEPTION_CODE
  WS_EXCEPTION_CODE_USAGE_FAILURE        = $C03D0000;
  WS_EXCEPTION_CODE_INTERNAL_FAILURE     = $c03d0001;


//  Faults enum
//
//   A set of values used with WsSetFaultErrorProperty and
//   WsGetFaultErrorProperty.
//
  //type = WS_FAULT_ERROR_PROPERTY_ID
  WS_FAULT_ERROR_PROPERTY_FAULT      = 0;
  WS_FAULT_ERROR_PROPERTY_ACTION     = 1;
  WS_FAULT_ERROR_PROPERTY_HEADER     = 2;


//  Faults enum
//
//   Controls how much error information is included in a fault.
//
  //type = WS_FAULT_DISCLOSURE;
  WS_MINIMAL_FAULT_DISCLOSURE     = 0;
  WS_FULL_FAULT_DISCLOSURE        = 1;


//  Heap enum
//
//   Each heap property is identified by an ID and has an associated value.
//
  //type = WS_HEAP_PROPERTY_ID
  WS_HEAP_PROPERTY_MAX_SIZE           = 0;
  WS_HEAP_PROPERTY_TRIM_SIZE          = 1;
  WS_HEAP_PROPERTY_REQUESTED_SIZE     = 2;
  WS_HEAP_PROPERTY_ACTUAL_SIZE        = 3;


//  Listener enum
//  And enumeration of the different states that a listener can be in.
//
  //type = WS_LISTENER_STATE
  WS_LISTENER_STATE_CREATED     = 0;
  WS_LISTENER_STATE_OPENING     = 1;
  WS_LISTENER_STATE_OPEN        = 2;
  WS_LISTENER_STATE_FAULTED     = 3;
  WS_LISTENER_STATE_CLOSING     = 4;
  WS_LISTENER_STATE_CLOSED      = 5;


//  Listener enum
//
//   Each listener property is of type WS_LISTENER_PROPERTY and is
//  is identified by an ID and has an associated value.  If a property
//  is not specified when the listener is created, then its default value is used.
//
  //type = WS_LISTENER_PROPERTY_ID
  WS_LISTENER_PROPERTY_LISTEN_BACKLOG                     = 0;
  WS_LISTENER_PROPERTY_IP_VERSION                         = 1;
  WS_LISTENER_PROPERTY_STATE                              = 2;
  WS_LISTENER_PROPERTY_ASYNC_CALLBACK_MODEL               = 3;
  WS_LISTENER_PROPERTY_CHANNEL_TYPE                       = 4;
  WS_LISTENER_PROPERTY_CHANNEL_BINDING                    = 5;
  WS_LISTENER_PROPERTY_CONNECT_TIMEOUT                    = 6;
  WS_LISTENER_PROPERTY_IS_MULTICAST                       = 7;
  WS_LISTENER_PROPERTY_MULTICAST_INTERFACES               = 8;
  WS_LISTENER_PROPERTY_MULTICAST_LOOPBACK                 = 9;
  WS_LISTENER_PROPERTY_CLOSE_TIMEOUT                      = 10;
  WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS         = 11;
  WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS     = 12;
  WS_LISTENER_PROPERTY_CUSTOM_LISTENER_CALLBACKS          = 13;
  WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS         = 14;
  WS_LISTENER_PROPERTY_CUSTOM_LISTENER_INSTANCE           = 15;
  WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT              = 16;


//  Listener enum
//
//   Specifies an IP version.
//
  //type = WS_IP_VERSION
  WS_IP_VERSION_4        = 1;
  WS_IP_VERSION_6        = 2;
  WS_IP_VERSION_AUTO     = 3;


//  Listener enum
//
//   A set of flags used to specify how to match a URL.
//
  WS_MATCH_URL_DNS_HOST                     = $1;
  WS_MATCH_URL_DNS_FULLY_QUALIFIED_HOST     = $2;
  WS_MATCH_URL_NETBIOS_HOST                 = $4;
  WS_MATCH_URL_LOCAL_HOST                   = $8;
  WS_MATCH_URL_HOST_ADDRESSES               = $10;
  WS_MATCH_URL_THIS_HOST                    = WS_MATCH_URL_DNS_HOST or WS_MATCH_URL_DNS_FULLY_QUALIFIED_HOST or WS_MATCH_URL_NETBIOS_HOST or WS_MATCH_URL_LOCAL_HOST or WS_MATCH_URL_HOST_ADDRESSES;
  WS_MATCH_URL_PORT                         = $20;
  WS_MATCH_URL_EXACT_PATH                   = $40;
  WS_MATCH_URL_PREFIX_PATH                  = $80;
  WS_MATCH_URL_NO_QUERY                     = $100;


//  Message enum
//
//   The different states that a message can be in.
//
  //type = WS_MESSAGE_STATE
  WS_MESSAGE_STATE_EMPTY           = 1;
  WS_MESSAGE_STATE_INITIALIZED     = 2;
  WS_MESSAGE_STATE_READING         = 3;
  WS_MESSAGE_STATE_WRITING         = 4;
  WS_MESSAGE_STATE_DONE            = 5;


//  Message enum
//
//   The following values specify what headers the
//   WsInitializeMessage
//   should add to the message.
//
  //type = WS_MESSAGE_INITIALIZATION
  WS_BLANK_MESSAGE         = 0;
  WS_DUPLICATE_MESSAGE     = 1;
  WS_REQUEST_MESSAGE       = 2;
  WS_REPLY_MESSAGE         = 3;
  WS_FAULT_MESSAGE         = 4;


//  Message enum
//
//   This enum is used to specify whether a header is expected
//  to appear more than once in a message.
//
  //type = WS_REPEATING_HEADER_OPTION
  WS_REPEATING_HEADER     = 1;
  WS_SINGLETON_HEADER     = 2;


//  Message enum
//
//   Identifies a type of header.
//
  //type = WS_HEADER_TYPE
  WS_ACTION_HEADER         = 1;
  WS_TO_HEADER             = 2;
  WS_MESSAGE_ID_HEADER     = 3;
  WS_RELATES_TO_HEADER     = 4;
  WS_FROM_HEADER           = 5;
  WS_REPLY_TO_HEADER       = 6;
  WS_FAULT_TO_HEADER       = 7;


//  Message enum
//
//   A set of flags representing the SOAP mustUnderstand and relay attributes of a header.
//
  WS_MUST_UNDERSTAND_HEADER_ATTRIBUTE     = $1;
  WS_RELAY_HEADER_ATTRIBUTE               = $2;


//  Message enum
//
//   The following values identify the version of the specification used for
//  the addressing headers.
  //type = WS_ADDRESSING_VERSION
  WS_ADDRESSING_VERSION_0_9           = 1;
  WS_ADDRESSING_VERSION_1_0           = 2;
  WS_ADDRESSING_VERSION_TRANSPORT     = 3;


//  Message enum
//
//   Identifies the version of the specification used for the envelope
//  structure.
//
  //type = WS_ENVELOPE_VERSION
  WS_ENVELOPE_VERSION_SOAP_1_1     = 1;
  WS_ENVELOPE_VERSION_SOAP_1_2     = 2;
  WS_ENVELOPE_VERSION_NONE         = 3;


//  Message enum
//
//   Each message property is identified by an ID and has an associated
//  value.
//
  //type = WS_MESSAGE_PROPERTY_ID
  WS_MESSAGE_PROPERTY_STATE                                = 0;
  WS_MESSAGE_PROPERTY_HEAP                                 = 1;
  WS_MESSAGE_PROPERTY_ENVELOPE_VERSION                     = 2;
  WS_MESSAGE_PROPERTY_ADDRESSING_VERSION                   = 3;
  WS_MESSAGE_PROPERTY_HEADER_BUFFER                        = 4;
  WS_MESSAGE_PROPERTY_HEADER_POSITION                      = 5;
  WS_MESSAGE_PROPERTY_BODY_READER                          = 6;
  WS_MESSAGE_PROPERTY_BODY_WRITER                          = 7;
  WS_MESSAGE_PROPERTY_IS_ADDRESSED                         = 8;
  WS_MESSAGE_PROPERTY_HEAP_PROPERTIES                      = 9;
  WS_MESSAGE_PROPERTY_XML_READER_PROPERTIES                = 10;
  WS_MESSAGE_PROPERTY_XML_WRITER_PROPERTIES                = 11;
  WS_MESSAGE_PROPERTY_IS_FAULT                             = 12;
  WS_MESSAGE_PROPERTY_MAX_PROCESSED_HEADERS                = 13;
  WS_MESSAGE_PROPERTY_USERNAME                             = 14;
  WS_MESSAGE_PROPERTY_ENCODED_CERT                         = 15;
  WS_MESSAGE_PROPERTY_TRANSPORT_SECURITY_WINDOWS_TOKEN     = 16;
  WS_MESSAGE_PROPERTY_HTTP_HEADER_AUTH_WINDOWS_TOKEN       = 17;
  WS_MESSAGE_PROPERTY_MESSAGE_SECURITY_WINDOWS_TOKEN       = 18;
  WS_MESSAGE_PROPERTY_SAML_ASSERTION                       = 19;
  WS_MESSAGE_PROPERTY_SECURITY_CONTEXT                     = 20;
  WS_MESSAGE_PROPERTY_PROTECTION_LEVEL                     = 21;


//  Security Bindings enum
//
//   The type of the security binding, used as a selector for subtypes of
//   WS_SECURITY_BINDING.  In general, the type name of the
//  security binding (one of the values defined here) specifies how the
//  security token used with that security binding is obtained and used.
//
  //type = WS_SECURITY_BINDING_TYPE
  WS_SSL_TRANSPORT_SECURITY_BINDING_TYPE                = 1;
  WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TYPE           = 2;
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TYPE             = 3;
  WS_USERNAME_MESSAGE_SECURITY_BINDING_TYPE             = 4;
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TYPE       = 5;
  WS_XML_TOKEN_MESSAGE_SECURITY_BINDING_TYPE            = 6;
  WS_SAML_MESSAGE_SECURITY_BINDING_TYPE                 = 7;
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TYPE     = 8;
  WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING_TYPE     = 9;


//  Security Binding Settings enum
//
//   Defines the options for performing client authentication using HTTP
//  authentication headers.
//
  WS_HTTP_HEADER_AUTH_SCHEME_NONE          = $1;
  WS_HTTP_HEADER_AUTH_SCHEME_BASIC         = $2;
  WS_HTTP_HEADER_AUTH_SCHEME_DIGEST        = $4;
  WS_HTTP_HEADER_AUTH_SCHEME_NTLM          = $8;
  WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE     = $10;
  WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT      = $20;


//  Security Binding Settings enum
//
//   Defines the target for the HTTP header authentication security binding.
//
  //type = WS_HTTP_HEADER_AUTH_TARGET
  WS_HTTP_HEADER_AUTH_TARGET_SERVICE     = 1;
  WS_HTTP_HEADER_AUTH_TARGET_PROXY       = 2;


//  Security Binding Settings enum
//
//   Defines the specific SSP package to be used for Windows Integrated
//  Authentication.
//
  //type = WS_WINDOWS_INTEGRATED_AUTH_PACKAGE
  WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_KERBEROS     = 1;
  WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_NTLM         = 2;
  WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_SPNEGO       = 3;


//  Security Channel Settings enum
//
//   Defines the WS-Security specification version to be used with message
//  security and mixed-mode security.
//
  //type = WS_SECURITY_HEADER_VERSION
  WS_SECURITY_HEADER_VERSION_1_0     = $1;
  WS_SECURITY_HEADER_VERSION_1_1     = $2;


//  Security Binding Settings enum
//
//   Defines the WS-Trust specification version to be used with message
//  security and mixed-mode security.
//
  //type = WS_TRUST_VERSION
  WS_TRUST_VERSION_FEBRUARY_2005     = $1;
  WS_TRUST_VERSION_1_3               = $2;


//  Security Binding Settings enum
//
//   Defines which set of actions to use when negotiating security tokens using WS-Trust.
//
  //type = WS_REQUEST_SECURITY_TOKEN_ACTION
  WS_REQUEST_SECURITY_TOKEN_ACTION_ISSUE             = 1;
  WS_REQUEST_SECURITY_TOKEN_ACTION_NEW_CONTEXT       = 2;
  WS_REQUEST_SECURITY_TOKEN_ACTION_RENEW_CONTEXT     = 3;


//  Security Channel Settings enum
//
//   Defines the WS-SecureCoversation specification version to be used with message
//  security and mixed-mode security.
//
  //type = WS_SECURE_CONVERSATION_VERSION
  WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005     = $1;
  WS_SECURE_CONVERSATION_VERSION_1_3               = $2;


//  Security Channel Settings enum
//
//   Defines secure protocol that can be used by WS_SSL_TRANSPORT_SECURITY_BINDING binding.
//
  //type = WS_SECURE_PROTOCOL
  WS_SECURE_PROTOCOL_SSL2       = $1;
  WS_SECURE_PROTOCOL_SSL3       = $2;
  WS_SECURE_PROTOCOL_TLS1_0     = $4;
  WS_SECURE_PROTOCOL_TLS1_1     = $8;
  WS_SECURE_PROTOCOL_TLS1_2     = $10;


//  Security Channel Settings enum
//
//  With message security and mixed-mode security, this defines when a
//  timestamp element should be generated and demanded in the WS-Security
//  header.
//
  //type = WS_SECURITY_TIMESTAMP_USAGE
  WS_SECURITY_TIMESTAMP_USAGE_ALWAYS            = 1;
  WS_SECURITY_TIMESTAMP_USAGE_NEVER             = 2;
  WS_SECURITY_TIMESTAMP_USAGE_REQUESTS_ONLY     = 3;


//  Security Channel Settings enum
//
//  Defines the layout rules applied to the elements of the WS-Security
//  security header.  This setting is relevant to message security
//  bindings and mixed-mode security bindings.
//
  //type = WS_SECURITY_HEADER_LAYOUT
  WS_SECURITY_HEADER_LAYOUT_STRICT                       = 1;
  WS_SECURITY_HEADER_LAYOUT_LAX                          = 2;
  WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_FIRST     = 3;
  WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_LAST      = 4;


//  Security Channel Settings enum
//
//  Identifies the properties representing security algorithm knobs.
//
  //type = WS_SECURITY_ALGORITHM_PROPERTY_ID
  //empty typedef enum


//  Security Channel Settings enum
//
//   Defines the security algorithms to be used with WS-Security.
//  These values are relevant to message security bindings
//  and mixed-mode security bindings.
//
  //type = WS_SECURITY_ALGORITHM_ID
  WS_SECURITY_ALGORITHM_DEFAULT                                      = 0;
  WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE                   = 1;
  WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE_WITH_COMMENTS     = 2;
  WS_SECURITY_ALGORITHM_DIGEST_SHA1                                  = 3;
  WS_SECURITY_ALGORITHM_DIGEST_SHA_256                               = 4;
  WS_SECURITY_ALGORITHM_DIGEST_SHA_384                               = 5;
  WS_SECURITY_ALGORITHM_DIGEST_SHA_512                               = 6;
  WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1                = 7;
  WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_256             = 8;
  WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_384             = 9;
  WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_512             = 10;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1                = 11;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_DSA_SHA1                = 12;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_256             = 13;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_384             = 14;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_512             = 15;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5                   = 16;
  WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP                  = 17;
  WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1                        = 18;


//  Security Channel Settings enum
//
//  Defines the required integrity and confidentiality levels for sent and
//  received messages.  With transport and mixed-mode security bindings,
//  this setting applies to each message as a whole.  With message
//  security, the protection level is specified at the granularity of a
//  message header or body.  The default value defined applies only to
//  transport and mixed-mode security.
//
  //type = WS_PROTECTION_LEVEL
  WS_PROTECTION_LEVEL_NONE                 = 1;
  WS_PROTECTION_LEVEL_SIGN                 = 2;
  WS_PROTECTION_LEVEL_SIGN_AND_ENCRYPT     = 3;


//  Security Channel Settings enum
//
//   Identifies the properties representing channel-wide security knobs.
//
  //type = WS_SECURITY_PROPERTY_ID
  WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL       = 1;
  WS_SECURITY_PROPERTY_ALGORITHM_SUITE                  = 2;
  WS_SECURITY_PROPERTY_ALGORITHM_SUITE_NAME             = 3;
  WS_SECURITY_PROPERTY_MAX_ALLOWED_LATENCY              = 4;
  WS_SECURITY_PROPERTY_TIMESTAMP_VALIDITY_DURATION      = 5;
  WS_SECURITY_PROPERTY_MAX_ALLOWED_CLOCK_SKEW           = 6;
  WS_SECURITY_PROPERTY_TIMESTAMP_USAGE                  = 7;
  WS_SECURITY_PROPERTY_SECURITY_HEADER_LAYOUT           = 8;
  WS_SECURITY_PROPERTY_SECURITY_HEADER_VERSION          = 9;
  WS_SECURITY_PROPERTY_EXTENDED_PROTECTION_POLICY       = 10;
  WS_SECURITY_PROPERTY_EXTENDED_PROTECTION_SCENARIO     = 11;
  WS_SECURITY_PROPERTY_SERVICE_IDENTITIES               = 12;


//  Security Binding Settings enum
//
//  The key type of a security token.  It is used as the return type when
//  a security token is queried about its key.  It is also used to specify
//  the required key type when requesting a security token from a security
//  token service.
//
  //type = WS_SECURITY_KEY_TYPE
  WS_SECURITY_KEY_TYPE_NONE           = 1;
  WS_SECURITY_KEY_TYPE_SYMMETRIC      = 2;
  WS_SECURITY_KEY_TYPE_ASYMMETRIC     = 3;


//  Security Binding Settings enum
//
//   A suite of security algorithms used for tasks such as signing and encryting.
//  The values in this enumeration correspond to the suites defined in
//   (http://schemas.xmlsoap.org/ws/2005/07/securitypolicy/) WS-SecurityPolicy 1.1
//   section 7.1.
//
  //type = WS_SECURITY_ALGORITHM_SUITE_NAME
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256                  = 1;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192                  = 2;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128                  = 3;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_RSA15            = 4;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_RSA15            = 5;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_RSA15            = 6;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256           = 7;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256           = 8;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256           = 9;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256_RSA15     = 10;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256_RSA15     = 11;
  WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256_RSA15     = 12;


//  Security Binding Settings enum
//
//  With message and mixed-mode security bindings, the mechanism to use to
//  refer to a security token from signatures, encrypted items and derived
//  tokens.  The security runtime can use the right reference on its own
//  most of the time, and this needs to be explicitly set only when a
//  specific reference mechanism is required, typically for interop with
//  another platform that supports only that reference form.
//
  //type = WS_SECURITY_TOKEN_REFERENCE_MODE
  WS_SECURITY_TOKEN_REFERENCE_MODE_LOCAL_ID                = 1;
  WS_SECURITY_TOKEN_REFERENCE_MODE_XML_BUFFER              = 2;
  WS_SECURITY_TOKEN_REFERENCE_MODE_CERT_THUMBPRINT         = 3;
  WS_SECURITY_TOKEN_REFERENCE_MODE_SECURITY_CONTEXT_ID     = 4;
  WS_SECURITY_TOKEN_REFERENCE_MODE_SAML_ASSERTION_ID       = 5;


//  Security Binding Settings enum
//
//   Defines failures related to certificate validation. Can be used with WS_SECURITY_BINDING_PROPERTY_CERT_FAILURES_TO_IGNORE to
//  specify which certificate verification failures should be ignored.
//
  WS_CERT_FAILURE_CN_MISMATCH            = $1;
  WS_CERT_FAILURE_INVALID_DATE           = $2;
  WS_CERT_FAILURE_UNTRUSTED_ROOT         = $4;
  WS_CERT_FAILURE_WRONG_USAGE            = $8;
  WS_CERT_FAILURE_REVOCATION_OFFLINE     = $10;


//  Security Binding Settings enum
//
//  Defines how randomness should be contributed to the issued key during
//  a security token negotiation done with message and mixed-mode security.
//
  //type = WS_SECURITY_KEY_ENTROPY_MODE
  WS_SECURITY_KEY_ENTROPY_MODE_CLIENT_ONLY     = 1;
  WS_SECURITY_KEY_ENTROPY_MODE_SERVER_ONLY     = 2;
  WS_SECURITY_KEY_ENTROPY_MODE_COMBINED        = 3;


//  Extended Protection enum
//
//   Defines if Extended Protection data should be validated. This property is only available on the server,
//  and can only be set when WS_HTTP_CHANNEL_BINDING with WS_SSL_TRANSPORT_SECURITY_BINDING and either WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING
//   or WS_HTTP_HEADER_AUTH_SECURITY_BINDING is used.
//
  //type = WS_EXTENDED_PROTECTION_POLICY
  WS_EXTENDED_PROTECTION_POLICY_NEVER              = 1;
  WS_EXTENDED_PROTECTION_POLICY_WHEN_SUPPORTED     = 2;
  WS_EXTENDED_PROTECTION_POLICY_ALWAYS             = 3;


//  Extended Protection enum
//
//   Defines how Extended Protection is validated. For most configurations, the runtime can automatically determine what needs to
//  be validated based on the presence of the WS_SSL_TRANSPORT_SECURITY_BINDING. However, if the SSL connection is terminated at
//  an intermediary such as a proxy prior to reaching the server then the validation method must change, and this scenario cannot be automatically detected.
//
//   Only available on the server.
//
  //type = WS_EXTENDED_PROTECTION_SCENARIO
  WS_EXTENDED_PROTECTION_SCENARIO_BOUND_SERVER       = 1;
  WS_EXTENDED_PROTECTION_SCENARIO_TERMINATED_SSL     = 2;


//  Security Binding Settings enum
//
//   Identifies the properties used to specify security
//  binding settings.  Security binding settings are present
//  in (WS_SECURITY_BINDING) security bindings
//   that are used, in turn, in a (WS_SECURITY_DESCRIPTION) security description.
//
//   Note that the related enum WS_SECURITY_TOKEN_PROPERTY_ID
//   defines the keys for extracting fields from a security token instance.
//  Thus, WS_SECURITY_BINDING_PROPERTY enables specifying security binding
//  settings at channel / listener creation time to influence how a
//  security token is created and used, whereas WS_SECURITY_TOKEN_PROPERTY_ID
//  enables extracting fields out of a security token -- typically a
//  security token from a received message when the channel and security
//  are 'live'.
//
  //type = WS_SECURITY_BINDING_PROPERTY_ID
  WS_SECURITY_BINDING_PROPERTY_REQUIRE_SSL_CLIENT_CERT                     = 1;
  WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE             = 2;
  WS_SECURITY_BINDING_PROPERTY_REQUIRE_SERVER_AUTH                         = 3;
  WS_SECURITY_BINDING_PROPERTY_ALLOW_ANONYMOUS_CLIENTS                     = 4;
  WS_SECURITY_BINDING_PROPERTY_ALLOWED_IMPERSONATION_LEVEL                 = 5;
  WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_SCHEME                     = 6;
  WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_TARGET                     = 7;
  WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_BASIC_REALM                = 8;
  WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_REALM               = 9;
  WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_DOMAIN              = 10;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_SIZE                   = 11;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_ENTROPY_MODE           = 12;
  WS_SECURITY_BINDING_PROPERTY_MESSAGE_PROPERTIES                          = 13;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_MAX_PENDING_CONTEXTS       = 14;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_MAX_ACTIVE_CONTEXTS        = 15;
  WS_SECURITY_BINDING_PROPERTY_SECURE_CONVERSATION_VERSION                 = 16;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_SUPPORT_RENEW              = 17;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_RENEWAL_INTERVAL           = 18;
  WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_ROLLOVER_INTERVAL          = 19;
  WS_SECURITY_BINDING_PROPERTY_CERT_FAILURES_TO_IGNORE                     = 20;
  WS_SECURITY_BINDING_PROPERTY_DISABLE_CERT_REVOCATION_CHECK               = 21;
  WS_SECURITY_BINDING_PROPERTY_DISALLOWED_SECURE_PROTOCOLS                 = 22;
  WS_SECURITY_BINDING_PROPERTY_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT     = 23;


//  Security Credentials enum
//
//  The type of the certificate credential, used as a selector for
//  subtypes of WS_CERT_CREDENTIAL.
//
  //type = WS_CERT_CREDENTIAL_TYPE
  WS_SUBJECT_NAME_CERT_CREDENTIAL_TYPE     = 1;
  WS_THUMBPRINT_CERT_CREDENTIAL_TYPE       = 2;
  WS_CUSTOM_CERT_CREDENTIAL_TYPE           = 3;


//  Security Credentials enum
//
//  The type of the Windows Integrated Authentication credential, used as
//  a selector for subtypes of WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.
//
  //type = WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE
  WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE      = 1;
  WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE     = 2;
  WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE      = 3;


//  Security Credentials enum
//
//  The type of the username/password credential, used as a selector for
//  subtypes of WS_USERNAME_CREDENTIAL.
//
  //type = WS_USERNAME_CREDENTIAL_TYPE
  WS_STRING_USERNAME_CREDENTIAL_TYPE     = 1;


//  Security Processing Results enum
//
//   Defines the keys for the fields and properties that can be extracted
//  from a security token.  Not all properties are valid for all security
//  token types.  The function WsGetSecurityTokenProperty uses
//  the values defined here as keys.
//
//   See also WS_SECURITY_BINDING_PROPERTY.
//
  //type WS_SECURITY_TOKEN_PROPERTY_ID
  WS_SECURITY_TOKEN_PROPERTY_KEY_TYPE                     = 1;
  WS_SECURITY_TOKEN_PROPERTY_VALID_FROM_TIME              = 2;
  WS_SECURITY_TOKEN_PROPERTY_VALID_TILL_TIME              = 3;
  WS_SECURITY_TOKEN_PROPERTY_SERIALIZED_XML               = 4;
  WS_SECURITY_TOKEN_PROPERTY_ATTACHED_REFERENCE_XML       = 5;
  WS_SECURITY_TOKEN_PROPERTY_UNATTACHED_REFERENCE_XML     = 6;
  WS_SECURITY_TOKEN_PROPERTY_SYMMETRIC_KEY                = 7;


//  Security Bindings enum
//
//  Types of security keys.
//
  //type = WS_SECURITY_KEY_HANDLE_TYPE
  WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE_TYPE         = 1;
  WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE     = 2;
  WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE       = 3;


//  Security Bindings enum
//
//  Defines how a message security binding attaches the security token
//  corresponding to it to a message using WS-Security mechanisms.
//
  //type = WS_MESSAGE_SECURITY_USAGE
  WS_SUPPORTING_MESSAGE_SECURITY_USAGE     = 1;


//  Security Context enum
//
//   Identifies a property of a security context object.
//
  //type = WS_SECURITY_CONTEXT_PROPERTY_ID
  WS_SECURITY_CONTEXT_PROPERTY_IDENTIFIER                         = 1;
  WS_SECURITY_CONTEXT_PROPERTY_USERNAME                           = 2;
  WS_SECURITY_CONTEXT_PROPERTY_MESSAGE_SECURITY_WINDOWS_TOKEN     = 3;
  WS_SECURITY_CONTEXT_PROPERTY_SAML_ASSERTION                     = 4;


//  Security Channel Settings enum
//
//   Identifies the properties for the creation of XML security tokens.
//
  //type = WS_XML_SECURITY_TOKEN_PROPERTY_ID
  WS_XML_SECURITY_TOKEN_PROPERTY_ATTACHED_REFERENCE       = 1;
  WS_XML_SECURITY_TOKEN_PROPERTY_UNATTACHED_REFERENCE     = 2;
  WS_XML_SECURITY_TOKEN_PROPERTY_VALID_FROM_TIME          = 3;
  WS_XML_SECURITY_TOKEN_PROPERTY_VALID_TILL_TIME          = 4;


//  Security Bindings enum
//
//   The type ids of the SAML token authenticators used on the server side
//  (i.e., relying party) to validate incoming SAML tokens.
//
  //type = WS_SAML_AUTHENTICATOR_TYPE
  WS_CERT_SIGNED_SAML_AUTHENTICATOR_TYPE     = 1;


//  Security Channel Settings enum
//
//   Identifies the properties for requesting a security token from an issuer.
//
  //type = WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_APPLIES_TO                      = 1;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_TRUST_VERSION                   = 2;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_SECURE_CONVERSATION_VERSION     = 3;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_TYPE               = 4;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_REQUEST_ACTION                  = 5;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_EXISTING_TOKEN                  = 6;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_TYPE           = 7;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_SIZE           = 8;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_ENTROPY        = 9;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_LOCAL_REQUEST_PARAMETERS        = 10;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_SERVICE_REQUEST_PARAMETERS      = 11;
  WS_REQUEST_SECURITY_TOKEN_PROPERTY_MESSAGE_PROPERTIES              = 12;


//  Serialization enum
//
//   An enumeration of the different types supported for serialization.
//
  //type = WS_TYPE
  WS_BOOL_TYPE                 = 0;
  WS_INT8_TYPE                 = 1;
  WS_INT16_TYPE                = 2;
  WS_INT32_TYPE                = 3;
  WS_INT64_TYPE                = 4;
  WS_UINT8_TYPE                = 5;
  WS_UINT16_TYPE               = 6;
  WS_UINT32_TYPE               = 7;
  WS_UINT64_TYPE               = 8;
  WS_FLOAT_TYPE                = 9;
  WS_DOUBLE_TYPE               = 10;
  WS_DECIMAL_TYPE              = 11;
  WS_DATETIME_TYPE             = 12;
  WS_TIMESPAN_TYPE             = 13;
  WS_GUID_TYPE                 = 14;
  WS_UNIQUE_ID_TYPE            = 15;
  WS_STRING_TYPE               = 16;
  WS_WSZ_TYPE                  = 17;
  WS_BYTES_TYPE                = 18;
  WS_XML_STRING_TYPE           = 19;
  WS_XML_QNAME_TYPE            = 20;
  WS_XML_BUFFER_TYPE           = 21;
  WS_CHAR_ARRAY_TYPE           = 22;
  WS_UTF8_ARRAY_TYPE           = 23;
  WS_BYTE_ARRAY_TYPE           = 24;
  WS_DESCRIPTION_TYPE          = 25;
  WS_STRUCT_TYPE               = 26;
  WS_CUSTOM_TYPE               = 27;
  WS_ENDPOINT_ADDRESS_TYPE     = 28;
  WS_FAULT_TYPE                = 29;
  WS_VOID_TYPE                 = 30;
  WS_ENUM_TYPE                 = 31;
  WS_DURATION_TYPE             = 32;
  WS_UNION_TYPE                = 33;
  WS_ANY_ATTRIBUTES_TYPE       = 34;


//  Serialization enum
//
//   Specifies how a field of a structure is represented in XML.  This is used within
//  a WS_FIELD_DESCRIPTION.
//
  //type = WS_FIELD_MAPPING
  WS_TYPE_ATTRIBUTE_FIELD_MAPPING               = 0;
  WS_ATTRIBUTE_FIELD_MAPPING                    = 1;
  WS_ELEMENT_FIELD_MAPPING                      = 2;
  WS_REPEATING_ELEMENT_FIELD_MAPPING            = 3;
  WS_TEXT_FIELD_MAPPING                         = 4;
  WS_NO_FIELD_MAPPING                           = 5;
  WS_XML_ATTRIBUTE_FIELD_MAPPING                = 6;
  WS_ELEMENT_CHOICE_FIELD_MAPPING               = 7;
  WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING     = 8;
  WS_ANY_ELEMENT_FIELD_MAPPING                  = 9;
  WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING        = 10;
  WS_ANY_CONTENT_FIELD_MAPPING                  = 11;
  WS_ANY_ATTRIBUTES_FIELD_MAPPING               = 12;


//  Serialization enum
//
//   A set of flags used within a WS_STRUCT_DESCRIPTION.
//
  WS_STRUCT_ABSTRACT                            = $1;
  WS_STRUCT_IGNORE_TRAILING_ELEMENT_CONTENT     = $2;
  WS_STRUCT_IGNORE_UNHANDLED_ATTRIBUTES         = $4;


//  Serialization enum
//
//   A set of flags used within a WS_FIELD_DESCRIPTION.
//
  WS_FIELD_POINTER             = $1;
  WS_FIELD_OPTIONAL            = $2;
  WS_FIELD_NILLABLE            = $4;
  WS_FIELD_NILLABLE_ITEM       = $8;
  WS_FIELD_OTHER_NAMESPACE     = $10;


//  Serialization enum
//
//   Specifies how a WS_TYPE maps to/from XML when serialized
//  or deserialized.
//
  //type = WS_TYPE_MAPPING
  WS_ELEMENT_TYPE_MAPPING             = 1;
  WS_ATTRIBUTE_TYPE_MAPPING           = 2;
  WS_ELEMENT_CONTENT_TYPE_MAPPING     = 3;
  WS_ANY_ELEMENT_TYPE_MAPPING         = 4;


//  Serialization enum
//
//   Specifies whether a value is required, and how the value should be allocated.
//
  //type = WS_READ_OPTION
  WS_READ_REQUIRED_VALUE       = 1;
  WS_READ_REQUIRED_POINTER     = 2;
  WS_READ_OPTIONAL_POINTER     = 3;
  WS_READ_NILLABLE_POINTER     = 4;
  WS_READ_NILLABLE_VALUE       = 5;


//  Serialization enum
//
//   Specifies whether a storage specified contains the value, or a pointer to the value,
//  and whether the value can be represented as nil in the XML content.
//
  //type = WS_WRITE_OPTION
  WS_WRITE_REQUIRED_VALUE       = 1;
  WS_WRITE_REQUIRED_POINTER     = 2;
  WS_WRITE_NILLABLE_VALUE       = 3;
  WS_WRITE_NILLABLE_POINTER     = 4;


//  Service Operation enum
//
//   An enumeration of the different reasons for which a cancel can occur.
//
  //type = WS_SERVICE_CANCEL_REASON
  WS_SERVICE_HOST_ABORT          = 0;
  WS_SERVICE_CHANNEL_FAULTED     = 1;


//  Service Operation enum
//
//   An enumeration of the different operation styles.
//
  //type = WS_OPERATION_STYLE
  WS_NON_RPC_LITERAL_OPERATION     = 0;
  WS_RPC_LITERAL_OPERATION         = 1;


//  Service Operation enum
//
//   An enumeration of the different parameter types.
//
  //type = WS_PARAMETER_TYPE
  WS_PARAMETER_TYPE_NORMAL          = 0;
  WS_PARAMETER_TYPE_ARRAY           = 1;
  WS_PARAMETER_TYPE_ARRAY_COUNT     = 2;
  WS_PARAMETER_TYPE_MESSAGES        = 3;


//  Service Operation enum
//
//   A set of flags used within a WS_OPERATION_DESCRIPTION.
//
  WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT     = $1;


//  Service Host enum
//
//   Each property represents optional parameters for configuring
//  the given WS_SERVICE_ENDPOINT.
//
  //type = WS_SERVICE_ENDPOINT_PROPERTY_ID
  WS_SERVICE_ENDPOINT_PROPERTY_ACCEPT_CHANNEL_CALLBACK          = 0;
  WS_SERVICE_ENDPOINT_PROPERTY_CLOSE_CHANNEL_CALLBACK           = 1;
  WS_SERVICE_ENDPOINT_PROPERTY_MAX_ACCEPTING_CHANNELS           = 2;
  WS_SERVICE_ENDPOINT_PROPERTY_MAX_CONCURRENCY                  = 3;
  WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_MAX_SIZE               = 4;
  WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_TRIM_SIZE              = 5;
  WS_SERVICE_ENDPOINT_PROPERTY_MESSAGE_PROPERTIES               = 6;
  WS_SERVICE_ENDPOINT_PROPERTY_MAX_CALL_POOL_SIZE               = 7;
  WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNEL_POOL_SIZE            = 8;
  WS_SERVICE_ENDPOINT_PROPERTY_LISTENER_PROPERTIES              = 9;
  WS_SERVICE_ENDPOINT_PROPERTY_CHECK_MUST_UNDERSTAND            = 10;
  WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE           = 11;
  WS_SERVICE_ENDPOINT_PROPERTY_METADATA                         = 12;
  WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_URL_SUFFIX     = 13;
  WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNELS                     = 14;


//  Service Metadata enum
//
  //type = WS_METADATA_EXCHANGE_TYPE
  WS_METADATA_EXCHANGE_TYPE_NONE         = 0;
  WS_METADATA_EXCHANGE_TYPE_MEX          = 1;
  WS_METADATA_EXCHANGE_TYPE_HTTP_GET     = 2;


//  Service Host enum
//
//   Each property represents optional parameters for configuring the service host.
//
  //type = WS_SERVICE_PROPERTY_ID
  WS_SERVICE_PROPERTY_HOST_USER_STATE      = 0;
  WS_SERVICE_PROPERTY_FAULT_DISCLOSURE     = 1;
  WS_SERVICE_PROPERTY_FAULT_LANGID         = 2;
  WS_SERVICE_PROPERTY_HOST_STATE           = 3;
  WS_SERVICE_PROPERTY_METADATA             = 4;
  WS_SERVICE_PROPERTY_CLOSE_TIMEOUT        = 5;


//  Service Host enum
//  An enumeration of the different states that a service host can be in.
  //type = WS_SERVICE_HOST_STATE
  WS_SERVICE_HOST_STATE_CREATED     = 0;
  WS_SERVICE_HOST_STATE_OPENING     = 1;
  WS_SERVICE_HOST_STATE_OPEN        = 2;
  WS_SERVICE_HOST_STATE_CLOSING     = 3;
  WS_SERVICE_HOST_STATE_CLOSED      = 4;
  WS_SERVICE_HOST_STATE_FAULTED     = 5;


//  Service Proxy State Machine enum
//
//   See Service Proxy State Machine for detail.
//
  //type = WS_SERVICE_PROXY_STATE
  WS_SERVICE_PROXY_STATE_CREATED     = 0;
  WS_SERVICE_PROXY_STATE_OPENING     = 1;
  WS_SERVICE_PROXY_STATE_OPEN        = 2;
  WS_SERVICE_PROXY_STATE_CLOSING     = 3;
  WS_SERVICE_PROXY_STATE_CLOSED      = 4;
  WS_SERVICE_PROXY_STATE_FAULTED     = 5;


//  Service Proxy enum
//
//   Optional parameters for configuring the service proxy. With an exception of
//   WS_PROXY_PROPERTY_STATE all the values are only supported for
//  use with WsCreateServiceProxy.
//
  //type = WS_PROXY_PROPERTY_ID
  WS_PROXY_PROPERTY_CALL_TIMEOUT           = 0;
  WS_PROXY_PROPERTY_MESSAGE_PROPERTIES     = 1;
  WS_PROXY_PROPERTY_MAX_CALL_POOL_SIZE     = 2;
  WS_PROXY_PROPERTY_STATE                  = 3;
  WS_PROXY_PROPERTY_MAX_PENDING_CALLS      = 4;
  WS_PROXY_PROPERTY_MAX_CLOSE_TIMEOUT      = 5;
  WS_PROXY_FAULT_LANG_ID                   = 6;


//  Service Proxy enum
//
//   Optional parameters for configuring a call on a client side service operation.
//
  //type = WS_CALL_PROPERTY_ID
  WS_CALL_PROPERTY_CHECK_MUST_UNDERSTAND       = 0;
  WS_CALL_PROPERTY_SEND_MESSAGE_CONTEXT        = 1;
  WS_CALL_PROPERTY_RECEIVE_MESSAGE_CONTEXT     = 2;
  WS_CALL_PROPERTY_CALL_ID                     = 3;


//  Tracing enum
//
  //type = WS_TRACE_API
  WS_TRACE_API_NONE                                      = -1;
  WS_TRACE_API_START_READER_CANONICALIZATION             = 0;
  WS_TRACE_API_END_READER_CANONICALIZATION               = 1;
  WS_TRACE_API_START_WRITER_CANONICALIZATION             = 2;
  WS_TRACE_API_END_WRITER_CANONICALIZATION               = 3;
  WS_TRACE_API_CREATE_XML_BUFFER                         = 4;
  WS_TRACE_API_REMOVE_NODE                               = 5;
  WS_TRACE_API_CREATE_READER                             = 6;
  WS_TRACE_API_SET_INPUT                                 = 7;
  WS_TRACE_API_SET_INPUT_TO_BUFFER                       = 8;
  WS_TRACE_API_FREE_XML_READER                           = 9;
  WS_TRACE_API_GET_READER_PROPERTY                       = 10;
  WS_TRACE_API_GET_READER_NODE                           = 11;
  WS_TRACE_API_FILL_READER                               = 12;
  WS_TRACE_API_READ_START_ELEMENT                        = 13;
  WS_TRACE_API_READ_TO_START_ELEMENT                     = 14;
  WS_TRACE_API_READ_START_ATTRIBUTE                      = 15;
  WS_TRACE_API_READ_END_ATTRIBUTE                        = 16;
  WS_TRACE_API_READ_NODE                                 = 17;
  WS_TRACE_API_SKIP_NODE                                 = 18;
  WS_TRACE_API_READ_END_ELEMENT                          = 19;
  WS_TRACE_API_FIND_ATTRIBUTE                            = 20;
  WS_TRACE_API_READ_ELEMENT_VALUE                        = 21;
  WS_TRACE_API_READ_CHARS                                = 22;
  WS_TRACE_API_READ_CHARS_UTF8                           = 23;
  WS_TRACE_API_READ_BYTES                                = 24;
  WS_TRACE_API_READ_ARRAY                                = 25;
  WS_TRACE_API_GET_READER_POSITION                       = 26;
  WS_TRACE_API_SET_READER_POSITION                       = 27;
  WS_TRACE_API_MOVE_READER                               = 28;
  WS_TRACE_API_CREATE_WRITER                             = 29;
  WS_TRACE_API_FREE_XML_WRITER                           = 30;
  WS_TRACE_API_SET_OUTPUT                                = 31;
  WS_TRACE_API_SET_OUTPUT_TO_BUFFER                      = 32;
  WS_TRACE_API_GET_WRITER_PROPERTY                       = 33;
  WS_TRACE_API_FLUSH_WRITER                              = 34;
  WS_TRACE_API_WRITE_START_ELEMENT                       = 35;
  WS_TRACE_API_WRITE_END_START_ELEMENT                   = 36;
  WS_TRACE_API_WRITE_XMLNS_ATTRIBUTE                     = 37;
  WS_TRACE_API_WRITE_START_ATTRIBUTE                     = 38;
  WS_TRACE_API_WRITE_END_ATTRIBUTE                       = 39;
  WS_TRACE_API_WRITE_VALUE                               = 40;
  WS_TRACE_API_WRITE_XML_BUFFER                          = 41;
  WS_TRACE_API_READ_XML_BUFFER                           = 42;
  WS_TRACE_API_WRITE_XML_BUFFER_TO_BYTES                 = 43;
  WS_TRACE_API_READ_XML_BUFFER_FROM_BYTES                = 44;
  WS_TRACE_API_WRITE_ARRAY                               = 45;
  WS_TRACE_API_WRITE_QUALIFIED_NAME                      = 46;
  WS_TRACE_API_WRITE_CHARS                               = 47;
  WS_TRACE_API_WRITE_CHARS_UTF8                          = 48;
  WS_TRACE_API_WRITE_BYTES                               = 49;
  WS_TRACE_API_PUSH_BYTES                                = 50;
  WS_TRACE_API_PULL_BYTES                                = 51;
  WS_TRACE_API_WRITE_END_ELEMENT                         = 52;
  WS_TRACE_API_WRITE_TEXT                                = 53;
  WS_TRACE_API_WRITE_START_CDATA                         = 54;
  WS_TRACE_API_WRITE_END_CDATA                           = 55;
  WS_TRACE_API_WRITE_NODE                                = 56;
  WS_TRACE_API_PREFIX_FROM_NAMESPACE                     = 57;
  WS_TRACE_API_GET_WRITER_POSITION                       = 58;
  WS_TRACE_API_SET_WRITER_POSITION                       = 59;
  WS_TRACE_API_MOVE_WRITER                               = 60;
  WS_TRACE_API_TRIM_XML_WHITESPACE                       = 61;
  WS_TRACE_API_VERIFY_XML_NCNAME                         = 62;
  WS_TRACE_API_XML_STRING_EQUALS                         = 63;
  WS_TRACE_API_NAMESPACE_FROM_PREFIX                     = 64;
  WS_TRACE_API_READ_QUALIFIED_NAME                       = 65;
  WS_TRACE_API_GET_XML_ATTRIBUTE                         = 66;
  WS_TRACE_API_COPY_NODE                                 = 67;
  WS_TRACE_API_ASYNC_EXECUTE                             = 68;
  WS_TRACE_API_CREATE_CHANNEL                            = 69;
  WS_TRACE_API_OPEN_CHANNEL                              = 70;
  WS_TRACE_API_SEND_MESSAGE                              = 71;
  WS_TRACE_API_RECEIVE_MESSAGE                           = 72;
  WS_TRACE_API_REQUEST_REPLY                             = 73;
  WS_TRACE_API_SEND_REPLY_MESSAGE                        = 74;
  WS_TRACE_API_SEND_FAULT_MESSAGE_FOR_ERROR              = 75;
  WS_TRACE_API_GET_CHANNEL_PROPERTY                      = 76;
  WS_TRACE_API_SET_CHANNEL_PROPERTY                      = 77;
  WS_TRACE_API_WRITE_MESSAGE_START                       = 78;
  WS_TRACE_API_WRITE_MESSAGE_END                         = 79;
  WS_TRACE_API_READ_MESSAGE_START                        = 80;
  WS_TRACE_API_READ_MESSAGE_END                          = 81;
  WS_TRACE_API_CLOSE_CHANNEL                             = 82;
  WS_TRACE_API_ABORT_CHANNEL                             = 83;
  WS_TRACE_API_FREE_CHANNEL                              = 84;
  WS_TRACE_API_RESET_CHANNEL                             = 85;
  WS_TRACE_API_ABANDON_MESSAGE                           = 86;
  WS_TRACE_API_SHUTDOWN_SESSION_CHANNEL                  = 87;
  WS_TRACE_API_GET_CONTEXT_PROPERTY                      = 88;
  WS_TRACE_API_GET_DICTIONARY                            = 89;
  WS_TRACE_API_READ_ENDPOINT_ADDRESS_EXTENSION           = 90;
  WS_TRACE_API_CREATE_ERROR                              = 91;
  WS_TRACE_API_ADD_ERROR_STRING                          = 92;
  WS_TRACE_API_GET_ERROR_STRING                          = 93;
  WS_TRACE_API_COPY_ERROR                                = 94;
  WS_TRACE_API_GET_ERROR_PROPERTY                        = 95;
  WS_TRACE_API_SET_ERROR_PROPERTY                        = 96;
  WS_TRACE_API_RESET_ERROR                               = 97;
  WS_TRACE_API_FREE_ERROR                                = 98;
  WS_TRACE_API_GET_FAULT_ERROR_PROPERTY                  = 99;
  WS_TRACE_API_SET_FAULT_ERROR_PROPERTY                  = 100;
  WS_TRACE_API_CREATE_FAULT_FROM_ERROR                   = 101;
  WS_TRACE_API_SET_FAULT_ERROR_DETAIL                    = 102;
  WS_TRACE_API_GET_FAULT_ERROR_DETAIL                    = 103;
  WS_TRACE_API_CREATE_HEAP                               = 104;
  WS_TRACE_API_ALLOC                                     = 105;
  WS_TRACE_API_GET_HEAP_PROPERTY                         = 106;
  WS_TRACE_API_RESET_HEAP                                = 107;
  WS_TRACE_API_FREE_HEAP                                 = 108;
  WS_TRACE_API_CREATE_LISTENER                           = 109;
  WS_TRACE_API_OPEN_LISTENER                             = 110;
  WS_TRACE_API_ACCEPT_CHANNEL                            = 111;
  WS_TRACE_API_CLOSE_LISTENER                            = 112;
  WS_TRACE_API_ABORT_LISTENER                            = 113;
  WS_TRACE_API_RESET_LISTENER                            = 114;
  WS_TRACE_API_FREE_LISTENER                             = 115;
  WS_TRACE_API_GET_LISTENER_PROPERTY                     = 116;
  WS_TRACE_API_SET_LISTENER_PROPERTY                     = 117;
  WS_TRACE_API_CREATE_CHANNEL_FOR_LISTENER               = 118;
  WS_TRACE_API_CREATE_MESSAGE                            = 119;
  WS_TRACE_API_CREATE_MESSAGE_FOR_CHANNEL                = 120;
  WS_TRACE_API_INITIALIZE_MESSAGE                        = 121;
  WS_TRACE_API_RESET_MESSAGE                             = 122;
  WS_TRACE_API_FREE_MESSAGE                              = 123;
  WS_TRACE_API_GET_HEADER_ATTRIBUTES                     = 124;
  WS_TRACE_API_GET_HEADER                                = 125;
  WS_TRACE_API_GET_CUSTOM_HEADER                         = 126;
  WS_TRACE_API_REMOVE_HEADER                             = 127;
  WS_TRACE_API_SET_HEADER                                = 128;
  WS_TRACE_API_REMOVE_CUSTOM_HEADER                      = 129;
  WS_TRACE_API_ADD_CUSTOM_HEADER                         = 130;
  WS_TRACE_API_ADD_MAPPED_HEADER                         = 131;
  WS_TRACE_API_REMOVE_MAPPED_HEADER                      = 132;
  WS_TRACE_API_GET_MAPPED_HEADER                         = 133;
  WS_TRACE_API_WRITE_BODY                                = 134;
  WS_TRACE_API_READ_BODY                                 = 135;
  WS_TRACE_API_WRITE_ENVELOPE_START                      = 136;
  WS_TRACE_API_WRITE_ENVELOPE_END                        = 137;
  WS_TRACE_API_READ_ENVELOPE_START                       = 138;
  WS_TRACE_API_READ_ENVELOPE_END                         = 139;
  WS_TRACE_API_GET_MESSAGE_PROPERTY                      = 140;
  WS_TRACE_API_SET_MESSAGE_PROPERTY                      = 141;
  WS_TRACE_API_ADDRESS_MESSAGE                           = 142;
  WS_TRACE_API_CHECK_MUST_UNDERSTAND_HEADERS             = 143;
  WS_TRACE_API_MARK_HEADER_AS_UNDERSTOOD                 = 144;
  WS_TRACE_API_FILL_BODY                                 = 145;
  WS_TRACE_API_FLUSH_BODY                                = 146;
  WS_TRACE_API_REQUEST_SECURITY_TOKEN                    = 147;
  WS_TRACE_API_GET_SECURITY_TOKEN_PROPERTY               = 148;
  WS_TRACE_API_CREATE_XML_SECURITY_TOKEN                 = 149;
  WS_TRACE_API_FREE_SECURITY_TOKEN                       = 150;
  WS_TRACE_API_REVOKE_SECURITY_CONTEXT                   = 151;
  WS_TRACE_API_GET_SECURITY_CONTEXT_PROPERTY             = 152;
  WS_TRACE_API_READ_ELEMENT_TYPE                         = 153;
  WS_TRACE_API_READ_ATTRIBUTE_TYPE                       = 154;
  WS_TRACE_API_READ_TYPE                                 = 155;
  WS_TRACE_API_WRITE_ELEMENT_TYPE                        = 156;
  WS_TRACE_API_WRITE_ATTRIBUTE_TYPE                      = 157;
  WS_TRACE_API_WRITE_TYPE                                = 158;
  WS_TRACE_API_SERVICE_REGISTER_FOR_CANCEL               = 159;
  WS_TRACE_API_GET_SERVICE_HOST_PROPERTY                 = 160;
  WS_TRACE_API_CREATE_SERVICE_HOST                       = 161;
  WS_TRACE_API_OPEN_SERVICE_HOST                         = 162;
  WS_TRACE_API_CLOSE_SERVICE_HOST                        = 163;
  WS_TRACE_API_ABORT_SERVICE_HOST                        = 164;
  WS_TRACE_API_FREE_SERVICE_HOST                         = 165;
  WS_TRACE_API_RESET_SERVICE_HOST                        = 166;
  WS_TRACE_API_GET_SERVICE_PROXY_PROPERTY                = 167;
  WS_TRACE_API_CREATE_SERVICE_PROXY                      = 168;
  WS_TRACE_API_OPEN_SERVICE_PROXY                        = 169;
  WS_TRACE_API_CLOSE_SERVICE_PROXY                       = 170;
  WS_TRACE_API_ABORT_SERVICE_PROXY                       = 171;
  WS_TRACE_API_FREE_SERVICE_PROXY                        = 172;
  WS_TRACE_API_RESET_SERVICE_PROXY                       = 173;
  WS_TRACE_API_ABORT_CALL                                = 174;
  WS_TRACE_API_CALL                                      = 175;
  WS_TRACE_API_DECODE_URL                                = 176;
  WS_TRACE_API_ENCODE_URL                                = 177;
  WS_TRACE_API_COMBINE_URL                               = 178;
  WS_TRACE_API_DATETIME_TO_FILETIME                      = 179;
  WS_TRACE_API_FILETIME_TO_DATETIME                      = 180;
  WS_TRACE_API_DUMP_MEMORY                               = 181;
  WS_TRACE_API_SET_AUTOFAIL                              = 182;
  WS_TRACE_API_CREATE_METADATA                           = 183;
  WS_TRACE_API_READ_METADATA                             = 184;
  WS_TRACE_API_FREE_METADATA                             = 185;
  WS_TRACE_API_RESET_METADATA                            = 186;
  WS_TRACE_API_GET_METADATA_PROPERTY                     = 187;
  WS_TRACE_API_GET_MISSING_METADATA_DOCUMENT_ADDRESS     = 188;
  WS_TRACE_API_GET_METADATA_ENDPOINTS                    = 189;
  WS_TRACE_API_MATCH_POLICY_ALTERNATIVE                  = 190;
  WS_TRACE_API_GET_POLICY_PROPERTY                       = 191;
  WS_TRACE_API_GET_POLICY_ALTERNATIVE_COUNT              = 192;
  WS_TRACE_API_WS_CREATE_SERVICE_PROXY_FROM_TEMPLATE     = 193;
  WS_TRACE_API_WS_CREATE_SERVICE_HOST_FROM_TEMPLATE      = 194;


//  Url enum
//
//   The set of schemes used with WsDecodeUrl, WsEncodeUrl,
//  and WsCombineUrl.
//
  //type = WS_URL_SCHEME_TYPE
  WS_URL_HTTP_SCHEME_TYPE        = 0;
  WS_URL_HTTPS_SCHEME_TYPE       = 1;
  WS_URL_NETTCP_SCHEME_TYPE      = 2;
  WS_URL_SOAPUDP_SCHEME_TYPE     = 3;
  WS_URL_NETPIPE_SCHEME_TYPE     = 4;


//  Url enum
//
//   Flags that control behavior of WsDecodeUrl, WsEncodeUrl,
//  and WsCombineUrl.
//
  WS_URL_FLAGS_ALLOW_HOST_WILDCARDS     = $1;
  WS_URL_FLAGS_NO_PATH_COLLAPSE         = $2;
  WS_URL_FLAGS_ZERO_TERMINATE           = $4;


//  Utilities enum
//
//   Specifies the textual format of a WS_DATETIME.
//
  //type = WS_DATETIME_FORMAT
  WS_DATETIME_FORMAT_UTC       = 0;
  WS_DATETIME_FORMAT_LOCAL     = 1;
  WS_DATETIME_FORMAT_NONE      = 2;


//  Metadata Import enum
//
//   The state of the metadata object.
//
  //type = WS_METADATA_STATE
  WS_METADATA_STATE_CREATED      = 1;
  WS_METADATA_STATE_RESOLVED     = 2;
  WS_METADATA_STATE_FAULTED      = 3;


//  Metadata Import enum
//
//   Each metadata property is identified by an ID and has an associated
//  value.  If a property is not specified when the metadata is created,
//  then its default value is used.
//
  //type = WS_METADATA_PROPERTY_ID
  WS_METADATA_PROPERTY_STATE                   = 1;
  WS_METADATA_PROPERTY_HEAP_PROPERTIES         = 2;
  WS_METADATA_PROPERTY_POLICY_PROPERTIES       = 3;
  WS_METADATA_PROPERTY_HEAP_REQUESTED_SIZE     = 4;
  WS_METADATA_PROPERTY_MAX_DOCUMENTS           = 5;
  WS_METADATA_PROPERTY_HOST_NAMES              = 6;
  WS_METADATA_PROPERTY_VERIFY_HOST_NAMES       = 7;


//  Metadata Import enum
//
//   The state of the policy object.
//
  //type = WS_POLICY_STATE
  WS_POLICY_STATE_CREATED     = 1;
  WS_POLICY_STATE_FAULTED     = 2;


//  Metadata Import enum
//
//   Each policy property is identified by an ID and has an associated
//  value.
//
  //type = WS_POLICY_PROPERTY_ID
  WS_POLICY_PROPERTY_STATE                = 1;
  WS_POLICY_PROPERTY_MAX_ALTERNATIVES     = 2;
  WS_POLICY_PROPERTY_MAX_DEPTH            = 3;
  WS_POLICY_PROPERTY_MAX_EXTENSIONS       = 4;


//  Metadata Import enum
//
//   The values in this enumeration are used to identify the sub-types of WS_SECURITY_BINDING_CONSTRAINT.
//
  //type = WS_SECURITY_BINDING_CONSTRAINT_TYPE
  WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE                = 1;
  WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE           = 2;
  WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE             = 3;
  WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE             = 4;
  WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE       = 5;
  WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE         = 6;
  WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE                 = 7;
  WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE     = 8;


//  Metadata Import enum
//
//   The values in this enumeration are used to identify the sub-types of WS_POLICY_EXTENSION.
//
  //type = WS_POLICY_EXTENSION_TYPE
  WS_ENDPOINT_POLICY_EXTENSION_TYPE     = 1;


//  Policy Support enum
//
//   An enumeration of the different security binding combinations that
//  are supported in current product.
//
  //type = WS_BINDING_TEMPLATE_TYPE
  WS_HTTP_BINDING_TEMPLATE_TYPE                                         = 0;
  WS_HTTP_SSL_BINDING_TEMPLATE_TYPE                                     = 1;
  WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE                             = 2;
  WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE_TYPE                         = 3;
  WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE_TYPE                            = 4;
  WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE                      = 5;
  WS_TCP_BINDING_TEMPLATE_TYPE                                          = 6;
  WS_TCP_SSPI_BINDING_TEMPLATE_TYPE                                     = 7;
  WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE                            = 8;
  WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE                      = 9;
  WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE           = 10;
  WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE     = 11;
  WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE           = 12;
  WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE     = 13;


//  ERROR DEFINITIONS

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

const
  WEBSERVICES_DLL = 'WebServices.dll';


function WsStartReaderCanonicalization; external WEBSERVICES_DLL name 'WsStartReaderCanonicalization';
function WsEndReaderCanonicalization; external WEBSERVICES_DLL name 'WsEndReaderCanonicalization';
function WsStartWriterCanonicalization; external WEBSERVICES_DLL name 'WsStartWriterCanonicalization';
function WsEndWriterCanonicalization; external WEBSERVICES_DLL name 'WsEndWriterCanonicalization';
function WsCreateXmlBuffer; external WEBSERVICES_DLL name 'WsCreateXmlBuffer';
function WsRemoveNode; external WEBSERVICES_DLL name 'WsRemoveNode';
function WsCreateReader; external WEBSERVICES_DLL name 'WsCreateReader';
function WsSetInput; external WEBSERVICES_DLL name 'WsSetInput';
function WsSetInputToBuffer; external WEBSERVICES_DLL name 'WsSetInputToBuffer';
procedure WsFreeReader; external WEBSERVICES_DLL name 'WsFreeReader';
function WsGetReaderProperty; external WEBSERVICES_DLL name 'WsGetReaderProperty';
function WsGetReaderNode; external WEBSERVICES_DLL name 'WsGetReaderNode';
function WsFillReader; external WEBSERVICES_DLL name 'WsFillReader';
function WsReadStartElement; external WEBSERVICES_DLL name 'WsReadStartElement';
function WsReadToStartElement; external WEBSERVICES_DLL name 'WsReadToStartElement';
function WsReadStartAttribute; external WEBSERVICES_DLL name 'WsReadStartAttribute';
function WsReadEndAttribute; external WEBSERVICES_DLL name 'WsReadEndAttribute';
function WsReadNode; external WEBSERVICES_DLL name 'WsReadNode';
function WsSkipNode; external WEBSERVICES_DLL name 'WsSkipNode';
function WsReadEndElement; external WEBSERVICES_DLL name 'WsReadEndElement';
function WsFindAttribute; external WEBSERVICES_DLL name 'WsFindAttribute';
function WsReadValue; external WEBSERVICES_DLL name 'WsReadValue';
function WsReadChars; external WEBSERVICES_DLL name 'WsReadChars';
function WsReadCharsUtf8; external WEBSERVICES_DLL name 'WsReadCharsUtf8';
function WsReadBytes; external WEBSERVICES_DLL name 'WsReadBytes';
function WsReadArray; external WEBSERVICES_DLL name 'WsReadArray';
function WsGetReaderPosition; external WEBSERVICES_DLL name 'WsGetReaderPosition';
function WsSetReaderPosition; external WEBSERVICES_DLL name 'WsSetReaderPosition';
function WsMoveReader; external WEBSERVICES_DLL name 'WsMoveReader';
function WsCreateWriter; external WEBSERVICES_DLL name 'WsCreateWriter';
procedure WsFreeWriter; external WEBSERVICES_DLL name 'WsFreeWriter';
function WsSetOutput; external WEBSERVICES_DLL name 'WsSetOutput';
function WsSetOutputToBuffer; external WEBSERVICES_DLL name 'WsSetOutputToBuffer';
function WsGetWriterProperty; external WEBSERVICES_DLL name 'WsGetWriterProperty';
function WsFlushWriter; external WEBSERVICES_DLL name 'WsFlushWriter';
function WsWriteStartElement; external WEBSERVICES_DLL name 'WsWriteStartElement';
function WsWriteEndStartElement; external WEBSERVICES_DLL name 'WsWriteEndStartElement';
function WsWriteXmlnsAttribute; external WEBSERVICES_DLL name 'WsWriteXmlnsAttribute';
function WsWriteStartAttribute; external WEBSERVICES_DLL name 'WsWriteStartAttribute';
function WsWriteEndAttribute; external WEBSERVICES_DLL name 'WsWriteEndAttribute';
function WsWriteValue; external WEBSERVICES_DLL name 'WsWriteValue';
function WsWriteArray; external WEBSERVICES_DLL name 'WsWriteArray';
function WsWriteQualifiedName; external WEBSERVICES_DLL name 'WsWriteQualifiedName';
function WsWriteChars; external WEBSERVICES_DLL name 'WsWriteChars';
function WsWriteCharsUtf8; external WEBSERVICES_DLL name 'WsWriteCharsUtf8';
function WsWriteBytes; external WEBSERVICES_DLL name 'WsWriteBytes';
function WsPushBytes; external WEBSERVICES_DLL name 'WsPushBytes';
function WsPullBytes; external WEBSERVICES_DLL name 'WsPullBytes';
function WsWriteEndElement; external WEBSERVICES_DLL name 'WsWriteEndElement';
function WsWriteText; external WEBSERVICES_DLL name 'WsWriteText';
function WsWriteStartCData; external WEBSERVICES_DLL name 'WsWriteStartCData';
function WsWriteEndCData; external WEBSERVICES_DLL name 'WsWriteEndCData';
function WsWriteNode; external WEBSERVICES_DLL name 'WsWriteNode';
function WsGetPrefixFromNamespace; external WEBSERVICES_DLL name 'WsGetPrefixFromNamespace';
function WsGetWriterPosition; external WEBSERVICES_DLL name 'WsGetWriterPosition';
function WsSetWriterPosition; external WEBSERVICES_DLL name 'WsSetWriterPosition';
function WsMoveWriter; external WEBSERVICES_DLL name 'WsMoveWriter';
function WsTrimXmlWhitespace; external WEBSERVICES_DLL name 'WsTrimXmlWhitespace';
function WsVerifyXmlNCName; external WEBSERVICES_DLL name 'WsVerifyXmlNCName';
function WsXmlStringEquals; external WEBSERVICES_DLL name 'WsXmlStringEquals';
function WsGetNamespaceFromPrefix; external WEBSERVICES_DLL name 'WsGetNamespaceFromPrefix';
function WsReadQualifiedName; external WEBSERVICES_DLL name 'WsReadQualifiedName';
function WsGetXmlAttribute; external WEBSERVICES_DLL name 'WsGetXmlAttribute';
function WsCopyNode; external WEBSERVICES_DLL name 'WsCopyNode';
function WsAsyncExecute; external WEBSERVICES_DLL name 'WsAsyncExecute';
function WsCreateChannel; external WEBSERVICES_DLL name 'WsCreateChannel';
function WsOpenChannel; external WEBSERVICES_DLL name 'WsOpenChannel';
function WsSendMessage; external WEBSERVICES_DLL name 'WsSendMessage';
function WsReceiveMessage; external WEBSERVICES_DLL name 'WsReceiveMessage';
function WsRequestReply; external WEBSERVICES_DLL name 'WsRequestReply';
function WsSendReplyMessage; external WEBSERVICES_DLL name 'WsSendReplyMessage';
function WsSendFaultMessageForError; external WEBSERVICES_DLL name 'WsSendFaultMessageForError';
function WsGetChannelProperty; external WEBSERVICES_DLL name 'WsGetChannelProperty';
function WsSetChannelProperty; external WEBSERVICES_DLL name 'WsSetChannelProperty';
function WsWriteMessageStart; external WEBSERVICES_DLL name 'WsWriteMessageStart';
function WsWriteMessageEnd; external WEBSERVICES_DLL name 'WsWriteMessageEnd';
function WsReadMessageStart; external WEBSERVICES_DLL name 'WsReadMessageStart';
function WsReadMessageEnd; external WEBSERVICES_DLL name 'WsReadMessageEnd';
function WsCloseChannel; external WEBSERVICES_DLL name 'WsCloseChannel';
function WsAbortChannel; external WEBSERVICES_DLL name 'WsAbortChannel';
procedure WsFreeChannel; external WEBSERVICES_DLL name 'WsFreeChannel';
function WsResetChannel; external WEBSERVICES_DLL name 'WsResetChannel';
function WsAbandonMessage; external WEBSERVICES_DLL name 'WsAbandonMessage';
function WsShutdownSessionChannel; external WEBSERVICES_DLL name 'WsShutdownSessionChannel';
function WsGetOperationContextProperty; external WEBSERVICES_DLL name 'WsGetOperationContextProperty';
function WsGetDictionary; external WEBSERVICES_DLL name 'WsGetDictionary';
function WsReadEndpointAddressExtension; external WEBSERVICES_DLL name 'WsReadEndpointAddressExtension';
function WsCreateError; external WEBSERVICES_DLL name 'WsCreateError';
function WsAddErrorString; external WEBSERVICES_DLL name 'WsAddErrorString';
function WsGetErrorString; external WEBSERVICES_DLL name 'WsGetErrorString';
function WsCopyError; external WEBSERVICES_DLL name 'WsGetErrorString';
function WsGetErrorProperty; external WEBSERVICES_DLL name 'WsGetErrorProperty';





function WsWriteXmlBuffer; external WEBSERVICES_DLL name 'WsWriteXmlBuffer';
function WsReadXmlBuffer; external WEBSERVICES_DLL name 'WsReadXmlBuffer';
function WsWriteXmlBufferToBytes; external WEBSERVICES_DLL name 'WsWriteXmlBufferToBytes';
function WsReadXmlBufferFromBytes; external WEBSERVICES_DLL name 'WsReadXmlBufferFromBytes';



procedure WsFreeError; external WEBSERVICES_DLL name 'WsFreeError';
function WsCreateHeap; external WEBSERVICES_DLL name 'WsCreateHeap';
procedure WsFreeHeap; external WEBSERVICES_DLL name 'WsFreeHeap';


end.
