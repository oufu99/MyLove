#singleinstance force

; return 要放在If的外面,不然会穿透继续执行

::!a::
IfWinActive, 用户登录 ‎- Microsoft Edge
{
	Send,{Raw}admin
	Send,{Tab}
	Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
	Send,{Enter}	
}
Return

:?:!s::
IfWinActive, 连接到服务器
{
	Send,{Raw}WA@@@Wei315#@#WinGG
	Send,{Enter}
}
else
{
	Send,{Raw}!s
}
Return

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
