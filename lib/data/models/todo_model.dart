import '../../domain/entities/todo.dart';


class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    required super.completed,
  });
}