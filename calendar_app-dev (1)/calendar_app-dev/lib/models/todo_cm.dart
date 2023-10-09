import 'package:calendar_app/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo_cm.g.dart';

@HiveType(typeId: 1)
class TodoListPageCM extends HiveObject with EquatableMixin {
  @HiveField(0)
  final List<Todo> list;

  TodoListPageCM({required this.list});

  @override
  List<Object?> get props => [
        list,
      ];
}
