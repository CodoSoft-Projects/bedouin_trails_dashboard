# Bedouin Trails Dashboard

A modern **Flutter-based Admin Dashboard** built to manage the **Bedouin
Trails tourism platform**.\
This dashboard allows administrators to manage trips, bookings, users,
employees, and site content through a clean and responsive interface.

The project follows a **feature-based architecture**, uses **Provider
for state management**, **Dio for API communication**, and **Hive for
local storage**, making it scalable and production-ready.

---

## Project Overview

Bedouin Trails Dashboard is a **cross-platform Flutter application**
designed to manage a tourism platform that offers desert trips and
experiences.

The dashboard provides powerful management tools for administrators
including:

- Managing trips
- Handling booking requests
- Managing users and employees
- Controlling site content (articles, ads, questions)
- Monitoring platform activity

The application is optimized for **desktop and web dashboards**, with
responsive layouts for different screen sizes.

---

## Tech Stack

### Core

- Flutter
- Dart

### State Management

- Provider

### Networking

- Dio

### Local Storage

- Hive
- Hive Flutter

### Dependency Injection

- GetIt

### UI / Visualization

- FL Chart
- Lottie Animations
- Skeletonizer
- Flutter SVG
- Cached Network Image

### File & Media Handling

- File Picker
- Image Picker

### Other Tools

- Intl (Localization)
- Lucide Icons
- Bitsdojo Window

---

## Architecture

The project follows a **Feature-Based Clean Architecture** structure.

    lib/
    │
    ├── core/
    │   ├── api/
    │   ├── providers/
    │   ├── services/
    │   ├── utils/
    │   └── functions/
    │
    ├── features/
    │   ├── auth/
    │   ├── dashboard/
    │   ├── trips/
    │   ├── users/
    │   ├── employees/
    │   ├── orders/
    │   ├── settings/
    │   └── profile/
    │
    ├── generated/
    │
    ├── main.dart
    └── bedouin_trails.dart

Each feature contains:

    feature/
    │
    ├── data
    ├── presentation
    │   ├── views
    │   └── manager (providers)
    └── functions

---

## Features

### Authentication

- Admin login
- Password recovery

### Dashboard

- Analytics overview
- Platform statistics
- Booking statistics
- Charts and metrics

### Trips Management

- View trips
- Create new trip
- Edit trip
- Suspend trips

### Users Management

- View all users
- View user trips
- User details

### Employees Management

- Manage employee accounts
- Assign permissions

### Orders / Booking Requests

- View booking requests
- Track booking status

### Site Management

- Manage advertisements
- Manage articles
- Manage FAQ / questions
- Manage About Us page

### Profile Management

- Edit admin profile
- Update account data

### Localization

- Arabic
- English

---

## Testing

Basic Flutter widget testing is included.

Run tests using:

    flutter test

---

## Folder Structure

    bedouin_trails_dashboard
    │
    ├── assets
    │   ├── images
    │   └── animations
    │
    ├── lib
    │   ├── core
    │   ├── features
    │   ├── generated
    │   ├── bedouin_trails.dart
    │   └── main.dart
    │
    ├── test
    │
    ├── android
    ├── ios
    ├── windows
    ├── macos
    ├── linux
    └── web

---

## How to Run the Project

### 1. Clone the repository

    git clone https://github.com/yourusername/bedouin_trails_dashboard.git

### 2. Navigate to the project

    cd bedouin_trails_dashboard

### 3. Install dependencies

    flutter pub get

### 4. Run the project

For Windows:

    flutter run -d windows

For Web:

    flutter run -d chrome

---

## Future Improvements

Possible improvements for the project:

- Role-based access control
- Advanced analytics dashboard
- Real-time notifications
- Offline caching
- Dark mode support
- Unit and integration tests
- Performance monitoring
- Export reports (PDF / Excel)

---

## Screenshots

Add screenshots of the dashboard UI here.

    screenshots/
    ├── dashboard.png
    ├── trips.png
    ├── users.png
    ├── orders.png
    └── settings.png

Example:

    ![Dashboard](screenshots/dashboard.png)

---

## Social Links

**Developer:** Mahmoud Adel

GitHub\
<https://github.com/Mahmoud-Adel-Ali>

---

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create a new branch
3. Commit your changes
4. Open a Pull Request

---

## License

This project is licensed under the **MIT License**.
