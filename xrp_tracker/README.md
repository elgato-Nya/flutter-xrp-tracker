# XRP Tracker 📈

A modern Flutter application for real-time XRP cryptocurrency price monitoring in Malaysian Ringgit (MYR).

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

- 🔴 **Real-time Price Display** - Live XRP prices in Malaysian Ringgit (MYR)
- 🎨 **Modern Crypto UI** - Dark theme with XRP-branded blue color scheme
- 📱 **Cross-platform** - Runs on Android, iOS, Web, Windows, macOS, and Linux
- 🔄 **Auto-refresh** - Manual refresh functionality with loading indicators
- ⚡ **Animated Interface** - Smooth animations and pulsing live indicators
- 🛡️ **Error Handling** - Robust error handling with retry mechanisms
- ✅ **Well Tested** - Comprehensive unit and widget tests

## 📱 Screenshots

### Home Screen
- Live XRP price display with animated indicators
- Real-time data from reliable cryptocurrency APIs
- Clean, professional interface optimized for price monitoring

### About Screen
- App information and feature descriptions
- Developer information and version details
- Modern card-based layout

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>= 3.8.1)
- [Dart SDK](https://dart.dev/get-dart) (>= 3.8.1)
- IDE: [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/flutter_XRP_tracker.git
   cd flutter_XRP_tracker/xrp_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS App:**
```bash
flutter build ios --release
```

**Web App:**
```bash
flutter build web --release
```

**Windows Desktop:**
```bash
flutter build windows --release
```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and theme configuration
├── models/
│   └── xrp_rate.dart        # XRP rate data model with JSON parsing
├── services/
│   └── api_service.dart     # API communication service
├── screens/
│   ├── home_screen.dart     # Main price display screen
│   └── about_screen.dart    # App information screen
└── widgets/
    └── rate_display.dart    # Animated price display widget

test/
├── api_service_test.dart    # API service unit tests
└── widget_test.dart         # Widget integration tests
```

## 🔧 Architecture

### Design Pattern
- **Stateful Widgets** for dynamic content
- **Service Layer** for API communication
- **Model Classes** for data representation
- **Separation of Concerns** with clear file organization

### Key Components

1. **ApiService** - Handles HTTP requests to cryptocurrency APIs
2. **XrpRate Model** - Data structure for XRP price information
3. **RateDisplay Widget** - Animated price presentation component
4. **Theme Configuration** - Crypto-inspired dark theme with XRP colors

## 🌐 API Integration

The app fetches real-time XRP prices from:
- **Primary:** [MyPapit Crypto API](https://api.mypapit.net/crypto/XRPMYR.json)

### API Response Format
```json
{
  "pair": "XRPMYR",
  "timestamp": 1751266802578,
  "bid": "9.1998",
  "ask": "9.1999", 
  "last_trade": "9.1999",
  "rolling_24_hour_volume": "356949.00",
  "status": "ACTIVE"
}
```

## 🎨 Design System

### Color Palette
- **Primary:** `#23D3FF` (XRP Blue)
- **Secondary:** `#00B8D4` (Cyan Accent)
- **Background:** `#121212` (Dark)
- **Surface:** `#1A1A1A` (Card Background)

### Typography
- **Headers:** Bold, high contrast
- **Body:** Medium weight for readability
- **Price Display:** Large, prominent formatting

## 🧪 Testing

### Run Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/api_service_test.dart
```

### Test Coverage
- ✅ API service unit tests
- ✅ Widget integration tests
- ✅ JSON parsing validation
- ✅ Error handling scenarios

## 📦 Dependencies

### Main Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0          # HTTP client for API requests
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  http: ^1.1.0          # For testing API mocks
```

## 🔨 Development

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Document public APIs with dartdoc comments
- Maintain consistent formatting with `dart format`

### Adding New Features
1. Create feature branch: `git checkout -b feature/feature-name`
2. Implement changes with tests
3. Run tests: `flutter test`
4. Format code: `dart format .`
5. Create pull request

## 🚨 Troubleshooting

### Common Issues

**Build Errors:**
```bash
flutter clean
flutter pub get
flutter run
```

**API Connection Issues:**
- Check internet connectivity
- Verify API endpoint availability
- Review error messages in debug console

**Hot Reload Not Working:**
```bash
# Restart app
flutter run --hot
```

## 📈 Performance

### Optimization Features
- Efficient HTTP client reuse
- Minimal widget rebuilds
- Optimized animations
- Lazy loading where applicable

### Memory Management
- Proper disposal of animation controllers
- HTTP client cleanup
- State management best practices

## 🔮 Future Enhancements

- [ ] Historical price charts
- [ ] Price alerts and notifications
- [ ] Multiple cryptocurrency support
- [ ] Portfolio tracking
- [ ] Dark/Light theme toggle
- [ ] Localization support
- [ ] Offline mode with cached data

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Write tests for new features
- Follow existing code style
- Update documentation as needed
- Ensure cross-platform compatibility

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) for the amazing framework
- [MyPapit.net](https://www.mypapit.net/) for providing reliable crypto API
- [Material Design](https://material.io/) for design principles
- XRP community for inspiration

## 📊 Project Status

![GitHub last commit](https://img.shields.io/github/last-commit/yourusername/flutter_XRP_tracker)
![GitHub issues](https://img.shields.io/github/issues/yourusername/flutter_XRP_tracker)
![GitHub pull requests](https://img.shields.io/github/issues-pr/yourusername/flutter_XRP_tracker)

---

**Built with ❤️ using Flutter**