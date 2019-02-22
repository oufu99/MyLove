#SingleInstance force
#include <menuPublish>
ini:="config.ini"

bgColor:=IniRead(ini, "config", "bgColor", "303030")
fontcolor:=IniRead(ini, "config", "fontcolor", "5fb41b")
showHk:=IniRead(ini, "config", "showHk", "Rshift")
hideHK:=IniRead(ini, "config", "hideHK", "esc")

if(not InStr(hideHK, "~")){
	hideHK := "~" hideHK
}

Hotkey(showHk, "showGUI")
Hotkey(hideHK, "HideGUI")

bgColor:="Background" bgColor
fontcolor:="c" fontcolor

; 获取顶层窗体
global lastWin:=WinExist("A")

; gui:=guiCreate("-Caption +E0x08000000 +AlwaysOnTop ","提示框-By巴克队长")
gui:=guiCreate("-Caption +AlwaysOnTop ","提示框-By巴克队长")
Gui.SetFont(fontcolor " s18")
global etBox:=Gui.Add("Edit", "xm ym r1 w500 " bgColor)
etBox.onEvent("change","update")
; etBox.onEvent("loseFocus","loseFocus") 
global lb:=Gui.Add("ListBox", "xp yp+30 r5 w500 " bgColor)
gui.show()


Gui.BackColor := "EEAA99"
WinSetTransColor("EEAA99",gui.title)
gui.Hide()

trayMenu(gui,1,0)

; 获取字典文件
dictPath:="输入提示配置.txt"
dictRawStr:=FileRead(dictPath)
global dict:={}
for rowIndex,itemStr in StrSplit(dictRawStr, "`n", "`r") {
	splitList:=StrSplit(itemStr,"---")
	dict[splitList[1]]:=splitList[2]
}

Return




; 查找匹配项
getMatchKey(str,dict){
	keyWords:=[]
	pattern:="i)^" str
	for k,v in dict {
		try{
			if(RegExMatch(k, pattern)){
				keyWords.push(k)
			}
		}
	}
	Return keyWords
}

; 更新gui内容
update(){
	; setGuiPos()
	keyWords:=[]
	if(etBox.Text!=""){
		keyWords:=getMatchKey(etBox.Text,dict)
	}
	lb.Delete()
	lb.Add(keyWords)
	if(keyWords.MaxIndex()){
		lb.choose(1)
		hSize:=keyWords.MaxIndex()
		hSize:=hSize>12?12:hSize
		hSize *= 25
		lb.Move("h" hSize)
		hSize+=30
		lb.gui.show("h" hSize " NoActivate AutoSize")
	}	
}

; 获取光标位置

setGuiPos(){
	CoordMode "Mouse" , "Screen"
	x:=0,y:=0
	if( not CaretGetPos(x, y) ) {
		if(A_Cursor="IBeam"){
			MouseGetPos x, y
		}
	}

	if(x=""){
		x:=A_ScreenWidth/2
	}
	if(y=""){
		y:=A_ScreenHeight/2
	}

	etBox.gui.show("x" x " y" y+30)
	etBox.focus()
	send("{End}")
}

; 打开和关闭gui
showGUI:
	lastWin:=WinExist("A")
	setGuiPos()
Return

hideGUI:
	lb.gui.Hide()
Return	

#if WinActive(lb.gui.title)

	Down::
		Try{ 
			lb.choose(lb.value+1) 
		}
		Catch e {
			lb.choose(1)
		}
	Return

	up::
		Try{ 
			lb.choose(lb.value-1) 
		}
		Catch e {
			etBox.focus()
			send("{End}")
		}
	Return

	~BS::
		update()
	Return

	Tab::
		key:=lb.Text
		len:=StrLen(key)
		value:=dict[key]
        if(value=""){
        	value:=etBox.Text
        }
		etBox.text:=""
		etBox.gui.Hide()

		WinActivate("A")

		; 消除已输入的字符
		; if(len){
		; 	send("{BackSpace " len "}")
		; }		
		sendInput(value)
	Return

	~LButton::
		lastWin:=WinExist("A")
		CoordMode "Mouse" , "Screen"
		MouseGetPos(x, y)
		etBox.gui.show("x" x-25 " y" y+5 " NoActivate")
		WinActivate("A")
	Return
#if

; #if WinExist(lb.gui.title)

; #if