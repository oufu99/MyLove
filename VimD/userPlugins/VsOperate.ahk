#singleinstance force
; Vsר��
#If WinActive("ahk_exe devenv.exe")
{

; ctrl+������ת������ 
^RButton::
  Send,{Click}{Ctrl Down}{F12}{Ctrl Up}
Return

::jp::
SendInput {Text} JSON.parse();
Send,{Left 2}
Return
}

