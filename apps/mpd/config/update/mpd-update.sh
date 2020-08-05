#!/bin/bash

echo
echo -e "Stopping music player daemon.."
killall mpd 2>/dev/null
killall ncmpcpp 2>/dev/null
sleep 2
echo
echo -e "Cleaning old mpd database.."
echo
echo -e "Clearing:"
rm -rfv ~/.mpd/{mpd.db,mpd.log,mpd.pid}
sleep 1
echo -e "Updating mpd database.."
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid}
echo
echo -e "Restarting music player daemon.."
mpd 2>/dev/null
sleep 2
echo -e "\nDone."

