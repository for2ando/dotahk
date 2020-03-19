;;;
;;; AutoHotKey main script
;;; executed via the shortcut in the Startup folder.
;;;

;; auto-execute section
;;
SetTitleMatchMode,RegEx
While A_Index <= 26 {
  aChar := Chr(64 + A_Index)
  Ctrl%aChar% := Chr(A_Index)
}

;; reload AHK script
;;
  ^!F12::
    Reload

;; datedate-time string on saving session
;;   within SessionBuddy@Chrome and TabmixPlus@Firefox
;;
If (WinActive("セッションマネージャ - .*のウィンドウを保存ahk_class MozillaDialogClass") or WinActive(" - Session Buddy - ahk_class Chrome_WidgetWin_1")) {
  +F12::
    Date = %A_Year%%A_Mon%%A_MDay%-%A_Hour%%A_Min%
    Send,%Date%
    Return
}

;; Windows' Command Prompt hacks
;;
#IfWinActive, ahk_class ConsoleWindowClass	; The Command Prompt
  ^d::
    ; First send ESC, in case we're in select mode.
    Send,{Esc}{Esc}exit{Enter}
    Return
  +PgUp::
    WinGetPos,X,Y,Width,Height,A
    Rows := Floor(Height/20)-3
    SendInput,^{Up %Rows%}
    Return
  +PgDn::
    WinGetPos,X,Y,Width,Height,A
    Rows := Floor(Height/20)-3
    SendInput,^{Down %Rows%}
    Return
  +Up::Send,^{Up}
  +Down::Send,^{Down}
  Insert::
    WinGet,Controls,ControlList,A
    MsgBox %Controls%
    Return

;; Emacs-like trial for The Command Prompt
;;
#IfWinActive, ahk_class ConsoleWindowClassXXXXX	; The Command Prompt
  !v::Send,+{PgUp}
  ^v::Send,+{PgDn}
  ^p::Send,{Up}
  ^n::Send,{Down}
	^a::Send,{Home}
	^e::Send,{End}
  !f::Send,^{Right}
  !b::Send,^{Left}
  ^f::Send,{Right}
  ^b::Send,{Left}
  ^j::Send,{Enter}
  ^m::Send,{Enter}
  ^o::Send,{Enter}{Up}
  ^q::
    HotKey,IfWinActive,ahk_class ConsoleWindowClass
    HotKey,^a,Off
    HotKey,^b,Off
    ;HotKey,^c,Off
    ;HotKey,^d,Off
    HotKey,^e,Off
    HotKey,^f,Off
    ;HotKey,^g,Off
    ;HotKey,^h,Off
    ;HotKey,^i,Off
    HotKey,^j,Off
    ;HotKey,^k,Off
    ;HotKey,^l,Off
    HotKey,^m,Off
    HotKey,^n,Off
    HotKey,^o,Off
    HotKey,^p,Off
    ;HotKey,^q,Off
    ;HotKey,^r,Off
    ;HotKey,^s,Off
    ;HotKey,^t,Off
    ;HotKey,^u,Off
    HotKey,^v,Off
    ;HotKey,^w,Off
    ;HotKey,^x,Off
    ;HotKey,^y,Off
    ;HotKey,^z,Off
      Input,aKey,B C M L1
      ;aCode := Asc(aKey)			;dbg
      ;MsgBox,%ErrorLevel%;%aKey%;%aCode%;	;dbg
      IfEqual,aKey,%CtrlA%, Send,^a
      IfEqual,aKey,%CtrlB%, Send,^b
      IfEqual,aKey,%CtrlC%, Send,^c
      IfEqual,aKey,%CtrlD%, Send,^d
      IfEqual,aKey,%CtrlE%, Send,^e
      IfEqual,aKey,%CtrlF%, Send,^f
      IfEqual,aKey,%CtrlG%, Send,^g
      IfEqual,aKey,%CtrlH%, Send,^h
      IfEqual,aKey,%CtrlI%, Send,^i
      IfEqual,aKey,%CtrlJ%, Send,^j
      IfEqual,aKey,%CtrlK%, Send,^k
      IfEqual,aKey,%CtrlL%, Send,^l
      IfEqual,aKey,%CtrlM%, Send,^m
      IfEqual,aKey,%CtrlN%, Send,^n
      IfEqual,aKey,%CtrlO%, Send,^o
      IfEqual,aKey,%CtrlP%, Send,^p
      IfEqual,aKey,%CtrlQ%, Send,^q
      IfEqual,aKey,%CtrlR%, Send,^r
      IfEqual,aKey,%CtrlS%, Send,^s
      IfEqual,aKey,%CtrlT%, Send,^t
      IfEqual,aKey,%CtrlU%, Send,^u
      IfEqual,aKey,%CtrlV%, Send,^v
      IfEqual,aKey,%CtrlW%, Send,^w
      IfEqual,aKey,%CtrlX%, Send,^x
      IfEqual,aKey,%CtrlY%, Send,^y
      IfEqual,aKey,%CtrlZ%, Send,^z
      ;IfEqual,aKey,{Escape},Quit	;No need to define.
      ;IfEqual,aKey,{Enter},Quit	;No need to define.
    HotKey,^a,On
    HotKey,^b,On
    ;HotKey,^c,On
    ;HotKey,^d,On
    HotKey,^e,On
    HotKey,^f,On
    ;HotKey,^g,On
    ;HotKey,^h,On
    ;HotKey,^i,On
    HotKey,^j,On
    ;HotKey,^k,On
    ;HotKey,^l,On
    HotKey,^m,On
    HotKey,^n,On
    HotKey,^o,On
    HotKey,^p,On
    ;HotKey,^q,On
    ;HotKey,^q,On
    ;HotKey,^r,On
    ;HotKey,^s,On
    ;HotKey,^t,On
    ;HotKey,^u,On
    HotKey,^v,On
    ;HotKey,^w,On
    ;HotKey,^x,On
    ;HotKey,^y,On
    ;HotKey,^z,On
    HotKey,IfWinActive
    Return

