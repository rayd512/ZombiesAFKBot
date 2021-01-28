#SingleInstance, force


; Gui
; -------------------
; -------------------
shots_list = ;
Gui, Add, text, , Shot Type:
Gui, Add, DropdownList, w200 vFireType, Single/full-auto||3 Round Burst|6 Round Burst
Gui, Add, text, , Total Ammo:
Gui, Add, Edit, w200 vammoMax Number
Gui, Add, Button, w200, Calculate
Gui, Add, text, , Shots per Spot:
Gui, Add, DropdownList, w200 vnumShots, %shots_list%
Gui, +AlwaysOnTop
Gui, Add, text, , Mag Size:
Gui, Add, Edit, w200 vammoMaster Number
; Gui, Add, text, , Shots per Spot:
; Gui, Add, Edit, vperSpot Number
; Gui, Add, text, , Number of Rotations:
; Gui, Add, Edit, vnumRotations Number
Gui, Add, text, , Reload Time (ms):
Gui, Add, Edit, w200 vreloadWait Number, 1000 
Gui, Add, text, , Fire Delay (ms):
Gui, Add, Edit, w200 vshotDelay Number, 200
Gui, Add, text, , Use field upgrade?:
Gui, Add, DropdownList, w200 vuseField, No||Yes
Gui, Add, text, , Show Ammo?:
Gui, Add, DropdownList, w200 vshowAmmo, No||Yes
Gui, Add, Button, w200, OK
Gui, Show, w225 , AFK Bot
return

ButtonCalculate:
Gui, Submit, NoHide
shots_list = ;
if (ammoMax = "") {
	MsgBox, 0x41000, Error, You must fill in Total Ammo
	Return
}
if (FireType = "Single/full-auto") {
	realAmmo := Floor(ammoMax/12)
} else if (FireType = "3 Round Burst") {
	realAmmo := Floor(ammoMax/12/3)
} else if (FireType = "6 Round Burst") {
	realAmmo := Floor(ammoMax/12/6)
} else {
	Return
}
factorPairs := findFactors(realAmmo)
if(IsEmptyAssoc(factorPairs)) {
	MsgBox, 0x41000, Error, Incompatible Weapon
	return
}
For key, value in factorPairs
    	shots_list .= "|" key
GuiControl, , numShots, %shots_list%
return



; Labels 
; ------------------------------------
; ------------------------------------
ButtonOK:
Gui, Submit, NoHide


ammo := ammoMaster
afking := true
counter := 0
x := -25

if (shotDelay = "" or reloadWait = "" or numShots = "" or ammoMax = "" or ammoMaster="") {
	MsgBox, 0x41000, Error, You must fill in every field
	return
}

if (showAmmo = "Yes") {
	Gui, 2:+AlwaysOnTop
	Gui, 2:Add, text, , Ammo in Mag:
	Gui, 2:Add, text, vLiveAmmo, %ammo%
	Gui, 2:Show, x0 y0 , Live
}

perSpot := numShots
numRotations := factorPairs[numShots]


Sleep, 3000
Loop {
	Loop, %numRotations% {
		Loop, 12 {
			rotatePlayer(x)
			Loop, %perSpot% {
				Click, 1
				Sleep, %shotDelay%
				ammo := ammo - 1
				if (showAmmo = "Yes")
					GuiControl, 2:, LiveAmmo, %ammo% 
				if(ammo = 0) {
					ammo := ammoMaster
					adjustHeight()
					Sleep %reloadWait%
				}
				if (afking = false) {
					break 4
				}
			}
			Sleep, %shotDelay%
			Sleep, 500
			if (afking = false) {
				break 3
			}
			counter++
			if (counter = 6) {
				x := 25
			} else if (counter = 12) {
				x := -25
				counter := 0
			}
		}
		; Send {s 5}
		; Send {d 5}
	}
	if(useField = "Yes") {
		Send {x 1}
	}

	Sleep, 3000
	if (afking = false) {
		break 
	}
	Loop, 10 {
		Loop, 2 {
			Send {e 1}
			Sleep, 5
		}
	}
	ammo := ammoMaster
	if (afking = false) {
		break
	}
}
if(showAmmo = "Yes") {
	Gui, 2:Destroy
}
return



GuiClose:
ExitApp
return


; Functions
; -------------
; -------------
rotatePlayer(x) {
	y := 0
	Loop 30 {
		DllCall("mouse_event", uint, 1, int, x, int, y, uint, 0, int, 0)
		Sleep 10
	}
}

adjustHeight() {
	x := 0
	y := 150
	Loop 30 {
	    DllCall("mouse_event", uint, 1, int, x, int, y, uint, 0, int, 0)
	    Sleep 10
	}

	x := 0
	y := -90
	Loop 20 {
	    DllCall("mouse_event", uint, 1, int, x, int, y, uint, 0, int, 0)
	    Sleep 10
	}
}

IsEmptyAssoc(assoc){
	return !assoc._NewEnum()[k, v]
}

findFactors(Number) {
	factors := {}
	i := 2
	Loop {
	   if (i > Number/i)
	      break
	   if !mod(Number,i)
	      factors[Floor(Number/i)] := i
	      ; msgbox,% i . " " . Floor(Number/i)
	   i++
	}

	Return factors
}

; Hotkeys
; -------------
; -------------
F1::ExitApp

F2::afking := false

Pause::Pause