@echo off
color 0e
if not exist "%~dp0TOTALCMD.INC" (echo �뽫��Bat������TCĿ¼ִ�У�Win7����ϵͳ�Ҽ�����ԱȨ�����У�&&echo �밴������˳���&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" >NUL 2>NUL
md "%SystemRoot%\System32\Test_permissions" 2>NUL||(echo ϵͳΪWin7����ϵͳ����ʹ���Ҽ�����ԱȨ�����У�&&echo �밴������˳���&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" 2>NUL
(ver|find /i "5.1" >NUL 2>NUL)&&(goto SetTC)||(goto SetTC64 )

:SetTC
rem ����ȫ����ע���·�����õĳ���·���������˫���ţ���ʹ·���к��пո�ע���Ҳ������ȷ��ȡ����·��
reg add "HKCR\*\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\*\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /A /S /L=\"%%1\"" /f
reg add "HKCR\Directory\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Directory\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%1\"" /f
reg add "HKCR\Directory\Background\shell\��TC�д򿪵�ǰ�ļ���" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Directory\Background\shell\��TC�д򿪵�ǰ�ļ���\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%V\"" /f
reg add "HKCR\Drive\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Drive\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%1\"" /f
cls
echo ��Ϊ��Դ�����������TC�Ҽ��˵���
echo �밴������˳�&&pause >NUL
goto end

:SetTC64
if not exist "%~dp0TOTALCMD64.EXE" goto SetTC
rem ����ȫ����ע���·�����õĳ���·���������˫���ţ���ʹ·���к��пո�ע���Ҳ������ȷ��ȡ����·��
reg add "HKCR\*\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\*\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /A /S /L=\"%%1\"" /f
reg add "HKCR\Directory\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Directory\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%1\"" /f
reg add "HKCR\Directory\Background\shell\��TC�д򿪵�ǰ�ļ���" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Directory\Background\shell\��TC�д򿪵�ǰ�ļ���\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%V\"" /f
reg add "HKCR\Drive\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Drive\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%1\"" /f
cls
echo ��Ϊ��Դ�����������TC�Ҽ��˵���
echo �밴������˳�&&pause >NUL

:end
