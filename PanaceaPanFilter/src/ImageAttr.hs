module ImageAttr where
import Text.Pandoc.Builder
import Text.Pandoc.Generic
import Text.Pandoc.Definition
import Text.Pandoc.JSON
                
main :: IO ()
main = toJSONFilter imageAttr  
              
imageAttr :: Inline -> Inline 
imageAttr (Image  z xs y) =  Image  z ([Strong xs]) y
imageAttr x  =  x 
        
