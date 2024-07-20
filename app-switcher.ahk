
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


^!+#s:: OpenOrShowAppBasedOnExeName("C:\nextgate\shortcuts\WindowsTerminal.exe.lnk")
^!+#i:: OpenOrShowAppBasedOnExeName("C:\Users\qwert\AppData\Local\Programs\IntelliJ IDEA Ultimate\bin\idea64.exe")
^!+#e:: OpenOrShowAppBasedOnExeName("C:\nextgate\shortcuts\olk.exe.lnk")
^!+#c:: OpenOrShowAppBasedOnExeName("C:\nextgate\shortcuts\olk.exe.lnk")
^!+#b:: OpenOrShowAppBasedOnExeName("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
^!+#o:: OpenOrShowAppBasedOnExeName("C:\nextgate\shortcuts\Obsidian.exe.lnk")
^!+#t:: OpenOrShowAppBasedOnExeName("C:\nextgate\shortcuts\ms-teams.exe.lnk")

^!+#Space:: {
  global
  activeWindowsIdList := getSortedActiveWindowsIdList()
  if (activeWindowsIdList.Length == 1) {
    return
  }
  activateNextWindow(activeWindowsIdList)
  return
}

/* F8 - Open "Gmail as Chrome App"
 Note: if you have your chrome.exe located in the "Program Files (x86)" folder instead of "Program Files" use:
 F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")
*/
; F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")

; F9 - Open "Windows store Calculator app"
; Note: to get a Windows store app aumid check "https://jcutrer.com/windows/find-aumid"
; F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")