import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku/models/Item_model.dart';

class Numbers extends StatelessWidget {
  List<ItemModel> numbers = [
    ItemModel(
      image: 'assets/images/numbers/number_one.png',
      enName: 'One',
      jpName: 'Ichi',
      sound: 'sounds/numbers/number_one_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_two.png',
      enName: 'Two',
      jpName: 'Ni',
      sound: 'sounds/numbers/number_two_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_three.png',
      enName: 'Three',
      jpName: 'San',
      sound: 'sounds/numbers/number_three_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_four.png',
      enName: 'Four',
      jpName: 'Shi',
      sound: 'sounds/numbers/number_four_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_five.png',
      enName: 'Five',
      jpName: 'Go',
      sound: 'sounds/numbers/number_five_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_six.png',
      enName: 'Six',
      jpName: 'Roku',
      sound: 'sounds/numbers/number_six_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_seven.png',
      enName: 'Seven',
      jpName: 'Sebun',
      sound: 'sounds/numbers/number_seven_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_eight.png',
      enName: 'Eight',
      jpName: 'Hachi',
      sound: 'sounds/numbers/number_eight_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_nine.png',
      enName: 'Nine',
      jpName: 'Kyū',
      sound: 'sounds/numbers/number_nine_sound.mp3',
    ),
    ItemModel(
      image: 'assets/images/numbers/number_ten.png',
      enName: 'Ten',
      jpName: 'Jū',
      sound: 'sounds/numbers/number_ten_sound.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: Color(0xff46322B),
        title: Text('Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 10,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) =>
                numberItemBuilder(number: numbers[index]),
            itemCount: numbers.length,
          ),
        ),
      ),
    );
  }

  Widget numberItemBuilder({required ItemModel number}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        color: Color(0xffEF9235),
        child: Row(
          children: [
            Container(
              width: 100,
              color: Color(0xffFFF6DC),
              child: Image.asset('${number.image}'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${number.enName}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${number.jpName}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                final player=AudioPlayer();
                player.play(AssetSource(number.sound));
              },
              icon: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
