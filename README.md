# vcert2
script to compare the expiration of a certificate hosted in a keystore vs that of a URL

### Requisitos

* Keytool https://docs.oracle.com/javase/7/docs/technotes/tools/solaris/keytool.html
* alias to identify the installed certificate
  example: keytool -list -v -keystore /home/pruebas/certificates/cacerts.jks -storepass changeit| grep Alias
  
   ### Alias name: googleapis
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



