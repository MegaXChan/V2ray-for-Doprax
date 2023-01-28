sed "s#UUID#$UUID#g;s#PX#$PX#g" /etc/nginx/nginx.conf.tmp >  /etc/nginx/nginx.conf
sed "s#UUID#$UUID#g;s#PX#$PX#g"  /etc/xray/config.json.tmp > /etc/xray/config.json

supervisord
