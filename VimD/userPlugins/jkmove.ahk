#singleinstance force
#MaxHotkeysPerInterval 1000
VimFlag=0

^u::
	Send,{j down}
	return

; 开启
^j::
if(VimFlag=1){
	VimFlag=0
	return
}
else{
	VimFlag=1
	return
}
return
; 退出
$Esc::
if(VimFlag=1){
	VimFlag=0
	return
}
else
	Send,{Escape}
return

:?*:j::

if(VimFlag=1){
	Send,{Down}
	return
}
else
{
	GetKeyState, state, CapsLock, T
	if state = D
	{
		Send,J
	}
	else
	{
		GetKeyState, state, Shift
		if state = D
		Send,J
		else
		Send,{j down}
	}
}
return


:?*:h::
if(VimFlag=1){
	Send,{Left}
	return
}
else
{
	GetKeyState, state, CapsLock, T
	if state = D
	{
		Send,H
	}
	else
	{
		GetKeyState, state, Shift
		if state = D
		Send,H
		else
		Send,h
	}
}
return

:?*:k::
if(VimFlag=1){
	Send,{Up}
	return
}
else
{
	GetKeyState, state, CapsLock, T
	if state = D
	{
		Send,K
	}
	else
	{
		GetKeyState, state, Shift
		if state = D
		Send,K
		else
		Send,k
	}
}
return

:?*:l::
if(VimFlag=1){
	Send,{Right}
	return
}
else
{
	GetKeyState, state, CapsLock, T
	if state = D
	{
		Send,L
	}
	else
	{
		GetKeyState, state, Shift
		if state = D
		Send,L
		else
		Send,l
	}
}
return

:?*:x::
if(VimFlag=1){
	Send,{Backspace}
	return
}
else
{
	GetKeyState, state, CapsLock, T
	if state = D
	{
		Send,X
	}
	else
	{
		GetKeyState, state, Shift
		if state = D
		Send,X
		else
		Send,x
	}
}
return

:?*:;::
if(VimFlag=1){
	Send,{Right}{Backspace}
	return
}
else
	Send,;
return




