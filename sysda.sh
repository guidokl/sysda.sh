#!/bin/bash

while true; do
    clear
    cat <<'EOF'
==========================================
 sysda.sh - Quick Status & Security Menu
==========================================
 General
------------------------------------------
 1) Disk Usage
 2) Memory Usage
 3) System Uptime & Load
 4) CPU/Process Snapshot
 5) System Temperatures
 6) Largest Files
 7) Running Services
 8) Last Logins

 Network
------------------------------------------
 9) IP Addresses
10) Network Connections
11) Listening Ports

 Security & Updates
------------------------------------------
12) UFW Firewall Status
13) UFW Firewall Rules
14) Fail2ban Status
15) Fail2ban Summary
16) Fail2ban SSH Jail
17) Failed SSH Logins
18) Pending Updates
19) Run Update & Upgrade

------------------------------------------
 q) Quit
==========================================

EOF

    read -p "Select Option [1-19 or q]: " choice

    case "$choice" in
        1)  description="Disk Usage";                         cmd="df -h" ;;
        2)  description="Memory Usage";                       cmd="free -h" ;;
        3)  description="System Uptime & Load";               cmd="uptime" ;;
        4)  description="CPU/Process Snapshot";               cmd="top -b -n 1 | head -15" ;;
        5)  description="System Temperatures";                cmd="sensors" ;;
        6)  description="Largest Files";                      cmd="sudo du -ahx / | sort -rh | head -20" ;;
        7)  description="Running Services";                   cmd="systemctl list-units --type=service --state=running" ;;
        8)  description="Last Logins";                        cmd="last -a | head -5" ;;
        9)  description="IP Addresses";                       cmd="ip addr show" ;;
       10)  description="Network Connections";                cmd="netstat -plant | head -20" ;;
       11)  description="Listening Ports";                    cmd="sudo ss -tulpn" ;;
       12)  description="UFW Firewall Status";                cmd="sudo ufw status verbose" ;;
       13)  description="UFW Firewall Rules";                 cmd="sudo ufw status numbered" ;;
       14)  description="Fail2ban Status";                    cmd="sudo systemctl status fail2ban" ;;
       15)  description="Fail2ban Summary";                   cmd="sudo fail2ban-client status" ;;
       16)  description="Fail2ban SSH Jail";                  cmd="sudo fail2ban-client status sshd" ;;
       17)  description="Failed SSH Logins";                  cmd="sudo journalctl -u ssh --since \"1 day ago\" | grep \"Failed password\" | wc -l" ;;
       18)  description="Pending Updates";                    cmd="sudo apt update && sudo apt list --upgradable" ;;
       19)  description="Run Update & Upgrade";               cmd="sudo apt update && sudo apt upgrade" ;;
        q|Q) echo "Exiting. Stay safe!"; exit 0 ;;
        *)  echo "Invalid option. Please select a valid number or 'q' to quit."
            read -p "Press ENTER to return to menu..."
            continue
            ;;
    esac

    echo -e "\n# $description"
    echo "Command: $cmd"
    read -p "Execute this command? [y/N]: " confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo
        eval $cmd
    else
        echo "Command cancelled."
    fi

    echo
    read -p "Press ENTER to return to menu..."
done