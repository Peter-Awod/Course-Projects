import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/Item_model.dart';

class FamilyMembers extends StatelessWidget {
  List<ItemModel> familyMembers =[
    ItemModel(
      sound: 'sounds/family_members/father.wav',
      jpName: 'chich',
      enName: 'father',
      image: 'assets/images/family_members/family_father.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/mother.wav',
      jpName: 'Ni',
      enName: 'Mother',
      image: 'assets/images/family_members/family_mother.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/daughter.wav',
      jpName: 'San',
      enName: 'Daughter',
      image: 'assets/images/family_members/family_daughter.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/grand father.wav',
      jpName: 'Shi',
      enName: 'Grandfather',
      image: 'assets/images/family_members/family_grandfather.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/grand mother.wav',
      jpName: 'Go',
      enName: 'Grandmother',
      image: 'assets/images/family_members/family_grandmother.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/older bother.wav',
      jpName: 'Roku',
      enName: 'Older-Brother',
      image: 'assets/images/family_members/family_older_brother.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/older sister.wav',
      jpName: 'Sebun',
      enName: 'Older-Sister',
      image: 'assets/images/family_members/family_older_sister.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/son.wav',
      jpName: 'hachi',
      enName: 'Son',
      image: 'assets/images/family_members/family_son.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/younger brohter.wav',
      jpName: 'Kyū',
      enName: 'Younger-Brother',
      image: 'assets/images/family_members/family_younger_brother.png',
    ),
    ItemModel(
      sound: 'sounds/family_members/younger sister.wav',
      jpName: 'Jū',
      enName: 'Younger-Sister',
      image: 'assets/images/family_members/family_younger_sister.png',
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
                familyMemberItemBuilder(familyMember: familyMembers[index]),
            itemCount: familyMembers.length,
          ),
        ),
      ),
    );
  }

  Widget familyMemberItemBuilder({required ItemModel familyMember}) {
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
              child: Image.asset('${familyMember.image}'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${familyMember.enName}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${familyMember.jpName}',
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
                player.play(AssetSource(familyMember.sound));
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
