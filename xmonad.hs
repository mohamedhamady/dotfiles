import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import System.IO
import XMonad.Config.Azerty
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Grid
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Prompt
import Control.Monad

myWorkspaces    = with_tags ["WEB", "DEV", "RE7", "PROD", "PRE PROD", "MONITORING"] where with_tags li = li ++ map show [(1 + length li)..9]
-- myLayout = avoidStruts (tiled ||| Mirror tiled ||| noBorders Full)

-- Layouts
myLayout = (toggleLayouts $ noBorders Full) $ -- toggle fullscreen
  (tabbed shrinkText tabConfig ||| Grid ||| layoutHook azertyConfig)


-- Colors and borders
myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    				activeBorderColor = "#7C7C7C",
        			activeTextColor = "#CEFFAC",
            			activeColor = "#000000",
                		inactiveBorderColor = "#7C7C7C",
                    		inactiveTextColor = "#EEEEEE",
                        	inactiveColor = "#000000"
                        }

-- Color of current window title in xmobar.
xmobarTitleColor = "green"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1

--Terminal
myTerminal="terminator"


myManageHook = composeAll
     [ className =? "MPlayer"        --> doFloat
     , className =? "Gimp"           --> doFloat
     , className =? "Display"        --> doFloat
     , className =? "XVroot"         --> doFloat
     , resource  =? "desktop_window" --> doIgnore
     , resource  =? "kdesktop"       --> doIgnore
	 , className =? "Navigator"		 --> doShift "WEB"]

newKeys x = M.union (M.fromList (myKeys x)) (keys azertyConfig x)
myKeys conf@(XConfig {XMonad.modMask = modMask}) =
    -- go to a window
    [ ((modMask .|. shiftMask, xK_g),  goToSelected defaultGSConfig)
    -- toggle the space for the statusbar
    , ((modMask, xK_b),                sendMessage ToggleStruts)
    -- set window fullscreen
    , ((modMask, xK_f),                sendMessage ToggleLayout)
    ]
main = xmonad =<< xmobar azertyConfig
    { 
	 logHook = takeTopFocus >> setWMName "LG3D"
    , modMask = mod4Mask
    , keys = newKeys
	, terminal = myTerminal
    , workspaces = myWorkspaces
    , layoutHook = smartBorders (avoidStruts $ myLayout)
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    }
