import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: Text(
                    'Decrease',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Text(
                    'Increase',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
            child: Text(
              'Reset',
              style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
