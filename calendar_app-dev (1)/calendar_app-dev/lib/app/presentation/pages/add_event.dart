import 'package:calendar_app/app/domain/entities/day.dart';
import 'package:calendar_app/app/presentation/widgets/dropdawn_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/controller.dart';

class Detail extends StatelessWidget {
  final Day day;
  const Detail({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoController>(builder: (context, provider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //#eventName
                  Text(
                    "Event name",
                    style: GoogleFonts.roboto(
                        color: const Color(0xff111827),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      controller: provider.titleController,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 25),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //#eventDescription
                  Text(
                    "Event description",
                    style: GoogleFonts.roboto(
                        color: const Color(0xff111827),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 92,
                    child: TextField(
                      controller: provider.descController,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 25),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //#eventLocation
                  Text(
                    "Event location",
                    style: GoogleFonts.roboto(
                        color: const Color(0xff111827),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      controller: provider.locController,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 25),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  //#eventColor
                  Text(
                    "Priority color",
                    style: GoogleFonts.roboto(
                        color: const Color(0xff111827),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButtonExample(
                    colorController: provider.colorController,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Event time",
                    style: GoogleFonts.roboto(
                        color: const Color(0xff111827),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      controller: provider.timeController,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 25),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.createTodo(day);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff009FEE),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
