
/*
1- This AutoHotkey script enables you to open, restore, or minimize desired "Applications, Chrome Apps or Chrome Web Shortcuts", using your configured shortcuts key (hotkeys)

How it works ?

You set a hotkey and a corresponding utility function responsible to execute the action.

 There are three utility functions you can use for this:

 a) OpenOrShowAppBasedOnExeName(AppAddress) //Useful for regular Window Apps

 b) OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)  //Specially useful for Chrome Apps and Chrome Shortcuts

 c) OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID) //Useful for Windows Store Apps (contained in the "shell:AppsFolder\")


2- Additionally, pressing Alt + ` (key above Tab key) you can switch between open Windows of the current active App or Chrome Website Shortcut
*/


/* ;
*******************************************************************
*****  open, restore, or minimize APP - UTILITY FUNCTIONS *****
*******************************************************************
*/

#WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.



; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")

OpenOrShowAppBasedOnExeName(AppAddress) {
	AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)

	If WinExist("ahk_exe " . AppExeName) {
		If WinActive() {
			WinMinimize
			Return
		} else {
			WinActivate
			Return
		}
	} else {
	    try {
            Run AppAddress
        } catch {
            Msgbox("File " . AppAddress . " Not Found")
            Return
        } else {
			WinWait("ahk_exe " . AppExeName)
			WinActivate("ahk_exe " . AppExeName)
			Return
		}
	}
}


; WindowTitleWord: Usually the word at the end of the app window title (Eg: in: "New Document - Word" will be "Word")
; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")

OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress) {
	SetTitleMatchMode 2

    If WinExist(WindowTitleWord) {
		If WinActive {
			WinMinimize
			Return
		} else {
			WinActivate
			Return
		}
	} else {
        try {
            Run AppAddress
        } catch {
            Msgbox("File " . AppAddress . " Not Found")
            Return
        } else {
			WinActivate
			Return
		}
    }
}



; AppTitle: Usually the word at the end of the app window title(Eg: in: "New Document - Word" will be "Word")
; AppModelUserID: A comprehensive guide on how to find the AppModelUserID of a windows store app can be found here: https://jcutrer.com/windows/find-aumid

OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID) {
	SetTitleMatchMode 2

    If WinExist(AppTitle) {
		If WinActive {
			WinMinimize
			Return
		} else {
			WinActivateBottom %AppTitle%
		}
	} else {
	    try {
            Run "shell:AppsFolder\" . AppModelUserID
        } catch {
            Msgbox("File " . AppModelUserID . " Not Found")
            Return
        }
    }
}
