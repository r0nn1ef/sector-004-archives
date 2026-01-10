# 🛰️ CORE NETWORK SCHEMATICS // SECTOR 004
**FILE REF:** CNS-004-NET  
**CLEARANCE:** LEVEL 4 TACTICAL

## 📑 Overview
This manifest outlines the physical and logical backplane of the sector. It defines the "Subspace Gateway" and the switching fabric that allows the Collective and Federation assets to communicate.

---

## 🔌 Hardware Specifications

### ⚡ Subspace Gateway (Perimeter Control)
The eero Pro 6E serves as the Sector 004 primary router, firewall, and DHCP coordinator. It manages the interface between the Frontier Fiber external uplink and the internal Federation/Collective switching fabric.

#### 🛰️ Hardware Specs & Uplink

**Model:** eero Pro 6E (Tri-band Wi-Fi 6E)

**External Uplink:** Port 1 (2.5 Gbps) → ISP

**Internal Downlink:** Port 2 (1.0 Gbps) → Connected to Primary Switch (Edge Hub)

#### 📡 Wireless Subsystems

The gateway provides three distinct wireless bands for mobile units and secondary peripherals:

**6GHz Band:** Reserved for high-bandwidth Wi-Fi 6E devices (Defiant Uplink).

**5GHz Band:** General purpose Federation mobile traffic.

**2.4GHz Band:** Legacy support and IoT/Industrial sensors.

#### 🛡️ Security Configuration

**Firewall Status:** Active (Inbound block by default).

**DHCP Range:** 192.168.4.20 — 192.168.4.180

**DNS Servers:** 192.168.4.1 (Gateway Cache), 8.8.8.8 (Google Backup).

**Port Forwarding:** Strictly limited to Ports 80/443 (HTTP/S) and Port 22 (SSH).

### 🛰️ Primary Switch (Federation Edge Hub)

The TP-Link TL-SG105 serves as the high-speed backbone of Sector 004. It functions as the central nexus, routing traffic 
from the Subspace Gateway to the Federation Edge and the Borg Collective.

* **Model:** TP-Link TL-SG105 (5-Port Unmanaged)
* **Fabric:** High-performance, non-blocking switching.
* **Uplink:** Port 1 ← Gateway (Port 2)

#### 🗺️ Physical Port Map
| Port | Device            | VLAN                | Status      |
|:-----|:------------------|:--------------------|:------------|
| 1    | Subspace Gateway  | Federation          | :green_circle: Active   |
| 2    | Edge Switch       | Federation          | :green_circle: Active   |
| 3    | Collective Switch | Federation          | :green_circle: Active   |
| 4    | Open              | Federation          | :white_circle: Reserved  |
| 5    | Open              | Federation          | :white_circle: Reserved  |

### 🛰️ Edge Switch (GS308)

This is the "Federation Bridge Hub," optimized for high-performance data exchange between command workstations and the 
central archives.

#### 🗺️ Physical Port Map
| Port | Device                            | VLAN                | Status     |
|:-----|:----------------------------------|:--------------------|:-----------|
| 1    | Core Switch                       | Federation          | :green_circle: Active  |
| 2    | Excelsior                         | Federation          | :green_circle: Active  |
| 3    | Memory Alpha                      | Federation          | :green_circle: Active  |
| 4    | Open                              | Federation          | :white_circle: Reserved |
| 5    | Open                              | Federation          | :white_circle: Reserved |
| 6    | Open                              | Federation          | :white_circle: Reserved |
| 7    | Open                              | Federation          | :white_circle: Reserved |
| 8    | Open                              | Federation          | :white_circle: Reserved |


* **PoE+ Fabric:** [Model/Specs TBD]