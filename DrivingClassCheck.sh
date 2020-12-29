#!/bin/bash
  
output=$(curl 'https://www.tds.ms/CentralizeSP/BtwScheduling/Lessons?SchedulingTypeId=1'   -H 'authority: www.tds.ms'   -H 'cache-control: max-age=0'   -H 'sec-ch-ua: "Google Chrome";v="87", " Not;A Brand";v="99", "Chromium";v="87"'   -H 'sec-ch-ua-mobile: ?0'   -H 'dnt: 1'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'sec-fetch-site: none'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-user: ?1'   -H 'sec-fetch-dest: document'   -H 'accept-language: en-US,en;q=0.9'   -H 'cookie: CSPBuildName=nameofbuild=teachersdrivingacademy; ASP.NET_SessionId=ojkboid3sk42e2p2st4oeckm; Login=EmailID=##TDSIS##&Password=##TDSPASSWD##; __stripe_mid=5836780b-1c7d-4f22-8e34-2c9fe7b98db3a1e4fc; __stripe_sid=bd9e2767-18c0-48f0-b83a-436c714ec28bcca8a4' 2>&1 | grep "hdnAvailableDates"i | grep "value=")

echo $output

if [ -z $output ]; then
  echo "NO DATES AVAILABLE"
else
  echo "Subject: Driving Dates Available" > mail.txt
  echo $output >> mail.txt
  echo "DATES AVAILABLE"
  curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd   --mail-from '##GMAILID##' --mail-rcpt '##GMAILID##'   --upload-file mail.txt --user '##GMAILID##:##GMAILPASSWD##'
fi
