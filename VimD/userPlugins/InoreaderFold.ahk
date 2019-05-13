#singleinstance force
RssRead=0

#If WinActive("ahk_exe chrome.exe")
{
^d::
RssRead:=1
return


#IF RssRead
o::d
d::o
esc::RssRead:=!RssRead
#IF
} 