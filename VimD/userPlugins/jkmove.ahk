#singleinstance force
#MaxHotkeysPerInterval 1000

VimFlag=0

^j::
VimFlag:=1
return

:*:jj::
VimFlag:=1
return

#IF VimFlag
j::Down
k::Up
h::Left
l::Right
x::Backspace
`;::Delete
esc::VimFlag:=!VimFlag
a::VimFlag:=!VimFlag
#IF