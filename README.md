# 🇱🇰 TourSL - Flutter Tourism Guide for Sri Lanka

A beautiful and modern Flutter mobile app that helps users explore tourist destinations across Sri Lanka. Features an onboarding flow, interactive district map using GeoJSON, and detailed pages for tourist cities with images and descriptions.

![TourSL Demo](assets/screenshots/demo.gif)

---

## ✨ Features

- 🧭 Onboarding screens shown only once using SharedPreferences
- 🗺️ District selection with interactive GeoJSON-based map (`flutter_map`)
- 🏙️ City cards with images and descriptions
- 🔍 Navigate from district → cities → city detail
- 🎨 Custom UI with gradient overlays and reusable widgets
- ⚙️ BLoC-based state management for map and onboarding logic

---

## 📸 Screenshots

|  |  |  |  |
|-----------|----------|-----------|--------------|
| ![1](assets/screenshots/Screenshot_2025-06-18-16-27-50-566_com.example.toursl.jpg) | ![2](assets/screenshots/2.jpg) | ![3](assets/screenshots/3.jpg) | ![4](assets/screenshots/4.jpg) |

---

## 📦 Tech Stack

- **Flutter**
- `flutter_bloc` – BLoC state management
- `flutter_map` – Render district polygons
- `shared_preferences` – Store onboarding status
- `latlong2` – Geographic utilities

---

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/toursl.git
   cd toursl
