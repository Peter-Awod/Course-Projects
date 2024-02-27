import 'package:flutter/material.dart';

class NewMessengerScreen extends StatelessWidget {
  const NewMessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
            ),
            SizedBox(width: 10),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 25,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.camera_alt,
                size: 28,
                color: Colors.grey[800],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.edit,
                size: 28,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Search
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[200],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Search'),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //Create the list for story using ListView
              //by calling the function buildStoryItem
              Container(
                height: 110,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.0,
                        ),
                    itemCount: 10),
              ),
              SizedBox(
                height: 20,
              ),

              //Create the list for chat using ListView.separated
              //by calling the function buildChatItem
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                  itemCount: 100),
            ],
          ),
        ),
      ),
    );
  }

  // container of story
  // Arrow function
  Widget buildStoryItem() => Container(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 2,
                    end: 2,
                  ),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 2,
                    end: 2,
                  ),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Profile name owner'
              'Profile name owner',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  // Start chat
  Widget buildChatItem() {
    return Row(
      children: [
// Profile picture
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2,
                end: 2,
              ),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2,
                end: 2,
              ),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),

//Column for name and chat
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
// Profile name
            children: [
              Text(
                'Profile name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),

// Chat and time
              Row(
                children: [
//chat
                  Expanded(
                    child: Text(
                      'Hello, this is my flutter project'
                      ' Hello, this is my flutter project'
                      ' Hello, this is my flutter project'
                      ' Hello, this is my flutter project',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
//time+dot
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text('5:00 AM'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
