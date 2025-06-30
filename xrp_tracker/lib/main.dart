/// XRP Tracker - Real-time cryptocurrency price monitoring app
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';

/// Application entry point
void main() {
  runApp(const XrpTrackerApp());
}

/// Main application widget with crypto-themed dark UI
class XrpTrackerApp extends StatelessWidget {
  const XrpTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XRP Crypto Value Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF23D3FF), // XRP Blue
          secondary: const Color(0xFF00B8D4), // Cyan accent
          surface: const Color(0xFF1A1A1A),
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          iconTheme: IconThemeData(color: Color(0xFF23D3FF)),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E1E1E),
          elevation: 8,
          shadowColor: const Color(0xFF23D3FF).withAlpha(76), // 0.3 * 255 ≈ 76
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: const Color(0xFF23D3FF).withAlpha(51), // 0.2 * 255 ≈ 51
              width: 1,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF23D3FF),
            foregroundColor: Colors.black,
            elevation: 4,
            shadowColor: const Color(0xFF23D3FF).withAlpha(128), // 0.5 * 255 ≈ 128
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: const Color(0xFF23D3FF),
            backgroundColor: const Color(0xFF23D3FF).withAlpha(25), // 0.1 * 255 ≈ 25
            padding: const EdgeInsets.all(12),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
          bodyLarge: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            color: Colors.white60,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        AboutScreen.routeName: (_) => const AboutScreen(),
      },
    );
  }
}
