#!/bin/bash


# Color pallete to choose from for tmux configuration

# colour[int]

count=2

for i in {1..255}; do
    printf "\x1b[38;5;${i}m█████\x1b[0m"
    
    if [ $count == 14 ]; then
        echo
        count=1
    fi
    
    let count++
done

echo
