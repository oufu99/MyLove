@echo off
color 0e
if not exist "%~dp0TOTALCMD.INC" (echo 请将本Bat拷贝至TC目录执行，Win7以上系统右键管理员权限运行！&&echo 请按任意键退出…&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" >NUL 2>NUL
md "%SystemRoot%\System32\Test_permissions" 2>NUL||(echo 系统为Win7以上系统，请使用右键管理员权限运行！&&echo 请按任意键退出…&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" 2>NUL
(ver|find /i "5.1" >NUL 2>NUL)&&(goto SetTC)||(goto SetTC64 )

:SetTC
rem 下面全部的注册表路径引用的程序路径均无需加双引号，即使路径中含有空格，注册表也可以正确读取程序路径
reg add "HKCR\*\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\*\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /A /S /L=\"%%1\"" /f
reg add "HKCR\Directory\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Directory\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%1\"" /f
reg add "HKCR\Directory\Background\shell\在TC中打开当前文件夹" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Directory\Background\shell\在TC中打开当前文件夹\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%V\"" /f
reg add "HKCR\Drive\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE,0" /f
reg add "HKCR\Drive\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD.EXE /O /T /S /L=\"%%1\"" /f
cls
echo 已为资源管理器添加了TC右键菜单！
echo 请按任意键退出&&pause >NUL
goto end

:SetTC64
if not exist "%~dp0TOTALCMD64.EXE" goto SetTC
rem 下面全部的注册表路径引用的程序路径均无需加双引号，即使路径中含有空格，注册表也可以正确读取程序路径
reg add "HKCR\*\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\*\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /A /S /L=\"%%1\"" /f
reg add "HKCR\Directory\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Directory\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%1\"" /f
reg add "HKCR\Directory\Background\shell\在TC中打开当前文件夹" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Directory\Background\shell\在TC中打开当前文件夹\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%V\"" /f
reg add "HKCR\Drive\shell\Total Commander" /v Icon /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE,0" /f
reg add "HKCR\Drive\shell\Total Commander\command" /ve /t REG_EXPAND_SZ /d "%~dp0TOTALCMD64.EXE /O /T /S /L=\"%%1\"" /f
cls
echo 已为资源管理器添加了TC右键菜单！
echo 请按任意键退出&&pause >NUL

:end
