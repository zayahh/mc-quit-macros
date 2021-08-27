#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SetKeyDelay, 0

global ChatHotkey = "t" ; Change the letter inside the quotes to the letter that opens the chat
global CheckCheats = 0

ExitWorld()
{
    CheckCheats = 0
    SetKeyDelay, 0
    send {Esc}+{Tab}{Enter} 
}

Cheats()
{
    CheckCheats = 1
    SetKeyDelay, 0
    send {Esc}{Shift}+{Tab}{Shift}+{Tab}{Enter}{Shift}+{Tab}{Enter}{Tab}{Enter}
}

CheatsFastResetMod()
{
    CheckCheats = 1
    SetKeyDelay, 0
    send {Esc}{Shift}+{Tab}{Shift}+{Tab}{Shift}+{Tab}{Enter}{Shift}+{Tab}{Enter}{Tab}{Enter}
}

SwitchGamemode()
{
    if CheckCheats = 1
    {
        send {F3 down}{n down}{F3 up}{n up}
    }
}

LocateStructure(structure)
{
        if CheckCheats = 1
    {
        Send %ChatHotkey%
        Sleep, 100
        Send /locate
        Send {Space}
        Send %structure%
        Sleep, 100
        Send {Enter}
    }
}

NetherPortal()
{
    if CheckCheats = 1
    {
        send %ChatHotkey%
        Sleep, 100
        send /setblock
        send {Space}{~}{~}{Backspace}{Space}{~}{~}{Backspace}{Space}{~}{~}{Backspace}{Space}
        send minecraft:nether_portal
        Sleep, 100
        send {Enter}
    }
}

Perch()
{
	if CheckCheats = 1
	{
		send %ChatHotkey%
		Sleep, 100
		send /data merge entity @e[type=ender_dragon,limit=1]
		send {Space}{{}
		send DragonPhase: 2
		send {}}
		send {Enter}
	}
}

#IfWinActive, Minecraft
    {
	Y:: ; Wyjście ze świata
	    ExitWorld()
	return

	^0:: ; [ctrl + 0] Aktywacja cheatów
	    CheatsFastResetMod() ; Jeśli nie używasz FastResetMod zmień CheatsFastResetMod() na Cheats()
	return	    

	[:: ; Zmiana gamemode'a między ostatnim używanym, a spectatorem
	   SwitchGamemode()
	return
	}
	
	Up:: ; /locate village
	    LocateStructure("village")
	return

	Left:: ; /locate fortress
	    LocateStructure("fortress")
	return

	Right:: ; /locate bastion_remnant
	    LocateStructure("bastion_remnant")
	return

	Down:: ; /locate stronghold
	    LocateStructure("stronghold")
	return
	
	K:: ; /locate buried_treasure
	    LocateStructure("Buried_Treasure")
	return
	
	L:: ; /locate shipwreck
	    LocateStructure("Shipwreck")
	return
	
	RShift:: ; Portal do netheru
	   NetherPortal()
	return
	
	End:: ; Perch
	   Perch()
	return

*F7:: ; pauzowanie skryptu
Suspend
Pause,,1
Return