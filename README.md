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
  <a href="assets/lcars-network-diagram.svg">
    <img src="assets/lcars-network-diagram.svg" width="100%" alt="LCARS Sector 004 Tactical Map">
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

| Designation         | Registry       | Frequency (IP)  | Mission / Services                                         |
|:--------------------|:---------------|:----------------|:-----------------------------------------------------------|
| **Excelsior**       | `NCC-2000`     | `192.168.4.30`  | Command & Control / Primary Workstation                    |
| **Memory Alpha**    | `MAS-04`       | `192.168.4.190` | Central Core: Odoo, Penpot, Navidrome, Samba               |
| **Bilana**          | `NCC-40112`    | `192.168.4.182` | Industrial Replicator: HP LaserJet 1160 (CUPS)             |
| **Jupiter Station** | `STA-J1`       | `192.168.4.181` | Industrial Replicator: Canon MX-512 Multi-function printer |
| **The Hive**        | `UNIMATRIX-01` | `192.168.4.191` | Collective Queen: K3s Control Plane                        |
| **Adjunct-01**      | `ADJUNCT-01`   | `192.168.4.192` | Worker Node: Containerized Workloads                       |
| **Adjunct-02**      | `ADJUNCT-02`   | `192.168.4.193` | Worker Node: Containerized Workloads                       |
| **Adjunct-03**      | `ADJUNCT-03`   | `192.168.4.194` | Worker Node: Containerized Workloads                       |

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

### UNIMATRIX-01 [Offline]

The Hive Queen and central nexus of the Collective. Unimatrix-01 provides the core orchestration logic and 
synchronization signals required to maintain the K3s control plane. It is the singular point of unity that directs the 
swarm.

### ADJUNCT-01 [Offline]

Primary tactical drone. This unit provides the foundational computational mass for the Collective's containerized 
workloads, sacrificing individuality to ensure the total efficiency of the Hive's processing requirements.

### ADJUNCT-02 [Offline]

Secondary support drone. This unit reinforces the Hive's redundancy protocols, ensuring that if one drone is severed 
from the Collective, the workload is instantly redistributed without a loss in synchronization.

### ADJUNCT-03 [Offline]

Tertiary processing drone. This unit completes the current iteration of the Hive's distributed power, contributing its 
localized resources to the total computational output of the Sector 004 grid.

## 🦾 Assimilation Protocols (Installation)

To add a new drone to the collective, execute the following commands:

**1. Initialize the Queen (Control Plane)**
```bash
curl -sfL [https://get.k3s.io](https://get.k3s.io) | sh -
# Retrieve the Node Token:
sudo cat /var/lib/rancher/k3s/server/node-token