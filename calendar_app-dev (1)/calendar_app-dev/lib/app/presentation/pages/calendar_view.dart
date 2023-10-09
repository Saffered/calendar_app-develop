import 'package:calendar_app/app/presentation/bloc/calendar/day_type/bloc/calendar_bloc.dart';
import 'package:calendar_app/app/presentation/bloc/calendar/holiday/bloc/holiday_bloc.dart';
import 'package:calendar_app/app/presentation/pages/calendar_home.dart';
import 'package:calendar_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarView extends StatelessWidget {
  final DateTime dateTime;
  const CalendarView({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalendarBloc>(
          create: (_) => sl<CalendarBloc>()
            ..add(
              GetDayColorsTypeEvent(dateTime),
            ),
          lazy: false,
        ),
        BlocProvider<HolidayBloc>(
          create: (context) => sl<HolidayBloc>(),
        ),
      ],
      child: CalendarHomePage(
        dateTime: dateTime,
      ),
    );
  }
}
