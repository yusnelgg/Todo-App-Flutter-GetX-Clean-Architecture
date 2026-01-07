import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/repositories/todo_repository_impl.dart';
import 'presentation/controllers/todo_controller.dart';
import 'presentation/pages/todo_page.dart';

void main() {
  // 🔌 Inyección de dependencias
  Get.put(
    TodoController(
      TodoRepositoryImpl(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: TodoPage(),
    );
  }
}
