import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject with EquatableMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String location;
  @HiveField(4)
  int color;
  @HiveField(5)
  String time;
  @HiveField(6)
  bool isCompleted;

  Todo(
      {required this.id,
      required this.color,
      required this.location,
      required this.time,
      required this.title,
      required this.description,
      required this.isCompleted});

  @override
  List<Object?> get props => [
        id,
      ];
}
