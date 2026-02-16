🚗 iTrack – iOS Fleet & Vehicle Tracking System

📌 Overview

iTrack is a full-featured iOS fleet management and vehicle tracking application that enables real-time GPS monitoring, fleet data management, fuel and maintenance logging, driver management, and navigation support.

The system integrates Google Maps API, MongoDB backend, and a structured role-based user model (Admin / Sub-Admin / Driver) to provide secure and scalable fleet operations management.

Built using Swift (Xcode) with MongoDB backend and real-time location services.

🔥 Key Features
📍 Real-Time GPS Tracking

Live vehicle location updates

Google Maps visualization

Continuous tracking support

🚘 Fleet Management

Add / Edit / Delete fleets

Store registration, engine & chassis details

Track vehicle status

👨‍✈️ Driver Management

Driver profile storage

Contact and identification details

Role-based access system

⛽ Fuel & Maintenance Logging

Fuel entry records

Maintenance tracking

Cost monitoring

📊 Dashboard Overview

Centralized control panel

Fleet summary view

Historical data tracking

📏 Navigation & Distance Calculator

Source & destination search

Google Places integration

Route and distance estimation

🚨 SOS Emergency Feature

Alert system for emergency situations

🏗️ System Architecture
iOS App (Swift)
        ↓
Backend Server (Node / WebStorm)
        ↓
MongoDB Database
        ↓
Google Maps API (Visualization)


The system retrieves GPS coordinates, stores them in MongoDB, and displays vehicle positions in real-time using Google Maps.

🛠️ Tech Stack
Layer	Technology
Frontend	Swift (iOS)
IDE	Xcode
Backend	Node.js
Database	MongoDB
Maps API	Google Maps
Location	CoreLocation / GPS
Architecture	MVC
🗃️ Database Collections

User

Fleet

Agency

Maintenance

Fuel

Each module is structured for scalable fleet operations management.

🧠 Software Development Approach

The project follows a structured Software Development Life Cycle (SDLC) using the Waterfall Model, covering:

Requirement Analysis

System Design

Implementation

Testing

Deployment

Maintenance

📦 Dependency Management (CocoaPods)

This project uses CocoaPods to manage third-party libraries.

Included in this repository:

✅ Podfile

✅ Podfile.lock (locks exact dependency versions)

Due to repository size constraints, the Pods/ directory is not included.

After cloning the repository, install dependencies using:

pod install


Then open the project using:

iTrack.xcworkspace


This will regenerate the Pods/ directory locally and install all required libraries.

🚀 How to Run the Project
Prerequisites

macOS

Xcode installed

CocoaPods installed

MongoDB server running

Google Maps API key

Steps

Clone the repository

Navigate to project folder

Run:

pod install


Open iTrack.xcworkspace

Configure your MongoDB backend

Add Google Maps API key

Build & Run on iOS Simulator or Device

📈 Future Improvements

Real-time socket-based tracking

Push notifications

Cloud deployment (AWS / Firebase)

Enhanced authentication & security

Analytics dashboard

Modern SwiftUI upgrade

🎯 Project Objective

The goal of iTrack is to:

Prevent vehicle theft

Digitize fleet management

Replace manual record keeping

Improve owner-driver communication

Provide reliable, real-time fleet monitoring

👨‍💻 Author

Dhaval Pandit
Graduate Research Assistant | AI/ML & Real-Time Systems Engineer
MS Computer Science – University of Texas at Arlington
