import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/xrp_rate.dart';

/// Service for fetching real-time XRP price data from external API
class ApiService {
  /// API endpoint for XRP/MYR exchange rate
  static const String _endpoint = 'https://api.mypapit.net/crypto/XRPMYR.json';
  
  /// HTTP client (injectable for testing)
  http.Client? httpClient;

  /// Fetches current XRP rate in Malaysian Ringgit
  /// Throws [Exception] on network or parsing errors
  Future<XrpRate> fetchXrpRate() async {
    try {
      final uri = Uri.parse(_endpoint);
      final client = httpClient ?? http.Client();
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return XrpRate.fromJson(jsonData);
      } else {
        throw Exception('Failed to load XRP rate (HTTP ${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to fetch XRP rate: $e');
    }
  }
}
