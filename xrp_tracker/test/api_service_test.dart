/// Unit tests for ApiService XRP rate fetching functionality
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:xrp_tracker/services/api_service.dart';

void main() {
  group('ApiService.fetchXrpRate', () {
    test('parses a valid JSON response with new API format', () async {
      // Arrange: create a mock HTTP client
      final mockClient = MockClient((request) async {
        final jsonBody = jsonEncode({
          'pair': 'XRPMYR',
          'timestamp': 1751266802578,
          'bid': '3.4566',
          'ask': '3.4568',
          'last_trade': '3.4567',
          'rolling_24_hour_volume': '356949.00',
          'status': 'ACTIVE'
        });
        return http.Response(jsonBody, 200);
      });

      // Replace the http.get call in ApiService with our mock
      final service = ApiService();
      service.httpClient = mockClient;

      // Act
      final rate = await service.fetchXrpRate();

      // Assert
      expect(rate.value, 3.4567);
      expect(rate.fetchedAt, isA<DateTime>());
    });

    test('parses a valid JSON response with old API format', () async {
      // Arrange: create a mock HTTP client for backward compatibility
      final mockClient = MockClient((request) async {
        final jsonBody = jsonEncode({'price': '3.4567'});
        return http.Response(jsonBody, 200);
      });

      // Replace the http.get call in ApiService with our mock
      final service = ApiService();
      service.httpClient = mockClient;

      // Act
      final rate = await service.fetchXrpRate();

      // Assert
      expect(rate.value, 3.4567);
      expect(rate.fetchedAt, isA<DateTime>());
    });

    test('throws on non-200 status', () {
      final mockClient = MockClient((_) async => http.Response('Error', 404));
      final service = ApiService();
      service.httpClient = mockClient;

      expect(service.fetchXrpRate(), throwsException);
    });

    test('throws on network error', () {
      final mockClient = MockClient((_) async => throw Exception('Network error'));
      final service = ApiService();
      service.httpClient = mockClient;

      expect(service.fetchXrpRate(), throwsException);
    });
  });
}
