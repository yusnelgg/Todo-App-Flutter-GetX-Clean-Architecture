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
              trailing: Row(
                mainAxisSize: MainAxisSize.min, // 👈 CLAVE
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.deleteTodo(todo.id),
                  ),
                  IconButton(
                    onPressed: () => controller.toggleFavorite(todo.id),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        todo.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        key: ValueKey(todo.isFavorite), // 👈 CLAVE
                        color: todo.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ));          
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCreateDialog(),
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

void showCreateDialog() {
  final textController = TextEditingController();

  Get.defaultDialog(
    title: 'Crear tarea',
    content: TextField(
      controller: textController,
      decoration: const InputDecoration(
        hintText: 'Nuevo nombre',
      ),
    ),
    textConfirm: 'Guardar',
    textCancel: 'Cancelar',
    onConfirm: () {
      controller.addTodo(textController.text);
      Get.back();
    },
  );
}
}