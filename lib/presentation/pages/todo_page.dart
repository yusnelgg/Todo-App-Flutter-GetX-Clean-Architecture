import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../../domain/entities/todo.dart';

class TodoPage extends StatelessWidget {
  final controller = Get.find<TodoController>();

  Color getTodoColor(Todo todo) {
  return todo.completed
      ? Colors.green.withOpacity(0.15)
      : Colors.blue.withOpacity(0.15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: Obx(
        () => ListView(
          children: controller.todos.map((todo) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: getTodoColor(todo),
                borderRadius: BorderRadius.circular(14),
              ),
             child: ListTile(
              title: Text(todo.title),
              onTap: () => showEditDialog(todo),
              leading: Checkbox(
                value: todo.completed,
                onChanged: (_) => controller.toggleTodo(todo.id),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.deleteTodo(todo.id),
              ),
            ));          
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addTodo('Nueva tarea'),
        child: const Icon(Icons.add),
      ),
    );
  }

  void showEditDialog(Todo todo) {
  final textController = TextEditingController(text: todo.title);

  Get.defaultDialog(
    title: 'Editar tarea',
    content: TextField(
      controller: textController,
      decoration: const InputDecoration(
        hintText: 'Nuevo nombre',
      ),
    ),
    textConfirm: 'Guardar',
    textCancel: 'Cancelar',
    onConfirm: () {
      controller.updateTodo(todo.id, textController.text);
      Get.back();
    },
  );
}
}