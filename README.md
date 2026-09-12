# 🌤️ Weather Forecast

A clean, minimal Flutter weather app that displays real-time weather data using the **OpenWeatherMap API**. Shows current conditions, hourly forecast, and key weather metrics with a sleek dark glassmorphism UI.

## Features

- 🌡️ Current temperature with weather condition icon
- 📊 5-slot hourly forecast (horizontal scroll)
- 💧 Humidity, 💨 Wind Speed, and 🏖️ Pressure display
- 🔄 Pull-to-refresh via AppBar button
- 🌙 Dark Material 3 theme with glassmorphism card

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| **Flutter** | Dart SDK ^3.12.2 | UI framework |
| **OpenWeatherMap API** | — | 5-day/3-hour forecast endpoint |
| [http](https://pub.dev/packages/http) | ^1.6.0 | API requests |
| [intl](https://pub.dev/packages/intl) | ^0.20.3 | Date/time formatting |

## Project Structure

```
lib/
├── main.dart                    — App entry point & MaterialApp config
├── weather_Screen.dart          — Main weather UI (StatefulWidget + API call)
├── Hourly_Forecast_Section.dart — Hourly forecast card widget
├── Additional_Information.dart  — Additional info item widget
└── Secrets.dart                 — API key (not committed — see setup)
```

## Getting Started

### Prerequisites

- Flutter SDK ^3.12.2
- An OpenWeatherMap API key ([get a free key](https://openweathermap.org/api))

### Setup

1. **Clone the repo**
   ```bash
   git clone https://github.com/Ranveer1332/Weather.git
   cd weather_flutter
   ```

2. **Create the API key file**
   ```bash
   cp lib/Secrets.dart lib/Secrets.dart
   ```
   Then edit `lib/Secrets.dart` and paste your API key.

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## API Reference

- **Endpoint:** `https://api.openweathermap.org/data/2.5/forecast`
- **Query params:** `q` (city name), `APPID` (API key), `units=metric`
- **Docs:** [OpenWeatherMap 5-day Forecast](https://openweathermap.org/forecast5)



