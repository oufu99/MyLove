::n::
run,C:\Program Files (x86)\Notepad++\notepad++.exe
return

^Numpad0::
   Run, D:\Tools\OpenMyTools\bin\Debug\OpenMyTools.exe
Return

^Numpad1::
   Run, D:\Tools\ScreenCapture\bin\Debug\ScreenCapture.exe
Return

^Numpad2::
   run, http://admin.onlyid.cn/login.aspx
Return


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