#singleinstance force
#MaxHotkeysPerInterval 1000

VimFlag=0
OldStr=Hello world{!}
PrevStr=""

#If !WinActive("ahk_exe devenv.exe")
{

:*:jj::
VimFlag:=1
OldStr=%clipboard%
Send,{Shift Down}{Left}{Shift Up}{Ctrl Down}c{Ctrl Up}
PrevStr=%clipboard%
Send,{Right}
if(PrevStr="")
{
clipboard =%OldStr%
Send,{Backspace}
return
}
return


#IF VimFlag
j::Down
k::Up
h::Left
l::Right
d::Delete
x::Backspace
e::End
b::Home
esc::VimFlag:=!VimFlag
a::VimFlag:=!VimFlag
i::VimFlag:=!VimFlag
#IF
}