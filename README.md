# NewsApp — Modern Content & Campaign Platform

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

**NewsApp** is a high-performance, production-ready Flutter application built with a focus on scalability, maintainability, and clean code principles. It serves as a comprehensive demonstration of **Clean Architecture** combined with the **BLoC State Management** pattern.

##  Key Features

- **Smart News Feed:** Real-time top headlines filtered by categories using NewsAPI.
- **Global Search:** Find any article with a powerful keyword search engine.
- **Offline Bookmarks:** Save and read articles even without an internet connection, powered by **Hive (NoSQL)**.
- **Auth Simulation:** Full authentication flow (Login/Register/Logout) with smart UI redirection.
- **Interactive Notifications:** Integrated with **Firebase Cloud Messaging (FCM)** for user engagement.
- **Dynamic Campaigns:** Real-time banner updates (e.g., promo/announcements) via **Firebase Remote Config** without app updates.
- **Responsive UI:** Clean, modern, and adaptive interface with support for **Dark & Light Mode**.

##  System Architecture

The project strictly follows **Clean Architecture** to ensure the code is decoupled and testable:

1.  **Data Layer:** Implementation of repositories, local and remote data sources, and data models (DTOs).
2.  **Domain Layer:** Business logic containing Entities, Repository interfaces, and Use Cases.
3.  **Presentation Layer:** UI components and state management using the BLoC pattern.

##  Tech Stack

- **State Management:** `flutter_bloc`
- **Networking:** `dio` (with interceptors and error handling)
- **Dependency Injection:** `get_it` + `injectable`
- **Navigation:** `go_router` (URL-based routing)
- **Local Database:** `hive` (High-speed NoSQL)
- **Image Handling:** `cached_network_image`
- **Permissions:** `permission_handler`

##  Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- NewsAPI Key from [newsapi.org](https://newsapi.org)

### Installation Steps

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/your-username/news_app.git
    cd news_app
    ```

2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run Code Generation:**
    (Required for Dependency Injection and Hive Adapters)
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Configure API Key:**
    Open `lib/features/news/data/datasources/news_remote_ds.dart` and replace `YOUR_NEWS_API_KEY` with your actual key.

5.  **Run the App:**
    ```bash
    flutter run
    ```

##  Testing

The project includes unit tests to ensure the reliability of business logic.
```bash
flutter test
```

##  License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
*Built with ❤️ by ilhamramdanii*
