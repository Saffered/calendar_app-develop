import 'package:bloc/bloc.dart';
import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/app/domain/usecases/get_day_color_types.dart';
import 'package:calendar_app/core/util/color_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetDayColors dayColors;
  final ColorConverter colorConverter;
  CalendarBloc({required this.colorConverter, required this.dayColors})
      : super(const Empty()) {
    on<CalendarEvent>(onCalendarEvent);
  }

  void onCalendarEvent(event, emit) async {
    if (event is GetDayColorsTypeEvent) {
      emit(const LoadingState());
      try {
        final dayEnum = await dayColors(const NoParams());
        CalendarState state = dayEnum
            .fold<CalendarState>((fail) => ErrorState("fail:$fail"), (data) {
          return CalendarState.loaded(data);
        });
        emit(state);
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    }
  }
}
