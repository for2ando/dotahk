;; main.ahk
;; Copyright (C) Maholemono For2ando <forzandoe@gmail.com>

;; auto-execute section
;;
#Include %A_ScriptDir%

SetTitleMatchMode,RegEx
While A_Index <= 26 {
  aChar := Chr(64 + A_Index)
  Ctrl%aChar% := Chr(A_Index)
}

#Include emacs.ahk
#Include mybind.ahk

; vi: set tabstop=2 expandtab autoindent:
