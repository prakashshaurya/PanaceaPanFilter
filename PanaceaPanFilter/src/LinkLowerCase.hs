module LinkBoldMarker where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
            
    main :: IO ()
    main = toJSONFilter linkLowerCase  
    
    
        
    linkLowerCase :: Inline -> Inline 
    linkLowerCase (Link  z xs y) =  Link  z ([SmallCaps xs]) y
    linkLowerCase x  =  x 
        