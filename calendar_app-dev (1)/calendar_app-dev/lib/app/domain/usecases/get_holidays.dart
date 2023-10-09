import 'package:calendar_app/app/domain/entities/remote_days_base.dart';
import 'package:calendar_app/app/domain/repositories/calendar_holiday_repository.dart';
import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/core/usecases/usecase_holiday.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

final class GetHolidays implements UseCaseHoliday<RemoteDaysBase, Params> {
  final CalendarHolidayRepository repository;
  GetHolidays(this.repository);

  @override
  Future<Either<Failure, RemoteDaysBase>> call(Params params) async =>
      await repository.getHolidays(params.month);
}

class Params extends Equatable {
  final String month;
  const Params(this.month);

  @override
  List<Object?> get props => [];
}
