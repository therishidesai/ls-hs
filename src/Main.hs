module Main where
import Control.Monad as Monad
import System.Environment as Env
import System.Directory as Dir
import System.Posix.Files as Files

main :: IO ()
main = do
  args <- Env.getArgs
  lsDir args

lsDir :: [String] -> IO()
lsDir args = do
  curDir <- Dir.getCurrentDirectory
  contents <- case args of 
                   [] -> Dir.listDirectory curDir
                   ["-a"] -> Dir.getDirectoryContents curDir
  printDir args contents

printDir :: [String] -> [FilePath] -> IO()
printDir args [] = putStrLn ""
printDir args (f:fs) = do
  case args of
    -- ["-l"] -> longListPrint f
    _ ->  putStrLn f

  printDir args fs

-- TODO: get -l working 
-- longListPrint :: FilePath -> IO()
-- longListPrint f = do
--   fs <- Files.getFileStatus f
--   owner <- Files.fileOwner fs
--   putStrLn owner
