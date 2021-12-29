***
*  Programador..: Edson de Araujo
*  Participação.: Alexandre (Cobrança)
*  Finalidade...: Inicialização dos Eventos e Ambiente
*  Sistema......: Sindicato dos Empregados em Empresas de Turismo de SP
*  
*  Inicio Programa.:  18/06/1999
*  Ultima Alteração.: 07/06/2001
*
*  Sistema.: Sistema Escrito em VISUAL FOX PRO 3.0 SQL(SERVER/CLIENTE)
*  Atualizado Para : Visual Fox Pro 6.0
*
*  " Deus seja Louvado "
*
***

* Início do código...

Ttulo_1 = "Seetur"
Nome_1 = "Sindicato dos Empregados em Empresas de Turismo do Estado de São Paulo"

Local lnWinHandle
Declare Integer FindWindow In Win32API Integer, String 
lnWinHandle = FindWindow(0, Nome_1)
If lnWinHandle # 0 
=Messagebox( "O aplicativo já está sendo executado!", 16, Ttulo_1)
Cancel
Endif
* Final do código...

Set Sysmenu Off

#INCLUDE [..\SIS_APP.H]
**
* Carrega bibliotecas de UDF do sistema.
**
Set Procedure To Function Additive

_Screen.Visible     = .F. 
_Screen.Icon        = "Seetur.ICO"

cTitle              = Ttulo_1
cTitle2             = Ttulo_1
cTitle1             = Ttulo_1
cMessageTitle       = Ttulo_1
cMessageTitle1      = Ttulo_1
cMessageTitle2      = Nome_1
_Screen.Caption     = Nome_1
TiluloBar_          = Nome_1
StatusBarText       = Ttulo_1
_Screen.WindowState = 2

**
* Configuração de ambiente.
**
Set Century    On
Set Lock       On
Set Multilocks On
Set Ansi       Off
Set Confirm    Off
Set Notify     Off
Set Console    Off
Set Hours      To 24
Set Reprocess  To 2 Seconds	
Set Date       to British
Set Exclusive  Off
Set Deleted    On
Set Talk       Off
Set Safety     Off
Set status     Off
Set Lock       On
SET BELL       off
Set Clock      Off
SET BRSTATUS   Off
SET STATUS BAR Off
SET CPDIALOG   Off
SET CENTURY    ON
SET COLOR  TO BG/BG
**
* Tela de Fundo
**
_screen.Picture = "LogSeetur1.bmp"

***
* Especifica o Caminho 
***
ON ERROR DO errhand WITH ERROR( ), MESSAGE( )

def = 1
Do Case
   Case def = 1
        came = 'c:\Seetur2000\Arquivos\Estoq\'
        cami = 'c:\Seetur2000\Arquivos\Fotos\'
        Set Default to c:\Seetur2000\Arquivos
   Case def = 2
        came = 'c:\Desenv\SEETUR2000\Arquivos\Estoq\'
        cami = 'c:\Desenv\SEETUR2000\Arquivos\Fotos\'
        Set Default to c:\Desenv\SEETUR2000\Arquivos
   Case def = 3
        came = 'E:\Seetur2000\Arquivos\Estoq\'
        cami = 'E:\Seetur2000\Arquivos\Fotos\'
        Set Default to E:\Seetur2000\Arquivos
EndCase

ON ERROR

***
* Tabelas usadas no Sistema
***
*Open DataBase BancoDados shared

*use edif      IN 1 shared
*set order to Tag codedif  && nomeedif,endedif,cgcedif,admedif,cepedif 

*use adms      IN 2 shared
*set order to Tag codadm   && nomeadm,endadm,cgcadm,cepadm             

*use socios    IN 3 shared
*set order to Tag cadsoc   && cadnome,end_s,cadrg,cepsoc,bai,insc      

*use categ     IN 4 shared
*set order to Tag categ

*use aposent   IN 5 shared
*set order to Tag cadapo   && nomeapo,cad_p1                           

*use Resumo3   IN 6 shared
*set order to Tag resumo   && resumo2,re_1,re_2                         

*use edif02    IN 7 shared
*set order to Tag cadtemp  && nometemp,endtemp,cgctemp                 

