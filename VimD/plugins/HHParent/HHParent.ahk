HHParent:
	vim.comment("<HHParent_FocusToolBar>","�۽���������")
	vim.comment("<HHParent_FocusContentPanel>","�۽����������")
	vim.comment("<HHParent_FocusDirectoryTab>","�۽���Ŀ¼ѡ�")
	vim.comment("<HHParent_FocusIndexTab>","�۽�������ѡ�")
	vim.comment("<HHParent_FocusSearchTab>","�۽�������ѡ�")
	vim.comment("<HHParent_FocusSearchTab>","�۽�������ѡ�")
	vim.comment("<HHParent_FocusCollectionTab>","�۽����ղ�ѡ�")
	vim.comment("<HHParent_ShowContentContentURL>","��ʾ����ǰ����URL��Ϣ")
	vim.comment("<HHParent_SwitchNavigationPanel>","��ʾ/���أ����������")
	vim.comment("<HHParent_ContentFinder>","���ң�����")
	vim.comment("<HHParent_JumpForward>","��ת��ǰ��")
	vim.comment("<HHParent_JumpBack>","��ת������")
	vim.comment("<HHParent_JumpHome>","��ת����ҳ")
	vim.comment("<HHParent_RollingDown>","��������һ��")
	vim.comment("<HHParent_RollingUp>","��������һ��")
	vim.comment("<HHParent_RollingPgUp>","��������һ��")
	vim.comment("<HHParent_RollingPgDn>","��������һ��")
	vim.comment("<HHParent_RollingHome>","����������")
	vim.comment("<HHParent_RollingEnd>","����������")
	
	vim.SetWin("HHParent", "HH Parent")

	; insertģʽ
    vim.mode("insert", "HHParent")
	vim.map("<esc>", "<HHParent_NormalMode>", "HHParent")
	
	; normalģʽ
    vim.mode("normal", "HHParent")
	vim.map("<esc>", "<HHParent_FocusContentPanel>", "HHParent")	
	vim.map("j", "<HHParent_RollingDown>", "HHParent")
	vim.map("k", "<HHParent_RollingUp>", "HHParent")
	vim.map("h", "<HHParent_JumpBack>", "HHParent")
	vim.map("l", "<HHParent_JumpForward>", "HHParent")
	vim.map("gg", "<HHParent_RollingHome>", "HHParent")
	vim.map("G", "<HHParent_RollingEnd>", "HHParent")
	
	vim.map("J", "<HHParent_RollingPgDn>", "HHParent")
	vim.map("K", "<HHParent_RollingPgUp>", "HHParent")
	
	vim.map("i", "<HHParent_InsertMode>", "HHParent")
	
	vim.map("a", "<HHParent_FocusDirectoryTab>", "HHParent")
	vim.map("s", "<HHParent_FocusIndexTab>", "HHParent")
	vim.map("d", "<HHParent_FocusSearchTab>", "HHParent")
	vim.map("f", "<HHParent_FocusCollectionTab>", "HHParent")
	
	vim.map("/", "<HHParent_ContentFinder>", "HHParent")
	
	vim.map("q", "<HHParent_SwitchNavigationPanel>", "HHParent")
	vim.map("u", "<HHParent_ShowContentContentURL>", "HHParent")
	vim.map("t", "<HHParent_FocusToolBar>", "HHParent")
	vim.map("c", "<HHParent_FocusContentPanel>", "HHParent")
	
	vim.BeforeActionDo("HHParent_ForceInsertMode", "HHParent")
return


; ��ָ���ؼ�ʹ��insertģʽ
HHParent_ForceInsertMode()
{
    ControlGetFocus, ctrl,ahk_class  HH Parent    
    If RegExMatch(ctrl, "Edit3") or RegExMatch(ctrl, "Edit1") or RegExMatch(ctrl, "Edit2"){
        Return True
    }
    return False
}


<HHParent_NormalMode>:
    vim.mode("normal", "HHParent")	
return

<HHParent_InsertMode>:
    vim.mode("insert", "HHParent")
return


;�۽���������
<HHParent_FocusToolBar>:
ControlFocus,ToolbarWindow321,ahk_class  HH Parent
return

;�۽����������
<HHParent_FocusContentPanel>:
ControlFocus,Internet Explorer_Server1,ahk_class  HH Parent
return

;�۽���Ŀ¼ѡ�
<HHParent_FocusDirectoryTab>:
	SwitchNavigationPanel("Show")
	SendMessage, 0x1330,0,, SysTabControl321, ahk_class  HH Parent  
return

;�۽�������ѡ�
<HHParent_FocusIndexTab>:
	SwitchNavigationPanel("Show")
	SendMessage, 0x1330,1,, SysTabControl321, ahk_class  HH Parent  
return

;�۽�������ѡ�
<HHParent_FocusSearchTab>:
	SwitchNavigationPanel("Show")
	SendMessage, 0x1330,2,, SysTabControl321, ahk_class  HH Parent  
return

;�۽����ղ�ѡ�
<HHParent_FocusCollectionTab>:
	SwitchNavigationPanel("Show")
	SendMessage, 0x1330,3,, SysTabControl321, ahk_class  HH Parent  
return


;��ʾ����ǰ����URL��Ϣ
<HHParent_ShowContentContentURL>:
	Send !gu
return

;��ʾ/���أ����������
<HHParent_SwitchNavigationPanel>:
SwitchNavigationPanel("Switch")
return

;���ң�����
<HHParent_ContentFinder>:
	gosub,<HHParent_FocusContentPanel>
	Send ^f
return

;��ת��ǰ��
<HHParent_JumpForward>:
	Send +{BS}
return

;��ת������
<HHParent_JumpBack>:
	Send {BS}
return

;��ת����ҳ
<HHParent_JumpHome>:
	Send !gh
return

;��������һ��
<HHParent_RollingDown>:
	Send {Down}
return

;��������һ��
<HHParent_RollingUp>:
	Send {Up}
return

;��������һ��
<HHParent_RollingPgUp>:
	Send {PgUp}
return

;��������һ��
<HHParent_RollingPgDn>:
	Send {PgDn}
return

;����������
<HHParent_RollingEnd>:
	Send {End}
return

;����������
<HHParent_RollingHome>:
	Send {Home}
return

;�жϵ������Ƿ���ʾ,��ʾ����1�����ط���0
IsShowNavigationPanel(){
	ControlGet,ov,Visible,,HH Child2,ahk_class  HH Parent
	return ov
}


SwitchNavigationPanel(cmd)
{
	if(cmd=="Switch"){
		if(IsShowNavigationPanel()==1){
			gosub,<HHParent_FocusToolBar>
			Send {Enter}
			;Send !vn
		}
		else{
			gosub,<HHParent_FocusToolBar>
			Send {Enter}
			;Send !vn
		}
	}
	if(cmd=="Show") and  (IsShowNavigationPanel()==0){
		gosub,<HHParent_FocusToolBar>
		Send {Enter}
		;Send !vn
	}
	if(cmd=="Hide") and  (IsShowNavigationPanel()==1){
		gosub,<HHParent_FocusToolBar>
		Send {Enter}
		;Send !vn
	}
}


