q::
vText := "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890/()={}[]^^``',./\" ;note: ` requires escaping in AutoHotkey
vOutput := ""
Loop, Parse, vText
{
	vKey := A_LoopField
	vVK := GetKeyVK(vKey)
	vSC := GetKeySC(vKey)
	vOutput .= Format("VK{:02X} SC{:03X} {}`r`n", vVK, vSC, vKey)
}
Clipboard := vOutput
MsgBox, % "done"
return