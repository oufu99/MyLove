#SingleInstance Force
#NoEnv
#InstallKeybdHook
#InstallMouseHook
#Persistent
SetDefaultMouseSpeed,0


; 变量定义
NotePadPath := "C:\Program Files\Notepad++\notepad++.exe"
TCPath:="D:\MyLove\TotalCommand\Totalcmd64.exe"
WizPath:="D:\software\WizNote\Wiz.exe"
global targetTextPath:="D:\MyConfig\AdBlock拦截规则.txt"
global chromePath:="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
global adblockPath:="chrome-extension://gighmmpiobklfepjocnamgkkbiglidom/options.html"
global screePoint:="1356,547"

^+q::
InputBox, ChoiceText, 请选择您想要的操作, 1.备份AdBlock 2.还原AdBlock
if ChoiceText=1
{
   BankAdBlock()   
}
if ChoiceText=2
{
	ResetAdBlock()
}    	 
return


ResetAdBlock()
{
 tempClip:=clipboard
 FileRead,OutputVar,*P65001 %targetTextPath%

 Run,%chromePath%
 Sleep,200
 ; 模拟点击坐标
 Send,#{Up}
 Sleep,300
 Send,!d
 Sleep,300
 ; 打开去广告的地址
 clipboard:=adblockPath
 ClipWait,0.2
 SendInput,^v
 Send,{Enter}
 Sleep,300
 Click,%screePoint%
 Sleep,500
 Send,^a{Delete}
 Sleep,100
 clipboard:=OutputVar
 ClipWait,0.2
 SendInput,^v
 Sleep,200
 Click,%screePoint%
 Sleep,200
 SendInput,^w
}
 

 
BankAdBlock(){
     ; 保存剪切板的值
	 tempClip:=clipboard
	 Run,%chromePath%
	 Sleep,200
	 ; 模拟点击坐标
	 Send,#{Up}
	 Sleep,300
	 Send,!d
	 Sleep,500
	 ; 打开去广告的地址
	 clipboard:=adblockPath
	 SendInput,^v
	 Send,{Enter}
	 Sleep,300
	 Click,1356,547
	 Sleep,100
	 Send,^a
	 Sleep,100
	 Send,^c
	 ClipWait,0.2
	 ruleText:=clipboard
	 file := FileOpen(targetTextPath,3,"UTF-8-RAW")
	 file.write(ruleText)
	 file.Close()
	 clipboard:=tempClip
	 Send,^w
}










 
 