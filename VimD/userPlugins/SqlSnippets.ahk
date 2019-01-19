#singleinstance force

; sql的代码段  如果后面有多的SQL直接加  or WinActive("spy名")
#Include D:\MyLove\VimD\userPlugins\ManuIdProvide.ahk

#If WinActive("ahk_exe navicat.exe")
{
  ::ssf1::
	Send,{Raw}select * from tb_customer_%ManuId%	
	Return 
}

