/// Data model representing XRP cryptocurrency rate in MYR
class XrpRate {
  /// XRP price in Malaysian Ringgit
  final double value;

  /// Timestamp when rate was fetched
  final DateTime fetchedAt;

  /// Creates XRP rate instance
  XrpRate({
    required this.value,
    DateTime? fetchedAt,
  }) : fetchedAt = fetchedAt ?? DateTime.now();

  /// Parses XRP rate from API JSON response
  /// Supports multiple API formats: last_trade, price, bid, ask fields
  factory XrpRate.fromJson(Map<String, dynamic> json) {
    // Priority order: last_trade > price > bid > ask
    dynamic raw = json['last_trade'] ?? json['price'] ?? json['bid'] ?? json['ask'];
    
    final double parsed = raw is String
        ? double.tryParse(raw) ?? 0.0
        : (raw is num ? raw.toDouble() : 0.0);

    return XrpRate(value: parsed);
  }

  /// Converts rate to JSON format
  Map<String, dynamic> toJson() => {
        'price': value.toStringAsFixed(4),
        'fetchedAt': fetchedAt.toIso8601String(),
      };
}
