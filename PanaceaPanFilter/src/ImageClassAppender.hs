module ImageClassAppender where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
                    
    main :: IO ()
    main = toJSONFilter appendClass  
                  
    
     
     
    
    --get Attr
    getImageAttribute :: Inline -> Maybe (String, [String], [(String, String)])  
    getImageAttribute (Image  z xs y) =  Just z
    getImageAttribute x  =  Nothing
    
    
    --get class
    getImageAttributeClass ::Inline -> Maybe [String]
    getImageAttributeClass  (Image  z xs y) = case getImageAttribute (Image  z xs y) of 
                                     Just z -> Just $  getClass z
                                     Nothing ->Nothing
    getImageAttributeClass x = Nothing
    
    
    getClass :: (String, [String], [(String, String)]) -> [String]
    getClass (x,y,z) = y
    
    
    appendClass:: Inline -> Inline
    appendClass  (Image  (p,q,r)  xs y)  = case (getImageAttributeClass (Image  (p,q,r) xs y)) of 
                                       Just [x] ->   (Image  (p,[x]++["newClassName"],r) xs y)
                                       Just[] ->     (Image  (p,["newClassName"],r) xs y)
    appendClass x = x