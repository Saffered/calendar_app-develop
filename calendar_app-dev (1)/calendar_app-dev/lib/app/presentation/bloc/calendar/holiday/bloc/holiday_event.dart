part of 'holiday_bloc.dart';

@freezed
class HolidayEvent with _$HolidayEvent {
  const factory HolidayEvent.started() = _Started;
  const factory HolidayEvent.getHolidaysEvent(DateTime date) = GetHolidaysEvent;
  const factory HolidayEvent.getRefreshEvent(DateTime date) =
      GetRefreshHolidaysEvent;
}
