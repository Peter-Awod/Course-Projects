import 'package:flutter/material.dart';
import 'package:shopify/screens/home/home_screen.dart';
import 'package:shopify/screens/Update/update_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
      HomeScreen.id:(context) => HomeScreen(),
      UpdateProductScreen.id:(context) => UpdateProductScreen(),
    },
      initialRoute: HomeScreen.id,
    );
  }
}


