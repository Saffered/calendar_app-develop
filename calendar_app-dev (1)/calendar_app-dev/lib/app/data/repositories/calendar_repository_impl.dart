import 'package:calendar_app/app/data/datasources/calendar_local_data_source.dart';
import 'package:calendar_app/app/data/datasources/calendar_remote_data_source.dart';
import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/app/domain/repositories/calendar_repository.dart';
import 'package:calendar_app/core/error/exception.dart';
import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

typedef _CalendarFunction = Future<List<DayColorType>> Function();

class CalendarRepositoryImpl extends CalendarRepository {
  final CalendarLocalDataSource localData;
  final CalendarRemoteDataSource remoteData;
  final NetworkInfo network;
  CalendarRepositoryImpl(
      {required this.localData,
      required this.remoteData,
      required this.network});

  Future<Either<Failure, List<DayColorType>>> _getColorEnum(
      _CalendarFunction function) async {
    if (await network.isConnected) {
      try {
        final remote = await function();
        await localData.saveDayColors(remote);
        return Right<Failure, List<DayColorType>>(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await localData.getSavedColorTypes();
        return Right(local);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<DayColorType>>> getDayColorTypes() async {
    return await _getColorEnum(() async {
      return await remoteData.getDayColorTypes();
    });
  }
}
