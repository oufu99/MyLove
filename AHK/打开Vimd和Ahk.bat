@echo off
:: ��ȡ����ԱȨ��
cd /d %~dp0
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit



:: ����::��ע��
start "" "D:\Common\VimD\vimd.exe"
:: vid�е������ȹر��ٴ�
taskkill /f /im vimd.exe
start "" "D:\Common\VimD\vimd.exe"

start "" "D:\MyLove\AHK\MyLove.ahk"
exit