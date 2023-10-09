import 'package:calendar_app/app/domain/entities/day.dart';
import 'package:calendar_app/app/presentation/pages/detail_page.dart';
import 'package:calendar_app/controller/controller.dart';
import 'package:calendar_app/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  final Day day;
  const TodoPage({Key? key, required this.day}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    Future.microtask(() => context.read<TodoController>().init(widget.day));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoController>(
        builder: (context, controller, _) {
          final todos = controller.todosList;
          if (todos.isEmpty) return const Center(child: Text('No Todos'));
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ItemView(
                todo: todo,
              );
            },
          );
        },
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final Todo todo;
  const ItemView({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (_) => Detail(todo: todo)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        height: 110,
        width: 319,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff009FEE),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: 10,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(todo.color),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: GoogleFonts.poppins(
                          color: const Color(0xff056EA1),
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      todo.description,
                      style: GoogleFonts.poppins(
                          color: const Color(0xff056EA1),
                          fontSize: 8,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_rounded,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              todo.time,
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff056EA1),
                                  fontSize: 10,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                todo.location,
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff056EA1),
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
