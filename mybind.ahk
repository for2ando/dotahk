;; mybind.ahk
;; Copyright (C) Maholemono For2ando <forzandoe@gmail.com>

;; keys controlling AHK
;;
+!F9::
  Reload
  Return

+!F11::
  
  Return

;; input date-time string on a title of saving a browsers' session
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

; vi: set tabstop=2 expandtab autoindent:
