#!/bin/bash

installos() {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install git -y
    sudo apt install python -y
    sudo apt install ruby -y
    sudo apt install nano -y
    sudo apt install netcat-openbsd -y
    sudo apt install dnsutils -y
    clear
}

setupos() {
    mv os.sh "$HOME"
    cd "$HOME" || exit
    echo "bash ~/os.sh" >> ~/.bashrc
    echo "bash ~/os.sh" >> ~/.zshrc
    source ~/.bashrc  # لتفعيل التغييرات فورًا
}

installtr() {
    pkg update -y
    pkg upgrade -y
    pkg install python -y
    pkg install nano -y
    pkg install termux-api -y
    pkg install netcat-openbsd -y
    pkg install git -y
    pkg install dnsutils -y
    clear
}

setuptr() {
    mv ter.sh /data/data/com.termux/files/home
    cd /data/data/com.termux/files/home || exit
    echo "bash ~/ter.sh" >> .bashrc
    echo "bash ~/ter.sh" >> .zshrc
}

# التحقق من البيئة
if [ -d "$HOME/.termux" ]; then
    installtr
    setuptr
elif [ -f "/etc/os-release" ]; then
    distro=$(grep ^ID= /etc/os-release | cut -d'=' -f2)
    if [ "$distro" == "kali" ] || [ "$distro" == "parrot" ]; then
        installos
        setupos
    else
        echo "Unknown Linux distribution."
        exit
    fi
else
    echo "Unknown system."
    exit
fi
