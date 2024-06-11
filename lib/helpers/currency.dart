import 'package:intl/intl.dart';

class Money {
  static final idr =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
}
