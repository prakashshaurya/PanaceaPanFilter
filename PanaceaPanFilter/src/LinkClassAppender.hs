module LinkBoldMarker where
import Text.Pandoc.Builder
import Text.Pandoc.Generic
import Text.Pandoc.Definition
import Text.Pandoc.JSON
                
-- main :: IO ()
-- main = toJSONFilter boldmarker  
              


getLinkaltText :: Inline -> Maybe [Inline]
getLinkaltText (Link  z xs y) =  Just xs
getLinkaltText x  =  Nothing

--get Target Tuple
getLinkTarget :: Inline -> Maybe(String, String)
getLinkTarget (Link  z xs y) =  Just y
getLinkTarget x  =  Nothing

--get Attr
getLinkAttribute :: Inline -> Maybe (String, [String], [(String, String)])  
getLinkAttribute (Link  z xs y) =  Just z
getLinkAttribute x  =  Nothing

--get id
getLinkId ::Inline -> Maybe String
getLinkId  (Link  z xs y) = case getLinkAttribute (Link  z xs y) of 
                                 Just z -> Just $  getId z
                                 Nothing ->Nothing 
getLinkId x = Nothing

--get key value
getLinkAttributeKV ::Inline ->Maybe [(String,String)]
getLinkAttributeKV  (Link  z xs y) = case getLinkAttribute (Link  z xs y) of 
                                 Just z -> Just $  getKeyValue z
                                 Nothing ->Nothing 
getLinkAttributeKV x = Nothing

--get class
getLinkAttributeClass ::Inline ->Maybe [String]
getLinkAttributeClass  (Link  z xs y) = case getLinkAttribute (Link  z xs y) of 
                                 Just z -> Just $  getClass z
                                 Nothing ->Nothing 
getLinkAttributeClass x = Nothing
 
 
getId :: (String, [String], [(String, String)]) -> String 
getId (x,y,z) = x

getKeyValue :: (String, [String], [(String, String)]) -> [(String, String)]
getKeyValue (x,y,z) = z

getClass :: (String, [String], [(String, String)]) -> [String]
getClass (x,y,z) = y


