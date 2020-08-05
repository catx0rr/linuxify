#!/bin/bash

DIR="$(dirname $0)"

source $DIR/source/init
source $DIR/source/install

main() {

    show_banner
    check_root   
    update
    get_vmware
}

main
