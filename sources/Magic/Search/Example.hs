{-# OPTIONS_GHC -fno-warn-missing-signatures #-} -- to test inference
module Magic.Search.Example where
import Magic.Search
import System.Environment

{-|
@
stack build && stack exec -- example-magic-card-search
@
-}
main :: IO ()
main = do
 arguments <- getArgs >>= \case
  [s] -> return (s)
  _ -> return ("")
 mainWith arguments

mainWith s = do
 putStrLn s
 putStrLn "(Magic.Search.Example from JS...)"

