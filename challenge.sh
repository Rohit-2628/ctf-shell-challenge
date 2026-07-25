#!/bin/bash
clear
echo "====================================================================="
echo "  _      __    __                   __       __  __           "
echo " | | /| / /__ / /______  __ _  ___ / /____  / /_/ /  ___      "
echo " | |/ |/ / -_) / __/ _ \/  ' \/ -_) __/ _ \/ __/ _ \/ -_)     "
echo " |__/|__/\__/_/\__/\___/_/_/_/\__/\__/\___/\__/_//_/\__/      "
echo "====================================================================="
echo ""
echo " [+] System locked. Awaiting correct passcode."
echo ""

read -p "Enter Passcode: " user_input

if [ "$user_input" == "cyberadmin2026" ]; then
    echo "[*] Verifying..."
    sleep 1
    echo "[+] Access Granted!"
    
    if [ -f /home/ctfplayer/flag.txt ]; then
        FLAG_CONTENT=$(cat /home/ctfplayer/flag.txt)
        echo "[+] Here is your reward: $FLAG_CONTENT"
    else
        echo "[-] Error: flag.txt is missing."
    fi
else
    echo "[-] Access Denied. Intruder logged."
fi
