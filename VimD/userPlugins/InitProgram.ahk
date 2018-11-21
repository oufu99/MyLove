#singleinstance force

; 注释  !Alt ^Ctrl +Shift  #Win键
; 如果想结束{Raw}可以直接换行

Hotstring("EndChars","`t")  ; 设置终止符 可以设置多个(){}!`n值之类不用分隔符

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
 


#IfWinNotExist, ahk_class SoPY_Comp
::dd::
Send, {End}{Shift Down}{Home}{Home}{Shift Up}{Delete}{Delete}
Return
#IfWinNotExist


; 模拟vim操作结束


; 密码输入相关

#IfWinActive 用户登录 - Google Chrome
{
:*:!a::
   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
Return
}

#IfWinActive 用户登录 ‎- Microsoft Edge
{
:*:!a::
   Send,admin{Tab}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
   Send,{Enter}
Return
}



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

#IfWinActive 连接到服务器
{
:*:sa::
   Send,{Raw}WA@@@Wei315#@#WinGG
Return
}

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
