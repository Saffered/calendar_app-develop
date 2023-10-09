// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoListPageCMAdapter extends TypeAdapter<TodoListPageCM> {
  @override
  final int typeId = 1;

  @override
  TodoListPageCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoListPageCM(
      list: (fields[0] as List).cast<Todo>(),
    );
  }

  @override
  void write(BinaryWriter writer, TodoListPageCM obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListPageCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
