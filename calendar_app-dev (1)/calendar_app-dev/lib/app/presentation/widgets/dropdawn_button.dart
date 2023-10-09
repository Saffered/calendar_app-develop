import 'package:calendar_app/main.dart';
import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key, required colorController});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 32,
      decoration: BoxDecoration(
          color: const Color(0xffF3F4F6),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<int>(
        value: dropdownValue,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 30,
          color: Color(0xff009FEE),
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (int? colorController) {
          setState(() {
            dropdownValue = colorController!;
          });
        },
        items: list.map<DropdownMenuItem<int>>((int colorController) {
          return DropdownMenuItem<int>(
              value: colorController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Container(
                  height: 20,
                  width: 23,
                  color: Color(colorController).withOpacity(.1),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
