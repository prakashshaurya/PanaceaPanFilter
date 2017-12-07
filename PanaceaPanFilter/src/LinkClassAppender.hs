module LinkBoldMarker where
import Text.Pandoc.Builder
import Text.Pandoc.Generic
import Text.Pandoc.Definition
import Text.Pandoc.JSON
                
-- main :: IO ()
-- main = toJSONFilter app  
              

 
 

--get Attr
getLinkAttribute :: Inline -> Maybe (String, [String], [(String, String)])  
getLinkAttribute (Link  z xs y) =  Just z
getLinkAttribute x  =  Nothing


--get class
getLinkAttributeClass ::Inline -> Maybe [String]
getLinkAttributeClass  (Link  z xs y) = case getLinkAttribute (Link  z xs y) of 
                                 Just z -> Just $  getClass z
                                 Nothing ->Nothing
getLinkAttributeClass x = Nothing


getClass :: (String, [String], [(String, String)]) -> [String]
getClass (x,y,z) = y



appendClass:: Inline -> Inline
appendClass  (Link  (p,q,r)  xs y)  = case (getLinkAttributeClass (Link  (p,q,r) xs y)) of 
                                   Just [x] ->   (Link  (p,[x]++["newClassName"],r) xs y)
                                   Just[] ->     (Link  (p,["newClassName"],r) xs y)
appendClass x = x

-- appendClass:: Inline -> Inline
-- appendClass  (Link  z xs y)  = case (getLinkAttributeClass (Link  z xs y)) of 
--                                    Just [x] ->   Link  z (map(\x-> (Str x)) [x]) y
--                                    Just[] ->   (Link  z [Str "d"] y)
-- appendClass x = x

main = do 
         print (appendClass  (  Link ("Id", ["Classname"], [("Key","Value")]) [Str "ssssss"] ("url","target")))
