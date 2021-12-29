***
*  Programador..: Edson de Araujo
*  Programa.....: Function.prg
*  Finalidade...: Funções do Programa
*  Sistema.:     Sindicato dos Empregados em Empresas de turismo do Estado de São Paulo
*  
*  Inicio Programa.:  18/06/1999
*  Ultima Alteração.: 13/08/1999
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 3.0 SQL(SERVER/CLIENTE)
*  Atualizado Para : Visual Fox Pro 6.0
*
*  " Deus seja Louvado "
*
***

FUNCTION cabecalho()
	***  
	* Converte data para 2000
	***  
	dat_velha = date()
	STORE DTOC(dat_velha)             TO dat_nov
	STORE SUBSTR(dat_nov,1,6)         TO dat_fim
	STORE year(date())                TO dat_com
	STORE dat_fim+ltrim(str(dat_com)) TO aa_dat

	&& Cabeçalho da Pagina

   @ PROW()+10,00  SAY REPLICATE("=",152)
   @ PROW()+01,01  SAY cTiTle
   @ PROW()+01,00  SAY REPLICATE("-",172)
   @ PROW()+01,01  SAY "Data : "
   @ PROW()+00,08  SAY DATE()
   @ PROW()+00,52  SAY time()
   @ PROW()+00,104 SAY "Pagina : "
   @ PROW()+00,114 SAY Str(Pagina,4)
   @ PROW()+01,00  SAY REPLICATE("-",172)
   @ PROW()+01,00  SAY SPACE(02)
	
ENDFUNC


FUNCTION Neterror()

  If nCodEr = 1705
	 *=Aviso()
     cText = "Acesso não permitido"                         + Chr(13) + Chr(13) + ;
             "O  banco  de  dados  está  sendo  utilizado"  + Chr(13) + ;
             "em  modo  exclusivo na  rede  por uma outra"  + Chr(13) + ;
	         "estação de trabalho. Tente novamente."

	 =MessageBox(cText, 16, cSistema)
	 Close All
	 Cancel
	 Return(1)
	 *Quit
  EndIf
  If nCodEr = 202
	 *=Aviso()
     cText = "Servidor de Acesso não Foi       "  + Chr(13) + Chr(13) + ;
             "encontrado ou não está Disponivel"  + Chr(13) + ;
             "Tente reiniciar o Micro !!!      "

	 =MessageBox(cText, 16, cSistema)

ENDFUNC

*--------------------
*-- Habilita ou desabilita o pressionamento de botões na
*-- barra de ferramentas.  
*--
FUNCTION SisBarraStatus()

   Parameters nEstado
   
   If nEstado = 1
      oSisBarra.Enabled = .T. && Habilita barra de ferramentas
   Else
      oSisBarra.Enabled = .F.
   EndIf
   
ENDFUNC

FUNCTION TrataErro()

  PARAMETERS nCodEr, cMsgEr, cProgEr, nLinhaEr, cSistema
  
  Local nCount, nResp
  Local cText
	
  If Type("nLinhaEr") = "U"
     nLinhaEr = 0
  EndIf
	
  If Type("cSistema") = "U" Or Empty(cSistema)
	 cSistema = "Atenção"
  EndIf   

  If nCodEr = 125
	 *=Aviso()
     cText = "A impressora não está pronta."                   + Chr(13) + Chr(13) + ;
	         "Verifique se existe uma impressora instalada no" + Chr(13) + ;
	         "Gerenciador de Impressão e tente novamente."
	            
	 =MessageBox(cText, 16, cSistema)
	 Return(1)
  EndIf
	
  If nCodEr = 1881
	 *=Aviso()
     cText = "Acesso não permitido"                       + Chr(13) + Chr(13) + ;
	         "Arquivos de dados em uso exclusivo na rede" + Chr(13) + ;
	         "Tente novamente."
	            
	 =MessageBox(cText, 16, cSistema)
	 Return(1)
  EndIf

  If nCodEr = 1705
	 *=Aviso()
     cText = "Acesso não permitido"                         + Chr(13) + Chr(13) + ;
             "O  banco  de  dados  está  sendo  utilizado"  + Chr(13) + ;
             "em  modo  exclusivo na  rede  por uma outra"  + Chr(13) + ;
	         "estação de trabalho. Tente novamente."

	 =MessageBox(cText, 16, cSistema)
	 Close All
	 Cancel
	 Return(1)
	 *Quit
  EndIf
     	
  If nCodEr = 1405
     *=Aviso()
     =MessageBox("Não foi possível conectar o servidor da rede", 16, cSistema)
     Cancel
  EndIf
	
  If nCodEr = 109 Or nCodEr = 1502
     **
	 * Tratamento de erros da rede, tenta reexecutar os comandos.
	 **
	 For nCount = 1 To 5
	     Retry
	 EndFor    
  EndIf
	   
  nResp=MessageBox("MENSAGEM: "        + AllTrim(cMsgEr)        + Chr(13) + ;
	          "       CÓDIGO: "   + AllTrim(Str(nCodEr))   + Chr(13) + ;
	          "PROGRAMA: "        + AllTrim(cProgEr)       + Chr(13) + ;
	          "          LINHA: " + AllTrim(Str(nLinhaEr)) + Chr(13) + Chr(13) + ;
	          "Anote essas informações e entre em contato com o suporte técnico", 1+16+0, cSistema)
  If nResp = 2            
     Cancel
  Else
     Return(Error())
  EndIf
	
