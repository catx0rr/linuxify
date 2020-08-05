#!/bin/bash

banner='
                               __     _            __        ____         
   ____ ___  ____  _______  __/ /_   (_)___  _____/ /_____ _/ / /__  _____
  / __ `__ \/ __ \/ ___/ / / / __/  / / __ \/ ___/ __/ __ `/ / / _ \/ ___/
 / / / / / / /_/ (__  ) /_/ / /_   / / / / (__  ) /_/ /_/ / / /  __/ /    
/_/ /_/ /_/ .___/____/\__, /\__/  /_/_/ /_/____/\__/\__,_/_/_/\___/_/     
         /_/         /____/                                               
		                Youtube on terminal -- 
'


install() {
    
    echo "$banner"
    sudo echo   
    echo -e "Installing mpsyoutube..\n"
    pip3 install --user youtube-dl
    pip3 install --user youtube-dl --upgrade
    sudo apt install mps-youtube -y
    sudo apt install mplayer -y
    echo -e "Copying config files:"
    cp -fv conf/mpsyt-clear ~/.local/bin/
    mpsyt set api_key AIzaSyBVhSRE9mTMj9hCfX9Rd_AuZvZf6iM9JIU &
    sleep 1
    mpsyt set player mplayer &
    sleep 1
    mpsyt set window_size 800x600 &
    sleep 1
    sudo killall mpsyt

    echo -e "\nDone. Installing mps-youtube"

}

install
