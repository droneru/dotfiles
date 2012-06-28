import XMonad
import System.Exit
import XMonad.Actions.SinkAll
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.Loggers
import XMonad.Util.Font
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import System.IO
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Ratio

main = do
    dzproc <- spawnPipe "dzen2 -bg '#000000' -fg '#ffffff' -h 16 -w 750 -e '' -ta l"
    spawn myStatusBar
    xmonad defaultConfig {
    terminal           = "~/bin/urxvtcd"
    , focusFollowsMouse  = True
    , borderWidth        = 1
    , modMask            = mod4Mask
    , workspaces         = ["Main","Code","Chat","Hide","Video","VBox"]
    , normalBorderColor       = myNormalBorderColor
    , focusedBorderColor      = myFocusedBorderColor
    , keys               = myKeys
    , manageHook         = manageDocks <+> manageApps
    , layoutHook = avoidStruts $ myLayoutHook
    , logHook            = dynamicLogWithPP $ dzPP dzproc
        }

myNormalBorderColor = "#0f0f0f"
myFocusedBorderColor = "#ff8800"

myStatusBar = "~/.xmonad/status.sh | dzen2 -x 750 -w 616 -ta r -h 16 -bg '#000000'"

-- Define a combination of layouts
myLayoutHook = smartBorders $ (tiled ||| Mirror tiled ||| Full)
               -- The only window w/o borders
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2

-- Apps
manageApps = composeAll [
        isDialog                                        --> doCenterFloat,
        className       =? "Tilda"                      --> doFloat,
        className       =? "Gpicview"                   --> doFloat,
        className       =? "Gimp"                       --> doShift "Main",
        className       =? "MPlayer"                    --> doShift "Video"
        ]
-- Dzen2
dzPP o = defaultPP {
        ppCurrent               = wrap ("^fg(#000000)^bg(#ff8800)"++marker) " ^fg()^bg()^p(1)",
        ppVisible               = wrap ("^fg(#000000)^bg(#505050)"++marker++"^fg(#ffffff)") " ^fg()^bg()^p(1)",
        ppUrgent                = wrap ("^fg(#000000)^bg(#ff8800)"++urgent) "^fg()^bg()^p(1)" . dzenStrip,
        ppHidden                = wrap "^p(9)^fg(#ffffff)^bg(#000000)" "^fg()^bg() ^p(1)",
        ppHiddenNoWindows       = wrap "^p(9)^fg(#b5b5b5)^bg(#000000)" "^fg()^bg() ^p(1)",
        ppWsSep                 = "",
        ppSep                   = "^p(4)^fg(#b5b5b5)^bg(#000000)^i("++icons++"sep.xbm)^fg()^bg()^p(4)",
        ppTitle                 = wrap "^fg(#ffffff)^bg(#000000)" "^fg()^bg()" . dzenEscape,
        ppLayout                = dzenColor "#ffffff" "" .
                                        (\ x -> case x of
                                        "Tall"                  -> "^i("++icons++"tall.xbm)"
                                        "ResizableTall"         -> "^i("++icons++"tall.xbm)"
                                        "Mirror Tall"           -> "^i("++icons++"mtall.xbm)"
                                        "Mirror ResizableTall"  -> "^i("++icons++"mtall.xbm)"
                                        "Full"                  -> "^i("++icons++"full.xbm)"
                                        "Grid"                  -> "^i("++icons++"grid.xbm)"
                                        "IM Grid"               -> "^i("++icons++"imgrid.xbm)"
                                        _                       -> pad x
                                        ),
        ppOutput                = hPutStrLn o
        }
        where
                icons                   = "/home/drone/.xmonad/img/"
                marker                  = "^i("++icons++"marker.xbm)"
                urgent                  = "^i("++icons++"urgent.xbm)" 


------------------------------------------------------------------------
-- Key bindings
--
altMask 	= mod1Mask 
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    [ ((modMask,                xK_z), spawn $ XMonad.terminal conf)
    , ((modMask,		xK_r	), spawn "gmrun")
    , ((modMask,		xK_m	), spawn "urxvt -e mc")
    , ((modMask,		xK_e	), spawn "~/opt/eclipse/eclipse")
    , ((modMask,		xK_F12	), spawn "sudo hibernate")
    , ((mod4Mask, xK_Print), spawn "scrot screen_%Y-%m-%d.png -d 1") -- take screenshot
    , ((modMask,	xK_space	), spawn "firefox")
    , ((modMask,	xK_v	), spawn "gvim")
    -- close focused window
    , ((modMask,		xK_c     ), kill)
     -- Rotate through the available layout algorithms
    , ((modMask,                xK_Return ), sendMessage NextLayout)
    -- Move focus to the next window
    , ((modMask,                xK_Tab   ), windows W.focusDown) 
    -- Move focus to the next window
    , ((modMask,                xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modMask,                xK_k     ), windows W.focusUp  )
    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask,  xK_j     ), windows W.swapDown  ) 
    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask,  xK_k     ), windows W.swapUp    ) 
    -- Shrink the master area
    , ((modMask,                xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modMask,                xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modMask,                xK_t     ), withFocused $ windows . W.sink)
    -- Quit xmonad (Default)
    , ((modMask .|. shiftMask,  xK_q     ), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modMask,                xK_w     ),
          broadcastMessage ReleaseResources >> restart "xmonad" True)
    , ((modMask .|. controlMask, xK_Home), spawn "mpc toggle") -- play/pause song
    , ((modMask .|. controlMask, xK_End), spawn "mpc stop") -- stop playback
    , ((modMask .|. controlMask, xK_Page_Up), spawn "mpc prev") -- previous song
    , ((modMask .|. controlMask, xK_Page_Down), spawn "mpc next") -- next song
	, ((0 			, 0x1008ff13 ), spawn "amixer -c0 sset PCM 2dB+")
    , ((0 			, 0x1008ff11 ), spawn "amixer -c0 sset PCM 2dB-")
    ]
    ++
    [ ((m .|. modMask, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9] -- mod-[F1..F9], switch to workspace n
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)] -- mod-shift-[F1..F9], move window to workspace n
    ]
    ++
    --
    -- mod-{u,i}, Switch to {prev,next} workspace
    -- mod-shift-{u,i}, Move client and shift to {prev,next} workspace
    -- Requires Xmonad.Actions.CycleWS
    --
    [	((modMask		, xK_u	), prevWS)
      ,	((modMask		, xK_i	), nextWS)
      ,	((modMask .|. shiftMask	, xK_u	), shiftToPrev >> prevWS)
      ,	((modMask .|. shiftMask	, xK_i	), shiftToNext >> nextWS)
    ]