;; Command Prompt hacks for cmd or Posh within ConEmu64
;;
#IfWinActive, (cmd|[pP]ower[sS]hell)( \(Admin\))?$ ahk_exe ConEmu64.exe
  ^d::
    ; First send ESC, in case we're in select mode.
    Send,{Esc}{Esc}exit{Enter}
    Return
  Insert::
    ;WinGet,Controls,ControlList,A
    ;ControlGetText V,Edit1,A
    WinGetText V,A
    MsgBox %V%
    Return

;; Emacs-like trial for Evernote
;;
#IfWinActive, ahk_class ENMainFrameXXX		;Evernote
  !<::Send,^{Home}
  !>::Send,^{End}
  !v::Send,{PgUp}
  ^v::Send,{PgDn}
  ^p::Send,{Up}
  ^n::Send,{Down}
  ^a::Send,{Home}
  ^e::Send,{End}
  !f::Send,^{Right}
  !b::Send,^{Left}
  ^f::Send,{Right}
  ^b::Send,{Left}
  ^h::Send,{Backspace}
  ^d::Send,{Delete}
  ^j::Send,{Enter}
  ^m::Send,{Enter}
  ^o::Send,{Enter}{Left}
  ^i::Send,{Tab}
  ^g::Return
  ^c::Return
  ^k::Return
  ^w::Return
  ^y::Return
  ^l::Return
  ^s::Return
  ^r::Return
  ^t::Return
  ^u::Return
  ^x::Return
  ^q::
    HotKey,IfWinActive,ahk_class ENMainFrame
    HotKey,^p,Off
    HotKey,^n,Off
    HotKey,^v,Off
    HotKey,^a,Off
    HotKey,^e,Off
    HotKey,^f,Off
    HotKey,^b,Off
    HotKey,^h,Off
    HotKey,^d,Off
    HotKey,^j,Off
    HotKey,^m,Off
    HotKey,^o,Off
    HotKey,^i,Off
    HotKey,^g,Off
    HotKey,^c,Off
    HotKey,^k,Off
    HotKey,^w,Off
    HotKey,^y,Off
    HotKey,^l,Off
    HotKey,^s,Off
    HotKey,^r,Off
    HotKey,^t,Off
    HotKey,^u,Off
    HotKey,^x,Off
    HotKey,^q,Off
      Input,aKey,B C M L1
      ;aCode := Asc(aKey)			;dbg
      ;MsgBox,%ErrorLevel%;%aKey%;%aCode%;	;dbg
      IfEqual,aKey,%CtrlP%, Send,^p
      IfEqual,aKey,%CtrlN%, Send,^n
      IfEqual,aKey,%CtrlV%, Send,^v
      IfEqual,aKey,%CtrlA%, Send,^a
      IfEqual,aKey,%CtrlE%, Send,^e
      IfEqual,aKey,%CtrlF%, Send,^f
      IfEqual,aKey,%CtrlB%, Send,^b
      IfEqual,aKey,%CtrlH%, Send,^h
      IfEqual,aKey,%CtrlD%, Send,^d
      IfEqual,aKey,%CtrlJ%, Send,^j
      IfEqual,aKey,%CtrlM%, Send,^m
      IfEqual,aKey,%CtrlO%, Send,^o
      IfEqual,aKey,%CtrlI%, Send,^i
      IfEqual,aKey,%CtrlG%, Send,^g
      IfEqual,aKey,%CtrlC%, Send,^c
      IfEqual,aKey,%CtrlK%, Send,^k
      IfEqual,aKey,%CtrlW%, Send,^w
      IfEqual,aKey,%CtrlY%, Send,^y
      IfEqual,aKey,%CtrlL%, Send,^l
      IfEqual,aKey,%CtrlS%, Send,^s
      IfEqual,aKey,%CtrlR%, Send,^r
      IfEqual,aKey,%CtrlT%, Send,^t
      IfEqual,aKey,%CtrlU%, Send,^u
      IfEqual,aKey,%CtrlX%, Send,^x
      IfEqual,aKey,%CtrlZ%, Send,^z
      IfEqual,aKey,%CtrlQ%, Send,^q
      ;IfEqual,aKey,{Escape},Quit	;No need to define.
      ;IfEqual,aKey,{Enter},Quit	;No need to define.
    HotKey,^p,On
    HotKey,^n,On
    HotKey,^v,On
    HotKey,^a,On
    HotKey,^e,On
    HotKey,^f,On
    HotKey,^b,On
    HotKey,^h,On
    HotKey,^d,On
    HotKey,^j,On
    HotKey,^m,On
    HotKey,^o,On
    HotKey,^i,On
    HotKey,^g,On
    HotKey,^c,On
    HotKey,^k,On
    HotKey,^w,On
    HotKey,^y,On
    HotKey,^l,On
    HotKey,^s,On
    HotKey,^r,On
    HotKey,^t,On
    HotKey,^u,On
    HotKey,^x,On
    HotKey,^q,On
    HotKey,^q,On
    HotKey,IfWinActive
    Return

#IfWinActive

;
; vi: set tabstop=2 expandtab autoindent:
