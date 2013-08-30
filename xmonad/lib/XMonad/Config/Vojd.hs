-- monstrous moonshine

module XMonad.Config.Vojd
  (
    vojdConfig
  ) where


-- import Data.Maybe ( isJust, catMaybes )
-- import Codec.Binary.UTF8.String (encodeString)
import XMonad.Layout.LayoutScreens
import XMonad.Layout.TwoPane
-- import XMonad.Layout.DragPane
import           Control.Monad
import           Data.List
import qualified Data.Map as M
import           Data.Ratio ((%))
import qualified Solarized as Sol
import           System.Directory (doesFileExist)
import           System.Environment (getEnv)
import           System.Exit ( exitSuccess )
import           System.IO
import qualified System.IO.UTF8
import           XMonad hiding ( (|||) )
import           XMonad.Actions.CycleRecentWS
import           XMonad.Actions.CycleWS hiding (toggleWS)
import           XMonad.Actions.DwmPromote
import qualified XMonad.Actions.DynamicWorkspaces as DW
import           XMonad.Actions.MouseGestures
import qualified XMonad.Actions.Navigation2D as Nav2d
import           XMonad.Actions.SpawnOn
import           XMonad.Actions.UpdatePointer
import           XMonad.Actions.WindowBringer    (gotoMenuArgs)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops hiding (fullscreenEventHook)
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.Minimize
import           XMonad.Hooks.SetWMName
import           XMonad.Hooks.UrgencyHook
import           XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
import           XMonad.Config.Gnome
import           XMonad.Layout.BoringWindows hiding (Replace)
import           XMonad.Layout.Fullscreen
-- import           XMonad.Layout.Gaps
import           XMonad.Layout.Grid
import           XMonad.Layout.IM
import           XMonad.Layout.LayoutCombinators
import           XMonad.Layout.Minimize
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.NoBorders
import           XMonad.Layout.PerWorkspace      (onWorkspace)
import           XMonad.Layout.Reflect
import           XMonad.Layout.Renamed
import qualified XMonad.Layout.Spiral as Spiral
import           XMonad.Prompt hiding (height)
import           XMonad.Prompt.Workspace
import qualified XMonad.StackSet                 as W
-- import qualified XMonad.Util.Dzen as DZ
import           XMonad.Util.EZConfig
import           XMonad.Util.NamedActions
-- import           XMonad.Util.NamedWindows
import           XMonad.Util.NamedScratchpad
import           XMonad.Util.Run
import           XMonad.Util.WorkspaceCompare
import           XMonad.Util.Paste



myManageHook :: ManageHook
myManageHook =
  manageSpawn  <+> fullscreenManageHook <+> (composeOne . concat $
    [
      [resource  =? c -?>       doCenterFloatLarge | c <-  ["floating-center-large"]]
    , [resource  =? c -?>       doCenterFloat      | c <-  ["floating-center"]]
    ]
  ) <+> manageDocks
  where
     doCenterFloatLarge = myCenterFloat 0.6 0.8


myCenterFloat w h = customFloating $ W.RationalRect left top width height
  where
    width = w
    height = h
    left = (1 - width) / 2
    top = (1 - height) / 2

{-
main = xmonad $ addDescrKeys ((mod4Mask, xK_F1), xMessage) myKeys $ gnomeConfig
                  { terminal = "urxvt"
                  , modMask = mod4Mask
                  , normalBorderColor = "#00afee"
                  , focusedBorderColor = "#ff0808"
                  , startupHook = setWMName "LG3D"
                  , focusFollowsMouse = False
                  }
-}

vojdConfig = addDescrKeys ((mod4Mask, xK_F1), xMessage) myKeys $ gnomeConfig
                  { terminal = "urxvt"
                  , modMask = mod4Mask
                  , normalBorderColor = "#00afee"
                  , focusedBorderColor = "#ff0808"
                  , startupHook = setWMName "LG3D"
                  , focusFollowsMouse = False
                  , manageHook = myManageHook
                  }

myKeys c = (subtitle "Custom Keys":) $ mkNamedKeymap c $
       [("M-o", addName "dmenu" $ spawn "dmenu_run")]
