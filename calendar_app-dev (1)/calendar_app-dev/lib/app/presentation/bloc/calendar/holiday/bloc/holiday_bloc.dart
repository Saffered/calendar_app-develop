import 'package:bloc/bloc.dart';
import 'package:calendar_app/app/data/datasources/calendar_local_data_source.dart';
import 'package:calendar_app/app/domain/entities/day.dart';
import 'package:calendar_app/app/domain/entities/day_color_type.dart';
import 'package:calendar_app/app/domain/entities/remote_days_base.dart';
import 'package:calendar_app/app/domain/usecases/get_holidays.dart';
import 'package:calendar_app/core/util/color_converter.dart';
import 'package:calendar_app/core/util/date_time_to_weekList_converter.dart';
import 'package:calendar_app/injection_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_bloc.freezed.dart';
part 'holiday_event.dart';
part 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final GetHolidays holidays;
  final ColorConverter colorConverter;
  final DateTimeToWeekListConverter weekListConverter;
  final CalendarLocalDataSource calendarLocalDataSource =
      sl<CalendarLocalDataSource>();
  HolidayBloc(
      {required this.colorConverter,
      required this.holidays,
      required this.weekListConverter})
      : super(const Initial()) {
    on<HolidayEvent>(onHolidayEvent);
  }

  void onHolidayEvent(event, emit) async {
    if (event is GetHolidaysEvent) {
      await _onLoad(event, emit);
    } else if (event is GetRefreshHolidaysEvent) {
      await _onRefresh(event, emit);
    }
  }

  Future<void> _onLoad(GetHolidaysEvent event, emit) async {
    emit(const Loading());
    try {
      //event.date ni paramsga beramiz
      var params = const Params('92TT');
      final dayEnum = await holidays(params);
      HolidayState state = await dayEnum.fold<Future<HolidayState>>(
          (fail) => Future.value(Error("fail:$fail")), (date) async {
        var weekList = await _convert(
          daysBase: date,
          dateTime: event.date,
        );
        return HolidayState.loaded(weekList);
      });
      emit(state);
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<void> _onRefresh(GetRefreshHolidaysEvent event, emit) async {
    emit(const Loading());
    try {
      //event.date ni paramsga beramiz
      var params = const Params('92TT');
      final dayEnum = await holidays(params);
      HolidayState state = await dayEnum.fold<Future<HolidayState>>(
          (fail) => Future.value(Error("fail:$fail")), (date) async {
        var weekList = await _convert(daysBase: date, dateTime: event.date);
        return HolidayState.loaded(weekList);
      });
      emit(state);
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<List<List<Day>>> _convert(
      {required RemoteDaysBase daysBase, required DateTime dateTime}) async {
    final List<DayColorType> dayColorEnum =
        await calendarLocalDataSource.getSavedColorTypes();
    var weekList = weekListConverter
        .dateTimeToDay(
            dateTime: dateTime,
            coloredDaysBase: daysBase,
            colorEnumList: dayColorEnum)
        .fold<List<List<Day>>>((fail) {
      return List.empty();
    }, (weekList) => weekList);
    return weekList;
  }
}
