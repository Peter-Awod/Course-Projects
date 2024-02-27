import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/layout/todo_home_layout.dart';
import 'package:todo_app_sqflite/layout/todo_new_home_layout.dart';
import 'package:todo_app_sqflite/shared/bloc_observer.dart';
import 'package:bloc/bloc.dart';

void main() {

  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewHomeLayoutScreen(),
    );
  }
}
