import 'package:bloc/bloc.dart';
import 'package:counter_app_stlls_vs_stateful/counter_screen.dart';
import 'package:counter_app_stlls_vs_stateful/new_counter_screen.dart';
import 'package:counter_app_stlls_vs_stateful/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
