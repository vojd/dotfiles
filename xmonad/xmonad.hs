import XMonad
import XMonad.Config.Gnome
import XMonad.Util.NamedActions
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName

main = xmonad $ addDescrKeys ((mod4Mask, xK_F1), xMessage) myKeys $ gnomeConfig { terminal = "urxvt"
                  , modMask = mod4Mask
                  , normalBorderColor = "#00afee"
                  , focusedBorderColor = "#ff0808"
                  , startupHook = setWMName "LG3D"
                  , focusFollowsMouse = False
                  }

myKeys c = (subtitle "Custom Keys":) $ mkNamedKeymap c $
       [("M-o", addName "dmenu" $ spawn "dmenu_run")]
