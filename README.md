# 🖖 SECTOR 004 // JOINT STRATEGIC COMMAND

## 📡 Tactical Overview: Mission Directive
**MISSION DIRECTIVE:** To exercise supreme command over the integrated assets of Sector 004. This facility serves as the nexus 
between Federation administrative protocols and the Borg Collective's computational efficiency. By maintaining a 
Joint Strategic Command, we ensure the seamless interoperation of diverse hostnames — from the archival depths of 
Memory Alpha to the distributed processing power of the Hive. All operations are conducted under a hardened security 
posture to preserve the integrity of the quadrant.

---

## 🗺️ System Topology

<p align="center">
  <a href="assets/lcars-network-diagram.jpg">
    <img src="assets/lcars-network-diagram.jpg" width="100%" alt="LCARS Sector 004 Tactical Map">
  </a>
</p>

*Figure 1.0: Logical mapping of the Sector 004 Perimeter. Click image to enlarge tactical view.*

---

## 🛡️ Security Posture: CONDITION RED
The Sector 004 perimeter is currently hardened against external intrusion.
* **Shield Status:** ENERGIZED (Active Filtering)
* **Inbound Aperture:** Ports 80 (HTTP) and 443 (HTTPS) only.
* **Security Purge:** Port 21 (FTP) has been decommissioned. External transport is strictly limited to SSL-encrypted channels.

---

## 🚢 Fleet Manifest & Uplink Frequencies

| Designation         | Registry       | Frequency (IP)  | Mission / Services                                            |
|:--------------------|:---------------|:----------------|:--------------------------------------------------------------|
| **Excelsior**       | `NCC-2000`     | `192.168.4.30`  | 🟢 Command & Control / Primary Workstation                       |
| **Defiant**         | `NX-74205`     | `DHCP`          | 🟢 Command & Control / Mobile Workstation                        |
| **Memory Alpha**    | `MAS-04`       | `192.168.4.190` | 🟢 Central Core: Odoo, Penpot, Navidrome, Samba                  |
| **Bilana**          | `NCC-40112`    | `192.168.4.182` | 🟢 Industrial Replicator: HP LaserJet 1160 (CUPS)                |
| **Jupiter Station** | `STA-J1`       | `192.168.4.181` | 🟢 Industrial Replicator: Canon MX-512 Multi-function printer |
| **The Hive**        | `UNIMATRIX-01` | `192.168.4.220` | 🟢 Collective Queen: K3s Control Plane                        |
| **Adjunct-01**      | `ADJUNCT-01`   | `192.168.4.221` | 🟢 Worker Node: Containerized Workloads                       |
| **Adjunct-02**      | `ADJUNCT-02`   | `192.168.4.222` | 🔴 Worker Node: Containerized Workloads                       |
| **Adjunct-03**      | `ADJUNCT-03`   | `192.168.4.223` | 🔴 Worker Node: Containerized Workloads                       |

---

## The Federation

The Federation layer of Sector 004 consists of the primary command and support infrastructure. These nodes represent the 
legacy of the fleet — reliable, multi-functional, and serving as the backbone for the sector's administrative, R&D, 
and replicator services. From the central archive at Memory Alpha to the specialized replicator hub at Jupiter Station, these assets 
provide the essential stability required to govern the quadrant's data flow.

### Excelsior

The primary command and control asset. As the flagship of the Sector 004 fleet, 
Excelsior serves as the Admiral's interface for high-level design, secure terminal access, and the architectural 
development of the Joint Command grid.

### Defiant

The fleet's primary escort and mobile reconnaissance unit. Defiant provides a high-performance, portable bridge for 
field operations, ensuring that Command can maintain a subspace uplink to the archives even when stationed outside the 
primary sector.

### Memory Alpha

The central hub and data repository for Sector 004, housing the Odoo ERP, Penpot design assets, and the Navidrome sonic 
archives. It acts as the "Grand Library" for all Federation and Joint operations.

### Bilana

A dedicated industrial research outpost. Operating as a high-reliability replicator station, Bilana manages the 
HP LaserJet 1160 interface, translating digital schematics into physical tactical hardcopy for the fleet.

### Jupiter Station

The sector's advanced multi-function research and development facility. Jupiter Station expands the fleet's replicator 
capabilities with the Canon MX-512, providing high-resolution imaging (scanning) and subspace wireless relay protocols 
to support all nearby vessels.

---

## The Borg Collective

Designated as The Hive, this segment of the network represents a unified, distributed intelligence. By assimilating 
Raspberry Pi hardware into a singular K3s orchestration fabric, I have eliminated the inefficiency of the individual. 
All drones within the Hive operate in total synchronization, sharing resources and computational loads to ensure that 
service downtime is non-existent. In the Collective, there is no "self," only the Cluster.

### UNIMATRIX-01 [Online]

The Hive Queen and central nexus of the Collective. Unimatrix-01 provides the core orchestration logic and 
synchronization signals required to maintain the K3s control plane. It is the singular point of unity that directs the 
swarm.

