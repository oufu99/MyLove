#SingleInstance Force
#NoEnv
#InstallKeybdHook
#InstallMouseHook
#Persistent
SetDefaultMouseSpeed,0
Hotstring("EndChars","`t ")  ; 设置终止符 可以设置多个(){}!`n值之类不用分隔符

;************** 自动重启脚本开始 ************** 
;设定15分钟重启一次脚本，防止卡键 1000*60*15
GV_ReloadTimer := % 1000*60*15


Gosub,AutoReloadInit
AutoReloadInit:
	SetTimer, SelfReload, % GV_ReloadTimer
return

SelfReload:
	reload
return
;************** 自动重启脚本结束 ************** 

; 变量定义
NotePadPath := "C:\Program Files\Notepad++\notepad++.exe"
TCPath:="D:\MyLove\TotalCommand\Totalcmd64.exe"
WizPath:="D:\software\WizNote\Wiz.exe"
global targetTextPath:="D:\MyConfig\AdBlock拦截规则.txt"
global chromePath:="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
global adblockPath:="chrome-extension://gighmmpiobklfepjocnamgkkbiglidom/options.html"
global screePoint:="1356,547"

#Include D:\Common\CommonAHK\Capsez\AaronAHK\DiffPathCommonAHK.ahk
#Include D:\Common\CommonAHK\Capsez\capsez.ahk


; 重启我的代码
$~#Esc::Run,D:\MyLove\AHK\MyLove.ahk


 
 