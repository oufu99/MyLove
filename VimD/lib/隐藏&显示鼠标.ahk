; ����: �������� Win+C ʱ���������. �ٴΰ��� Win+C ��ʾ.
; �˽ű����� www.autohotkey.com/forum/topic6107.html

OnExit, ShowCursor  ; ȷ�����ű��˳�ʱ���������ʾ��.
return

ShowCursor:
SystemCursor("On")
ExitApp


<ShowAndHideSystemCursor>:
SystemCursor("Toggle")  ; Win+C �ȼ������л���������ʾ������.
return

SystemCursor(OnOff=1)   ; ��ʼ�� = "I","Init"; ���� = 0,"Off"; �л� = -1,"T","Toggle"; ��ʾ = ����
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; ϵͳָ��
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; �հ�ָ��
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; Ĭ��ָ��ľ�
   
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; ��������״˵���ʱ���г�ʼ��
    {
        $ = h                                          ; ���Ĭ��ָ��
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
            b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; ʹ�ÿհ�ָ��
    else
        $ = h  ; ʹ�ñ����ָ��

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}