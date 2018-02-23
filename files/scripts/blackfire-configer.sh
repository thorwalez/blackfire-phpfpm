#!/usr/bin/env bash

mv /.blackfire.ini /root/.blackfire.ini

sed -i 's/$BLACKFIRE_SERVER_ID/'$BLACKFIRE_SERVER_ID'/g' /etc/blackfire/agent
sed -i 's/$BLACKFIRE_SERVER_TOKEN/'$BLACKFIRE_SERVER_TOKEN'/g' /etc/blackfire/agent


sed -i 's/$BLACKFIRE_CLIENT_ID/'$BLACKFIRE_CLIENT_ID'/g' /root/.blackfire.ini
sed -i 's/$BLACKFIRE_CLIENT_TOKEN/'$BLACKFIRE_CLIENT_TOKEN'/g' /root/.blackfire.ini

cp /root/.backfire.in /var/www/.blackfire.in

/etc/init.d/blackfire-agent restart
