import XMonad
-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
-- Layout
import XMonad.Layout.Magnifier
import XMonad.Layout.Renamed
import XMonad.Layout.ThreeColumns
-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Ungrab

-- myXmonad

myBorderWidth = 1

myClickJustFocuses ::Bool
myClickJustFocuses = False

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myModMask = mod4Mask

myTerminal = "wezterm"

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myConfig = def
    { terminal      = "wezterm"
    , modMask       = mod4Mask          -- Rebind Mod to the Super key
    , layoutHook    = myLayout          -- Use custom layouts
    , manageHook    = myManageHook      -- match on certain windows
    , startupHook   = myStartupHook
    , borderWidth   = 3
    }

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        tiled   = Tall nmaster delta ratio
        threeCol
            = renamed [Replace "ThreeCol"]
            $ magnifiercz' 1.3
            $ ThreeCol nmaster delta ratio
        nmaster = 1     -- Default number of windows in the master pane
        delta   = 5/100 -- Percent of screen to increment by when resizing panes
        ratio   = 6/10   -- Default proportion of screen occupied by master pane

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp"   --> doFloat
    , isDialog              --> doFloat
    ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut true --expand true --width 10 \
            \--transparent true --tint 0x5f5f5f --height 18"

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
