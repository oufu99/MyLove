#singleinstance force

; return 要放在If的外面,不然会穿透继续执行


#If WinActive("用户登录 - Google Chrome") or WinActive("用户登录 ‎- Microsoft Edge")
{
  ::!a::
	Send,{Raw}admin
	Send,{Tab}
	Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
	Send,{Enter}	
	Return 
}

; 因为是热串所以不怎么用担心误按  如果有后面遇见了再说
  ::!sw::
	Send,{Raw}serp3_test1
	Return
  ::!sm::
	Send,{Raw}serp3111
	Return


#If WinActive("连接到服务器")
{
  ::!s::
	Send,{Raw}sa
	Send,{Tab}
	Send,{Raw}WA@@@Wei315#@#WinGG
	return
  ::web::
	Send,{Raw}123
	return 
  ::mobile:: 
	Send,{Raw}456
	return 
}


