#singleinstance force

;CapsLock��ǿ�ű�������
;by Ez

; �ҵ�ָ��˼�� Caps�����ƶ� ɾ��  ;�������ļ� Tab����ѡ��

;����ԱȨ�޴��룬�����ļ���ͷ {{{1
Loop, %0%
  {
    param := %A_Index%  ; Fetch the contents of the variable whose name is contained in A_Index.
    params .= A_Space . param
  }
ShellExecute := A_IsUnicode ? "shell32\ShellExecute":"shell32\ShellExecuteA"
if not A_IsAdmin
{
    If A_IsCompiled
       DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_ScriptFullPath, str, params , str, A_WorkingDir, int, 1)
    Else
       DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_AhkPath, str, """" . A_ScriptFullPath . """" . A_Space . params, str, A_WorkingDir, int, 1)
    ExitApp
}

;�ļ�ͷ {{{1
;Directives
#WinActivateForce
#InstallKeybdHook
#InstallMouseHook
#Persistent                   ;�ýű��־�����(�رջ�ExitApp)
#MaxMem 4	;max memory per var use
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 1000 ;Avoid warning when mouse wheel turned very fast
SetCapsLockState AlwaysOff
;SendMode InputThenPlay
;KeyHistory
SetBatchLines -1                	 	;�ýű������ߵ�ִ�У����仰˵��Ҳ�����ýű�ȫ�����У�
SetKeyDelay -1							;����ÿ��Send��ControlSend���ͼ������Զ�����ʱ,ʹ��-1��ʾ����ʱ
Process Priority,,High           	    ;�߳�,��,�߼���

SendMode Input

DetectHiddenWindows, on
SetTitleMatchMode, 2

SetWinDelay,0
SetControlDelay,0


;************** group����^ ************** {{{1
;GroupAdd, group_browser,ahk_class St.HDBaseWindow
GroupAdd, group_browser,ahk_class IEFrame               ;IE
GroupAdd, group_browser,ahk_class MozillaWindowClass    ;Firefox
GroupAdd, group_browser,ahk_class Chrome_WidgetWin_0    ;Chrome
GroupAdd, group_browser,ahk_class Chrome_WidgetWin_1    ;Chrome
GroupAdd, group_browser,ahk_class Chrome_WidgetWin_100  ;liebao
GroupAdd, group_browser,ahk_class QQBrowser_WidgetWin_1

GroupAdd, group_disableCtrlSpace, ahk_exe excel.exe
GroupAdd, group_disableCtrlSpace, ahk_exe pycharm.exe
GroupAdd, group_disableCtrlSpace, ahk_exe SQLiteStudio.exe

GroupAdd,GroupDiagOpenAndSave,Open ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,Save As ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,���Ϊ ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,���� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,���� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,�½� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,�� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,ͼ�����Ϊ ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,�ļ��� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,���渱�� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,�ϴ� ahk_class #32770
GroupAdd,GroupDiagOpenAndSave,ѡ���ļ� ahk_class #32770

;GroupAdd, group_disableCtrlSpace, ahk_exe gvim.exe 
;GroupAdd, group_disableCtrlSpace, ahk_class NotebookFrame��ע��ahk_class������AHK������mathematica��class����

;************** group����$ **************

;�趨15��������һ�νű�����ֹ���� 1000*60*15
GV_ReloadTimer := % 1000*60*5

;������Լ���tc�������ı��ű��������Զ�����COMMANDER_PATH
;������Ǳ�ĵط�������ע����autorun�����������ı��ű�����ô���б�Ҫ�������������
;COMMANDER_PATH := % GF_GetSysVar("COMMANDER_PATH")
;if COMMANDER_PATH = 
;{
;COMMANDER_PATH := "D:\totalcmd_bar"
;EnvSet,COMMANDER_PATH,D:\totalcmd_bar
;}

;GV_ToolsPath := % GF_GetSysVar("ToolsPath")
GV_TempPath := % GF_GetSysVar("TEMP")
;�Ƿ����ù���¹���
GV_ToggleWheelOnCursor := 1

;����ģʽ
GV_ToggleKeyMode := 0
;˫����ݼ����175΢�룬���
GV_Timer := 175
GV_KeyClickAction1 :=
GV_KeyClickAction2 :=
GV_KeyClickAction3 :=

TC_Msg := 1075
CM_OpenDrives := 2122
CM_OpenDesktop := 2121
CM_OpenPrinters := 2126
CM_OpenNetwork := 2125
CM_OpenControls := 2123
CM_OpenRecycled := 2127
CM_CopySrcPathToClip := 2029
CM_ConfigSaveDirHistory := 582

ScreenShotPath := "C:\"

;Tim������λ��
Tim_Start_X := 100
Tim_Start_Y := 100
Tim_Bar_Height := 60 

WX_Start_X := 180
WX_Start_Y := 100
WX_Bar_Height := 62 

TG_Start_X := 100
TG_Start_Y := 110
TG_Bar_Height := 62 

CreatTrayMenu()

;�Զ������ű�
Gosub,AutoReloadInit
AutoReloadInit:
	SetTimer, SelfReload, % GV_ReloadTimer
return

SelfReload:
	reload
return


;��ramdisk��ʱ����ʱ�����Զ��Ľ���TempĿ¼
;FileDelete,% GV_TempPath
;FileCreateDir, % GV_TempPath
;FileCreateDir, % GV_TempPath . "\ChromeCache"


;************** �ڹ���·����� ************** {{{1
;Autoexecute code
CoordMode, Mouse, Screen
MinLinesPerNotch := 1
MaxLinesPerNotch := 5
AccelerationThreshold := 100
AccelerationType := "L" ;Change to "P" for parabolic acceleration
StutterThreshold := 10
;************** �������Զ�ִ�в��֣�����Ҫִ�� autorun ************** {{{1

;************** �ڹ���·�����^ ************** {{{1 ;Function definitions
 ;See above for details on parameters
FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
{
	Critical ;Buffer all missed scrollwheel input to prevent missing notches
	SetBatchLines, -1 ;Run as fast as possible

	;Stutter filter: Prevent stutter caused by cheap mice by ignoring successive WheelUp/WheelDown events that occur to close together.
	If(A_TimeSincePriorHotkey < StutterThreshold) ;Quickest succession time in ms
		If(A_PriorHotkey = "WheelUp" Or A_PriorHotkey ="WheelDown")
			Return

	MouseGetPos, m_x, m_y
	m_x &= 0xFFFF

	MouseGetPos,,,, ControlClass2, 2
	MouseGetPos,,,, ControlClass3, 3

	if(A_Is64bitOS)
		;64-bit systems use this line
		ControlClass1 := DllCall( "WindowFromPoint", "int64", m_x | (m_y << 32), "Ptr")
	else
		ControlClass1 := DllCall("WindowFromPoint", "int", m_x, "int", m_y)

	lParam := (m_y << 16) | m_x
	wParam := (120 << 16) ;Wheel delta is 120, as defined by MicroSoft

	;Detect WheelDown event
	If(A_ThisHotkey = "WheelDown" Or A_ThisHotkey = "^WheelDown" Or A_ThisHotkey = "+WheelDown" Or A_ThisHotkey = "*WheelDown")
		wParam := -wParam ;If scrolling down, invert scroll direction
	;Detect modifer keys held down (only Shift and Control work)
	If(GetKeyState("Shift","p"))
		wParam := wParam | 0x4
	If(GetKeyState("Ctrl","p"))
		wParam := wParam | 0x8

	;If you don't need scroll acceleration, you can simply remove the LinesPerNotch() function def and set Lines := 1. Additionally you will want to strip out all the related unused function parameters.
	Lines := LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)
	;Run this loop several times to create the impression of faster scrolling
	Loop, %Lines%
	{
		If(ControlClass2 = "")
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass1%
		Else
		{
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass2%
			If(ControlClass2 != ControlClass3)
				SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass3%
		}
	}
}

LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)
{
	T := A_TimeSincePriorHotkey
	;Normal slow scrolling, separationg between scroll events is greater than AccelerationThreshold miliseconds.
	If((T > AccelerationThreshold) Or (T = -1)) ;T = -1 if this is the first hotkey ever run
	{
		Lines := MinLinesPerNotch
	}
	;Fast scrolling, use acceleration
	Else
	{
		If(AccelerationType = "P")
		{
			;Parabolic scroll speed curve
			;f(t) = At^2 + Bt + C
			A := (MaxLinesPerNotch-MinLinesPerNotch)/(AccelerationThreshold**2)
			B := -2 * (MaxLinesPerNotch - MinLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(A*(T**2) + B*T + C)
		}
		Else
		{
			;Linear scroll speed curve
			;f(t) = Bt + C
			B := (MinLinesPerNotch-MaxLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(B*T + C)
		}
	}
	Return Lines
}

;All hotkeys can use the same instance of FocuslessScroll(). No need to have separate calls unless each hotkey requires different parameters (e.g. you want to disable acceleration for Ctrl-WheelUp and Ctrl-WheelDown). If you want a single set of parameters for all scrollwheel actions, you can simply use *WheelUp:: and *WheelDown:: instead.

;Win10�����Ѿ�����Ҫ����¹����������
;if A_OSVersion in WIN_2003, WIN_XP, WIN_7
#If GV_ToggleWheel=1
	WheelUp::
		if A_OSVersion in WIN_2003, WIN_XP, WIN_7 
		{
			FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
		}
		else{
			Send,{WheelUp}
		}
	return

	^WheelUp::
		if A_OSVersion in WIN_2003, WIN_XP, WIN_7 
		{
			FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
		}
		else{
			Send,^{WheelUp}
		}
	return

	WheelDown::
		if A_OSVersion in WIN_2003, WIN_XP, WIN_7 
		{
			FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
		}
		else{
			Send,{WheelDown}
		}
	return

	^WheelDown::
		if A_OSVersion in WIN_2003, WIN_XP, WIN_7 
		{
			FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
		}
		else{
			Send,^{WheelUp}
		}
	return
#if

;WheelUp::
;^WheelUp:: ;zooms in
;WheelDown::
;^WheelDown:: ;zoom out
	;FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
;Return

;************** Capslock+�����ֵ�������͸����^    ************** {{{1
;~LShift & WheelUp::
Capslock & WheelUp::
; ͸���ȵ��������ӡ�
WinGet, Transparent, Transparent,A
If (Transparent="")
	Transparent=255
	;Transparent_New:=Transparent+10
	Transparent_New:=Transparent+20
	If (Transparent_New > 254)
		Transparent_New =255
	WinSet,Transparent,%Transparent_New%,A

	tooltip ԭ͸����: %Transparent_New% `n��͸����: %Transparent%
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

Capslock & WheelDown::
;͸���ȵ��������١�
WinGet, Transparent, Transparent,A
If (Transparent="")
	Transparent=255
	Transparent_New:=Transparent-10  ;��͸���ȼ����ٶȡ�
	;msgbox,Transparent_New=%Transparent_New%
	If (Transparent_New < 30)    ;����С͸�������ơ�
		Transparent_New = 30
	WinSet,Transparent,%Transparent_New%,A
	tooltip ԭ͸����: %Transparent_New% `n��͸����: %Transparent%
	;�鿴��ǰ͸���ȣ�����֮��ģ���
	;sleep 1500
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

;����Lwin &Mbuttonֱ�ӻָ�͸���ȵ�255��
Capslock & Mbutton::
	WinGet, Transparent, Transparent,A
	WinSet,Transparent,255,A
	tooltip �ָ� ;�鿴��ǰ͸���ȣ�����֮��ģ���
	;sleep 1500
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

RemoveToolTip_transparent_Lwin:
	tooltip
	SetTimer, RemoveToolTip_transparent_Lwin, Off
return
;************shift+�����ֵ�������͸����$***********

;http://www.autohotkey.com/forum/topic6772-75.html
;************** �ڹ���·�����$ **************
;************** ��סCaps�϶����^    ************** {{{1
Capslock & LButton::
Escape & LButton::
	CoordMode, Mouse  ; Switch to screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
	WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
	if EWD_WinState = 0  ; Only if the window isn't maximized 
		SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
	GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U  ; Button has been released, so drag is complete.
	{
		SetTimer, EWD_WatchMouse, off
		return
	}
	;GetKeyState, EWD_EscapeState, Escape, P
	;if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
	;{
	;	SetTimer, EWD_WatchMouse, off
	;	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	;	return
	;}
	; Otherwise, reposition the window to match the change in mouse coordinates
	; caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1   ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
return
;************** ��סESC�϶�$    **************


;************** Ez�ķ���^ ************** {{{1
GF_GetSysVar(sys_var_name)
{
	EnvGet, sv,% sys_var_name
	return % sv
}

AscSend(str){
	SetFormat, Integer, H
	for k,v in StrSplit(str)
	out.="{U+ " Ord(v) "}"
	Sendinput % out
}

;�ʺϵ���ֱ�ӵ���
CoordWinClick(x,y){
	CoordMode, Mouse, Window
	click %x%, %y%
}

;�ڵ��õĹ���ǰ��ͳһ����һ�� CoordMode, Mouse, Window �Ϻã���ͬ
ClickSleep(x,y,s){
	click %x%, %y%
	Sleep, % 100*s
}


ControlClickSleep(ctl,s){
	ControlClick, %ctl%
	Sleep, % 100*s
}

MyWinWaitActive(title){
	WinWait, %title%, 
	IfWinNotActive, %title%, , WinActivate, %title%, 
	WinWaitActive, %title%, 
}

/*
If (GetCursorShape() = 161920)      ;I �͹��
	SwitchIME("E0220804")               ;�ѹ����뷨���İ��
else 
	SwitchIME("4090409")	              ;Ӣ�ļ��̲���
return
*/
SwitchIME(dwLayout){
	DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, (DllCall("LoadKeyboardLayout", "Str", dwLayout, UInt, 0x01)))
}

/*
SwitchIME(dwLayout){ ;�޸ĵ�ǰ�������뷨
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}
*/

GetCursorShape(){   ;��ȡ��������� by nnrxin  
    VarSetCapacity( PCURSORINFO, 20, 0) ;Ϊ�����Ϣ �ṹ ���ó�20�ֽڿռ�
    NumPut(20, PCURSORINFO, 0, "UInt")  ;*������ �ṹ �Ĵ�СcbSize = 20�ֽ�
    DllCall("GetCursorInfo", "Ptr", &PCURSORINFO) ;��ȡ �ṹ-�����Ϣ
    if ( NumGet( PCURSORINFO, 4, "UInt")="0" ) ;���������ʱ��ֱ�����������Ϊ0
        return, 0
    VarSetCapacity( ICONINFO, 20, 0) ;���� �ṹ-ͼ����Ϣ
    DllCall("GetIconInfo", "Ptr", NumGet(PCURSORINFO, 8), "Ptr", &ICONINFO)  ;��ȡ �ṹ-ͼ����Ϣ
    VarSetCapacity( lpvMaskBits, 128, 0) ;���� ����-��ͼ��Ϣ��128�ֽڣ�
    DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 12), "UInt", 128, "UInt", &lpvMaskBits)  ;��ȡ ����-��ͼ��Ϣ
    loop, 128{ ;��ͼ��
        MaskCode += NumGet( lpvMaskBits, A_Index, "UChar")  ;�ۼ�ƴ��
    }
    if (NumGet( ICONINFO, 16, "UInt")<>"0"){ ;��ɫͼ��Ϊ��ʱ����ɫͼ��ʱ��
        VarSetCapacity( lpvColorBits, 4096, 0)  ;���� ����-ɫͼ��Ϣ��4096�ֽڣ�
        DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 16), "UInt", 4096, "UInt", &lpvColorBits)  ;��ȡ ����-ɫͼ��Ϣ
        loop, 256{ ;ɫͼ��
            ColorCode += NumGet( lpvColorBits, A_Index*16-3, "UChar")  ;�ۼ�ƴ��
        }  
    } else
        ColorCode := "0"
    DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 12))  ; *������ͼ
    DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 16))  ; *����ɫͼ
    VarSetCapacity( PCURSORINFO, 0) ;��� �ṹ-�����Ϣ
    VarSetCapacity( ICONINFO, 0) ;��� �ṹ-ͼ����Ϣ
    VarSetCapacity( lpvMaskBits, 0)  ;��� ����-��ͼ
    VarSetCapacity( lpvColorBits, 0)  ;��� ����-ɫͼ
    return, % MaskCode//2 . ColorCode  ;���������
}

Sub_KeyClick123:
	if winc_presses > 0 ; SetTimer �Ѿ�����, �������Ǽ�¼����.
	{
		winc_presses += 1
		return
	}
	; ����, �����¿�ʼϵ���е��״ΰ���. �Ѵ�����Ϊ 1 ������
	; ��ʱ����
	winc_presses = 1
	SetTimer, KeyWinC, % GV_Timer ; �� 400 �����ڵȴ�����ļ���.
return

KeyWinC:
	SetTimer, KeyWinC, off
	if winc_presses = 1 ; �˼�������һ��.
	{
		fun_KeyClickAction123(GV_KeyClickAction1)
	}
	else if winc_presses = 2 ; �˼�����������.
	{
		fun_KeyClickAction123(GV_KeyClickAction2)
	}
	else if winc_presses > 2
	{
		fun_KeyClickAction123(GV_KeyClickAction3)
		;MsgBox, Three or more clicks detected.
	}
	; ���۴�����������ĸ�����, ���� count ��������
	; Ϊ��һ��ϵ�еİ�����׼��:
	winc_presses = 0
return

fun_KeyClickAction123(act){
	If RegExMatch(act,"i)^(run,)",m) {
		run,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(send,)",m) {
		Send,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(SendInput,)",m) {
		SendInput,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(GoSub,)",m) {
		GoSub,% substr(act,strlen(m1)+1)
	}
}


;%A_YYYY%-%A_MM%-%A_DD%-%A_MSec%
;msgbox % fun_GetFormatTime("yyyy-MM-dd-HH-mm-ss")
fun_GetFormatTime(f,t="")
{
;FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
;FormatTime, TimeString, ,'Month Name': MMMM`n'Day Name': dddd
FormatTime, TimeString, %t% ,%f%
return %TimeString%
}

Sub_ClipAppend:
	;SendInput,^{Home}^+{End}^c
	Send,^c
	ToolTip �Ѿ���ӵ� %GV_TempPath%\ClipAppend.txt
	FileAppend, %ClipBoard%.`n, %GV_TempPath%\ClipAppend.txt
	Sleep 1000
	ToolTip
return


Sub_MaxRestore:
	WinGet, Status_minmax ,MinMax,A
	If (Status_minmax=1){
		WinRestore A
	}
	else{
		WinMaximize A
	}
return


Sub_WindowNoCaption:
	WinGetPos, xTB, yTB,lengthTB,hightTB, ahk_class Shell_TrayWnd
	;msgbox %xTB%
	;msgbox %yTB%
	;msgbox %lengthTB%
	;msgbox %hightTB%
	bd := 8 ;win8Border = 4
	lW := A_ScreenWidth
	hW := A_ScreenHeight
	if(xTB == 0){ ;��ߺ��ϡ���������
		if(yTB == 0){ ;���������Ϻ���
			if(lengthTB == A_ScreenWidth){ ;����
				xW := 0
				yW := hightTB
				lW := A_ScreenWidth
				hW := A_ScreenHeight - hightTB
			}
			else{ ;����
				xW := lengthTB
				yW := 0
				lW := A_ScreenWidth - lengthTB
				hW := A_ScreenHeight
			}
		}
		else{ ;����
			xW := 0	
			yW := 0
			lW := A_ScreenWidth
			hW := A_ScreenHeight - hightTB
		}
	}
	else{ ;����
		xW := 0
		yW := 0
		lW := A_ScreenWidth - lengthTB
		hW := A_ScreenHeight
	}
	WinSet, Style, ^0xC00000, A
return

;�򿪼������ж������
OpenClipURLS:
	Loop, parse, clipboard, `n, `r  ; �� `r ֮ǰָ�� `n, ��������ͬʱ֧�ֶ� Windows �� Unix �ļ��Ľ���.
	{
		cu := A_LoopField
		if(RegExMatch(A_LoopField,"^http")){
			sleep 200
			run, nircmd shexec open "%A_LoopField%"
		}
	}
return
;************** Ez�ķ���$ **************


;************** Youdao_���緭��^ ********* {{{1
;����+����  ����-��Ӣ����	by����	From:Cando_�е�����+�����庯��+Splash����+�жϵ���

<#y::
	ԭֵ:=Clipboard
	clipboard =
	Send ^c
	gosub sound
Return
sound:
	ClipWait,0.5
	If(ErrorLevel)
		{
		InputBox,varTranslation,������,���뷭��ɶ������˵
		if !ErrorLevel
			{
			Youdao����:=YouDaoApi(varTranslation)
			Youdao_��������:= json(Youdao����, "web.value")
			SplashYoudaoMsg("Youdao_���緭��", Youdao_��������)
			spovice:=ComObjCreate("sapi.spvoice")
			spovice.Speak(Youdao_��������)
			Sleep, 3000
			SplashTextOff
			}
		}
	else
		{
			varTranslation:=clipboard
			Youdao����:=YouDaoApi(varTranslation)
			Youdao_��������:= json(Youdao����, "web.value")
			SplashYoudaoMsg("Youdao_���緭��", Youdao_��������)
			spovice:=ComObjCreate("sapi.spvoice")
			spovice.Speak(Youdao_��������)
			Sleep, 3000
			SplashTextOff
		}
	Clipboard:=ԭֵ
return

SplashYoudaoMsg(title, content){
	;SoundBeep 750, 500
	MouseGetPos, MouseX, MouseY ;������λ��x,y
	MouseZ := MouseX + 100
	SplashTextOn , 400, 60, %title%, %content%
	WinMove, %title%, , %MouseZ%, %MouseY%
	WinSet, Transparent, 200, %title%
}

YouDaoApi(KeyWord)
{
;    KeyWord:=SkSub_UrlEncode(KeyWord,"utf-8")
	url:="http://fanyi.youdao.com/fanyiapi.do?keyfrom=qqqqqqqq123&key=86514254&type=data&doctype=json&version=1.1&q=" . KeyWord
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("GET", url)
    WebRequest.Send()
    result := WebRequest.ResponseText
    Return result
}
json(ByRef js, s, v = "")
{
	j = %js%
	Loop, Parse, s, .
	{
		p = 2
		RegExMatch(A_LoopField, "([+\-]?)([^[]+)((?:\[\d+\])*)", q)
		Loop {
			If (!p := RegExMatch(j, "(?<!\\)(""|')([^\1]+?)(?<!\\)(?-1)\s*:\s*((\{(?:[^{}]++|(?-1))*\})|(\[(?:[^[\]]++|(?-1))*\])|"
				. "(?<!\\)(""|')[^\7]*?(?<!\\)(?-1)|[+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:,|$|\})", x, p))
				Return
			Else If (x2 == q2 or q2 == "*") {
				j = %x3%
				z += p + StrLen(x2) - 2
				If (q3 != "" and InStr(j, "[") == 1) {
					StringTrimRight, q3, q3, 1
					Loop, Parse, q3, ], [
					{
						z += 1 + RegExMatch(SubStr(j, 2, -1), "^(?:\s*((\[(?:[^[\]]++|(?-1))*\])|(\{(?:[^{\}]++|(?-1))*\})|[^,]*?)\s*(?:,|$)){" . SubStr(A_LoopField, 1) + 1 . "}", x)
						j = %x1%
					}
				}
				Break
			}
			Else p += StrLen(x)
		}
	}
	If v !=
	{
		vs = "
		If (RegExMatch(v, "^\s*(?:""|')*\s*([+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:""|')*\s*$", vx)
			and (vx1 + 0 or vx1 == 0 or vx1 == "true" or vx1 == "false" or vx1 == "null" or vx1 == "nul"))
			vs := "", v := vx1
		StringReplace, v, v, ", \", All
		js := SubStr(js, 1, z := RegExMatch(js, ":\s*", zx, z) + StrLen(zx) - 1) . vs . v . vs . SubStr(js, z + StrLen(x3) + 1)
	}
	Return, j == "false" ? 0 : j == "true" ? 1 : j == "null" or j == "nul"
		? "" : SubStr(j, 1, 1) == """" ? SubStr(j, 2, -1) : j
}
;************** Youdao_���緭��$ *********

;************** ��Ͽ�ݼ����� ************** {{{1
;************** Escape��� ************** {{{2
; +HJKL ��ʾ�������Ϸ���  SendInput@chm
Escape & j:: SendInput,{Blind}{Down}
Escape & k:: SendInput,{Blind}{Up}
Escape & h:: SendInput,{Blind}{Left}
Escape & l:: SendInput,{Blind}{Right}

Escape & w:: SendInput,{Blind}^{Right}
Escape & b:: SendInput,{Blind}^{Left}

Escape & e:: SendInput,{Blind}{PgDn}
Escape & q:: SendInput,{Blind}{PgUp}

;************** u,i����˫��^ ************** 
;Escape & u:: SendInput,{Blind}^{End}
;Escape & i:: SendInput,{Blind}^{Home}
;Escape & n:: SendInput,{Blind}{PgDn}
;Escape & m:: SendInput,{Blind}{PgUp}

Escape & u::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	GoSub,Sub_KeyClick123
return

Escape & i::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	GoSub,Sub_KeyClick123
return

Escape & n::
	GV_KeyClickAction1 := "SendInput,{PgDn}"
	GV_KeyClickAction2 := "SendInput,^{PgDn}"
	GoSub,Sub_KeyClick123
return

Escape & m::
	GV_KeyClickAction1 := "SendInput,{PgUp}"
	GV_KeyClickAction2 := "SendInput,^{PgUp}"
	GoSub,Sub_KeyClick123
return
;************** u,i����˫��$ **************

;***************** ���������^ ************** {{{2
Escape & v::
	if EscapeV_presses > 0
	{
		EscapeV_presses += 1
		return
	}
	EscapeV_presses = 1
	SetTimer, KeyEscapeV, 175
return

KeyEscapeV:
	SetTimer, KeyEscapeV, off
	if EscapeV_presses = 1
	{
		GoSub,PastePureText
	}
	else if EscapeV_presses = 2
	{
		;msgbox 285
		;Menu, MyMenu, Show
		;EzMenuShow()
		;EzOtherMenuShow()
	}
	EscapeV_presses = 0
return


Escape & c::
	GoSub,Sub_ClipAppend
return

PastePureText:
	IfWinActive, ahk_class ConsoleWindowClass
	{
		;SendInput,!{Space}ep
		Send {Click Right}
	}
	else
	{
		clipboard = %clipboard%
		send,{Blind}^v
	}
return

;#z::Menu, MyMenu, Show  ; i.e. press the Win-Z hotkey to show the menu.
;***************** ���������$ **************
;�رպ�ˢ��
Escape & g:: SendInput,{Blind}^w
Escape & r:: SendInput,{Blind}^r
;�л�tab
Escape & o:: send,{Blind}^+{Tab}
Escape & p:: send,{Blind}^{Tab}
;�Ҽ���DEL
;Escape & y:: send,{AppsKey}
Escape & y:: Send {Click Right}
Escape & d:: SendInput,{Delete}
;Alttab��Win8����ʱ������
Escape & .:: AltTab
Escape & ,:: ShiftAltTab


;enter �س��������
;Escape & Enter:: WinMaximize A
Escape & Enter:: GoSub,Sub_MaxRestore
Escape & Space:: WinMinimize A
^#u:: GoSub,OpenClipURLS

Escape & Pause::
	suspend permit
	pause toggle
return

;���һ�лָ������ܣ���Ҫ
Escape::
	suspend permit
	SendInput,{Escape}
return

/*
~Escape::
If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<200){
	;MsgBox You double taped %A_ThisHotkey%
	WinClose A
}
else {
	;sleep 200
	;msgbox press %A_ThisHotkey% for %A_TimeSinceThisHotkey%
	;if (A_TimeSinceThisHotkey > 200 && A_TimeSinceThisHotkey < 1000){
	SendInput {Escape}
	;}
}
return
*/


;************** CapsLock��� ************** {{{2
;win+caps+����
;Capslock & e::
;state := GetKeyState("LWin", "T")  ; �� CapsLock ��ʱΪ��, ����Ϊ��.
;if state
	;msgbox handle��
;else
	;send #e
;return

CapsLock & j:: SendInput,{Blind}{Down}
CapsLock & k:: SendInput,{Blind}{Up}
CapsLock & h:: SendInput,{Blind}{Left}
CapsLock & l:: SendInput,{Blind}{Right}



;************** u,i����˫��^ **************
;CapsLock & b:: SendInput,{Blind}^{Home}
;CapsLock & e:: SendInput,{Blind}^{End}
;CapsLock & n:: SendInput,{Blind}{PgDn}
;CapsLock & m:: SendInput,{Blind}{PgUp}


CapsLock & e::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	GoSub,Sub_KeyClick123
return

CapsLock & b::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	GoSub,Sub_KeyClick123
return

 

;************** u,i����˫��$ **************

;***************** ���������^ **************
CapsLock & v::
	if CapsLockV_presses > 0
	{
		CapsLockV_presses += 1
		return
	}
	CapsLockV_presses = 1
	SetTimer, KeyCapsLockV, 175
return

KeyCapsLockV:
	SetTimer, KeyCapsLockV, off
	if CapsLockV_presses = 1
	{
		GoSub,PastePureText
	}
	else if CapsLockV_presses = 2
	{
			;msgbox 285
		;Menu, MyMenu, Show
		;EzOtherMenuShow()
		;GoSub,EzOtherMenuShow
		;EzOtherMenuShow()
	}
	CapsLockV_presses = 0
return
;***************** ���������$ **************
CapsLock & c::
	GoSub,Sub_ClipAppend
return

CapsLock & r:: SendInput,{Blind}^r

CapsLock & n:: send,{Blind}^+{Tab}
CapsLock & m:: send,{Blind}^{Tab}

;CapsLock & y:: send,{AppsKey}
CapsLock & y:: Send {Click Right}

CapsLock & .:: AltTab
CapsLock & ,:: ShiftAltTab



;enter �س��������
CapsLock & Enter:: GoSub,Sub_MaxRestore
;CapsLock & Space:: WinMinimize A
CapsLock & Space:: send,{Backspace}


;************** �Զ��忪ʼ **************

; ɾ����  CapsLock & `;
; ������  ֱ�������ļ������� ������������س����ݼ�
; ;+�ո� �ĳ���BackSpace
; ;+z ȥ���� ��ó�ͻVs�İ���
; ɾ���� CapsLock & n:: ��CapsLock & o p �ĳ���n m


;************** ���뿪ʼ **************

CapsLock & d::SendInput,{End}{Shift Down}{Home}{Shift Up}{Backspace}{Home}{Backspace}
CapsLock & `;::SendInput,{Right}
CapsLock & '::SendInput,""{Left}

`; & d::SendInput,{End}+{Home}{Backspace}
`; & b::SendInput,{Home}
`; & e::SendInput,{End}
CapsLock & <::SendInput,`<`>{Left}
; �����ź����� ��Ҫ��ô�������
CapsLock & [::Send, {{}{}}{Left}
CapsLock & (::Send, (){Left}
CapsLock & x::SendInput,`<`>{Left}
CapsLock & w::SendInput,{Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}

CapsLock & t::
IfWinExist, Notepad++
    WinActivate ; ʹ��ǰ���ҵ��Ĵ���
else
   Run, C:\Program Files (x86)\Notepad++\notepad++.exe
   WinActivate ; 
Return

; Vs֮ǰ�����ڸ�Ϊͨ��
 

CapsLock & i::SendInput,""{Left}
:*:jw::{Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
 

Tab & h:: SendInput,{Blind}{Left}
Tab & j:: SendInput,{Blind}{Down}
Tab & l:: SendInput,{Blind}{Right}
Tab & k:: SendInput,{Blind}{Up}


; Vs����Ч
#IfWinActive, ahk_exe devenv.exe

`; & f::SendInput public{Space}{Space}void{Space}{Space}Func(){Enter}{{}{Enter}{Enter}{}}{Up}

`; & z::SendInput, {Ctrl Down}{Shift Down}{Alt Down}{F12}{Ctrl Up}{Shift Up}{Alt Up}
`; & t::SendInput, {Ctrl Down}{Shift Down}{Alt Down}{F11}{Ctrl Up}{Shift Up}{Alt Up}


#IfWinActive

;************** �Զ������ **************
^!#r:: 
	;<==�ر�hintģʽ��
	;down:=(down) ? 0 : 1
	Reload    ;<==�������ű����޸���֪ȱ�ݣ���Ҫ������F2�����ٿ���hint by Zz
return

;��caps�滻Ϊesc  �ָ�Caps���� 
CapsLock::
;	suspend permit
;	SendInput,{Escape}
return

;��ͣ�ȼ��������ٰ��ָ�
pause::
^!#t::
	suspend permit
	pause toggle
return

;��ͣ�ű��������Ҽ��˵�ѡ������������ű��ָ�������ô��Ҫ��
^!#z::
	suspend permit
	suspend toggle
return


;+CapsLock:: CapsLock "֮ǰ��д��
;^PrintScreen::
^CapsLock::  ; control + capslock to toggle capslock.  alwaysoff/on so that the key does not blink
	GetKeyState t, CapsLock, T
	IfEqual t,D, SetCapslockState AlwaysOff
	Else SetCapslockState AlwaysOn
Return


;************** �ֺ�;��� ************** {{{2


`; & j:: SendInput,{Blind}{Down}
`; & k:: SendInput,{Blind}{Up}
`; & h:: SendInput,{Blind}{Left}
`; & l:: SendInput,{Blind}{Right}
`; & n:: SendInput,{Blind}{PgDn}
`; & m:: SendInput,{Blind}{PgUp}

`; & Space:: SendInput,{Backspace}
`; & s:: SendInput,{End}{Shift Down}{Home}{Shift Up}



`; & c::
	GV_KeyClickAction1 := "SendInput,^c"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^c"
	GoSub,Sub_KeyClick123
return



`; & v::
	GV_KeyClickAction1 := "SendInput,^v"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^v"
	GoSub,Sub_KeyClick123
return

;ճ��Ȼ��س���������������������λ��
`; & p::
`; & g::
	GV_KeyClickAction1 := "SendInput,^{Home}^+{End}^v{Enter}"
	GV_KeyClickAction2 := "SendInput,^v{Enter}"
	GoSub,Sub_KeyClick123
return




;��ո���ճ��

`; & a::SendInput,^{Home}^+{End}{Delete}

;ճ����ת��,�����������tc�ж�����
`; & u:: send,^t!d^v{Enter}
;`; & u:: send,^t!dwww.^v{Enter}

;`; & 1:: send,%A_YYYY%-%A_MM%-%A_DD%
`; & 1:: send,% fun_GetFormatTime("yyyy-MM-dd")
`; & 2:: AscSend(fun_GetFormatTime(" HHmm"))
;`; & `:: SendRaw,% "#" . fun_GetFormatTime("MM-dd")
`; & 3:: SendRaw,% "#" . fun_GetFormatTime("MMdd")

;�ָ��ֺ�������
;$`;:: SendInput,`;
`;:: SendInput,`;
^`;:: SendInput,^`;
^+`;:: SendInput,^+`;
!`;:: SendInput,!`;
::: SendInput,:


;************** `��� ************** {{{2
;���λ��˳�֣���Ҫ���ڰ�ס������ôѡ��֮����ȥ��ctrl���ߣ��ֺŵȾ��Ե�Զ��
` & 1:: SendInput,^x
` & 2:: SendInput,^c
` & 3:: SendInput,^v
` & 4:: SendInput,{Del}
` & `;:: SendInput,{Blind}{Home}+{End}

` & j:: SendInput,{Blind}+{Down}
` & k:: SendInput,{Blind}+{Up}
` & h:: SendInput,{Blind}+{Left}
` & l:: SendInput,{Blind}+{Right}

` & b:: SendInput,{Blind}^+{Left}
` & w:: SendInput,{Blind}^+{Right}

;` & o:: SendInput,{Blind}^{PgUp}
;` & p:: SendInput,{Blind}^{PgDn}
` & n:: SendInput,{Blind}+{PgDn}
` & m:: SendInput,{Blind}+{PgUp}
;` & y:: SendInput,{Blind}{Home}+{End}
;` & u:: SendInput,{Blind}+{End}
;` & i:: SendInput,{Blind}+{Home}
` & u::
	GV_KeyClickAction1 := "SendInput,+{End}"
	GV_KeyClickAction2 := "SendInput,^+{End}"
	GoSub,Sub_KeyClick123
return

` & i::
	GV_KeyClickAction1 := "SendInput,+{Home}"
	GV_KeyClickAction2 := "SendInput,^+{Home}"
	GoSub,Sub_KeyClick123
return

` & y::
	GV_KeyClickAction1 := "SendInput,{Blind}{Home}+{End}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	GoSub,Sub_KeyClick123
return

;�㲻��Ĭ�ϵġ�ȷ��������OK��ť�����û�о͵��һ��Button1�����������ּ򵥵ĶԻ��򣬱���TC�ı�ע
` & Enter::
	try {
		SetTitleMatchMode RegEx
		SetTitleMatchMode Slow
		ControlClick, i).*ȷ��|OK.*, A
	} catch e {
		ControlClick, Button1, A
	}
return


+`::SendInput,~
`::SendInput,``
^`::SendInput,^``
!`::SendInput,!``
+!`::SendInput,+!``
;`::EzMenuShow()


;************** Alttab��� ************** {{{2

;��ס����ٽ��й��֣���AltaTab�˵��У����Ե���Ҽ����߰��ո����ȷ��ѡ��
;�����ڰ��ļ��ϵ���ĳ����д򿪣�����������qq΢�Ŵ��ļ���Ҳ���Խ�������е�ͼƬֱ���ϵ��ļ��������б���
; LButton & WheelUp::ShiftAltTab
; LButton & WheelDown::AltTab
;��û��Ҫ���������
;LWin & WheelUp::ShiftAltTab
;LWin & WheelDown::AltTab

;����в���
#IfWinActive, ahk_class TaskSwitcherWnd
;Win10�Լ��Ѿ�֧��alttab�а��ո�ѡ�����
;if A_OSVersion in WIN_2003, WIN_XP, WIN_7
;{
!Space::send,{Alt Up}
Space::send,{Alt Up}
;}
;��alttab�Ĳ˵��У����Ҽ�ѡ�ж�Ӧ�ĳ���
!RButton::send,{Alt Up}
~LButton & RButton::send,{Alt Up}

;alt+shift+tab���л�����һ�����ڹ��ܣ�����һ���� TaskSwitcherWnd����
;<+Tab::ShiftAltTab


;����
!q::SendInput,{Blind}{Left}
;����
!j::SendInput,{Blind}{Down}
!k::SendInput,{Blind}{Up}
!h::SendInput,{Blind}{Left}
!l::SendInput,{Blind}{Right}
!u::SendInput,{Blind}{End}
!i::SendInput,{Blind}{Home}
!,::SendInput,{Blind}{Left}
!.::SendInput,{Blind}{Right}


#IfWinActive

;10�ĳ���MultitaskingViewFrame
#IfWinActive, ahk_class MultitaskingViewFrame
!RButton::send,{Alt Up}
~LButton & RButton::send,{Alt Up}

;����
!q::SendInput,{Blind}{Left}
;����
!j::SendInput,{Blind}{Down}
!k::SendInput,{Blind}{Up}
!h::SendInput,{Blind}{Left}
!l::SendInput,{Blind}{Right}
!u::SendInput,{Blind}{End}
!i::SendInput,{Blind}{Home}
!,::SendInput,{Blind}{Left}
!.::SendInput,{Blind}{Right}

#IfWinActive

;************** tab��� ************** {{{2
;���������������ң���������չ����Ҫ�����������Ĳ�����ʽ
Tab & s:: SendInput,{Blind}{Down}
Tab & w:: SendInput,{Blind}{Up}
Tab & a:: SendInput,{Blind}{Left}
Tab & d:: SendInput,{Blind}{Right}
Tab & q:: SendInput,{Blind}{PgUp}
Tab & f:: SendInput,{Blind}{PgDn}



;��Ӧ�������Ϲ̶���ǰ5����������л�
Tab & 1:: send,#1
Tab & 2:: send,#2
Tab & 3:: send,#3
Tab & 4:: send,#4
Tab & 5:: send,#5

;���õ���������
Tab & r:: SendInput,{Blind}{Del}
Tab & e:: SendInput,{Blind}{Enter}





;��Ҫ��alttab�˵�
<!Tab::AltTab


;����
;!+Tab::MsgBox 111
;!Tab::MsgBox 222
;������

;�ָ�tab������
Tab:: SendInput,{Tab}
#Tab:: SendInput,#{Tab}
+Tab:: SendInput,+{Tab}
^Tab:: SendInput,^{Tab}
^+Tab:: SendInput,^+{Tab}


;************** ��ͼС���� ************** {{{2
>!Space::fun_NircmdScreenShot(1)
^PrintScreen::fun_NircmdScreenShot(0)
+PrintScreen::fun_NircmdScreenShot(1)
fun_NircmdScreenShot(wd)
{
	;1 ActiveWin ,0 WholeDesktop
	ScreenShotPath := "D:\"
	if(wd==1){
		SSFileName = % ScreenShotPath . "SSAW-" . fun_GetFormatTime( "yyyy-MM-dd HH-mm-ss" ) . ".png"
		run nircmd savescreenshotwin "%SSFileName%"
	}
	else{
		SSFileName = % ScreenShotPath . "SSWD-" .  fun_GetFormatTime( "yyyy-MM-dd HH-mm-ss" ) . ".png"
		run nircmd savescreenshot "%SSFileName%"
	}
}



;************** ������� ************** {{{2
;#a:: WinClose A
;ȥ��������
#f11::
	;WinSet, Style, ^0xC00000, A ;�����л������У���ҪӰ�����޷��϶�����λ�á�
	;WinSet, Style, ^0x40000, A ;�����л�sizing border����ҪӰ�����޷��ı䴰�ڴ�С��
	GoSub, Sub_WindowNoCaption
return

#f12::Winset, Alwaysontop, toggle, A


;ˢ�±��ű�
;^!#r:: reload
;^!#r::
;reload
;ToolTip �Ѿ�ˢ�½ű�
;Sleep 2000
;ToolTip
;return

;************** mouse������ ************** {{{2
;����߼�XButton2
;XButton1:: Send,{PgUp}
;XButton2:: Send,{PgDn}

;************** ������ݼ�ģʽ��� ************** {{{1
;ScrollLock::
CapsLock & /::
Escape & /::
;	GV_ToggleKeyMode := !GV_ToggleKeyMode
return

#If GV_ToggleKeyMode=1
j::Send {Down}
k::Send {Up}
h::Send {Left}
l::Send {Right}
y:: Send {Click Right}

u::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	GoSub,Sub_KeyClick123
return

i::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	GoSub,Sub_KeyClick123
return

n::
	GV_KeyClickAction1 := "SendInput,{PgDn}"
	GV_KeyClickAction2 := "SendInput,^{PgDn}"
	GoSub,Sub_KeyClick123
return

m::
	GV_KeyClickAction1 := "SendInput,{PgUp}"
	GV_KeyClickAction2 := "SendInput,^{PgUp}"
	GoSub,Sub_KeyClick123
return

o:: send,{Blind}^+{Tab}
p:: send,{Blind}^{Tab}
.:: SendInput,^w
w:: SendInput,^w

`;:: Send {Click}
,:: SendInput,{Escape}

#If

;************** Ӧ�ó������ ************** {{{1
;************** _group��� ************** {{{2
#IfWinActive, ahk_group group_browser
	F1:: SendInput,^t
	F2:: send,{Blind}^+{Tab}
	F3:: send,{Blind}^{Tab}
	F4:: SendInput,^w
	`;:: 
		;msgbox % GetCursorShape()
		;64λ��Win7����148003967
		If (GetCursorShape() = 148003967)      ;I �͹��
			SendInput,`;
		else 
			Send {Click}
	return
	!`;:: Send {Click Right}
	;^`;:: Send,`;

	;��ס������Ҽ�����Ctrl+W�رձ�ǩ
	~LButton & RButton:: send ^w

#IfWinActive

#IfWinActive, ahk_group group_disableCtrlSpace
	^Space::Controlsend,,^{Space}
	+Space::Controlsend,,+{Space}
#IfWinActive



;totalcmd������İ�ס������Ҽ��ƶ�
;#IfWinNotActive ahk_class TTOTAL_CMD
;~LButton & RButton::
	;;opera ���������֮�ж��������Լ��İ�ס������Ҽ�����
	;if not WinActive("ahk_class OperaWindowClass") and not WinActive("GreenBrowser"){
	;send ^w
	;}
;return 
;#IfWinNotActive




;************** ���������ݼ��������޸ģ� ************** {{{1
#h::run, cmd
;����ԱȨ��cmd
^#h::run, *RunAs cmd
#c::run %COMMANDER_PATH%\Tools\notepad\Notepad.exe /c

;************** ���±� ************** {{{1

;�������±���ȥ����� {{{3
#n::
	run %COMMANDER_PATH%\Tools\notepad\Notepad.exe /f %COMMANDER_PATH%\Tools\notepad\Lite.ini, , , OutputVarPID
	sleep 100
	WinWait ahk_pid %OutputVarPID%
	if ErrorLevel
	{
		MsgBox, WinWait timed out.
		return
	}
	else
	{
		PID = %OutputVarPID%
		WinGet, ThisHWND, ID, ahk_pid %PID% 
		;����λ�úʹ�С, x,y,width,height
		;WinMove, ahk_id %ThisHWND%,, 700,400,550,350
		WinMove, ahk_id %ThisHWND%,, 700,600,310,144
		;WinMove, ahk_pid %PID%,, 700,400,550,350
		;ȥ����
		WinSet, Style, ^0xC00000, ahk_pid %PID%
		;���ܸı��С
		;WinSet, Style, ^0x40000, ahk_pid %PID%
		;ȥ�˵�
		DllCall("SetMenu", "Ptr", ThisHWND, "Ptr", 0)
		;����
		;Winset, Alwaysontop, On,  ahk_pid %PID%
	}
return

;�������±���ȥ����ȣ����ռ������� {{{3
^#b::
	run %COMMANDER_PATH%\Tools\notepad\Notepad.exe /b /f %COMMANDER_PATH%\Tools\notepad\Lite.ini, , , OutputVarPID
	sleep 100
	WinWait ahk_pid %OutputVarPID%
	if ErrorLevel
	{
		MsgBox, WinWait timed out.
		return
	}
	else
	{
		PID = %OutputVarPID%
		WinGet, ThisHWND, ID, ahk_pid %PID% 
		;����λ�úʹ�С, x,y,width,height
		;WinMove, ahk_id %ThisHWND%,, 700,400,550,350
		WinMove, ahk_id %ThisHWND%,, 700,600,310,144
		;WinMove, ahk_pid %PID%,, 700,400,550,350
		;ȥ����
		WinSet, Style, ^0xC00000, ahk_pid %PID%
		;���ܸı��С
		;WinSet, Style, ^0x40000, ahk_pid %PID%
		;ȥ�˵�
		DllCall("SetMenu", "Ptr", ThisHWND, "Ptr", 0)
		;����
		;Winset, Alwaysontop, On,  ahk_pid %PID%
	}
return



;************** С�˵����� ************** {{{2
;�������ɫ��Я��С�˵�����PopSel
;#z::run %COMMANDER_PATH%\Tools\popsel\PopSel.exe /pc /n /is
;#RButton::run %COMMANDER_PATH%\Tools\popsel\PopSel.exe /n


;************** �������ݼ����� ************** {{{1
;������������س����ݼ� {{{2


`; & q::
	send,#1
return

; `; & w::
; 	send,#2
; return

 
; `; & t::
; 	Run, C:\Program Files (x86)\Notepad++\notepad++.exe
; return


#IfWinActive ahk_class TXGuiFoundation       ;QQ,Tim
{
	!1::CoordWinClick(Tim_Start_X, Tim_Start_Y+(1-1)*Tim_Bar_Height)
	!2::CoordWinClick(Tim_Start_X, Tim_Start_Y+(2-1)*Tim_Bar_Height)
	!3::CoordWinClick(Tim_Start_X, Tim_Start_Y+(3-1)*Tim_Bar_Height)
	!4::CoordWinClick(Tim_Start_X, Tim_Start_Y+(4-1)*Tim_Bar_Height)
	!5::CoordWinClick(Tim_Start_X, Tim_Start_Y+(5-1)*Tim_Bar_Height)
	!6::CoordWinClick(Tim_Start_X, Tim_Start_Y+(6-1)*Tim_Bar_Height)
	!7::CoordWinClick(Tim_Start_X, Tim_Start_Y+(7-1)*Tim_Bar_Height)
	!8::CoordWinClick(Tim_Start_X, Tim_Start_Y+(8-1)*Tim_Bar_Height)
	!9::CoordWinClick(Tim_Start_X, Tim_Start_Y+(9-1)*Tim_Bar_Height)
	!0::CoordWinClick(Tim_Start_X, Tim_Start_Y+(10-1)*Tim_Bar_Height)
}


;΢��PC�ͻ���
#IfWinActive ahk_exe WeChat.exe
{
	;�۽�������
	!/::CoordWinClick(100,36)
	;�����ɫ���������
	!,::
		CoordMode, Mouse, Window
		click 28,90 2
		Sleep,100
		click 180,100
	Return
	;�۽����ֿ�
	!`;::
		WinGetPos, wxx, wxy,wxw,wxh, ahk_class WeChatMainWndForPC
		wxw := wxw - 80
		wxh := wxh - 60
		CoordWinClick(wxw,wxh)
	return

	!1::CoordWinClick(WX_Start_X, WX_Start_Y+(1-1)*WX_Bar_Height)
	!2::CoordWinClick(WX_Start_X, WX_Start_Y+(2-1)*WX_Bar_Height)
	!3::CoordWinClick(WX_Start_X, WX_Start_Y+(3-1)*WX_Bar_Height)
	!4::CoordWinClick(WX_Start_X, WX_Start_Y+(4-1)*WX_Bar_Height)
	!5::CoordWinClick(WX_Start_X, WX_Start_Y+(5-1)*WX_Bar_Height)
	!6::CoordWinClick(WX_Start_X, WX_Start_Y+(6-1)*WX_Bar_Height)
	!7::CoordWinClick(WX_Start_X, WX_Start_Y+(7-1)*WX_Bar_Height)
	!8::CoordWinClick(WX_Start_X, WX_Start_Y+(8-1)*WX_Bar_Height)
	!9::CoordWinClick(WX_Start_X, WX_Start_Y+(9-1)*WX_Bar_Height)
	!0::CoordWinClick(WX_Start_X, WX_Start_Y+(10-1)*WX_Bar_Height)
}


;telegram
#IfWinActive ahk_exe Telegram.exe
{
	!/::CoordWinClick(150,52)
	!1::CoordWinClick(TG_Start_X, TG_Start_Y+(1-1)*TG_Bar_Height)
	!2::CoordWinClick(TG_Start_X, TG_Start_Y+(2-1)*TG_Bar_Height)
	!3::CoordWinClick(TG_Start_X, TG_Start_Y+(3-1)*TG_Bar_Height)
	!4::CoordWinClick(TG_Start_X, TG_Start_Y+(4-1)*TG_Bar_Height)
	!5::CoordWinClick(TG_Start_X, TG_Start_Y+(5-1)*TG_Bar_Height)
	!6::CoordWinClick(TG_Start_X, TG_Start_Y+(6-1)*TG_Bar_Height)
	!7::CoordWinClick(TG_Start_X, TG_Start_Y+(7-1)*TG_Bar_Height)
	!8::CoordWinClick(TG_Start_X, TG_Start_Y+(8-1)*TG_Bar_Height)
	!9::CoordWinClick(TG_Start_X, TG_Start_Y+(9-1)*TG_Bar_Height)
	!0::CoordWinClick(TG_Start_X, TG_Start_Y+(10-1)*TG_Bar_Height)
}


#IfWinActive,���������� ahk_class TMultiRename
{
F1::Send,!p{tab}{enter}e
}

;totalcmd�п�ݼ� {{{2
#IfWinActive ahk_class TTOTAL_CMD
	,:: 
		ControlGetFocus, TC_CurrentControl, A
		;msgbox % name
		;TInEdit1 ��ַ���������� Edit1 ������
		if (RegExMatch(TC_CurrentControl, "TMyListBox1|TMyListBox2"))
			TcSendPos(524)   ;cm_ClearAll
		else
			send,`,
	return
	CapsLock & y:: send,{AppsKey}
	/*
	   [:: send,{Home}{Down}
	 */
	;]:: send,{End}
	;���Ƶ�����ѡ��Ŀ¼
	^!F5::
		send,{Tab}^+c{Tab}{F5}
		Sleep,500
		send,^v
		Sleep,500
		send,{Enter 2}
	return
	;�ƶ�������ѡ��Ŀ¼
	^!F6::
		send,{Tab}^+c{Tab}{F6}
		Sleep,500
		send,^v
		Sleep,500
		send,{Enter 2}
	return
	;���ϼ����������ݸ���
	^F2::
		send,+{F6}
		Sleep,300
		send,{right}
		Sleep,300
		send,{Space}^v
		Sleep,300
		send,{Enter}
	return

	;�м���������½���ǩ�д�
	MButton::
		Send,{Click}
		Sleep 50
		TcSendPos(3003)
	return

	`:: GoSub,Sub_azHistory

#IfWinActive

TcSendPos(Number)
{
    PostMessage 1075, %Number%, 0, , AHK_CLASS TTOTAL_CMD
}


;excel�� {{{2
;excel 2010: ahk_class bosa_sdm_XL9  excel2013: ahk_class XLMAIN ahk_exe C:\Windows\System32\Notepad.exe 
#IfWinActive ahk_exe excel.exe 
{
	;���Ƶ�Ԫ���ı�
	!c:: send,{F2}^+{Home}^c{Esc}
	;ɸѡ
	f3::PostMessage, 0x111, 447, 0, , a   
	;��λ
	!g::ControlClick, Edit1
	;��ϸ�༭
	!;::ControlClick, EXCEL<1
}

 

;����Ŀ¼�л� {{{2
;�ղص�Ŀ¼��
;���ʹ�õ�Ŀ¼
;#IfWinActive ���Ϊ ahk_class #32770
;#If WinActive("���Ϊ ahk_class #32770") or WinActive("�� ahk_class #32770")
;!f:: SendPath2Diag("���Ϊ","Edit1","d:\My Documents\����")
;send,!n%2Path%{Enter}{Del}
;send,% text
;ControlSetText, Edit1, "d:\My Documents\����",A
;ControlSetText, Edit1, cd %ThisMenuItem%, ahk_class TTOTAL_CMD
#IfWinActive, ahk_group GroupDiagOpenAndSave
	!g:: GoSub,Sub_SendCurDiagPath2Tc
	!t:: GoSub,Sub_SendTcCurPath2Diag
#IfWinActive

;��TC�д򿪶Ի����·��
Sub_SendCurDiagPath2Tc:
	WinGetText, CurWinAllText
	;MsgBox, The text is:`n%CurWinAllText%
	Loop, parse, CurWinAllText, `n, `r
	{
		If RegExMatch(A_LoopField, "^��ַ: "){
			curDiagPath := SubStr(A_LoopField,4)
			break
		}
	}
	;msgbox % curDiagPath
	WinActivate, ahk_class TTOTAL_CMD
	ControlSetText, Edit1, cd %curDiagPath%, ahk_class TTOTAL_CMD
	sleep 900
	ControlSend, Edit1, {enter}, ahk_class TTOTAL_CMD
return

;��tc��·�����͵��Ի���
Sub_SendTcCurPath2Diag:
	;����������������Ϊ�ļ���
	B_Clip2Name := false
	B_ChangeDiagSize := true

	;�Ȼ�ȡTC�е�ǰ·��
	clip:=Clipboard
	Clipboard =
    ;CM_CopySrcPathToClip 2029
	PostMessage, TC_Msg, CM_CopySrcPathToClip,0,, ahk_class TTOTAL_CMD
	ClipWait, 1
	srcDIR := Clipboard
	Clipboard:=clip

	;�ٷ��ͼ�����·�����ؼ�
	ControlFocus, Edit1, A
	send,{Backspace}
	sleep 100
	ControlSetText, Edit1, %srcDIR%,A
	send,{enter}
	;msgbox %clip%
	if(B_Clip2Name){
		Sleep 100
		ControlSetText, Edit1, %clip%,A
	}
	;ControlSetText, Edit1, %text%,A
	if(B_ChangeDiagSize){
		;WinGetPos, xTB, yTB,lengthTB,hightTB, ahk_class Shell_TrayWnd
		;�ı�Ի����С��ʡ�¾�ֱ���ƶ���100,100��λ�ã�Ȼ��85%��Ļ��С�������Ҫ��ϸ�������������������ҵ�λ��
		WinMove, A,,80,80, A_ScreenWidth * 0.85, A_ScreenHeight * 0.85
	}
return
;�����Ի����в˵�
Sub_Menu2Diag:
;�����ʷ
;�ұ���ʷ
;hotdir
return


;Totalcmd��ʷ��¼ {{{2
;��Ӱ���ini��ȡ�������˵����ӹ�`����
;��������ǿ
;�̶��ı���Ŀ��ǿ
;#Persistent
Sub_azHistory:

    Global TC_azHistorySelect
	;MaxItem := 36
	;MaxItem := 10
	MaxItem := 30

	WinGet,exeName,ProcessName,A
	WinGet,exeFullPath,ProcessPath,A
	;D:\tools\totalcmd\TOTALCMD.EXE �����������������

	if(SubStr(exeFullPath,2,2)!=":\")
	{
		WinGet,pid,PID,A
		;\Device\RAMDriv\totalcmd\TOTALCMD.EXE ���ڴ�������
		sql = Select * from Win32_Process WHERE ProcessId = %pid%
		for process in ComObjGet("winmgmts:").ExecQuery(sql)
		{
			exeFullPath := process.CommandLine
			;"Z:\totalcmd\TOTALCMD.EXE"
		}
		exeFullPath := SubStr(exeFullPath,2,StrLen(exeFullPath)-3)
	}

	StringLeft, tcPath, exeFullPath, StrLen(exeFullPath)-StrLen(exeName)-1

	aTCINI = %tcPath%\wincmd.ini
    If Strlen(aTCINI)
    {
		PostMessage, TC_Msg, CM_ConfigSaveDirHistory,0,, ahk_class TTOTAL_CMD
        Sleep, 800
        If Mod(TC_LeftRight(), 2)
            Direct := "Left"
        Else
            Direct := "Right"

		try{
			;[LeftHistory]RedirectSection=%COMMANDER_PATH%\USER\HISTORY.INI
			INIRead, aRSTCINI, %aTCINI%, %Direct%History, RedirectSection
			;%COMMANDER_PATH%\USER\HISTORY.INI
			if SubStr(aRSTCINI,2,14)=="COMMANDER_PATH"
			{
				HINI := % SubStr(aRSTCINI,17)
				aTCINI = %tcPath%%HINI%
			}
		}
		catch e{
		}

        INIRead, HistoryList, %aTCINI%, %Direct%History
        arrHistory := StrSplit(HistoryList, "`n", "`r")
        TC_azHistorySelect := {}
        SplitPath, A_LineFile, , ScriptDir
        ;IconFile := ScriptDir "\azHistory.icl"
        Menu, TC_azHistory, UseErrorLevel
        Menu, TC_azHistory, DeleteAll
		if(arrHistory.MaxIndex()<MaxItem)
			MaxItem := arrHistory.MaxIndex()
        Loop % MaxItem
        {
			Value := RegExReplace(arrHistory[A_Index],"^\d\d?=")
			IconNum := A_Index
			if(A_Index <= 10)
				Char := "[&" Chr(A_Index+47) "]"
			else if(A_Index <= 36)
				Char := "[&" Chr(A_Index+54) "]"
			Else
				Char = ""
				;Break
            TC_azHistorySelect[A_Index] := Value
            Value := RegExReplace(Value, "::(\{[0-9a-zA-Z\-]*\})?\|")
            Menu, TC_azHistory, Add, %Char%    %Value%, azHistory_Select
            ;Menu, TC_azHistory, Add, %Value%%A_Tab%%Char%, azHistory_Select
            ;Menu, TC_azHistory, Icon, %Value%%A_Tab%%Char%, %IconFile%, %IconNum%
        }
        ControlGetFocus,TLB,ahk_class TTOTAL_CMD
        ControlGetPos,xn,yn,wn,,%TLB%,ahk_class TTOTAL_CMD
		yn := yn - 80
        Menu, TC_azHistory, Add, �ر�%A_Tab%[& ],TC_azHistory_DeleteAll
		Menu, TC_azHistory, Show, %XN%, %YN%
    }
return

TC_azHistory_DeleteAll:
	Menu, TC_azHistory, DeleteAll
return

azHistory_Select:
	Global TC_azHistorySelect
    Value := TC_azHistorySelect[A_ThisMenuItemPos]
    If RegExMatch(Value, "^::")
    {
        If RegExMatch(Value, "::\{20D04FE0\-3AEA\-1069\-A2D8\-08002B30309D\}")
            Number := CM_OpenDrives
        Else If RegExMatch(Value, "::(?!\{)")
            Number := CM_OpenDesktop
        Else If RegExMatch(Value, "::\{21EC2020\-3AEA\-1069\-A2DD\-08002B30309D\}\\::\{2227A280\-3AEA\-1069\-A2DE\-08002B30309D\}")
		    Number := cm_OpenPrinters
	    Else If RegExMatch(Value, "::\{F02C1A0D\-BE21\-4350\-88B0\-7367FC96EF3C\}")
		    Number := cm_OpenNetwork
        Else If RegExMatch(Value, "::\{26EE0668\-A00A\-44D7\-9371\-BEB064C98683\}\\0")
		    Number := cm_OpenControls
	    Else If RegExMatch(Value, "::\{645FF040\-5081\-101B\-9F08\-00AA002F954E\}")
		    Number := cm_OpenRecycled
        PostMessage, %TC_Msg%, %Number%, 0, , AHK_CLASS TTOTAL_CMD
    }
    Else
    {
        ThisMenuItem := RegExReplace(Value,"\t.*$")
        WinGet, ExeName, ProcessName, ahk_class TTOTAL_CMD
		ControlSetText, Edit1, cd %ThisMenuItem%, ahk_class TTOTAL_CMD
		ControlSend, Edit1, {enter}, ahk_class TTOTAL_CMD
    }
return

TC_LeftRight()
{
	Location := 0
	ControlGetPos,x1,y1,,,%TCPanel1%,AHK_CLASS TTOTAL_CMD
	If x1 > %y1%
		location += 2
	ControlGetFocus,TLB,ahk_class TTOTAL_CMD
	ControlGetPos,x2,y2,wn,,%TLB%,ahk_class TTOTAL_CMD
	If location
	{
		If x1 > %x2%
			location += 1
	}
	Else
	{
		If y1 > %y2%
			location += 1
	}
	Return location
}

MenuHandler:
MsgBox You selected %A_ThisMenuItem% from the menu %A_ThisMenu%.
return


CreatTrayMenu()
{
Menu,Tray,NoStandard
Menu,Tray,add,����(&R),Menu_Reload
Menu,Tray,add
Menu,Tray,add,��ͣ�ȼ�(&S),Menu_Suspend
Menu,Tray,add,��ͣ�ű�(&A),Menu_Pause
Menu,Tray,add,�˳�(&X),Menu_Exit
}
Menu_Reload:
	Reload
return
Menu_Suspend:
	Menu,tray,ToggleCheck,��ͣ�ȼ�(&S)
	Suspend
return
Menu_Pause:
	Menu,tray,ToggleCheck,��ͣ�ű�(&A)
	Pause
return
Menu_Exit:
	ExitApp
return

Quit:
ExitApp

; vim: textwidth=120 wrap tabstop=4 shiftwidth=4
; vim: foldmethod=marker fdl=0
