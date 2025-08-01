# sysda.sh

**sysda.sh** is a Bash script that provides an interactive menu for quick system, network, and security checks—everything an admin needs, all in one place.  
The menu is easily modifiable, so you can add or change options to suit your workflow.

> 💬 I made this for quick checks—especially on mobile SSH—without typing every command.

---

## 🖼️ Screenshot



---

## 🛠️ Features

- **System:** View disk, memory, CPU, uptime, and temperatures
- **Network:** Check IP addresses, connections, and listening ports
- **Security:** See UFW firewall and Fail2ban status, pending updates, failed SSH logins
- **Users & Files:** View last logins and largest files
- **Services:** List running services
- **Confirmation for every action:** Always preview the command before execution

---

## 📦 Requirements

sysda.sh makes use of these packages on Ubuntu/Debian. Modify as needed for your system:

```sh
sudo apt update
sudo apt install lm-sensors net-tools ufw fail2ban smartmontools
```

Most other commands are built into typical Linux distributions.

---

## 🚀 Installation

1. **Download:**

   ```sh
   wget https://your-repo-url/sysda.sh -O sysda.sh
   ```

2. **Make executable:**

   ```sh
   chmod +x sysda.sh
   ```

---

## 📋 Usage

```sh
./sysda.sh
```

Pick a menu option, confirm, and see results.

---

Made for sysadmins who want quick, organized access to the essentials.  
Your menu, your rules—edit the script to add your own commands
