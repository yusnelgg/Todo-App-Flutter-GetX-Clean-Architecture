import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  List<Todo> getTodos() => _todos;

  @override
  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  @override
  void toggleTodo(int id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = Todo(
        id: _todos[index].id,
        title: _todos[index].title,
        completed: !_todos[index].completed,
      );
    }
  }

  @override
  void deleteTodo(int id) {
    _todos.removeWhere((t) => t.id == id);
  }

  @override
  void updateTodo(int id, String newTitle) {
  final index = _todos.indexWhere((t) => t.id == id);
  if (index != -1) {
    _todos[index] = Todo(
      id: _todos[index].id,
      title: newTitle,
      completed: _todos[index].completed,
    );
  }
}
}
