#singleinstance force
#MaxHotkeysPerInterval 1000
Flag=0

; 开启
^j::
if(Flag=1){
	Flag=0
	return
}
else{
	Flag=1
	return
}
	Flag=1
return
; 退出
$Esc::
if(Flag=1){
	Flag=0
	return
}
else
	Send,{Escape}
return

:?*:j::
if(Flag=1){
	Send,{Down}
	return
}
else
	Send,j
return


:?*:h::
if(Flag=1){
	Send,{Left}
	return
}
else
	Send,h
return

:?*:k::
if(Flag=1){
	Send,{Up}
	return
}
else
	Send,k
return

:?*:l::
if(Flag=1){
	Send,{Right}
	return
}
else
	Send,l
return

:?*:x::
if(Flag=1){
	Send,{Backspace}
	return
}
else
	Send,x
return





