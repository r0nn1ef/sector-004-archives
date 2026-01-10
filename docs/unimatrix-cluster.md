# 🧠 UNIMATRIX CLUSTER SETUP // THE HIVE
**FILE REF:** UCS-001-HIVE  
**CLEARANCE:** COLLECTIVE ACCESS ONLY

## 📑 Collective Intelligence Overview
Detailed configuration for the K3s orchestration layer. This document serves as the "Borg Queen" manual for node provisioning and container deployment.

## 🛠️ Provisioning Protocols
* **OS:** Raspberry Pi Lite OS (64-bit)
* **Kernel Flags:** `cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory`
* **Orchestrator:** K3s (vX.X.X)

## 🐝 Node Manifest (Drones)
* **Control Plane:** Unimatrix-01
* **Workers:** Adjunct-01, 02, 03

---

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