import 'package:flutter/cupertino.dart';

class DateTimeValueNotifier extends ValueNotifier<DateTime> {
  DateTimeValueNotifier(DateTime value) : super(value);

  void setDateTime(DateTime dateTime) {
    value = dateTime;
  }
}
