@echo off
:: ��ȡ����ԱȨ��
cd /d %~dp0
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit



:: ����::��ע��
start "" "D:\MyLove\AHK\MyLove.ahk"
start "" "D:\Common\CommonAHK\Capsez\AaronAHK\ThirdAhk.ahk"
exit