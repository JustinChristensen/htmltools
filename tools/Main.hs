{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (writeFile, readFile, unlines)
import Data.Text (Text, unlines)
import Data.Text.IO (writeFile, readFile)
import Data.Text.Encoding (decodeUtf8)
import System.Directory (doesFileExist, createDirectoryIfMissing)
import Data.String (fromString)
import System.Exit (exitFailure)
import System.IO (hPutStrLn, stderr)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Monad (unless)
import Network.HTTP.Simple
import Text.HTML.TagSoup.Tree

indexUrl :: String
indexUrl = "https://html.spec.whatwg.org/multipage/indices.html"

tmpDir :: FilePath
tmpDir = "tmp"

tmpIndexHtmlFile :: FilePath
tmpIndexHtmlFile = tmpDir ++ "/indices.html"

dataDir :: FilePath
dataDir = "data"

elementsDataFile :: FilePath
elementsDataFile = dataDir ++ "/elements.txt"

attributesDataFile :: FilePath
attributesDataFile = dataDir ++ "/attributes.txt"

fatalError :: String -> IO ()
fatalError err = do
    hPutStrLn stderr err
    exitFailure

getUrl :: MonadIO m => String -> m (Response Text)
getUrl url = do
    resp <- httpBS (fromString url)
    unless (getResponseStatusCode resp == 200) $ do
        liftIO $ fatalError $ "Request for " ++ indexUrl ++ " failed, " ++ 
            "status: " ++ show (getResponseStatusCode resp) ++ "\n"
    pure $ decodeUtf8 <$> resp

unlessFileExists :: FilePath -> IO () -> IO ()
unlessFileExists path action = do
    exists <- doesFileExist path 
    case exists of 
        True -> putStrLn $ path ++ " exists, skipping..."
        False -> action

selectNodes :: (TagTree Text -> Bool) -> [TagTree Text] -> [TagTree Text]
selectNodes match ts = select [] ts
    where select = foldl checkNode 
            where 
                checkNode matches node 
                    | match node = matches ++ [node]
                    | otherwise = case node of 
                        TagBranch _ _ trees -> select matches trees
                        _ -> matches 
                    
isNamedNode :: TagTree Text -> Bool
isNamedNode 

isTableNode :: TagTree Text -> Bool
isTableNode (TagBranch name _ _) = name == "table"
isTableNode _ = False

isTBodyNode :: TagTree Text -> Bool
isTBodyNode (TagBranch n 

tbody :: TagTree Text -> TagTree Text
tbody = selectNodes isTBodyNode 

getElements :: TagTree Text -> [Text]
getElements _ = []

getAttributes :: TagTree Text -> [Text]
getAttributes _ = []

main :: IO ()
main = do
        unlessFileExists tmpIndexHtmlFile $ do
            putStrLn $ "creating " ++ tmpIndexHtmlFile
            resp <- getUrl indexUrl
            mkdirp tmpDir
            writeFile tmpIndexHtmlFile $ getResponseBody resp

        doc <- parseTree <$> readFile tmpIndexHtmlFile

        case selectNodes isTableNode doc of 
            [elementsTable, _, attributesTable] -> do
                unlessFileExists elementsDataFile $ do
                    putStrLn $ "creating " ++ elementsDataFile
                    mkdirp dataDir
                    print elementsTable
                    writeFile elementsDataFile $ unlines (getElements elementsTable)

                -- unlessFileExists attributesDataFile $ do
                --     putStrLn $ "creating " ++ attributesDataFile
                --     mkdirp dataDir
                --     writeFile attributesDataFile $ unlines (getAttributes attributesTable)
            _ -> fatalError "Tables missing in the response"

    where 
        mkdirp = createDirectoryIfMissing True
