# RedPipe – Red Team C2 Pipeline

**Version 1.0 | By M0G3H**

RedPipe is a lightweight C2 (Command & Control) tool for encrypted remote communication. It provides remote shell access, client monitoring, and persistence capabilities – designed for **authorized red team operations only**.

> ⚠️ **WARNING:** This tool is for **authorized security testing and educational purposes only**. Unauthorized use is illegal.

---

## ✨ Features

- 🔐 **SSL/TLS encryption** for secure communication
- 💻 **Interactive remote shell** on victim machine
- 👥 **Client monitoring** – save connected users from victim
- 📁 **File transfer** (maintain in progress)
- 🔄 **Persistence installation** (maintain in progress)
- 📊 **Simple menu-driven** attacker interface
- 📝 **Session logging** to file

---

## 📁 File Structure

```
RedPipe/
├── config.cfg       # Configuration file
├── victim.sh        # Runs on target machine
└── attacker.sh      # Runs on operator machine
```

---

## ⚙️ Configuration (`config.cfg`)

| Variable | Description | Example |
|----------|-------------|---------|
| `VICTIM_IP` | Target machine IP address | `192.168.1.5` |
| `SERVER_PORT` | Port for communication | `8080` |
| `ALLOW_IP` | Restrict connections to attacker IP | `10.0.0.1` |
| `SSL_ENABLED` | Enable SSL encryption | `true` / `false` |
| `SSL_CERT` | Custom SSL certificate (optional) | `server.pem` |
| `SSL_KEY` | Custom SSL private key (optional) | `server.key` |

---

## 🚀 Installation

### 1. Download files to both machines

```bash
# On victim machine
get victim.sh
get config.cfg
chmod +x victim.sh

# On attacker machine
get attacker.sh
get config.cfg
chmod +x attacker.sh
```

### 2. Configure `config.cfg` on each machine

**On victim machine:**
```ini
VICTIM_IP="<victim_IP>"
SERVER_PORT="8080"
SSL_ENABLED="true"
```

**On attacker machine:**
```ini
VICTIM_IP="<victim_IP>"
SERVER_PORT="8080"
SSL_ENABLED="true"
```

---

## 🎮 Usage

### On Victim Machine

```bash
./victim.sh
```

### On Attacker Machine

```bash
./attacker.sh
```

---

## 🔍 How It Works

```
┌─────────────┐                    ┌─────────────┐
│  Attacker   │                    │   Victim    │
│             │                    │             │
│./attacker.sh│                    │ ./victim.sh │
│      │      │                    │      │      │
│      │      │   Encrypted TCP    │      │      │
│      ├──────┼───────────────────►│      │      │
│      │      │   Connection       │      │      │
│      │      │                    │      │      │
│      │      │  Interactive Shell │      │      │
│      │◄─────┼────────────────────┤      │      │
│      │      │                    │      │      │
│      │      │  who > file.txt    │      │      │
│      ├──────┼───────────────────►│      │      │
│      │      │                    │      │      │
└──────┴──────┘                    └──────┴──────┘
```

1. **Victim runs** `victim.sh` – listens for incoming connections
2. **Attacker connects** via Option 1 – receives interactive shell
3. **Commands** sent from attacker execute on victim
4. **Option 4** saves connected clients to file on victim

---

## 🛠️ Requirements

- `ncat`

---

## 📝 Logging

- Attacker session logs saved to `RedPipe_log.txt` (option 1)
- Connected clients saved to `connected_clients.txt` on victim (option 4)

---

*Made for red team operations and security assessments*
