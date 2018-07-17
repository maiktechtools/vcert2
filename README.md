# vcert2
script to compare the expiration of a certificate hosted in a keystore vs that of a URL

### Requirements

* Keytool https://docs.oracle.com/javase/7/docs/technotes/tools/solaris/keytool.html
* alias to identify the installed certificate
  
  example: keytool -list -v -keystore /home/pruebas/certificates/cacerts.jks -storepass changeit| grep Alias
  
       Alias name: googleapis
       Alias name: ezioint
       Alias name: googleaccounts
       Alias name: consolefirebase
       Alias name: amazonivr
       Alias name: estados
       Alias name: firebaseiocom

 


### Usage

 vcert2.sh [ALIASKEY] [URL]
 
### Example

vcert2.sh googleAccounts https://accounts.google.com
      
      #sh  vcert2.sh googleAccounts https://accounts.google.com
      certificate validation [Keystore vs URL]
      *RESULT=0*
      KEYSTORE EPOCH=1535455860 
      URL_EPOCH= 1535455860
      VENCIMIENTO_URL=2018-08-28 06:31:00
      VENCIMIENTO_KEYSTORE=2018-08-28 06:31:00
      
      
      sh  vcert2.sh googleAccounts https://console.firebaseio.com
      certificate validation [Keystore vs URL]
      *RESULT=1*
      KEYSTORE EPOCH=1535455860
      URL EPOCH= 1533254400
      VENCIMIENTO_URL=2018-08-02 19:00:00
      VENCIMIENTO_KEYSTORE=2018-08-28 06:31:00








