import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<DayColorType>>> getDayColorTypes();
}
