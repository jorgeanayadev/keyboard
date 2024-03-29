; Keyboard Remap and Shortcuts
; By jorgeanaya.dev
;
; KEYS
; # Win
; ! Alt
; ^ Control
; + Shift
; < Left Key 	(Alt, Control, Shift)
; > Right Key 	(Alt, Control, Shift)
; <^>! AltGR
; * Wildcard: Fire the hotkey even if extra modifiers are being held down
; {Blind} Allows the key to be repeated without releasing the special key (Control, Alt, Shift)
; 
; Examples:
; Disable Key	RWin::return 
; Stack HotKey	^Numpad0::
;				^Numpad1::
;				MsgBox Pressing either Control+Numpad0 or Control+Numpad1 will display this message.
;				return
; References
;	https://www.autohotkey.com/docs/Hotkeys.htm
;	https://www.autohotkey.com/docs/KeyList.htm
; 	https://www.autohotkey.com/docs/commands/Send.htm

#InstallKeybdHook
SetKeyDelay, -1

; --------------------------
; AltGR Shortcuts
; --------------------------
; NOTES: AltGR is the combination of LControl & RAlt 
;		 EN-US layout will not recognize <^>! as a shortcut to AltGR instead use RAlt
;		 EN-US International layout will recognize <^>!
;		 
; UPDATE: Replacing <^>! for RAlt because gives problems to key repetition (you have to release the key) with AltGR there is no problem

; This approach will work partially since it will block native keyboard AltGR Shortcuts
;LControl & RAlt:: AltGR := true
;LControl & RAlt Up:: AltGR := false
;#If (AltGR)  ; is pressed
	; AltGR+p
;	p::(
;	P::)
;#If

;[a] -> áÁ
RAlt & a::
If GetKeyState("Shift","a")
	Send {Blind}{asc 0193}
else
	Send {Blind}{asc 0225}	
return

;[e] -> éÉ
RAlt & e::
If GetKeyState("Shift","e")
	Send {Blind}{asc 0201}
else
	Send {Blind}{asc 0233}
return

;[i] -> íÍ
RAlt & i::
If GetKeyState("Shift","i")
	Send {Blind}{asc 0205}
else
	Send {Blind}{asc 0237}
return

;[o] -> óÓ
RAlt & o::
If GetKeyState("Shift","o")
	Send {Blind}{asc 0211}
else
	Send {Blind}{asc 0243}
return

;[u] -> úÚ
RAlt & u::
If GetKeyState("Shift","u")
	Send {Blind}{asc 0218}
else
	Send {Blind}{asc 0250}
return

;[ñ] -> ~
RAlt & sc027::
Send {Blind}{asc 0126}
return

;[7] -> \
RAlt & vk37::
Send, {Blind}{asc 0092}
return

;[0][?][ ][backspace] -> =
RAlt & scD::
Send {Blind}{asc 0061 up}
return

;[N][M][ ][][] -> (
RAlt & sc33::
Send {Blind}{asc 0040}
return

;[N][M][][ ][] -> )
RAlt & sc34::
Send {Blind}{asc 0041}
return

;[N][M][][][ ] -> |
RAlt & sc35::
Send {Blind}{asc 0124}
return

; ~~~ US Keyboard | Emulate SP [{}] with AltGR ~~~
; [
RAlt & sc01A::
Send {Blind}{asc 0091}
return
; ]
RAlt & sc01B::
Send {Blind}{asc 0093}
return

; {
RAlt & sc028::
Send {Blind}{asc 0123}
return
; } 
RAlt & sc02B::
Send {Blind}{asc 0125}
return

; ~~~ UNICODE ~~~
; Star - White | Black
<^>!vk53::
Send {Blind}{u+2605}
return
<^>!+vk53::
Send {Blind}{u+2606}
return

; Flag - White | Black
<^>!vk46::
Send {Blind}{u+2690}
return
<^>!+vk46::
Send {Blind}{u+2691}
return

; Check Mark - Light | Heavy
<^>!vk5A::
Send {Blind}{u+2713}
return
<^>!+vk5A::
Send {Blind}{u+2714}
return

; Cross Mark - Light | Heavy
<^>!vk58::
Send {Blind}{u+2715}
return
<^>!+vk58::
Send {Blind}{u+2716}
return


; --------------------------
; WindowsKey Shortcuts
; --------------------------
~#q:: ; Close Current Window
Send !{f4}
return
~#x:: ; Execute for Dev
Send {f5}
return
~#t::Run, "C:\Tools\apps\Translator.lnk", , max
~#g::Run, "C:\Tools\apps\Grammarly.lnk", , max
~#h::Run, "C:\Tools\handbrake\handbrake.exe", , max
~#c::
Process, Exist, caffeine.exe ; check to see if program is running
If (ErrorLevel = 0) ; If it is not running
	{
	Run, "C:\Tools\caffeine\caffeine.exe"	
	}
Else 
	{
	; In case we need to close process
	; Process, Close, %ErrorLevel%
	msgbox Caffeine Already Running
	}