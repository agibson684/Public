import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Grid
import XMonad.Layout.Circle
import XMonad.Layout.Cross
import XMonad.Layout.MosaicAlt
import qualified Data.Map as M
import System.IO
import XMonad.Hooks.SetWMName (setWMName)


myManageHook = composeAll
       [ className =? "Gimp"      --> doFloat
        , className =? "Vncviewer" --> doFloat
        , className =? "VLC media player" --> doFloat
        , className =? "XDaliClock"  --> doFloat
        , className =? "XClock"  --> doFloat
        , className =? "Firestorm-Releasex64 4.7.5.47975"  --> doFloat
        , className =? "Steam"  --> doFloat
        , className =? "libreoffice" --> doShift "1"
        , className =? "libreoffice-calc" --> doShift "1"
        , className =? "soffice" --> doShift "1"
        , className =? "Soffice" --> doShift "1"
        , className =? "Gpodder" --> doShift "1"
        , className =? "Nautilus" --> doShift "1"
        , className =? "Gpicview" --> doShift "1"
        , className =? "Rox-filer" --> doShift "1"
        , className =? "lutris" --> doShift "1"
        , className =? "Virt-manager" --> doShift "1"
        , className =? "Emacs" --> doShift "1"
        , className =? "synergy" --> doShift "1"
        , className =? "Navigator" --> doShift "1"
        , className =? "Thunar" --> doShift "1"
        , className =? "thunar" --> doShift "1"
        , className =? "Iceweasel" --> doShift "2"
        , className =? "Firefox-esr" --> doShift "2"
        , className =? "Firefox-esr" --> doShift "2"
        , className =? "Firefox-esr - Choose User Profile" --> doShift "2"
        , className =? "Terminator" --> doShift "3"
        , className =? "URxvt" --> doShift "3"
        , className =? "urxvt" --> doShift "3"
        , className =? "Xterm" --> doShift "3"
        , className =? "slack" --> doShift "3"
        , className =? "Slack" --> doShift "3"
        , className =? "Kodi" --> doShift "4"
        , className =? "mpv" --> doShift "4"
        , className =? "Mpv" --> doShift "4"
        , className =? "cssh" --> doShift "4"
        , className =? "Cssh" --> doShift "4"
        , className =? "CSSH:" --> doShift "4"
        , className =? "transmission-qt" --> doShift "5"
        , className =? "Transmission-remote-gtk" --> doShift "5"
        , className =? "transmission" --> doShift "5"
        , className =? "Google-chrome" --> doShift "6"
        , className =? "Chromium" --> doShift "6"
        , className =? "chromium-browser" --> doShift "6"
        , className =? "Cantata" --> doShift "6"
        , className =? "cantata" --> doShift "6"
        , className =? "Thunderbird" --> doShift "7"
        , className =? "Conkeror" --> doShift "8"
        , className =? "Keepassx" --> doShift "8"
        , className =? "ckb" --> doShift "8"
    ]
-- myLayout = Grid ||| Circle ||| simpleCross ||| MosaicAlt M.empty ||| Full
myLayout = Grid ||| Full
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $  defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , terminal = "urxvt"
        , layoutHook =  avoidStruts $ myLayout
        , logHook = setWMName "LG3D"
        , modMask = mod4Mask   -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "apps.sh")
        , ((mod4Mask .|. controlMask, xK_1), spawn "switch_audio_output.sh 0")
        , ((mod4Mask .|. controlMask, xK_2), spawn "switch_audio_output.sh 1")
        , ((mod4Mask .|. controlMask, xK_3), spawn "switch_audio_output.sh 2")
        , ((mod4Mask, xK_z), spawn "switch_screen_output.sh 1")
        , ((mod4Mask, xK_x), spawn "switch_screen_output.sh 2")
        , ((mod4Mask, xK_a), spawn "switch_screen_output.sh 3")
        , ((mod4Mask, xK_s), spawn "switch_screen_output.sh 4")
        , ((mod4Mask, xK_p), spawn "/usr/bin/dmenu_run")
        , ((mod4Mask, xK_c), spawn "xdaliclock &  sleep 3 ; kill -9 $(pidof xdaliclock)")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s -q 100")
        , ((0, xK_Print), spawn "scrot")
        ]

