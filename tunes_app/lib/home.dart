import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  List<String> tunes = [
    'note1.wav',
    'note2.wav',
    'note3.wav',
    'note4.wav',
    'note5.wav',
    'note6.wav',
    'note7.wav',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff253238),
        centerTitle: true,
        title: Text('Flutter tunes'),
      ),
      body: Column(
        children: [
          tuneItem(Colors.red, tunes[0]),
          tuneItem(Colors.orange, tunes[1]),
          tuneItem(Colors.yellow, tunes[2]),
          tuneItem(Colors.green, tunes[3]),
          tuneItem(Colors.blueGrey, tunes[4]),
          tuneItem(Colors.blue, tunes[5]),
          tuneItem(Colors.indigo, tunes[6]),
        ],
      ),
    );
  }

  Widget tuneItem(Color color, String tune) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioPlayer();
          player.play(
            AssetSource(tune),
          );
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
