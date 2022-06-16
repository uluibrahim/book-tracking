import 'package:easy_localization/easy_localization.dart';

mixin CustomDateFormat {
  String customDateFormat(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
