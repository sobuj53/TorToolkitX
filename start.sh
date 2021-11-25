#!/bin/bash

echo "Starting TTK-X engine in 10 seconds"

secs=$((1 * 10))
while [ $secs -gt 0 ]; do
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done

echo "ttk-x engine starting now --------"


aria2c --conf-path="aria2.conf" -D
./alive.sh & gunicorn tortoolkit:start_server --bind 0.0.0.0:$PORT --worker-class aiohttp.GunicornWebWorker & qbittorrent-nox -d & python3 -m tortoolkit
