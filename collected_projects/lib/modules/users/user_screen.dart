import 'package:collected_projects/models/user/user_model.dart';
import 'package:flutter/material.dart';



class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
        ID: 1,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 2,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 3,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 4,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 5,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 6,
        Name: 'Peter',
        Phone: '01551256428'
    ),
    UserModel(
        ID: 7,
        Name: 'Peter',
        Phone: '01551256428'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        titleSpacing: 20,
        actions: [
          IconButton(
              onPressed: () {
                print("help");
              },
              icon: Icon(Icons.arrow_back_sharp))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[600],
            ),
          ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blueAccent,
          child: Text(
            '${user.ID}',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:  [
              Text(
                '${user.Name}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${user.Phone}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
