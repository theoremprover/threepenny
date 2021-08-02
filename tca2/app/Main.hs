{-# OPTIONS_GHC -fno-warn-tabs #-}

module Main where

import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

-- http://localhost:8023

data Tree a = Leaf a | Tree a [Tree a]

example_tree = Tree "root" [ Leaf "left", Tree "right" [ Leaf "r1",Tree "r2" [ Leaf "leaf" ] ] ]

main :: IO ()
main = startGUI defaultConfig $ \ w -> do
	return w # set title "Test"
	button <- UI.button # set UI.text "Button"
	input <- UI.input #. "input"
	getBody w #+ [element input,element button]
	on UI.click button $ const $ do
		element button # set UI.text "CLICKED!"
