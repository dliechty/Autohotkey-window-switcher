
#Requires AutoHotkey v2.0
#Warn All, StdOut  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force

#Include <Open-Apps>
#Include <Switch-App-Windows>


/* ;
********************************************
***** YOUR SHORTCUTS CONFIGURATION *****
********************************************
*/


; F7 - Open "Notepad"
F7:: OpenOrShowAppBasedOnExeName("C:\Windows\notepad.exe")

/* F8 - Open "Gmail as Chrome App"
 Note: if you have your chrome.exe located in the "Program Files (x86)" folder instead of "Program Files" use:
 F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")
*/
; F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")

; F9 - Open "Windows store Calculator app"
; Note: to get a Windows store app aumid check "https://jcutrer.com/windows/find-aumid"
; F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")