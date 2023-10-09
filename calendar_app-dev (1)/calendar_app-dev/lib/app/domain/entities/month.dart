import 'day.dart';

abstract class MonthAbstract {
  int year = 2023;
  int month = 1;
  List<List<Day>> weekList = List.empty(growable: true);
}

class Month extends MonthAbstract {
  Month({required this.month, required this.year});

  @override
  int month;

  @override
  List<List<Day>> weekList = [];

  @override
  int year;
}
