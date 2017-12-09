# PanaceaPanFilter


Pandoc Filter Collection
contains a set of pandoc filters to modify the content.

pandoc -f SOURCEFORMAT -t json | runhaskell behead2.hs | pandoc -f json -t TARGETFORMAT

example : pandoc -f html client.html -t json | runhaskell LinkStriker.hs | pandoc -f json -tdocx -o fff.docx

Make sure that all the files are mentioned with completely qualified filenames.

While copying the query from here , make sure that the query shouldnt have the leading ':', otherwise error not enough input will be flagged by pandoc.

**1.ImageBoldMarker.hs : To make the alt text bold.** 

Source Html : <a href="www.google.com" id="ii" class="jj">ooGle</a> <img src="eee.png" alt="ssss" />

Output :

1. For markdown : \[ooGle\](www.google.com){#ii .jj} \!\[\*\*ssss\*\*\](eee.png)

2. For html5     : \<a href="www.google.com" id="ii" class="jj">ooGle\</a> \<img src="eee.png" alt="ssss" /> [NO CHANGE ]

3. For rst :                `ooGle <www.google.com>`__ |**ssss**|

                            .. |**ssss**| image:: eee.png 
                            
                            
                            

