#!/bin/bash
clear
echo "====================================================================="
echo "  _      __    __                   __       __  __           "
echo " | | /| / /__ / /______  __ _  ___ / /____  / /_/ /  ___      "
echo " | |/ |/ / -_) / __/ _ \/  ' \/ -_) __/ _ \/ __/ _ \/ -_)     "
echo " |__/|__/\__/_/\__/\___/_/_/_/\__/\__/\___/\__/_//_/\__/      "
echo "                                                              "
echo "====================================================================="
echo ""
echo " [+] System locked. Awaiting correct passcode."
echo ""

read -p "Enter Passcode: " user_input

if [ "$user_input" == "cyberadmin2026" ]; then
    echo "[*] Verifying..."
    sleep 1
    echo "[+] Access Granted!"

    if [ -z "$FLAG" ]; then
        echo "[-] Error: Environment variable \$FLAG is missing."
    else
        echo "[+] Here is your reward: $FLAG"
    fi
else
    echo "[-] Access Denied. Intruder logged."
fi
