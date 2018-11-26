
#IfWinActive ; 要成对出现不然后面的会触发不了
::!a::
#IfWinActive 用户登录 - Google Chrome
{
   Send,{Raw}admin
   Send,{Tab}
   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
   Send,{Enter}
}
#IfWinActive

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

#IfWinActive 连接到服务器
{
:*:sa::
   Send,{Raw}WA@@@Wei315#@#WinGG
   Send,{Enter}
Return
}
#IfWinActive

#IfWinActive 编辑筛选器
{
:*:sa::
   Send,{Raw}WA@@@Wei315#@#WinGG
   Send,{Enter}
Return

:*:web::
   Send,{Raw}serp3_test1
Return

:*:mobile::
   Send,{Raw}serp3111
Return
}
#IfWinActive
