# 🖥️ WORKSTATION SCHEMATICS // COMMAND DECK
**FILE REF:** WSC-002-CMD  
**CLEARANCE:** ADMIRALTY OVERRIDE

## 📑 Command & Control Overview
Specifications for the primary Federation bridge stations. These units are configured for secure terminal access, architectural design, and remote management of the Hive.

## 🚢 Unit Specifications
### Excelsior (NCC-2000)
* **OS:** [e.g., Windows/Linux/macOS]
* **Primary Function:** Cluster Management / VS Code / Ansible Control

### Defiant (NX-74205)
* **OS:** [e.g., Mobile OS/Laptop]
* **Primary Function:** Field Recon / Remote SSH Uplink

---

## Setup

### Run this from Excelsior to take command of the Hive
scp pi@192.168.4.220:/etc/rancher/k3s/k3s.yaml ~/.kube/config
### Then update the server address from 127.0.0.1 to 192.168.4.220
sed -i 's/127.0.0.1/192.168.4.220/g' ~/.kube/config