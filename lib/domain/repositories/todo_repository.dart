import '../entities/todo.dart';


abstract class TodoRepository {
  List<Todo> getTodos();
  void addTodo(Todo todo);
  void toggleTodo(int id);
  void deleteTodo(int id);
  void updateTodo(int id, String newTitle);
}