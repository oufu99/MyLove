#singleinstance force

; 注释  !Alt ^Ctrl +Shift  #Win键
; 如果想结束{Raw}可以直接换行

Hotstring("EndChars","`t")  ; 设置终止符 可以设置多个(){}!`n值之类不用分隔符

#Include jkmove.ahk


; 运行软件开始
::n::
run,C:\Program Files (x86)\Notepad++\notepad++.exe
return



; notepad相关开始
; 按退出键退出 不行就结束进程


; notepad相关结束
; 运行软件结束

::lockvim::
Send, {CapsLock Down}
Return

::unlockvim::
Send, {CapsLock Up}
Return


; ^Numpad5::  ; 使用剪切板来输入 但是没有那种打字机的感觉了
;   clipboard = my text   ; 在剪贴板中存入新内容
;   send, ^v
; Return


^Numpad0::
   Run, D:\Tools\OpenMyTools\bin\Debug\OpenMyTools.exe
Return

^Numpad1::
   Run, D:\Tools\ScreenCapture\bin\Debug\ScreenCapture.exe
Return

^Numpad2::
   run, http://admin.onlyid.cn/login.aspx
Return

; RButton & c::MsgBox 您按着鼠标中键同时向下滚动了滚轮。

; 模拟vim操作开始
 

::dd::
#IfWinNotExist, ahk_class SoPY_Comp
Send, {End}{Shift Down}{Home}{Home}{Shift Up}{Delete}{Delete}
Return



; 模拟vim操作结束

; #IfWinActive 要成对出现不然后面的会触发不了
; :*:!a::
; #IfWinActive 用户登录 - Google Chrome
; {
;   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
;   return
; }
; #IfWinActive


#IfWinActive 用户登录 ‎- Microsoft Edge
{
::!a::
   Send,{Raw}admin
   Send,{Tab}
   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
   Send,{Enter}
Return
}
#IfWinActive


#IfWinActive FTP 连接
{
j::
   Send,{Down}
Return
k::
   Send,{Up}
Return
l::
   Send,{Enter}
Return
}
#IfWinActive

#IfWinActive 连接到服务器
{
:*:sa::
   Send,{Raw}WA@@@Wei315#@#WinGG
Return
}
#IfWinActive

#IfWinActive 编辑筛选器
{
:*:sa::
   Send,{Raw}WA@@@Wei315#@#WinGG
Return

:*:web::
   Send,{Raw}serp3_test1
Return

:*:mobile::
   Send,{Raw}serp3111
Return
}
#IfWinActive

; 打开米菲
>^m::
IfWinExist, MiFei - Microsoft Visual Studio (管理员) ; 激活窗口
	{
		IfWinActive, MiFei - Microsoft Visual Studio (管理员) ; 激活窗口
		{
			WinMinimize 
		}
		else
		{
			WinActivate
		}
	}
	else
	{
	 Run ,E:\ZPCode\MiFei\MiFei.sln
	}
Return

; 打开新版素雅
>^s::
IfWinExist, SuYa_V2 - Microsoft Visual Studio (管理员)
	{
		IfWinActive, SuYa_V2 - Microsoft Visual Studio (管理员)
		{
			WinMinimize 
		}
		else
		{
			WinActivate
		}
	}
	else
	{
	 Run ,E:\ZPCode\SuYa_V2\SuYa_V2.sln
	}
Return


>^t::
IfWinExist, SuYa_V2 - Microsoft Visual Studio (管理员)
	{
		IfWinActive, SuYa_V2 - Microsoft Visual Studio (管理员)
		{
			WinMinimize 
		}
		else
		{
			WinActivate
		}
	}
	else
	{
	 
	}
Return






