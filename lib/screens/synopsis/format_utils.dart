import 'package:intl/intl.dart';

class FormatUtils {
  static final _numberFormat = NumberFormat('#,##0', 'en_US');
  static final _currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 0,
  );

  static String hours(double h) {
    if (h < 1) {
      return '${(h * 60).round()}m';
    }
    final whole = h.floor();
    final mins = ((h - whole) * 60).round();
    if (mins == 0) return '${whole}h';
    return '${whole}h ${mins}m';
  }

  static String roundedHours(double h) {
    if (h < 10) return h.toStringAsFixed(1).replaceAll('.0', '');
    return h.round().toString();
  }

  static String largeHours(double h) {
    return _numberFormat.format(h.round());
  }

  static String days(double h) {
    final d = h / 24.0;
    if (d < 1) return hours(h);
    if (d < 10) return '${d.toStringAsFixed(1)} days';
    return '${d.round()} days';
  }

  static String years(double h) {
    final y = h / (24 * 365);
    if (y < 1) return days(h);
    return '${y.toStringAsFixed(1)} years';
  }

  static String currency(double amount) => _currencyFormat.format(amount);

  static String count(double n, String singular, [String? plural]) {
    final rounded = n.round();
    final label = rounded == 1 ? singular : (plural ?? '${singular}s');
    return '${_numberFormat.format(rounded)} $label';
  }
}
