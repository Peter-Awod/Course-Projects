import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Points Counter'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Team A',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$teamAPoints',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.black,
                          fontSize: 150,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamAPoints += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 1 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamAPoints += 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 2 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamAPoints += 3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 3 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Team B',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$teamBPoints',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.black,
                          fontSize: 150,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamBPoints += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 1 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamBPoints += 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 2 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        teamBPoints += 3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: Size(20, 50),
                    ),
                    child: Text(
                      'Add 3 point',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                teamAPoints = 0;
                teamBPoints = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(200, 50),
            ),
            child: Text(
              'Reset',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
