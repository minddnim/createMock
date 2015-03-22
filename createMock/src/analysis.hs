module RecursiveContents (getRecursiveContents) where

import Control.Monad (forM)
import System.Directory (doesDirectoryExist, getDirectoryContents)
import System.FilePath((</>))

getRecursiveContents :: FIlePath -> IO [FIlePath]
getRecursiveContents topdir = do
  names <- getDirectoryContents topdir
  let properNames = filter (`notElem` [".", ".."]) names
  paths <- forM properNames $ /name -> do
    let path = topdir </> name
    isDirectory <- doesDirectoryExist path
    if isDirectory
      then getRecursiveContents path
      else return [path]
  return (concat paths)


main :: IO()
main = do
  src <- readFile "../testSrc/test.c"
  let str = createMock src
  writeFile "testMock.c" str

createMock :: String -> String
createMock str = undefined

