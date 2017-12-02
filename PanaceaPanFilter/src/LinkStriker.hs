module LinkStriker where
import Text.Pandoc.Builder
import Text.Pandoc.Generic
import Text.Pandoc.Definition
import Text.Pandoc.JSON
        
main :: IO ()
main = toJSONFilter strikemarker  


    
strikemarker :: Inline -> Inline 
strikemarker (Link  z xs y) =  Link  z ([Strikeout xs]) y
strikemarker x  =  x 
    