### ADJUNCT-01 [Online]

Primary tactical drone. This unit provides the foundational computational mass for the Collective's containerized 
workloads, sacrificing individuality to ensure the total efficiency of the Hive's processing requirements.

### ADJUNCT-02 [Offline]

Secondary support drone. This unit reinforces the Hive's redundancy protocols, ensuring that if one drone is severed 
from the Collective, the workload is instantly redistributed without a loss in synchronization.

### ADJUNCT-03 [Offline]

Tertiary processing drone. This unit completes the current iteration of the Hive's distributed power, contributing its 
localized resources to the total computational output of the Sector 004 grid.

## 🦾 Assimilation Protocols (Installation)

Before a drone can join the collective, its storage medium must be manually prepared to bypass standard configuration limitations.

_NOTE_: The following are based on Raspberry Pi OS (Bookworm).

### 💾 Phase 1: SD Card Pre-Configuration

Perform these steps on your workstation (e.g., Linux Mint) after imaging the card with Raspberry Pi OS (Bookworm) but before first boot.

1. Enable SSH & Container Cgroups

Access the _bootfs_ partition to unlock remote access and enable the kernel features required by K3s.

````bash
# Enable SSH service
touch /media/$USER/bootfs/ssh

# Enable Cgroups (Append to the end of the existing line in cmdline.txt)
sudo vi /media/$USER/bootfs/cmdline.txt
# Add: cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
````

2. Establish Identity & Static Networking

Access the rootfs partition to hardcode the node's identity and network coordinates.

````bash
# Set Hostname
sudo vi /media/$USER/rootfs/etc/hostname  
# Enter: adjunct-01 (or unimatrix-01)

# Map Hostname to Loopback
sudo vi /media/$USER/rootfs/etc/hosts     
# Add: 127.0.1.1 adjunct-01
````

**Inject NetworkManager Profile:** Create the static Ethernet configuration to ensure the drone appears at the correct coordinates immediately.

````bash
sudo vi /media/$USER/rootfs/etc/NetworkManager/system-connections/eth0-static.nmconnection
````

_Input the following configuration (changing address1 for specific IP addresses):_

````ini
[connection]
id=eth0-static
type=ethernet
interface-name=eth0

[ipv4]
method=manual
address1=192.168.4.220/24,192.168.4.1
dns=192.168.4.1;8.8.8.8;8.8.4.4;

[ipv6]
method=ignore
````

**Lock Permissions (Required by NetworkManager):**

````bash
sudo chmod 600 /media/$USER/rootfs/etc/NetworkManager/system-connections/eth0-static.nmconnection
````

### 🚀 Phase 2: Post-Boot Optimization

Once the drone is powered on and reachable via SSH, disable the wireless sub-systems to focus all bandwidth on the primary wired uplink.

````bash
# Disconnect and disable WiFi radio
sudo nmcli device set wlan0 managed no
sudo nmcli radio wifi off
````

### 🧠 Phase 3: Cluster Initialization

**1. Initialize the Queen (Control Plane - Unimatrix-01)**

The primary nexus must be established first. We force the node to bind to the dedicated subspace frequency (Static IP) to 
ensure the stability of the Hive's neural path.

```bash
curl -sfL https://get.k3s.io | sudo sh -s - server \
  --node-ip=192.168.4.220 \
  --flannel-iface=eth0 \
  --write-kubeconfig-mode 644
```

**2. Retrieve the Neural Token**

Once the Queen is online, extract the unique security signature required to bring secondary drones into the Collective:

````bash
sudo cat /var/lib/rancher/k3s/server/node-token
````

**3. Assimilate Adjunct Drones (Worker Nodes)**

On each worker node (Adjunct-01, 02, etc.), execute the following. Replace ```[QUEEN_TOKEN]``` with the string retrieved above.

````bash
export K3S_URL=https://192.168.4.220:6443
export K3S_TOKEN=[QUEEN_TOKEN]
curl -sfL https://get.k3s.io | sudo -E sh -
````

### 🖖 Phase 4: Collective Synchronization Check

Verify that all assets are reporting to the Hive and are ready for tasking:

````bash
kubectl get nodes -o wide
````

## 📊 Tactical HUD: Monitoring the Collective

Once the Hive is synchronized, use these localized sub-routines to monitor the health and resource consumption of each drone.

**📡 Real-time Resource Allocation**

Monitor CPU and Memory usage across the collective to ensure total efficiency.

_Note:_ This requires the ```metrics-server``` (installed by default with K3s).

````bash
# View resource consumption by drone (node)
kubectl top nodes

# View resource consumption by individual pods across the entire Hive
kubectl top pods --all-namespaces
````

**🛰️ Drone Status Detail**

If a drone begins to desynchronize (Status: NotReady), run a deep scan to identify faults in the neural link:

````bash
kubectl describe node adjunct-01
````

**🖖 Fleet Logistics (Services)**

View the ingress points and internal frequencies for all active deployments currently hosted within the Hive:

````bash
kubectl get svc --all-namespaces
````