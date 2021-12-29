set defa to f:\arquivos
do abrir
use socios shared
set order to cadsoc
* Legenda = "Listagem de Associados do Conj. Nascional"
* Legenda = "Listagem de Associados do Conj. Nascional"
* Legenda = "Listagem de Associados do Edif. Italia"
Legenda = "Listagem de Associados do Prime Work Service"
a_Cod_e = 14164
REPORT FORM c:\sistema2000\reports\lisocios.frx  for codedif = a_Cod_e NOEJECT NOCONSOLE TO PRINTER

** Conj. Nascional = 15925
** São Paulo       =
** Edif Italia     = 10092
** Prime Work Service = 14164