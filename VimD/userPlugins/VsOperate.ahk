
; Vsר��
#If WinActive("ahk_exe devenv.exe")
{

; ctrl+������ת������ 
^RButton::
	Send,{Click}{Alt Down}{F12}{Alt Up}
Return

::jp::
SendInput {Text} JSON.parse();
Send,{Left 2}
Return
}

