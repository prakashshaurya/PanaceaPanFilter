module LinkKeyValueAppender where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
    
    main :: IO ()
    main = toJSONFilter appendKeyValue 
        
    --get Attr
    getLinkAttribute :: Inline -> Maybe (String, [String], [(String, String)])  
    getLinkAttribute (Link  z xs y) =  Just z
    getLinkAttribute x  =  Nothing
    
    
    
    --get key value
    getLinkAttributeKV ::Inline ->Maybe [(String,String)]
    getLinkAttributeKV  (Link  z xs y) = case getLinkAttribute (Link  z xs y) of 
                                        Just z -> Just $  getKeyValue z
                                        Nothing ->Nothing 
    getLinkAttributeKV x = Nothing
    
    getClass :: (String, [String], [(String, String)]) -> [String]
    getClass (x,y,z) = y
    
    
        
    
    getKeyValue :: (String, [String], [(String, String)]) -> [(String, String)]
    getKeyValue (x,y,z) = z
        
        
    appendKeyValue :: Inline -> Inline 
    appendKeyValue  (Link   (p,q,r) z y) = case getLinkAttributeKV (Link   (p,q,r) z y)  of
                                          Just r->  (Link   (p,q,r++[("AddYourKey","AddyourValue")]) z y)
                                          Nothing -> (Link  (p,q,[("AddYourKey","AddyourValue")]) z y)
    appendKeyValue  x =x