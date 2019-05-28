#singleinstance force
#MaxHotkeysPerInterval 1000

VimFlag=0

#If !WinActive("ahk_exe devenv.exe")
{

:*:jj::
VimFlag:=1
return


#IF VimFlag
j::Down
k::Up
h::Left
l::Right
d::Backspace
x::Delete
esc::VimFlag:=!VimFlag
a::VimFlag:=!VimFlag
i::VimFlag:=!VimFlag
#IF
}