ENDFUNC

***
*  Função termometro
**

FUNCTION termometro()
LPARAMETERS ativar, percentual, mensagem, incremento

If Parameters()= 4

   If ((percentual % incremento) > 1.0) 
     Return .T.
   Endif

   If ativar
     If not WVisible("TERMOMETRO")
        Define Window TERMOMETRO ;
          At  0.000, 0.000  ;
          Size 4.769,75.600 ;
          Font "MS Sans Serif", 8 ;
          NoFloat ;
          NoClose ;
          NoMinimize ;
          Color RGB(,,,192,192,192)
        Move Window TERMOMETRO Center
        Set Cursor Off
        Activate Window TERMOMETRO Top
        @ 2.692,5.200 To 2.692,65.400 ;
          Pen 1, 8 ;
          Style "1" ;
          Color RGB(128,128,128,128,128,128)
        @ 3.615,5.200 To 3.615,65.400 ;
      	  Pen 1, 8 ;
      	  Style "1" ;
      	  Color RGB(255,255,255,255,255,255)
        @ 2.692,5.200 To 3.692,5.200 ;
      	  Pen 1, 8 ;
      	  Color RGB(128,128,128,128,128,128)
        @ 2.692,65.200 To 3.692,65.200 ;
      	  Pen 1, 8 ;
      	  Color RGB(255,255,255,255,255,255)
        @ 2.769,2.400 Say "0"  ;
      	  Font "MS Sans Serif", 8 ;
      	  Style "BT"
        @ 2.769,66.200 Say "100%"  ;
      	  Font "MS Sans Serif", 8 ;
      	  Style "BT"
        @ 4.538,0.800 To 4.538,75.200 ;
      	  Pen 2, 8 ;
      	  Style "1" ;
      	  Color RGB(128,128,128,128,128,128)
        @ 0.231,0.400 To 4.539,0.400 ;
      	  Pen 2, 8 ;
      	  Color RGB(255,255,255,255,255,255)
        @ 0.231,75.000 To 4.539,75.000 ;
      	  Pen 2, 8 ;
      	  Color RGB(128,128,128,128,128,128)
        @ 0.077,0.600 To 0.077,75.000 ;
      	  Pen 2, 8 ;
      	  Style "1" ;
    	  Color RGB(255,255,255,255,255,255)
     Endif
     Activate Window TERMOMETRO Top
     @ 1.00, 2.500 Say mensagem ;
	 Size 1.000,59.00 ;
	 Font "MS Sans Serif", 8 ;
     Style "B" ;
	 Picture "@I"
     
     If percentual > 0
        @ 2.846,5.800 To 3.538, 5.8+58.8*(percentual/per1); && 5431.0);  && 
          Pattern 1 ;
          Pen 1, 8 ;
          Color RGB(,,,255,128,0)
     Endif
   Endif
Else
   If WExist("TERMOMETRO")
     Release Window TERMOMETRO
     Set Cursor On
   Endif
Endif
Return .T.
ENDFUNC

*   ---------------------------------
*   A funcao retorna o nome do mes
*   da data fornecida como parametro
*   de processamento.
*   ---------------------------------

