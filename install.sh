#!/bin/bash

banner='

██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗██╗███████╗██╗   ██╗
██║     ██║████╗  ██║██║   ██║╚██╗██╔╝██║██╔════╝╚██╗ ██╔╝
██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ██║█████╗   ╚████╔╝ 
██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ██║██╔══╝    ╚██╔╝  
███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗██║██║        ██║   
╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝        ╚═╝
                                            Customizer
                                                         '
   
dir=$(dirname $0)

install_customization() {

    echo -e "$banner"
    echo "All of the desktop customization will be only installed on the user."
    read -p "Do you want a system wide installation(y/N): " prompt

    while true; do
        case $prompt in
            [Yy]|[Yy][Ee][Ss])
                echo -e "\nYou have chosen: "$prompt

                if [[ $EUID -ne 0 ]]; then
                    echo -e "\nRun the script as root for system wide installation."
                    exit 1
                fi

                $dir/source/system
                break
                ;;

            [Nn]|[Nn][Oo])
                echo -e "\nYou have chosen: "$prompt
                echo
                $dotdir/source/user
                break
                ;;
            *)
                echo
                install_customization
                ;;
        esac
    done

}

install_security_packages() {

    echo
    read -p "Do you want to install security packages?(y/N): " prompt
    
    while true; do
        case $prompt in
            [Yy]|[Yy][Ee][Ss])
                echo -e "\nYou have chosen: "$prompt
                echo
                sudo $dir/source/spackages
                break
                ;;
            [Nn]|[Nn][Oo])
                echo -e "\nYou have chosen: "$prompt
                echo
                break
                ;;
            *)
                echo
                install_security_packages
                ;;
        esac
    done

}

install_util_packages() {
    
    echo
    read -p "Do you want to install the utility packages?(y/N): " prompt

    while true; do
        case $prompt in
            [Yy]|[Ee][Ss])
                echo -e "\nYou have choses: "$prompt
                echo
                sudo $dir/source/upackages
                break
                ;;
            [Nn]|[Nn][Oo])
                echo -e "\nYou have chosen: "$prompt
                echo
                break
                ;;
            *)
                echo
                install_util_packages
                ;;
        esac
    done
}               

install_misc_packages() {
    
    echo
    read -p "Do you want to install all misc packages?(y/N): " prompt

    while true; do
        case $prompt in
            [Yy]|[Yy][Ee][Ss])
                echo -e "\nYou have chosen: "$prompt
                echo
                sudo $dir/source/mpackages
                break
                ;;
            [Nn]|[Nn][Oo])
                echo -e "\nYou have chosen: "$prompt
                echo
                break
                ;;
            *)
                echo
                install_misc_packages
                ;;
        esac
    done

}

install_custom_packages() {
    
    echo
    read -p "Do you want to install all other custom packages?(y/N): " prompt

    while true; do
        case $prompt in
            [Yy]|[Yy][Ee][Ss])
                echo -e "\nYou have chosen: "$prompt
                echo
                sudo $dir/source/cpackages
                break
                ;;
            [Nn]|[Nn][Oo])
                echo -e "\nYou have chosen: "$prompt
                echo
                break
                ;;
            *)
                echo
                install_custom_packages
                ;;
        esac
    done

}

main() {

    install_customization
    install_security_packages
    install_util_packages
    install_misc_packages
    install_custom_packages

}

main
