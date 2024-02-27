import 'dart:math';


import 'package:flutter/material.dart';

import '../bmi_result/result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;

  double height = 50;
  int age = 0;
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            // First section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale
                                ? Colors.cyan[700]
                                : Colors.blueGrey[600],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !isMale
                                ? Colors.cyan[700]
                                : Colors.blueGrey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Second section
            // Height /////////////////////
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[900],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        // SLIDER ////////////////////
                        Slider(
                            value: height,
                            max: 220,
                            min: 50,
                            activeColor: Colors.blueGrey,
                            secondaryActiveColor: Colors.white,
                            inactiveColor: Colors.blueGrey[200],
                            thumbColor: Colors.cyan[700],
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            }),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey[600],
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Weight /////////////////////////////////
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[600],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[900],
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.cyan[700],
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  heroTag: 'Weight-',
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.cyan[700],
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                  heroTag: 'Weight+',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    // Age ///////////////////////////
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[600],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[900],
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.cyan[700],
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  heroTag: 'Age-',
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.cyan[700],
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add),
                                  heroTag: 'Age+',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.cyan[700],
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height/100, 2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
                      ),
                    ),
                  );
                },
                height: 50,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
