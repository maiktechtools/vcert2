#!/usr/bin/env bash

get_epoch() {

EXP_KEYSTORE=$(keytool -list -v -keystore ${RUTA_KEY} -storepass changeit -alias ${ALIASKEY} | grep "until:" | awk -F "until:" '{ print $2}')
EXP_URL=$(curl --insecure -v ${REMOTEKEY} 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }' | grep "expire date" | awk -F "expire date: " '{ print $2}')
EPOCH_KEYSTORE=$(date -d "${EXP_KEYSTORE}" +"%s")
EPOCH_URL=$(date -d "${EXP_URL}" +"%s")
EPOCH_HUMAN_KEYSTORE=$(date -d @$EPOCH_KEYSTORE +%Y-%m-%d' '%H:%M:%S)
EPOCH_HUMAN_URL=$(date -d @$EPOCH_URL +%Y-%m-%d' '%H:%M:%S)

}


comp_epoch() {

if [ ${EPOCH_KEYSTORE} == ${EPOCH_URL} ] ; then
        echo  "certificate validation [Keystore vs URL]\nRESULT=0\nKEYSTORE EPOCH=${EPOCH_KEYSTORE}\nURL EPOCH= ${EPOCH_URL}\nVENCIMIENTO_URL=${EPOCH_HUMAN_URL}\nVENCIMIENTO_KEYSTORE=${EPOCH_HUMAN_KEYSTORE}"
        exit 0
        
        else
        echo "certificate validation [Keystore vs URL]\nRESULT=1\nKEYSTORE EPOCH=${EPOCH_KEYSTORE}\nURL EPOCH= ${EPOCH_URL}\nVENCIMIENTO_URL=${EPOCH_HUMAN_URL}\nVENCIMIENTO_KEYSTORE=${EPOCH_HUMAN_KEYSTORE}"

        exit 1

fi
}


usage() {

        echo "Usage: vcert2.sh [ALIASKEY] [URL]"
        echo  "ejemplo: vcert2.sh googleAccounts https://accounts.google.com"

}


main() {
###### path of the keystore file
#local RUTA_KEY=/home/pruebas/certificates/cacerts.jks
local RUTA_KEY=/home/pruebas/certificates/cacerts.jks
local ALIASKEY=$1
local REMOTEKEY=$2

        if [ -z "${ALIASKEY}" ] ; then

        usage && exit 1
        elif [ -z "${REMOTEKEY}" ] ; then

        usage && exit 1

        fi


get_epoch
comp_epoch

}


main $@
