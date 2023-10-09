import 'package:calendar_app/app/presentation/listener/date_time_value_notifier.dart';
import 'package:calendar_app/app/presentation/pages/calendar_view.dart';
import 'package:calendar_app/controller/controller.dart';
import 'package:calendar_app/core/util/app_setup.dart';
import 'package:calendar_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await AppSetup.setup();
  runApp(const MyApp());
}

List<int> list = <int>[
  0xffEE2B00,
  0xff009FEE,
  0xffEE8F00,
];
final style = GoogleFonts.poppins(
    color: const Color.fromRGBO(150, 150, 150, 1),
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoController>(
        create: (context) => sl<TodoController>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const ArticsPage(),
          home: ValueListenableBuilder<DateTime>(
              valueListenable: sl<DateTimeValueNotifier>(),
              builder: (context, dateTime, _) {
                return CalendarView(
                  dateTime: dateTime,
                );
              }),
        ));
  }
}
