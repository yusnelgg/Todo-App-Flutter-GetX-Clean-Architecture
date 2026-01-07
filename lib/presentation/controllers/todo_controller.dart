import 'package:get/get.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoController extends GetxController {
  final TodoRepository repository;

  TodoController(this.repository);

  final todos = <Todo>[].obs;

  @override
  void onInit() {
    todos.value = repository.getTodos();
    super.onInit();
  }

  void addTodo(String title) {
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      completed: false,
    );

    repository.addTodo(todo);
    todos.refresh();
  }

  void toggleTodo(int id) {
    repository.toggleTodo(id);
    todos.refresh();
  }

  void deleteTodo(int id) {
    repository.deleteTodo(id);
    todos.refresh();
  }

  void updateTodo(int id, String newTitle) {
    repository.updateTodo(id, newTitle);
    todos.refresh();
  }
}
