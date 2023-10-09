part of 'calendar_bloc.dart';

@freezed
sealed class CalendarState with _$CalendarState {
  const factory CalendarState.empty() = Empty;
  const factory CalendarState.loading() = LoadingState;
  const factory CalendarState.loaded(List<DayColorType> type) = LoadedState;
  const factory CalendarState.error(String message) = ErrorState;
}
