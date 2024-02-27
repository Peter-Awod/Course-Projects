import 'package:flutter/material.dart';

import 'colors.dart';
import 'family_members.dart';
import 'numbers.dart';
import 'phrases.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: Color(0xff46322B),
        title: Text('Toku'),
      ),
      body: Column(
        children: [
          Category(
              text: 'Numbers',
              color: Color(0xffEF9235),
              context: context,
              widget: Numbers()),
          Category(
            text: 'Family members',
            color: Color(0xff558B37),
            context: context,
            widget: FamilyMembers(),
          ),
          Category(
            text: 'Colors',
            color: Color(0xff79359F),
            context: context,
            widget: ColorsScreen(),
          ),
          Category(
            text: 'Phrases',
            color: Color(0xff50ADC7),
            context: context,
            widget: Phrases(),
          ),
        ],
      ),
    );
  }

  Widget Category(
          {required String text,
          required Color color,
          required BuildContext context,
          required widget}) =>
      Card(
        color: color,
        child: ListTile(
          onTap: () {
            print('Tapped');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return widget;
                },
              ),
            );
          },
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      );
}
