************************************************************
*	Header File para o Aplicativo Artes
************************************************************
#INCLUDE foxpro.h

*------------------------------------------------
* Diretivas Ambiente de Desenvolvimento
*------------------------------------------------
#DEFINE DL_DEVELOP 			.f. 	&&<-  .T. para teste, .F. para 
										* versão de produção.
#DEFINE DC_DEVCONFIG 	""  && "C:\VFP\TOOLS\DEVELOPER\CONFIGARTES.PRG"
				* Chamado no oEnvironment.Destroy
				* reconfigura ambiente de desenvolvimento

#DEFINE DL_ERRORTRAP		.f. 	&&<-  Ativa Capturador de Erros

*------------------------------------------------
* Diretivas Ambiente do Aplicativo
*------------------------------------------------
#DEFINE DC_NOMEDOAPLICATIVO "Aplicativo Artes"
#DEFINE DC_ARQUIVOHELP 		""
#DEFINE DC_DATADIR "C:\vfpbook5\pjartes\dados\"
#DEFINE DN_ROLLOVERYEAR		70  &&-- Rollover year / 20th century
#DEFINE DC_REPORTSDIR 		"relatorios\"
#DEFINE DC_QUERYDIR 		"consultas\"

#DEFINE CR					CHR(13)

*-- Toolbar Positions (da header file do VFP)
*#DEFINE TOOL_NOTDOCKED  -1
*#DEFINE TOOL_TOP        0
*#DEFINE TOOL_LEFT       1
*#DEFINE TOOL_RIGHT      2
*#DEFINE TOOL_BOTTOM     3
#DEFINE DN_TOOLBARPOS 	TOOL_BOTTOM	&&<- Posição inicial da toolbar.
# DEFINE DN_PIXELSCASCATA 20 &&<- Controla deslocamento para
*							exibir as formas em cascata (em pixels).
**************************************************************
*EOF
