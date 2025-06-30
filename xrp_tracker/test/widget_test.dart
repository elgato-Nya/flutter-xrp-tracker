/// Widget tests for HomeScreen UI and navigation functionality
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xrp_tracker/models/xrp_rate.dart';
import 'package:xrp_tracker/screens/home_screen.dart';
import 'package:xrp_tracker/screens/about_screen.dart';
import 'package:xrp_tracker/services/api_service.dart';

/// Mock API service for testing with fixed rate data
class FakeApiService extends ApiService {
  @override
  Future<XrpRate> fetchXrpRate() async {
    return XrpRate(value: 4.3210, fetchedAt: DateTime(2025, 6, 30));
  }
}

void main() {
  testWidgets('HomeScreen shows loading indicator initially', (tester) async {
    // Arrange: create app with HomeScreen
    await tester.pumpWidget(MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        AboutScreen.routeName: (_) => const AboutScreen(),
      },
    ));

    // First frame: should see progress indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Tap the info icon to test navigation
    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    // Should be on the About screen now
    expect(find.text('About'), findsOneWidget);
  });
}
