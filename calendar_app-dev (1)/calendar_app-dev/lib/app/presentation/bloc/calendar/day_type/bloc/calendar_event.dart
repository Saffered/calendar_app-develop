part of 'calendar_bloc.dart';

@freezed
sealed class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.started() = _Started;
  const factory CalendarEvent.getDayColorsTypeEvent(DateTime date) =
      GetDayColorsTypeEvent;
}
