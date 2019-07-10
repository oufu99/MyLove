#singleinstance force
#MaxHotkeysPerInterval 1000

OldStr=Hello world{!}
PrevStr=""


:*:as::
OldStr=%clipboard%
Send,{Shift Down}{Left}{Shift Up}{Ctrl Down}c{Ctrl Up}
PrevStr=%clipboard%
Send,{Right}
if(PrevStr="")
{
clipboard =%OldStr%
Send,{Backspace}
return
}
clipboard =%OldStr%
return


 