*use curat     IN 8 shared  
*set order to Tag codcu_2

*use caddesc   IN 9 shared
*set order to Tag caddesc

*use conf      IN 10 shared
*set order to Tag cadconf

*use sindical  IN 11 shared 
*set order to Tag cadsind

*use leia      IN 12 shared 
*set order to Tag cadlia

*use bakdb     IN 13 shared
*set order to Tag indic

*use agora     IN 14 shared 
*set order to Tag ago_da

*use cobra     IN 15 shared
*set order to Tag cob_cod

*use vaga      IN 16 shared
*set order to Tag cadVag    && nomeVag,endVag,resVag

*use vagapre   IN 17 shared
*set order to Tag cadPRE    && nomePRE,endPRE,resPRE

*use cadadv    IN 18 shared
*set order to Tag cadadv

*use cadreaj   IN 19 shared
*set order to Tag pispro

*use morto     IN 20 shared 
*set order to Tag mordata    && mornome,moradvo

*use acompa    IN 21 shared
*set order to Tag cod        && acorg,acocic,aconom,acojcj,acopro

*use acompa2   IN 22 shared   
*set order to Tag cod2       && acorg2,acocic2,aconom2,acojcj2,acopro2

*use acompa_2  IN 23 shared
*set order to Tag ac_socio

*use curat_2   IN 24 shared
*set order to Tag codcur_2

*use agora2    IN 25 shared
*set order to Tag ago_da2

*use remed     IN 26 shared
*set order to Tag re_me1    && re_m2,co_me2,no_me2

*use cadfor    IN 27 shared
*set order to Tag cadfor    && cadfab,cadrep

*use cursos    IN 28 shared
*set order to Tag codcur    && nomcur,datcur,percur

*use resumoX   IN 29 shared
*set order to resumX       && resumX2,RE_1X,RE_2X

*use etqAdms   IN 30 shared
*set order to 

*use etqEdif   IN 31 shared
*set order to 

*use etqSoc    IN 32 shared
*set order to 

*use cheque    IN 33 Shared  && CHE_1, CHE_2, CHE_3   	
*set order to

*use cadbanco  IN 34 Shared && cadbanco, a_NO_M
*set order to

*use desp_1    IN 35 Shared 
*set order to caddes

*use banco     IN 36 Shared
*set index to databanc

*use planil    IN 37 Shared
*set order to CRED_1,CRED_2,CRED_3

*use histo     IN 38 Shared
*set order to CADHIS

*use saldo     IN 39 Shared
*set order to SAL_SE

*use dat_1     IN 40 Shared
*set order to da1

*use cadest    IN 41 Shared
*set order codest,nomeest,descest

*use lanca     IN 42 Shared 
*set order to lanc_01,lanc_02,lanc_03

*use repasa    IN 43 Shared
*set order to repq_01,repq_02,repq_03

*use cadest2   IN 44 Shared
*set order to codest2,nomeest2

*use gastos    IN 45 Shared
*set order to ga_1,ga_x,ga_2,ga_3

*use gasmes    IN 46 Shared
*set order to ga_mes

*use pesqsoc   IN 47 Shared
*set order to 

*use agenda    IN 48 Shared
*set order to dia_age,hora_age,sem_agen

*use caixa     IN 49 Shared
*set order to cai_ind

*use mov_est   IN 50 Shared
*set order to mov_est

*use aposent2  IN 51 shared  &&  para etiquetas
*set order to Tag cadapo2   && nomeapo2,cad_p12                           

*use aposent3  IN 52 shared  &&  para etiquetas3
*set order to Tag cad_p123

*use lisconf   IN 53 shared  &&  para Listconf
*set order to Tag lisconf1

*use lissind   IN 54 shared  &&  para Lissind
*set order to Tag lissind

*use socios2   IN 55 shared
*set order to Tag cadsoc2  && cadnome2,end_s2,cadrg2,cepsoc2,bai2,insc2      

*use mensal    IN 56 shared
*set order to Tag codnusoc

*use benef     IN 57 shared
*set order to Tag codben

*use lisedif_chif  IN 58 exclusive

*use mens_tmp      IN 59 exclusive

*use ben_tmp       IN 60 exclusive

