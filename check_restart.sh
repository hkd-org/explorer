#!/bin/bash
step=4
for ((i=0;i<148;i=(i+step)));do
  count=`ps aux | grep "app.js" | grep -v "grep" | wc -l`
  if [ $count -lt 1 ]; then
    mv /var/www/hkdBrowser/logs/out.log.txt /var/www/hkdBrowser/logs/c_out.$(date -d "today" +"%Y%m%d_%H%M%S").txt
    mv /var/www/hkdBrowser/logs/err.log.txt /var/www/hkdBrowser/logs/c_err.$(date -d "today" +"%Y%m%d_%H%M%S").txt
    nohup node /var/www/hkdBrowser/app.js 1>/var/www/hkdBrowser/logs/out.log.txt 2>/var/www/hkdBrowser/logs/err.log.txt &
    echo "start app ..."
  fi
  count_g=`ps aux | grep "grabber.js" | grep -v "grep" | wc -l`
  if [ $count_g -lt 1 ]; then
    mv /var/www/hkdBrowser/tools/logs/out.log.txt /var/www/hkdBrowser/tools/logs/c_out.$(date -d "today" +"%Y%m%d_%H%M%S").txt
    mv /var/www/hkdBrowser/tools/logs/err.log.txt /var/www/hkdBrowser/tools/logs/c_err.$(date -d "today" +"%Y%m%d_%H%M%S").txt
    nohup node /var/www/hkdBrowser/tools/grabber.js 1>/var/www/hkdBrowser/tools/logs/out.log.txt 2>/var/www/hkdBrowser/tools/logs/err.log.txt &
    echo "start grabber ..."
  fi
  sleep $step
done
exit 0
