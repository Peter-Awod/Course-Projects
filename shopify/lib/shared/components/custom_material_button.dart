import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
   CustomMaterialButton({required this.onPressed,required this.buttonName});

   VoidCallback?onPressed;
  String buttonName;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        color: Colors.grey[300],
        height: 70,
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 24,color: Colors.black54),
        ),
      ),
    );
  }
}
