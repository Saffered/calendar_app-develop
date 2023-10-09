import 'package:calendar_app/app/data/datasources/calendar_local_data_source.dart';
import 'package:calendar_app/app/data/datasources/calendar_remote_data_source.dart';
import 'package:calendar_app/app/data/datasources/key_value_storage.dart';
import 'package:calendar_app/app/data/repositories/calendar_holiday_repository_impl.dart';
import 'package:calendar_app/app/data/repositories/calendar_repository_impl.dart';
import 'package:calendar_app/app/domain/repositories/calendar_holiday_repository.dart';
import 'package:calendar_app/app/domain/repositories/calendar_repository.dart';
import 'package:calendar_app/app/domain/usecases/get_day_color_types.dart';
import 'package:calendar_app/app/domain/usecases/get_holidays.dart';
import 'package:calendar_app/app/presentation/bloc/calendar/day_type/bloc/calendar_bloc.dart';
import 'package:calendar_app/app/presentation/bloc/calendar/holiday/bloc/holiday_bloc.dart';
import 'package:calendar_app/app/presentation/listener/date_time_value_notifier.dart';
import 'package:calendar_app/controller/controller.dart';
import 'package:calendar_app/core/network/network_info.dart';
import 'package:calendar_app/core/util/color_converter.dart';
import 'package:calendar_app/core/util/date_time_to_weekList_converter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory(() => CalendarBloc(
        colorConverter: sl(),
        dayColors: sl(),
      ));

  sl.registerFactory(() => HolidayBloc(
      holidays: sl(), colorConverter: sl(), weekListConverter: sl()));
  sl.registerFactory<TodoController>(() => TodoController());
  sl.registerLazySingleton(() => GetHolidays(sl()));
  sl.registerLazySingleton(() => GetDayColors(sl()));

  sl.registerLazySingleton<CalendarHolidayRepository>(
      () => CalendarHolidayRepositoryImpl(remoteData: sl(), network: sl()));

  sl.registerLazySingleton<CalendarRepository>(() =>
      CalendarRepositoryImpl(localData: sl(), remoteData: sl(), network: sl()));

  sl.registerLazySingleton<CalendarHolidayRemoteDataSource>(
      () => CalendarRemoteDataSourceImpl(dio: sl(), client: sl()));
  sl.registerLazySingleton<CalendarRemoteDataSource>(
      () => CalendarRemoteDataSourceImpl(dio: sl(), client: sl()));

  sl.registerLazySingleton<CalendarLocalDataSource>(
      () => CalendarLocalDataSourceImpl(secureStorage: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ColorConverter>(() => ColorConverter());

  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  sl.registerLazySingleton<KeyValueStorage>(() => KeyValueStorage());
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      followRedirects: false,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60)))
    ..interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
      ),
    ));

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<DateTimeToWeekListConverter>(
      () => DateTimeToWeekListConverter());

  sl.registerSingleton<DateTimeValueNotifier>(
      DateTimeValueNotifier(DateTime(2023, 8)));
}
