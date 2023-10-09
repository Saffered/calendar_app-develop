part of 'holiday_bloc.dart';

@freezed
sealed class HolidayState with _$HolidayState {
  const factory HolidayState.initial() = Initial;
  const factory HolidayState.loading() = Loading;
  const factory HolidayState.loaded(List<List<Day>> weeks) = Loaded;
  const factory HolidayState.error(String message) = Error;
}
