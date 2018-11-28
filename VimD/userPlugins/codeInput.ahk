#singleinstance force

; 需要使用  编码=>编码字符集=>中文=>GB2312才可以   vim的和他不同
::admin::
#IfWinActive, 用户登录 ?- Microsoft Edge
{
   Send,{Raw}admin
   Send,{Tab}
   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
   Send,{Enter}
Return
}
::sa::
#IfWinActive 连接到服务器
{
   Send,{Raw}WA@@@Wei315#@#WinGG
   Send,{Enter}
   Return
}

#IfWinActive 连接到服务器
{
::web::
   Send,{Raw}serp3_test1
Return
}
#IfWinActive 连接到服务器
{
::mobile::
   Send,{Raw}serp3111
Return
}



