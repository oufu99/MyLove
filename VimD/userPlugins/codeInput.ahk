#singleinstance force

; return 要放在If的外面,不然会穿透继续执行


::!s::
IfWinActive, 连接到服务器
{
	Send,{Raw}sa
	Send,{Tab}
	Send,{Raw}WA@@@Wei315#@#WinGG
}
else
{
	Send,{Raw}!s
}
return

::web::
IfWinActive, 编辑筛选器
{
	Send,{Raw}serp3_test1
}
else
{
	Send,{Raw}web
}
Return

::mobile::
IfWinActive, 编辑筛选器
{
    Send,{Raw}serp3111
}
else
{
	Send,{Raw}mobile
}
Return

#IfWinActive 用户登录 ‎- Microsoft Edge 
::!a::
#IfWinActive 用户登录 - Google Chrome 
::!a::
	Send,{Raw}admin
	Send,{Tab}
	Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
	Send,{Enter}	
Return



