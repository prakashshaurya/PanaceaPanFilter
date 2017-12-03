module LinkToSubScript where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
            
    main :: IO ()
    main = toJSONFilter subscriptLink  
    
    
        
    subscriptLink :: Inline -> Inline 
    subscriptLink (Link  z xs y) =  Link  z ([Subscript xs]) y
    subscriptLink x  =  x 
        