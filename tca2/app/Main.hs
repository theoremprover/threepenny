module Main where

import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

-- http://localhost:8023
-- https://www.stackage.org/haddock/lts-11.16/threepenny-gui-0.8.2.4/Graphics-UI-Threepenny.html

main :: IO ()
main = startGUI defaultConfig setup

setup :: Window -> UI ()
setup w = do
	return w # set title "Test"
	button <- UI.button # set UI.text "Button"
	input <- UI.input #. "input"
	getBody w #+ [element input,element button]
	on UI.click button $ const $ do
		element button # set UI.text "CLICKED!"
