import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final NumberFormat _formatter = NumberFormat.currency(
    symbol: 'RM ',
    decimalDigits: 2,
  );

  /// Format a double value to currency string
  /// Example: 150.50 -> "RM 150.50"
  static String format(double amount) {
    return _formatter.format(amount);
  }

  /// Format a double value to currency string without symbol
  /// Example: 150.50 -> "150.50"
  static String formatWithoutSymbol(double amount) {
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 2);
    return formatter.format(amount).trim();
  }

  /// Parse a string to double, removing currency symbols
  /// Example: "RM 150.50" -> 150.50
  static double? parse(String value) {
    try {
      // Remove currency symbols and spaces
      final cleanValue = value.replaceAll(RegExp(r'[^\d.]'), '');
      return double.tryParse(cleanValue);
    } catch (e) {
      return null;
    }
  }
}
