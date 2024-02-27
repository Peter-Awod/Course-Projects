import 'package:flutter/material.dart';
import 'package:tunes_app/home.dart';

void main() {
  runApp( TunesApp());
}

class TunesApp extends StatelessWidget {
  const TunesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}


