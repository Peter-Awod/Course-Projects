import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {


  final bool isMale;
  final int result;
  final int age;

  BMIResult({
    required this.isMale,
    required this.age,
    required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text('BMI Result'),
      ),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            Expanded(
                child: Container(
                )),

            //  //  //                 \\  \\  \\
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Gender : ${isMale ? 'Male' : 'Female'}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Result : $result',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Age : $age',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
                )),

            //// Back Button
            Container(
              width: double.infinity,
              color: Colors.cyan[700],
              child: MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                height: 50,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
