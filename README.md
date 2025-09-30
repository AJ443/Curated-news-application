# NewsFlash

A personalized news mobile application built with **Flutter** that allows users to select interests and view related articles fetched from an external news API.

# Features

- Select topics of interest (e.g., Technology, Politics, Health, etc.)
- Fetch and display live news articles from NewsAPI based on selected interests
- Tap to view detailed article information
- Open full articles in browser
- Navigate between multiple screens (Home, News, Article Details)

# Technologies Used

- **Flutter** (Dart)
- **HTTP package** for API integration
- **Navigator** for multi-screen routing
- **Asynchronous Programming** (`async`/`await`)
- **Material Design** UI components
- **URL Launcher** for opening external links

#Setup Instructions

1. **Clone this repository** or download the project ZIP.
2. Navigate to the project folder:
   ```bash
   cd newsflash
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

# API Key Configuration

This project uses [NewsAPI.org](https://newsapi.org).

```dart
const String apiKey = 'dd462ec0f5c8464297e484e7925fea4e';

```

# File Structure Overview

```
lib/
├── main.dart             # App entry point
├── home_page.dart        # Interest selection page
├── news_page.dart        # News list based on selected topics
├── article_page.dart     # Article detail with URL launcher
```

# Authors

- Jasem Alkhaleel 

  Course: CSIS401-01 – Mobile Computing

# Submission Info

Presentation Due: June 12

Submission Includes:

Project ZIP + README

PowerPoint presentation

