🎬 Flutter Movie App
A beautifully crafted movie discovery app built with Flutter. It lets you discover trending, popular, and upcoming films, bringing the magic of cinema right to your fingertips. The app is powered by the TMDB API.
<!-- TODO: Replace with a real screenshot of your app! -->
✨ Features
Discover Movies: Browse through multiple categories:
Trending Movies
Popular Movies
Upcoming Movies
Movie Details: Tap on any movie to see more details, including the poster, rating, release date, and a full synopsis.
Engaging UI: A smooth, user-friendly interface featuring a CarouselSlider for an interactive browsing experience.
Clean Architecture: Built using the BLoC pattern for predictable and scalable state management, separating business logic from the UI.
Custom Styling: Utilizes google_fonts for elegant and readable typography.
🛠️ Tech Stack & Packages
This project is built with Flutter and leverages a number of powerful packages to deliver a modern development experience.
State Management: flutter_bloc - For predictable state management and a clean, scalable architecture.
HTTP Requests: http - To communicate with the TMDB REST API.
UI & Styling:
google_fonts - For applying custom fonts easily.
carousel_slider - For the main movie carousel on the home screen.
Utilities:
intl - For formatting dates and numbers.
equatable - To simplify equality comparisons in BLoC states and models.
🚀 Getting Started
Follow these instructions to get a copy of the project up and running on your local machine for development and testing.
Prerequisites
Flutter SDK (version 3.8.1 or higher)
An API Key from The Movie Database (TMDB)
Installation
Clone the repository:
Generated sh
git clone https://github.com/your-username/movie_app.git
cd movie_app
Use code with caution.
Sh
Install dependencies:
Generated sh
flutter pub get
Use code with caution.
Sh
Add your TMDB API Key:
You will need to create a new file to store your API key so the app can make requests.
Create a new file: lib/api/api_constants.dart
Add the following content to the file, replacing YOUR_API_KEY with your actual key from TMDB:
Generated dart
class ApiConstants {
static const String apiKey = 'YOUR_API_KEY';
static const String baseUrl = 'https://api.themoviedb.org/3';
}
Use code with caution.
Dart
Note: Make sure the file where you use this key (e.g., lib/api/api_client.dart) imports this new file and uses ApiConstants.apiKey.
Run the app:
Generated sh
flutter run
Use code with caution.
Sh
📂 Project Structure
The project follows a feature-driven structure, with code organized logically for clarity and maintainability.
Generated code
lib/
├── api/                  # Networking layer (API client, constants)
├── bloc/                 # BLoC logic for state management
├── models/               # Data models (e.g., Movie)
├── presentation/         # UI Layer (Screens, Widgets)
│   ├── screens/
│   └── widgets/
├── main.dart             # App entry point
└── ...
Use code with caution.
📄 License
This project is licensed under the MIT License - see the LICENSE.md file for details.