***
* Inicialização do Arquivos de Configuração do Programa
***
#DEFINE DN_TOOLBARPOS 	TOOL_BOTTOM	&&<- Posição inicial da toolbar.

IF TYPE([APP_GLOBAL.Class]) = "C" AND ;
   UPPER(APP_GLOBAL.Class) == UPPER(APP_CLASSNAME)
   MESSAGEBOX(APP_ALREADY_RUNNING_LOC,48, ;
              APP_GLOBAL.cCaption)
   IF VARTYPE(APP_GLOBAL.oFrame) = "O"
      APP_GLOBAL.oFrame.Show()
   ENDIF              
   RETURN
   
ENDIF   

RELEASE APP_GLOBAL
PUBLIC  APP_GLOBAL

LOCAL lcLastSetTalk, llAppRan, lnSeconds, loSplash
LOCAL ARRAY laCheck[1]

lcLastSetTalk=SET("TALK")
loSplash = .NULL.
SET TALK OFF

#IFDEF APP_SPLASHCLASS

   IF NOT EMPTY(APP_SPLASHCLASS)
      loSplash = NEWOBJECT(APP_SPLASHCLASS, APP_SPLASHCLASSLIB)
      IF VARTYPE(loSplash) = "O"   
         lnSeconds = SECONDS()
         loSplash.Show()
      ENDIF
   ENDIF                                

#ENDIF

APP_GLOBAL = NEWOBJECT(APP_CLASSNAME, APP_CLASSLIB)

IF VARTYPE(APP_GLOBAL) = "O" ;
      AND ACLASS(laCheck,APP_GLOBAL) > 0 AND ;
      ASCAN(laCheck,UPPER(APP_SUPERCLASS)) > 0

   APP_GLOBAL.cReference =[APP_GLOBAL]
   APP_GLOBAL.cFormMediatorName = APP_MEDIATOR_NAME

   #IFDEF APP_CD
      APP_CD
   #ENDIF
      
   #IFDEF APP_PATH
      APP_PATH
   #ENDIF   
   
   #IFDEF APP_INITIALIZE
       APP_INITIALIZE
   #ENDIF
   
   IF VARTYPE(loSplash) = "O"
   
      IF SECONDS() < lnSeconds + APP_SPLASHDELAY
         =INKEY(APP_SPLASHDELAY-(SECONDS()-lnSeconds),"MH")
      ENDIF

      loSplash.Release()
      loSplash = .NULL.

   ENDIF
   
   RELEASE laCheck, loSplash, lnSeconds
           
   IF NOT APP_GLOBAL.Show()

      IF TYPE([APP_GLOBAL.Name]) = "C"
         MESSAGEBOX(APP_CANNOT_RUN_LOC,16, ;
                 APP_GLOBAL.cCaption )
         APP_GLOBAL.Release()
      ELSE
         MESSAGEBOX(APP_CANNOT_RUN_LOC,16)
      ENDIF

   ELSE
      llAppRan = .T.
   ENDIF
   
     
   IF TYPE([APP_GLOBAL.lReadEvents]) = "L"
   
      IF APP_GLOBAL.lReadEvents
         APP_GLOBAL.Release()
      ENDIF
   ELSE
      RELEASE APP_GLOBAL
   ENDIF

ELSE

   MESSAGEBOX(APP_WRONG_SUPERCLASS_LOC,16)
   RELEASE APP_GLOBAL

ENDIF

IF lcLastSetTalk=="ON"
   SET TALK ON
ELSE
   SET TALK OFF
ENDIF


IF TYPE([APP_GLOBAL]) = " "
   * non-read events app
   RETURN APP_GLOBAL
ELSE
   RETURN llAppRan
ENDIF   

#DEFINE APP_GLOBAL              goApp

PROCEDURE errhand
PARAMETER errnum,message
If errnum = 202

   cText = "Servidor de Acesso não Foi encontrado"  + Chr(13) + Chr(13) + ;
           "A Rede não esta acessivel ou caminho "  + Chr(13) + ;
           "PATH não está Correto !!             "  + Chr(13) + ;
           "Tente Reiniciar o Sistema novamente !"

   =MessageBox(cText, 64, cMessageTitle)
   Quit
Endif