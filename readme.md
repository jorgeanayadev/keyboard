# Keyboards :keyboard:


## Microsoft Layout Creator
[Download MLC](https://www.microsoft.com/en-us/download/details.aspx?displaylang=en&id=22339)


## AutoHotKey

La combinación de tres teclas no es soportada por autohotkey usando {KeyNames} pero podemos utilizar la funcion **GetKeyState** para verificar si {Shift} esta activado:
``` ahk
; Enviar {e} acentuada incluyendo mayuscula
; Simulando el layout EN-US International
RAlt & e::
If GetKeyState("Shift","e")
	Send {Blind}{asc 0201}
else
	Send {Blind}{asc 0233}
return

```

##### REFERENCIAS

Portable Keyboard Layout <br>
http://pkl.sourceforge.net/

kbdedit <br>
http://www.kbdedit.com/

Keyboard Layout Files Creator
https://github.com/39aldo39/klfc <br>

[Jack's AutoHotKey Blog](https://jacksautohotkeyblog.wordpress.com/category/autohotkey/virtual-key-codes/)

[Key Shortcut for Unicode Characters ](https://www.key-shortcut.com/en/writing-systems/35-symbols/symbols-typography/)

[Microsoft Virtual KeyCodes ](https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes)

Script by @Drugoy - [Get Scan Codes and Virtual Keys](https://github.com/Drugoy/Autohotkey-scripts-.ahk/blob/master/DevTools/Get%20SC%20and%20VK%20(new).ahk)

Script - [Capture virtual key code of a keypress](https://autohotkey.com/board/topic/80592-how-to-capture-virtual-key-code-of-a-keypress/)