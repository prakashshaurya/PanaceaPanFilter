module Main where
import Text.Pandoc.JSON
    
main :: IO ()
main = toJSONFilter behead
   where behead (Header n _ xs) | n >= 2 = Para [Emph xs]
         behead x = x