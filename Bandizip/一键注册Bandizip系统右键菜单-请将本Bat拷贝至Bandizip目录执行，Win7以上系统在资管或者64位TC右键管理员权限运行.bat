@echo off
rem NirCMD.EXE win min ititle "cmd.exe"
rem ΪȺ�����С�Bandizip��Я�棨�������ܽ�ѹ��ɫ��-v6.14_x64��x32-�ں�TC����ε��õ�����ļ�.zip��һ��ע��Bandizipϵͳ�Ҽ��˵�
rem �뽫��Bat������BandizipĿ¼ִ�У�Win7����ϵͳ���ʹܻ���64λTC�Ҽ�����ԱȨ������
color 0e
if not exist "%~dp0bdzshl64.dll" (echo ������Ⱥ�����С�Bandizip��Я�棨�������ܽ�ѹ��ɫ��-v6.14_x64��x32-�ں�TC����ε��õ�����ļ�.zip����������Bat������BandizipĿ¼ִ�У�Win7����ϵͳ�Ҽ�����ԱȨ�����У�&&echo �밴������˳���&&Pause >nul&&Exit)
if not exist "%~dp0bdzshl32.dll" (echo ������Ⱥ�����С�Bandizip��Я�棨�������ܽ�ѹ��ɫ��-v6.14_x64��x32-�ں�TC����ε��õ�����ļ�.zip����������Bat������BandizipĿ¼ִ�У�Win7����ϵͳ�Ҽ�����ԱȨ�����У�&&echo �밴������˳���&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" >NUL 2>NUL
md "%SystemRoot%\System32\Test_permissions" 2>NUL||(echo ϵͳΪWin7����ϵͳ������ϵͳ����Դ����������64λTC��ʹ���Ҽ�����ԱȨ�����У�&&echo �밴������˳���&&Pause >nul&&Exit)
rd "%SystemRoot%\System32\Test_permissions" 2>NUL
pushd %~dp0
reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC} /ve /d "AABdzCtx Class" /f
if exist "%Windir%\SysWOW64" (reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl64.dll" /f) else (reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f)
reg add HKCR\CLSID\{5B69A6B4-393B-459C-8EBB-214237A9E7AC}\InprocServer32 /v ThreadingModel /d Apartment /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0 /ve /d "bdzshell 1.0 Type Library" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win32 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl32.dll" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\0\win64 /ve /t REG_EXPAND_SZ /d "%~dp0bdzshl64.dll" /f
reg add HKCR\TypeLib\{73C3D3D2-E1E9-4481-8166-CA5C4CC04675}\1.0\FLAGS /ve /d 0 /f
rem ��%~dp0���������\·������"%~dp0"�ᱻreg.exe����ת�崦�����ִ�����Bat��ͷ���޶�����BandizipĿ¼�������в�pushd��Bandizip·������ʹ��%cd%��������
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
echo �ѳɹ����Bandizipϵͳ�Ҽ��˵�
echo �밴������˳�&&pause >NUL
