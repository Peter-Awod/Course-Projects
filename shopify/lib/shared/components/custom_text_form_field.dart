import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  Function(String)? onChanged;
  TextInputType? inputType=TextInputType.text;
  CustomTextFormField({required this.hintText,this.onChanged,this.inputType,});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
              ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
      onChanged: onChanged,
      // validator: (value){
      //   if(value!.isEmpty){
      //     return 'Too Short';
      //   }
      // },
    );
  }
}