FUNCTION cabadm
LOCAL Diaimp,mesimp,Anoimp,VARMES
Diaimp = DAY(DATE())
VARMES = MONTH(DATE())
Anoimp = YEAR(DATE())

DO CASE
   CASE VARMES = 1
        MESIMP = "janeiro"
   CASE VARMES = 2
        MESIMP = "fevereiro"
   CASE VARMES = 3
        MESIMP = "marco"
   CASE VARMES = 4
        MESIMP = "abril"
   CASE VARMES= 5
        MESIMP = "maio"
   CASE VARMES = 6
        MESIMP = "junho"
   CASE VARMES = 7
        MESIMP = "julho"
   CASE VARMES = 8
        MESIMP = "agosto"
   CASE VARMES = 9
        MESIMP = "setembro"
   CASE VARMES = 10
        MESIMP = "outubro"
   CASE VARMES = 11
        MESIMP = "novembro"
   CASE VARMES = 12
        MESIMP = "dezembro"
   OTHERWISE
        MESIMP = " "
ENDCASE

* @ PROW() + 1,43 SAY "Sao Paulo, " + STR(Diaimp,2) + " de " + Mesimp + " de " + STR(Anoimp,4)

ENDFUNC

*  --------------------------------------
*  Esta funcao verifica se o socio esta
*  com o pagamento da mensalidade em dia.
*  --------------------------------------
FUNCTION pg_soc()

pagto = .T.
IF CATEGORIA = "R"
	pagto = .T.
ENDIF
IF CATEGORIA = "F"
	=Messagebox("Socio consta como FALECIDO !", cMessageTitle1)
	pagto = .F.
ENDIF
IF CATEGORIA = "D"
	=Messagebox("Socio consta como DESLIGADO !", cMessageTitle1)
	pagto = .F.
ENDIF
IF CATEGORIA = "L"
	=Messagebox("Socio consta como ELIMINADO do Quadro Social !", cMessageTitle1)
	pagto = .F.
ENDIF
IF CATEGORIA = "V"
	=Messagebox("Socio deve comparecer a DIRETORIA !", cMessageTitle1)
	pagto = .F.
ENDIF
IF CATEGORIA = "C" .OR. CATEGORIA = "A"
	STORE DATE()-90     TO PGSOC 

	DO CASE
		CASE MES = 01
			STORE "01/01" TO MDT
		CASE MES = 02
			STORE "01/02" TO MDT
  		CASE MES = 03
			STORE "01/03" TO MDT
		CASE MES = 04
 			STORE "01/04" TO MDT
		CASE MES = 05
			STORE "01/05" TO MDT
		CASE MES = 06
			STORE "01/06" TO MDT
		CASE MES = 07
			STORE "01/07" TO MDT
		CASE MES = 08
 			STORE "01/08" TO MDT
		CASE MES = 09
			STORE "01/09" TO MDT
		CASE MES = 10
			STORE "01/10" TO MDT
		CASE MES = 11
			STORE "01/11" TO MDT
		CASE MES = 12
			STORE "01/12" TO MDT
		OTHERWISE
			STORE "00/00" TO MDT
		ENDCASE
		DO CASE
			CASE ANO = 1999
				STORE "/1999" TO ADT
			CASE ANO = 2000
				STORE "/2000" TO ADT
			CASE ANO = 2001
				STORE "/2001" TO ADT
			CASE ANO = 2002
				STORE "/2002" TO ADT
			CASE ANO = 2003
				STORE "/2003" TO ADT
			CASE ANO = 2004
				STORE "/2004" TO ADT
			CASE ANO = 2005
				STORE "/2005" TO ADT
			CASE ANO = 2006
				STORE "/2006" TO ADT
			CASE ANO = 2007
				STORE "/2007" TO ADT
			CASE ANO = 2008
				STORE "/2008" TO ADT
			CASE ANO = 2009
				STORE "/2009" TO ADT
			CASE ANO = 2010
				STORE "/2010" TO ADT
			OTHERWISE
				STORE "00" TO ADT 
			ENDCASE
			
   STORE MDT + ADT TO DATA
   STORE CTOD(DATA) TO CERTO
   IF PGSOC >= CERTO
      =messagebox("Socio ATRASADO COM PAGAMENTO, acertar no CAIXA !", cMessageTitle1)
      pagto = .F.
   ENDIF
			
ENDIF
RETURN

ENDFUNC

