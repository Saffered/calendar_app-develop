import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/app/domain/entities/remote_days_base.dart';
import 'package:calendar_app/core/error/exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract interface class CalendarRemoteDataSource {
  Future<List<DayColorType>> getDayColorTypes();
}

abstract interface class CalendarHolidayRemoteDataSource {
  Future<RemoteDaysBase> getHolidays(String month);
}

class CalendarRemoteDataSourceImpl
    implements CalendarRemoteDataSource, CalendarHolidayRemoteDataSource {
  late final Dio dio;
  final http.Client client;
  CalendarRemoteDataSourceImpl({required this.dio, required this.client});
  Future<List<DayColorType>> _getDayColorFromUrl(String url) async {
    final responseData = await dio.getUri(
      Uri.parse(url),
    );
    if (responseData.statusCode == 200) {
      var data = responseData.data
          .map((e) {
            debugPrint('$e');
            debugPrint(e.runtimeType.toString());
            return DayColorType.fromJson(e as Map<String, dynamic>);
          })
          .toList()
          .cast<DayColorType>();
      return data;
    } else {
      throw ServerException();
    }
  }

  Future<RemoteDaysBase> _getHolidaysFromUrl(String url) async {
    final responseData = await dio.getUri<Map<String, dynamic>>(
      Uri.parse(url),
    );

    if (responseData.statusCode == 200) {
      return RemoteDaysBase.fromJson(responseData.data!);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DayColorType>> getDayColorTypes() async =>
      await _getDayColorFromUrl("https://jsonkeeper.com/$version/I86U");

  @override
  Future<RemoteDaysBase> getHolidays(String month) async =>
      await _getHolidaysFromUrl('https://jsonkeeper.com/$version/$month');

  String version = 'b';
}
