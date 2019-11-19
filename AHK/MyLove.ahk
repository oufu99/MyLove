CapsLock & t::
IfWinExist, Notepad++
    WinActivate ; 使用前面找到的窗口
else
   Run, C:\Program Files\Notepad++\notepad++.exe
   WinActivate ; 
Return