#singleinstance force

 
; Ctrl:^   Shift:+   Alt:!  ����Ҽ�:RButton

  Run, C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe
  Winwaitactive, QQ
  Wingetpos, x, y, w, h
  x:=x+w//2
  y:=y+h//2+110  ;�Լ�΢��������
  Coordmode, Mouse
  Sleep,500
  mouseclick,, x, y



 