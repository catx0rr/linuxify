#!/bin/bash

banner='
                        __                                                
   ____ ___  ____  ____/ /     ____  _________ ___  ____  _________  ____ 
  / __ `__ \/ __ \/ __  /_____/ __ \/ ___/ __ `__ \/ __ \/ ___/ __ \/ __ \
 / / / / / / /_/ / /_/ /_____/ / / / /__/ / / / / / /_/ / /__/ /_/ / /_/ /
/_/ /_/ /_/ .___/\__,_/     /_/ /_/\___/_/ /_/ /_/ .___/\___/ .___/ .___/ 
         /_/                                    /_/        /_/   /_/      
				Music player daemon - ncmpcpp mpd client'


main () {

    echo "$banner"
    echo
    sudo apt install -y mpd ncmpcpp wildmidi
    echo
    mkdir -p ~/{.mpd,.ncmpcpp}
    echo -e "Installing requirements.."
    sleep 3
    echo -e "Copied: $(cp -rv ./config/ncmpcpp/config ~/.ncmpcpp)"
    echo -e "Copied: $(cp -rv ./config/mpd/mpd.conf ~/.mpd)"
    echo -e "Copied: $(cp -rv ./config/help/readme.txt ~/.ncmpcpp)"
    echo -e "Copied: $(cp -rv ./config/help/ncmhelp.sh ~/.local/bin/ncmhelp)"
    echo -e "Copied: $(cp -rv ./config/update/mpd-update.sh ~/.local/bin/mpd-update)"
    touch ~/.mpd/{mpd.db,mpd.log,mpd.pid}
    echo -e "\nDone."
}

main
