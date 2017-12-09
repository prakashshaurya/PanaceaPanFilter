# PanaceaPanFilter
Haskell Pandoc Filter Collection.


## contains a set of pandoc filters to modify the text content. 
   pandoc -f SOURCEFORMAT -t json filename | runhaskell behead2.hs |  pandoc -f json -t TARGETFORMAT -o filename
  
   example : pandoc -f html client.html  -t json | runhaskell LinkStriker.hs |   pandoc -f json -tdocx -o  fff.docx
   
   Make sure that  all the files are mentioned with completely qualified file names.
   
   While copying the query from here , make sure that  the query shouldnt have the leading ':', otherwise error ***not enough input***
   will be flagged by pandoc.
