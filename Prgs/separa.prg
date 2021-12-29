Store sys(0) to rede
lo = ""
var1 = 1
For faz = 1 To 16
    Store substr(rede,var1,1) to c1
    If c1 <> " " .and. c1 <> "#"
       lo = lo + c1
    Else
       fim = lo   
    Endif   
    var1 = var1 + 1
Endfo    
? fim