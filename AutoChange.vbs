Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c ChangeRblxMouse.bat auto"
oShell.Run strArgs, 0, false