import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.menu_open_outlined),
        title: Text('Home'),
        actions: [
          IconButton(onPressed: (){
            print('you have new notidication');
          }, icon: Icon(Icons.notification_important)),
          IconButton(onPressed: (){
            print('Previous menu');
          }, icon: Icon(Icons.arrow_back_ios))
        ],
      ),
    );
  }
}