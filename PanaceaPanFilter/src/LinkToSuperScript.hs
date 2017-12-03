module LinkToSuperScript where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
            
    main :: IO ()
    main = toJSONFilter superscriptLink  
    
    
        
    superscriptLink :: Inline -> Inline 
    superscriptLink (Link  z xs y) =  Link  z ([Superscript xs]) y
    superscriptLink x  =  x 
        