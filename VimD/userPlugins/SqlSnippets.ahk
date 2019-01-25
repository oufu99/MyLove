#singleinstance force

; sql的代码段  如果后面有多的SQL直接加  or WinActive("spy名")
#Include D:\MyLove\VimD\userPlugins\ManuIdProvide.ahk

#If WinActive("ahk_exe navicat.exe")
{
  ::scust::
	Send,{Raw}select * from tb_customer_%ManuId%	
	Return

  ::suser::
	Send,{Raw}select * from tb_user where  manufacturer_id=%ManuId%	
	Return
  
  
  ::ir1::
    clipboard = {Raw}INSERT INTO `ymt.ws_sys`.`tb_rule_mapping_class`(`ManuId`, `ClassName`, `Json`, `filter_keyword`, `new_url`) VALUES ( %ManuId%, 'pcRedirect', NULL, '/agent/pay', '/youzuan/agent/pay');   
	clipboard=%clipboard%
	Send,%clipboard%
	Return
  
}

