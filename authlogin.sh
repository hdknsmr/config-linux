#!/bin/bash

case "$WINDIR" in
*Windows*)
	IFCONFIG="ipconfig | iconv -f SJIS"
	;;
*)
	IFCONFIG=/sbin/ifconfig
esac

eval $IFCONFIG | grep --text '10\.'

if [ -f ~/.scode ]; then
	SCODE=`cat ~/.scode`
else
	read -p "Your S-Code?: " SCODE
	echo $SCODE > ~/.scode
	echo "(Your S-code stored in ~/.scode)"
fi

read -sp "Password for $SCODE: " PW
echo ""

POSTDATA="name=${SCODE}&pass=${PW}&submitButton=++Working...++&ERRCNT=3"

echo $POSTDATA > /tmp/login.cgi.out 2>&1

URL=https://sec-auth01ap.osa.sharp.co.jp:8443/cgi-bin/adeflogin.cgi
#URL=https://sec-auth02.nara.sharp.co.jp:8443/cgi-bin/authen/login.cgi


for i in 1 2
do

wget -T 2 -O - --save-headers --no-proxy --no-check-certificate --header="Content-Type: application/x-www-form-urlencoded" --post-data="${POSTDATA}" ${URL} >> /tmp/login.cgi.out 2>&1
#wget -T 2 -O - --save-headers --no-proxy --no-check-certificate --header="Content-Type: application/x-www-form-urlencoded" --post-data="${POSTDATA}" https://sec-auth02.tnr.sharp.co.jp:8443/cgi-bin/adeflogin.cgi >> /tmp/login.cgi.out 2>&1

R=$?

grep completed /tmp/login.cgi.out > /dev/null
if [ "$?" = 0 ]; then
        echo "authlogin.sh done ...$R"
        exit
else
        echo "authlogin.sh failed ...$R"
fi

sleep 1

done
