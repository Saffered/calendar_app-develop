abstract class DayAbstract {
  int day = 1;
  int weekday = 1;
}

class Day implements DayAbstract {
  @override
  int day = 2;
  @override
  int weekday = 2;
  int month = 1;
  int year = 2023;
  int? color = 0xFF000000;
  int? type = 100;
  Day(
      {required this.day,
      required this.weekday,
      required this.month,
      required this.year,
      this.color,
      this.type});

  Day.withWeekIndex(
      {required this.day,
      required this.weekday,
      required this.month,
      required this.year,
      required int weekIndex,
      this.color,
      this.type}) {
    if (weekIndex == 0 && day > 7) month = -1;
    if (weekIndex > 3 && day < 7) month += 1;
  }

  Day.today()
      : this(
          day: DateTime.now().day,
          weekday: DateTime.now().weekday,
          month: DateTime.now().month,
          year: DateTime.now().year,
        );

  Day copyWith(
      {int? day, int? weekday, int? month, int? year, int? color, int? type}) {
    return Day(
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      color: color ?? this.color,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return '''
Day($day-$month-$year   type: $type)

''';
  }
}

class DateTileData extends Day {
  int? weekIndex;

  DateTileData(
      {required int dayNumber,
      required int weekDayNumber,
      required int monthNumber,
      required int yearNumber,
      required int weekIndex,
      int? color,
      int? type})
      : super.withWeekIndex(
            day: dayNumber,
            weekday: weekDayNumber,
            month: monthNumber,
            year: yearNumber,
            weekIndex: weekIndex,
            color: color,
            type: type);
}

extension ConvertDayToDateTime on Day {
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }
}