*  -----------------------------------------
*  Esta funcao verifica se o socio esta
*  com o cadastro atualizado para envio de
*  Correspondencia
*  -----------------------------------------

FUNCTION ATUL(cad)          

cad = .T.
IF CAD_SI = "E"
   =MESSAGEBOX("Socio com ENDERECO DESATUALIZADO !!", cMessageTitle1)
   cad = .F.
ENDIF
IF CAD_SI = "G"
   =MESSAGEBOX("Socio com RG DESATUALIZADO !!", cMessageTitle1)
   cad = .F.
ENDIF
IF CAD_SI = "P"
   =MESSAGEBOX("Socio com CEP DESATUALIZADO !!", cMessageTitle1)
   cad = .F.
ENDIF
RETURN(cad)

ENDFUNC

FUNCTION ATUL2(etq)        

cad = .T.
IF CAD_SI = "E"
   cad = .F.
ENDIF
IF CAD_SI = "P"
   cad = .F.
ENDIF

RETURN(cad)

ENDFUNC

procedure traperro
Parameters m.mensagem, m.programa, m.numero
*
* Procedure de tratamento de erro, pra que o programa não aborte por
* motivo nenhum.
*
= MessageBox("Erro no sistema: "+CHR(13)+CHR(13)+;
m.mensagem+CHR(13)+;
"Programa: "+m.programa+CHR(13)+;
"Número: "+STR(m.numero),48+0+0,;
"TrapErro...")

return

procedure janela
*
* Rotina que simula a janela COMMAND
*
private MCONT, MCOMANDO, MITEM, MLETRA
MITEM = 1
on error do traperro WITH MESSAGE(), SYS(16), ERROR()
define window tudo from 0,0 to 35,81 in screen
define window janela from 0,0 to 2,81 in window tudo
define window tela from 2,0 to 35,81 in window tudo font 'system'
activate window tudo
MCONT = .T.
MCOMANDO = space(100 )
do while MCONT
activate window janela
if m.E_PONTEIRO <> 0
*MCOMANDO = m.E_BUFFER [ m.E_PONTEIRO ]
endif
@ 0,0 get MCOMANDO pict '@K'
read
MLETRA = lastkey()
do case
case MLETRA = 27
MCONT = .F.
case MLETRA = 24
if m.E_PONTEIRO > 1
m.E_PONTEIRO = m.E_PONTEIRO - 1
endif
case MLETRA = 5
if m.E_PONTEIRO < m.E_MAXIMO
m.E_PONTEIRO = m.E_PONTEIRO + 1
endif
otherwise
=ains ( m.E_BUFFER,1 )
if m.E_MAXIMO < alen( m.E_BUFFER )
m.E_MAXIMO = m.E_MAXIMO + 1
endif
m.E_BUFFER [ 1 ] = MCOMANDO
m.E_PONTEIRO = 1
activate window tela
&mcomando
endcase
enddo
release window janela
release window tela
release window tudo
ON ERROR DO Meuerro WITH MESSAGE(), SYS(16), ERROR()
return

*********
* MEUERRO - Rotina de manipulacao de erro.
*********
function MEUERRO
Parameters m.mensagem, m.programa, m.numero
*
*Comandos que podem ser usados:
*
*** Retry - Retorna a execução do programa para a mesma linha de onde
* ocorreu o erro.
*** Return - Retorna a execução do programa para a linha seguinte de
* onde ocorreu o erro.
*
do case
case str( m.numero,4 ) $ ' 3|1705|2005|'
if messagebox ( 'Impossível acessar a rede !' + chr(13)+'Tentar novamente ?',128+32+4,'Impossível acessar o arquivo. (' + str( m.numero) + ')' ) = 6
retry
endif
otherwise
= MessageBox( 'Impossível acessar a rede !' +CHR(13)+;
"Programa: "+m.programa,48+0+0,;
"Gerenciador de Erros... (" + str( m.numero) + ")" )
endcase
Clear Events && Limpa o Read Events do programa Inicio
cancel
return

Func Repo_1()

_Screen.Icon = "Form.ICO"

DEFINE WINDOW WOUT;
   FROM 1,1 TO 28,75;
   TITLE "Visualiza Impressão";
   FONT "Courier New", 9 STYLE "B";
   MINIMIZE;
   FLOAT;
   CLOSE;
   ICON FILE "Form.ICO";
   GROW
EndFun
