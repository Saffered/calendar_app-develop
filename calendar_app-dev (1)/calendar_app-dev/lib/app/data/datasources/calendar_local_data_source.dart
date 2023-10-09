import 'dart:convert';

import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/core/error/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class _KeysOfStorage {
  static const cachedEnumKey = "SAVED_CALENDAR_ENUM";
}

abstract interface class CalendarLocalDataSource {
  Future<List<DayColorType>> getSavedColorTypes();
  Future<void> saveDayColors(List<DayColorType> dayColorEnumsToCache);
}

class CalendarLocalDataSourceImpl implements CalendarLocalDataSource {
  final FlutterSecureStorage secureStorage;
  CalendarLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<List<DayColorType>> getSavedColorTypes() async {
    final jsonString =
        await secureStorage.read(key: _KeysOfStorage.cachedEnumKey);
    if (jsonString != null) {
      return Future.value(json.decode(jsonString).map<DayColorType>((e) {
        return DayColorType.fromJson(e);
      }).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveDayColors(List<DayColorType> dayColorEnumsToCache) {
    return secureStorage.write(
        key: _KeysOfStorage.cachedEnumKey,
        value: json.encode(dayColorEnumsToCache));
  }
}
