import 'package:calendar_app/app/domain/entities/day.dart';
import 'package:calendar_app/app/presentation/bloc/calendar/holiday/bloc/holiday_bloc.dart';
import 'package:calendar_app/app/presentation/pages/add_event_view.dart';
import 'package:calendar_app/app/presentation/widgets/loading_widget.dart';
import 'package:calendar_app/app/presentation/widgets/message_widget.dart';
import 'package:calendar_app/controller/controller.dart';
import 'package:calendar_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_event.dart';

class CalendarPage extends StatefulWidget {
  final DateTime dateTime;
  const CalendarPage({
    super.key,
    required this.dateTime,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Day selecteddaytime = Day(day: 1, weekday: 3, month: 1, year: 2003);

  void onselectedday(Day day) {
    selecteddaytime = day;
    context.read<TodoController>().loadEvents(selecteddaytime);
    setState(() {});
  }

  void getHolidays() {
    Future.microtask(() =>
        context.read<HolidayBloc>().add(GetHolidaysEvent(widget.dateTime)));
  }

  @override
  void initState() {
    getHolidays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BUILDDDD');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          //#showSeptember
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "September",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff056EA1),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                            color: const Color(0xffefefef),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                  "assets/icons/left_arrow_back.png")),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                            color: const Color(0xffefefef),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child:
                              Image.asset("assets/icons/right_arrow_back.png"),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          //? claendar header vidjet
          const _CalendarHeaderWidget(),
          //? calendar body widget
          BlocBuilder<HolidayBloc, HolidayState>(
            builder: (context, state) => switch (state) {
              Initial() => const MessageWidget("Start searching ..."),
              Error(message: var message) => MessageWidget("ERROR:$message"),
              Loading() => const LoadingWidget(),
              Loaded(weeks: var weeks) => SizedBox(
                    child: _CalendarBodyWidget(
                  weeks: weeks,
                  onselected: onselectedday,
                  selectedday: selecteddaytime,
                ))
            },
          ),
          //#showSchedule
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Schedule",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff292929),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ),
                  //#addEventButton
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detail(
                              day: selecteddaytime,
                            ))),
                    child: Container(
                      height: 32,
                      width: 102,
                      decoration: BoxDecoration(
                          color: const Color(0xff009FEE),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "+ Add Event",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 18,
          ),

          Expanded(
            child: TodoPage(
              day: selecteddaytime,
            ),
          )
        ],
      ),
    ));
  }
}

class _CalendarHeaderWidget extends StatelessWidget {
  const _CalendarHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Mon', style: style),
        Text('Tue', style: style),
        Text('Wed', style: style),
        Text('Thu', style: style),
        Text('Fri', style: style),
        Text('Sat', style: style),
        Text('Sun', style: style),
      ],
    );
  }
}

class _CalendarBodyWidget extends StatefulWidget {
  final List<List<Day>> weeks;
  final ValueChanged<Day> onselected;
  final Day selectedday;
  const _CalendarBodyWidget(
      {required this.weeks,
      required this.onselected,
      required this.selectedday});

  @override
  State<_CalendarBodyWidget> createState() => _CalendarBodyWidgetState();
}

class _CalendarBodyWidgetState extends State<_CalendarBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.weeks.length,
        itemBuilder: (context, index) {
          var week = widget.weeks[index];
          return SizedBox(
            height: MediaQuery.sizeOf(context).width / 7,
            child: _CalendarBodyItemWidget(
              dayList: week,
              selectedday: widget.selectedday,
              onselected: widget.onselected,
            ),
          );
        },
      ),
    );
  }
}

class _CalendarBodyItemWidget extends StatefulWidget {
  final List<Day> dayList;
  final ValueChanged<Day> onselected;
  final Day selectedday;
  const _CalendarBodyItemWidget(
      {required this.dayList,
      required this.onselected,
      required this.selectedday});

  @override
  State<_CalendarBodyItemWidget> createState() =>
      _CalendarBodyItemWidgetState();
}

class _CalendarBodyItemWidgetState extends State<_CalendarBodyItemWidget> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.dayList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final day = widget.dayList[index];
            return switch (day.day) {
              0 => SizedBox(
                  width: MediaQuery.sizeOf(context).width / 7,
                  height: MediaQuery.sizeOf(context).width / 7),
              _ => Container(
                  color: widget.selectedday == day
                      ? Colors.blue
                      : Colors.transparent,
                  width: MediaQuery.sizeOf(context).width / 7,
                  height: MediaQuery.sizeOf(context).width / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        widget.onselected(day);
                      },
                      // onTap: () => showInfoDay(day),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: Color(0xff292929)),
                        ),
                      ),
                    ),
                  ),
                ),
            };
          }),
    );
  }

  void showInfoDay(Day day) => debugPrint(day.toString());
}
