
# 🚗 iTrack  
### Real-Time iOS Fleet & Vehicle Intelligence System

![Platform](https://img.shields.io/badge/Platform-iOS-blue)
![Language](https://img.shields.io/badge/Language-Swift-orange)
![Database](https://img.shields.io/badge/Database-MongoDB-green)
![Maps](https://img.shields.io/badge/API-Google%20Maps-red)
![Architecture](https://img.shields.io/badge/Architecture-MVC-lightgrey)

---

## 📌 Overview

**iTrack** is a full-stack iOS fleet management and real-time vehicle tracking system designed to digitize traditional fleet operations and enable continuous GPS-based monitoring.

The system integrates:

- 📍 Real-time GPS tracking  
- 🗺 Google Maps visualization  
- 🚘 Fleet & driver management  
- ⛽ Fuel and maintenance logging  
- 🔐 Role-based access control (Admin / Sub-Admin / Driver)  
- 📊 Operational dashboard  

Built using **Swift (Xcode)** with a **MongoDB backend**, the project demonstrates mobile application architecture, backend integration, structured database modeling, and location-based services.

---

## 🚀 Core Features

### 📍 Real-Time Tracking
- Live GPS-based vehicle monitoring
- Google Maps integration
- Continuous location updates

### 🚘 Fleet Management
- Vehicle registration & details storage
- Engine, chassis & registration tracking
- Fleet activity status control

### 👨‍✈️ Driver Management
- Driver profile management
- Identification & contact storage
- Role-based access system

### ⛽ Fuel & Maintenance Module
- Fuel logging
- Maintenance records
- Cost tracking & history

### 📏 Navigation & Distance Calculator
- Source-to-destination search
- Google Places API integration
- Route distance estimation

### 🚨 SOS Emergency Alert
- Emergency communication trigger

---

## 🏗 System Architecture

```
iOS Application (Swift)
        ↓
Node-based Backend
        ↓
MongoDB Database
        ↓
Google Maps API (Visualization Layer)
```

- GPS coordinates are captured via iOS location services  
- Backend stores structured fleet data  
- MongoDB manages scalable collections  
- Google Maps renders real-time vehicle positions  

---

## 🛠 Tech Stack

| Layer        | Technology |
|-------------|------------|
| Mobile App  | Swift (UIKit) |
| IDE         | Xcode |
| Backend     | Node.js |
| Database    | MongoDB |
| Maps API    | Google Maps |
| Location    | CoreLocation |
| Architecture| MVC |

---

## 🗃 Database Structure

Primary Collections:

- `User`
- `Fleet`
- `Agency`
- `Maintenance`
- `Fuel`

The schema supports scalable fleet tracking operations with structured entity relationships.

---

## 📦 Dependency Management (CocoaPods)

This project uses **CocoaPods** for managing third-party libraries (e.g., Google Maps SDK).

Included in this repository:

- ✅ `Podfile`
- ✅ `Podfile.lock` (locks exact dependency versions)

Due to repository size constraints, the `Pods/` directory is **not included**.

After cloning the repository, install dependencies locally:

```bash
pod install
```

Then open:

```bash
iTrack.xcworkspace
```

This regenerates the `Pods/` directory with the correct locked versions.

---

## ▶️ Running the Project

### Prerequisites
- macOS
- Xcode installed
- CocoaPods installed
- MongoDB server configured
- Google Maps API key

### Setup Steps

1. Clone the repository  
2. Navigate to project directory  
3. Run:
   ```bash
   pod install
   ```
4. Open `iTrack.xcworkspace`  
5. Configure backend & MongoDB  
6. Add Google Maps API key  
7. Build & run on simulator/device  

---

## 🎯 Project Objective

The primary goal of iTrack is to:

- Prevent vehicle theft  
- Replace manual fleet records  
- Enable centralized fleet control  
- Improve operational transparency  
- Provide scalable real-time monitoring  

---

## 📈 Future Improvements

- Real-time socket-based tracking
- Push notifications
- Cloud deployment (AWS / Firebase)
- Enhanced authentication & encryption
- Analytics dashboard
- SwiftUI-based redesign

---

## 👨‍💻 Author

**Dhaval Pandit**  
MS Computer Science – University of Texas at Arlington  
AI/ML & Real-Time Systems Engineer  

---
