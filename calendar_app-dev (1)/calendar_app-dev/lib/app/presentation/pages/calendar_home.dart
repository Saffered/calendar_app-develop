import 'package:calendar_app/app/presentation/bloc/calendar/day_type/bloc/calendar_bloc.dart';
import 'package:calendar_app/app/presentation/listener/date_time_value_notifier.dart';
import 'package:calendar_app/app/presentation/pages/calendar_page.dart';
import 'package:calendar_app/app/presentation/widgets/loading_widget.dart';
import 'package:calendar_app/app/presentation/widgets/message_widget.dart';
import 'package:calendar_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/calendar/holiday/bloc/holiday_bloc.dart';

class CalendarHomePage extends StatelessWidget {
  final DateTime dateTime;
  const CalendarHomePage({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //#appBar
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  builder: (_) => SizedBox(
                        height: MediaQuery.sizeOf(context).height * .4,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: CupertinoDatePicker(
                                  initialDateTime:
                                      sl<DateTimeValueNotifier>().value,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (dateTime) {
                                    sl<DateTimeValueNotifier>()
                                        .setDateTime(dateTime);
                                  }),
                            ),
                            Expanded(
                              flex: 1,
                              child: CupertinoButton.filled(
                                  onPressed: () {
                                    BlocProvider.of<HolidayBloc>(context)
                                        .add(GetRefreshHolidaysEvent(dateTime));
                                    debugPrint('SELECTEDDDDD');
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Select')),
                            ),
                            const Spacer(
                              flex: 1,
                            )
                          ],
                        ),
                      ));
            },
            child: Text(DateFormat.yMMMM().format(dateTime))),
        actions: const [
          Stack(
            children: [
              Positioned(
                left: 21,
                top: 5,
                child: Badge(
                  backgroundColor: Colors.blue,
                  smallSize: 10,
                ),
              ),
              Icon(
                Icons.notifications,
                size: 33,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) => switch (state) {
              Empty() => const MessageWidget("Start searching ..."),
              ErrorState(message: var message) =>
                MessageWidget("ERROR:$message"),
              LoadingState() => const LoadingWidget(),
              // ignore: unused_local_variable
              LoadedState(type: var type) => CalendarPage(
                  dateTime: dateTime,
                ),
            },
          ),
        ),
      ),
    );
  }
}
