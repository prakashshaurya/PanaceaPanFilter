module LinkToSubScript where
import Text.Pandoc.Builder
import Text.Pandoc.Generic
import Text.Pandoc.Definition
import Text.Pandoc.JSON
                
main :: IO ()
main = toJSONFilter linkToSingleQuote  
        
linkToSingleQuote :: Inline -> Inline 
linkToSingleQuote (Link  z xs y) =  Link  z ([Quoted DoubleQuote xs]) y
linkToSingleQuote x  =  x 
            