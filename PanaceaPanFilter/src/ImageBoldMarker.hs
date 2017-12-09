module LinkBoldMarker where
    import Text.Pandoc.Builder
    import Text.Pandoc.Generic
    import Text.Pandoc.Definition
    import Text.Pandoc.JSON
                
    -- main :: IO ()
    -- main = toJSONFilter boldmarker  
              
    boldmarker :: Inline -> Inline 
    boldmarker (Image  z xs y) =  Image  z ([Strong xs]) y
    boldmarker x  =  x 

    main = do 
        print (boldmarker  ( Image ("Id", ["Classname"], [("Key","Value")]) [Str "ssssss"] ("url","target")) )
