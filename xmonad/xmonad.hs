module Main (main) where
import XMonad
import XMonad.Config.Gnome
import XMonad.Util.NamedActions
import XMonad.Util.EZConfig
import XMonad.Util.Replace (replace)
import XMonad.Config.Vojd
import XMonad.Hooks.SetWMName
import Control.Monad (when)
import System.Environment (getArgs)

main :: IO ()
main = xmonad $ vojdConfig
{-
     args <- getArgs
     when ("--replace" `elem` args) replace
     -- xmonad =<< vojdConfig
     xmonad = vojdConfig
-}
