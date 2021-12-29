*-- (c) Microsoft Corporation 1995

*-- Arquivo comum de inclusão
#INCLUDE "FOXPRO.H"
#INCLUDE "STRINGS.H"

#DEFINE DEBUGMODE .F.
#DEFINE INIFILE  "TASTRADE.INI"
#DEFINE CRLF  CHR(13) + CHR(10)
#DEFINE CR    CHR(13)
#DEFINE TAB    CHR(9)

#DEFINE CURRENCY  ""
#DEFINE AERRORARRAY  7

*-- Estas comnstantes são usadas no tsbaseform para
*-- indicar o status do alias atual
#DEFINE FILE_OK    0
#DEFINE FILE_BOF  1
#DEFINE FILE_EOF  2
#DEFINE FILE_CANCEL  3

*-- Constantes que identificam qual disparador falhou
*-- usando o elemento 5 da matriz retornado por
*-- AERROR(), assim como para fazer referência ao elemento da matriz
*-- adequado na matriz de mensagens de erros: aErrorMsg[]
#DEFINE INSERTTRIG  1
#DEFINE UPDATETRIG  2
#DEFINE DELETETRIG  3

*-- Constantes usadas para ler o regsitro do sistema
#DEFINE HKEY_LOCAL_MACHINE      -2147483646  
#DEFINE KEY_SHARED_TOOLS_LOCATION  "Software\Microsoft\Shared Tools Location"
#DEFINE KEY_NTCURRENTVERSION    "Software\Microsoft\Windows NT\CurrentVersion"
#DEFINE KEY_WIN4CURRENTVERSION    "Software\Microsoft\Windows\CurrentVersion"
#DEFINE KEY_QUERY_VALUE        1
#DEFINE ERROR_SUCCESS        0

