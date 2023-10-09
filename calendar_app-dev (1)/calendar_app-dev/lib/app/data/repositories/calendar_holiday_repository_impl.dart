import 'package:calendar_app/app/data/datasources/calendar_remote_data_source.dart';
import 'package:calendar_app/app/domain/entities/remote_days_base.dart';
import 'package:calendar_app/app/domain/repositories/calendar_holiday_repository.dart';
import 'package:calendar_app/core/error/exception.dart';
import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

class CalendarHolidayRepositoryImpl extends CalendarHolidayRepository {
  final CalendarHolidayRemoteDataSource remoteData;
  final NetworkInfo network;
  CalendarHolidayRepositoryImpl(
      {required this.remoteData, required this.network});

  Future<Either<Failure, RemoteDaysBase>> _getColoredDays(
      Function function) async {
    if (await network.isConnected) {
      try {
        final remote = await function();
        return Right<Failure, RemoteDaysBase>(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteDaysBase>> getHolidays(String month) async {
    return await _getColoredDays(() async {
      return await remoteData.getHolidays(month);
    });
  }
}
