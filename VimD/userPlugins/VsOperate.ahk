
; Vs专用
#If WinActive("ahk_exe devenv.exe")
{

; ctrl+单击跳转到定义 
^RButton::
	Send,{Click}{Alt Down}{F12}{Alt Up}
Return

}
 