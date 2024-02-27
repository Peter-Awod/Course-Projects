import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  Function(String)? onChanged;
  CustomTextField({required this.hintText,this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
      onChanged: onChanged,
      validator: (value){
        if(value!.isEmpty){
          return 'Too Short';
        }
      },
    );
  }
}
