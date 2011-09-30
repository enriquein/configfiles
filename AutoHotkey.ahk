F1::Return

Capslock::Return
+Capslock::Return
^Capslock::Return

;---------------------------------------------------------------------------
; Middle Mouse Button Always on Top
;---------------------------------------------------------------------------

MButton::
  SetBatchLines, -1
  CoordMode, Mouse, Screen
  SetMouseDelay, -1 ; no pause after mouse clicks
  SetKeyDelay, -1 ; no pause after keys sent
  MouseGetPos, ClickX, ClickY, WindowUnderMouseID
  WinActivate, ahk_id %WindowUnderMouseID%

  ; WM_NCHITTEST
  SendMessage, 0x84,, ( ClickY << 16 )|ClickX,, ahk_id %WindowUnderMouseID%
  WM_NCHITTEST_Result =%ErrorLevel%
 
    If WM_NCHITTEST_Result in 2,3,8,9,20,21 ; in titlebar enclosed area - top of window
    {
    SetTimer, RemoveToolTip, -400
   
    Winset, Alwaysontop, toggle, ahk_id %WindowUnderMouseID%
    WinGet, ExStyle, ExStyle, ahk_id %WindowUnderMouseID%
    if (ExStyle & 0x8)
      ToolTip, Always-on-Top ON
    else
      ToolTip, Always-on-Top OFF
    ;PostMessage, 0x112, 0xF060,,, ahk_id %WindowUnderMouseID% ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
    Return
    }
   
RemoveToolTip:
  ToolTip
return
