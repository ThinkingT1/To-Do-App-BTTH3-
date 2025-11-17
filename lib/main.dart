import 'package:flutter/material.dart';
// 1. Import your TaskData class
import 'package:flutter_application_1/models/task_data.dart'; // Check your path!
// 2. Import the Provider package
import 'package:provider/provider.dart';
// 3. Import your TasksScreen
import 'package:flutter_application_1/screens/tasks_screen.dart'; // Check your path!

void main() {
  // 4. Wrap your app in the provider
  runApp(
    ChangeNotifierProvider(
      // Create the single instance of your "brain"
      create: (context) => TaskData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The home screen of your app
      home: TasksScreen(),
    );
  }
}