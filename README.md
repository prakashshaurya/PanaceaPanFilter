# PanaceaPanFilter
Pandoc Filter Collection
## contains a set of pandoc filters to modify the content. 
  pandoc -f SOURCEFORMAT -t json | runhaskell behead2.hs | 
  pandoc -f json -t TARGETFORMAT
  
  example :
   pandoc -f html client.html  -t json | runhaskell LinkStriker.hs |   pandoc -f json -tdocx -o  fff.docx
   
   Be sure that your mentioning all the files with completely qualified filenames.
   If you are copying the query from here , make sure ayour query shouldnt have the leading ':', otherwise error : not enough input
   will be flagged by pandoc.
