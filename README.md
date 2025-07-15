🎬 Movie App
A Flutter application to search, discover, and explore movies using The Movie Database (TMDB) API. This app features movie search, details view, featured carousel, and more — all wrapped in a modern and responsive UI.

🚀 Features
🔍 Search Movies by title

📝 View movie details (overview, rating, release date, genres)

🎞️ Featured Movies Carousel

👥 Cast & Crew listing

💡 Filter key crew (Directors, Writers, Story, Characters)

📱 Responsive layout and modern design

🧠 State Management using flutter_bloc

🧱 Built With
Flutter

TMDB API

flutter_bloc

http

carousel_slider

google_fonts

equatable

🛠️ Setup
Clone the repository

bash
Copy
Edit
git clone https://github.com/yourusername/movie_app.git
cd movie_app
Install dependencies

bash
Copy
Edit
flutter pub get
TMDB API Key
Create a file at:
lib/core/api/api_keys.dart

dart
Copy
Edit
const String tmdbApiKey = 'YOUR_API_KEY';
Run the app

bash
Copy
Edit
flutter run
📁 Project Structure
arduino
Copy
Edit
lib/
├── core/
│   └── api/
│       └── api_keys.dart
├── data/
│   ├── models/
│   └── repositories/
├── presentation/
│   ├── common_widgets/
│   └── features/
│       ├── home/
│       ├── results/
│       └── movie_details/
📸 Screenshots (Optional)
Add screenshots here to showcase UI

📄 License
This project is for learning purposes and uses the TMDB API, which is subject to their terms of use.