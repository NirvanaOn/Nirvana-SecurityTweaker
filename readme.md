# Nirvana's Safe Security Tweaker

## Overview

**Nirvana's Safe Security Tweaker** is a batch script designed to temporarily disable and revert key Windows security features such as Windows Defender, SmartScreen, Firewall, UAC (User Account Control), and Windows notifications.

This script is intended for **educational and awareness purposes only**, to demonstrate how security features can be manipulated by attackers, and to help cybersecurity students and professionals understand the impact of disabling protections.

---

## How It Works

The script works in two main modes:

1. **Disable Security Features**  
   It uses Windows built-in commands and PowerShell to:
   - Disable Windows Defender real-time protection.
   - Turn off SmartScreen filter.
   - Disable the Windows Firewall.
   - Turn off UAC (User Account Control).
   - Suppress Windows notifications.

2. **Revert Security Features**  
   The script restores the above protections by reversing the registry and system changes, re-enabling Defender, SmartScreen, Firewall, UAC, and notifications.

The script includes a User Account Control (UAC) privilege check and prompts for administrative rights if necessary.

---

## What This Simulates (Attack Type)

This script resembles the kind of activity an **advanced attacker or malware** might perform to weaken system defenses and evade detection. Commonly, malware or ransomware attempts to:

- Disable real-time antivirus protection.
- Turn off firewall and security alerts.
- Suppress user notifications.
- Reduce system protections by disabling UAC.

**Such tactics are often called:**

- **Security Feature Bypass**  
- **Antivirus and Firewall Disabling**  
- **Defense Evasion Techniques**

Understanding these helps cybersecurity professionals prepare better defenses and detection mechanisms.

---

## Usage

1. Run the script **as Administrator** (it will prompt if not run with elevated privileges).  
2. Choose from the menu:
   - `1` to disable security features temporarily.
   - `2` to revert and re-enable all security features.
   - `3` to exit the script.

**Important:** After disabling or reverting, a system reboot is recommended for changes to take full effect.

---

## Disclaimer

- This script is for **educational, testing, and awareness purposes only**.  
- **Do NOT run this on your primary system without understanding the risks.**  
- Disabling security features exposes your system to vulnerabilities.  
- Always re-enable protections after testing.

---

## Credits

- Script authored by **Om Sonani (Nirvana)**.  
- Created with the help of **advanced AI assistance** and various online resources.  
- Inspired by real-world attack techniques and cybersecurity learning.

---

## Future Improvements

- Add logging to track when and how security features are toggled.  
- Include detection bypass for Tamper Protection via automated scripts (currently manual).  
- Add options for selective feature toggling (only firewall, only Defender, etc.).  
- Support for PowerShell Core and cross-Windows version compatibility.

---

## Contribution

Feel free to fork, improve, or use this script for educational purposes. Pull requests and suggestions are welcome!

---
Happy Hacking !
