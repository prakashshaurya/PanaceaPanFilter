# PanaceaPanFilter
Pandoc Filter Collection
## contains a set of pandoc filters to modify the content. 
  pandoc -f SOURCEFORMAT -t json | runhaskell behead2.hs | 
  pandoc -f json -t TARGETFORMAT
  
  example :
   pandoc -f html client.html  -t json | runhaskell LinkStriker.hs |   pandoc -f json -tdocx -o  fff.docx
