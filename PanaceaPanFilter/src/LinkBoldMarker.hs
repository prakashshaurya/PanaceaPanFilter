module LinkBoldMarker where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
            
    main :: IO ()
    main = toJSONFilter boldmarker  
    
    
        
    boldmarker :: Inline -> Inline 
    boldmarker (Link  z xs y) =  Link  z ([Strong xs]) y
    boldmarker x  =  x 
        