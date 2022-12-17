{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (readFile)
import Text.XML
import Text.XML.Cursor
import qualified Data.Text as T
import System.Directory(getCurrentDirectory)

main :: IO ()
main = do
    currDir <- getCurrentDirectory
    putStrLn $ "currDir " <> currDir
    doc <- readFile def $ currDir <> "/test2.xml"
    let cursor = fromDocument doc
    print $ T.concat $
        cursor $// element "h2"
               >=> attributeIs "class" "bar"
               >=> precedingSibling
               >=> element "h1"
               &// content

