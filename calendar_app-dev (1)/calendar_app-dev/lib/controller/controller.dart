import 'package:calendar_app/app/data/datasources/key_value_storage.dart';
import 'package:calendar_app/app/domain/entities/day.dart';
import 'package:calendar_app/injection_container.dart';
import 'package:calendar_app/models/model.dart';
import 'package:calendar_app/models/todo_cm.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class TodoController with ChangeNotifier {
  final List<Todo> _items = [];
  final KeyValueStorage _storage = sl<KeyValueStorage>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController locController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final bool isLoading = false;

  late final Box box;
  List<Todo> get todos => _items;
  void init(Day day) async {
    try {
      box = await _storage.createTodoBox();
      final TodoListPageCM todoListPage = box.get(day.toDateTime().toString());
      _items.addAll(todoListPage.list);
      debugPrint("_items: $_items");
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void loadEvents(Day day) async {
    try {
      final todoListCM = await box.get(day.toDateTime().toString());
      debugPrint("_items: $todoListCM");

      _items.clear();
      _items.addAll(todoListCM.list);

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void createTodo(Day day) async {
    final title = timeController.text;
    final description = descController.text;
    final time = timeController.text;
    final location = locController.text;
    if (title.isEmpty ||
        description.isEmpty ||
        time.isEmpty ||
        location.isEmpty) return;

    final todo = Todo(
        id: day.toDateTime().toString(),
        color: 0xff00000,
        location: location,
        time: time,
        title: title,
        description: description,
        isCompleted: false);
    _items.add(todo);
    await saveTodoToStorage(day);
    clearData();
    notifyListeners();
  }

  void clearData() {
    titleController.clear();
    descController.clear();
    locController.clear();
    colorController.clear();
    timeController.clear();
  }

  Future<void> saveTodoToStorage(Day day) async {
    try {
      box.put(day.toDateTime().toString(), TodoListPageCM(list: _items));
      debugPrint("SAved");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Todo updateTodo(
    String id,
    String title,
    String description,
    int color,
    String location,
    String time,
  ) {
    final todoIndex = _items.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      final todo = _items[todoIndex];
      todo.title = title;
      todo.description = description;
      todo.color = color;
      todo.location = location;
      todo.time = time;
      notifyListeners();
      return todo;
    }
    return Todo(
        id: id,
        color: color,
        location: location,
        time: time,
        title: title,
        description: description,
        isCompleted: true);
  }

  void deleteTodo(Todo todo) {
    _items.remove(todo);
    notifyListeners();
  }

  void completeTodo(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  List<Todo> get todosList => _items;
}
