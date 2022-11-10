#!/bin/bash

term_handler() {
    echo "SIGTERM received"
    exit 143;
}
trap term_handler SIGTERM

id nextcloud
if [ "$?" == "1" ]; then
    echo "Creating Nextcloud user/dir"
    addgroup -g $PGID nextcloud
    adduser -G nextcloud -D -u $PUID nextcloud
    mkdir -p $PATH_LOCAL
    chown -R nextcloud:nextcloud $PATH_LOCAL
fi

echo "Starting Nextcloud client"

while true
do
    echo "Synchronising..."
    chown -R nextcloud:nextcloud /home/nextcloud
    /bin/su -s /bin/sh nextcloud -c "nextcloudcmd --non-interactive --path '$PATH_REMOTE' -u '$NC_USERNAME' -p '$NC_PASSWORD' $PATH_LOCAL '$NC_HOST'"
    echo "Done."
    sleep $SYNC_WAIT
done
