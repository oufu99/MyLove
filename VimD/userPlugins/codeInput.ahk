﻿#singleinstance force

; ��Ҫʹ��  ����=>�����ַ���=>����=>GB2312�ſ���   vim�ĺ�����ͬ
::admin::
#IfWinActive, �û���¼ ?- Microsoft Edge
{
   Send,{Raw}admin
   Send,{Tab}
   Send,{Raw}PT_DSe/XycOhQW_Q8Cu5tIZg_sg
   Send,{Enter}
Return
}
::sa::
#IfWinActive ���ӵ�������
{
   Send,{Raw}WA@@@Wei315#@#WinGG
   Send,{Enter}
   Return
}

#IfWinActive ���ӵ�������
{
::web::
   Send,{Raw}serp3_test1
Return
}
#IfWinActive ���ӵ�������
{
::mobile::
   Send,{Raw}serp3111
Return
}



