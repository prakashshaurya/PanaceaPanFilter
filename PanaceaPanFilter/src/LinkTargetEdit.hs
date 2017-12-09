module LinkTargetEdit where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
                
    main :: IO ()
    main = toJSONFilter targetEdit  
              
    targetEdit :: Inline -> Inline 
    targetEdit (Link  z xs y) =  Link  z xs ("YourTargetURL","YourTitle")
    targetEdit x  =  x 
            