@echo off
rem NirCMD.EXE win min ititle "cmd.exe"
rem 为群共享中“Bandizip便携版（独具智能解压特色）-v6.14_x64和x32-内含TC中如何调用的相关文件.zip”一键注册Bandizip系统右键菜单
rem 请将本Bat拷贝至Bandizip目录执行，Win7以上系统在资管或者64位TC右键管理员权限运行
color 0e
if not exist "%~dp0bdzshl64.dll" (echo 请下载群共享中“Bandizip便携版（独具智能解压特色）-v6.14_x64和x32-内含TC中如何调用的相关文件.zip”，并将本Bat拷贝至Bandizip目录执行，Win7以上系统右键管理员权限运行！&&echo 请按任意键退出…&&Pause >nul&&Exit)
if not exist "%~dp0bdzshl32.dll" (echo 请下载群共享中“Bandizip便携版（独具智能解压特色）-v6.14_x64和x32-内含TC中如何调用的相关文件.zip”，并将本Bat拷贝至Bandizip目录执行，Win7以上系统右键管理员权限运行！&&echo 请按任意键退出…&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" >NUL 2>NUL
md "%SystemRoot%\System32\Test_permissions" 2>NUL||(echo 系统为Win7以上系统，请在系统的资源管理器或者64位TC中使用右键管理员权限运行！&&echo 请按任意键退出…&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" 2>NUL
pushd %~dp0
reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC} /ve /d "AABdzCtx Class" /f
if exist "%Windir%\SysWOW64" (reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl64.dll" /f) else (reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f)
reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /v ThreadingModel /d Apartment /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0 /ve /d "bdzshell 1.0 Type Library" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win64 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl64.dll" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\FLAGS /ve /d 0 /f
rem 因%~dp0后面包含了\路径符，"%~dp0"会被reg.exe进行转义处理，出现错误，因本Bat开头已限定仅在Bandizip目录才能运行并pushd到Bandizip路径，故使用%cd%变量代替
rem reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\HELPDIR /ve /t REG_EXPAND_SZ /d "%~dp0" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\HELPDIR /ve /t REG_EXPAND_SZ /d "%cd%" /f
rem
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC} /ve /d "AABdzCtx Class" /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /v ThreadingModel /d Apartment /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0 /ve /d "bdzshell 1.0 Type Library" /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win64 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl64.dll" /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\FLAGS /ve /d 0 /f)
if exist "%Windir%\SysWOW64" (reg add HKCR\Wow6432Node\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\HELPDIR /ve /t REG_EXPAND_SZ /d "%cd%" /f)
rem
reg add HKCR\.iconpack /ve /d Bandizip.iconpack /f
reg add HKCR\*\ShellEx\ContextMenuHandlers\AABdzCtx /f
reg add HKCR\*\ShellEx\ContextMenuHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add HKCR\Directory\Background\ShellEx\ContextMenuHandlers\AABdzCtx /f
reg add HKCR\Directory\Background\ShellEx\ContextMenuHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add HKCR\Directory\ShellEx\ContextMenuHandlers\AABdzCtx /f
reg add HKCR\Directory\ShellEx\ContextMenuHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add HKCR\Drive\ShellEx\ContextMenuHandlers\AABdzCtx /f
reg add HKCR\Drive\ShellEx\ContextMenuHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add HKCR\Directory\ShellEx\DragDropHandlers\AABdzCtx /f
reg add HKCR\Directory\ShellEx\DragDropHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add HKCR\Drive\ShellEx\DragDropHandlers\AABdzCtx /f
reg add HKCR\Drive\ShellEx\DragDropHandlers\AABdzCtx /ve /d {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /d "AABdzCtx Class" /f
if exist "%Windir%\SysWOW64" (reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v {5B69A6B4-393B-459C-8EBB-214237A9E7AC} /d "AABdzCtx Class" /f)
%SystemRoot%\System32\rundll32.exe user32.dll, UpdatePerUserSystemParameters
cls
echo 已成功添加Bandizip系统右键菜单
echo 请按任意键退出&&pause >NUL
