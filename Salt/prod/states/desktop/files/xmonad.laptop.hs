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
        , className =? "Firefox-esr" --> doShift "1"
        , className =? "Wicd Network Manager" --> doShift "2"
        , className =? "Google-chrome" --> doShift "2"
        , className =? "Chromium" --> doShift "2"
        , className =? "Conkeror" --> doShift "2"
        , className =? "Nautilus" --> doShift "2"
        , className =? "Virt-manager" --> doShift "2"
        , className =? "Emacs" --> doShift "2"
        , className =? "Kodi" --> doShift "2"
        , className =? "Keepassx" --> doShift "2"
        , className =? "Icedove" --> doShift "2"
        , className =? "Terminator" --> doShift "2"
        , className =? "synergy" --> doShift "2"
        , className =? "transmission-qt" --> doShift "2"
        , className =? "xdaliclock"  --> doFloat
    ]

myLayout = Grid ||| Circle ||| simpleCross ||| MosaicAlt M.empty ||| Full

main = do
    xmonad $  defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , terminal = "xterm"
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
        , ((mod4Mask, xK_p), spawn "/usr/bin/dmenu_run")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s -q 100")
        , ((0, xK_Print), spawn "scrot")
        ]

