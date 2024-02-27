import 'package:echo_chat/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SenderChatBubble extends StatelessWidget {
   const SenderChatBubble({
    super.key, required this.message
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
          top: 8,
        ),
        padding: EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(16),
            bottomEnd: Radius.circular(0),
            topEnd: Radius.circular(16),
            topStart: Radius.circular(16),
          ),
        ),
        child: Text(
          '${message.message}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RecieverChatBubble extends StatelessWidget {
  const RecieverChatBubble({super.key,required this.message});
 final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: 8,
          end: 8,
          top: 8,
        ),
        padding: EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.8),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(0),
            bottomEnd: Radius.circular(16),
            topEnd: Radius.circular(16),
            topStart: Radius.circular(16),
          ),
        ),
        child: Text(
          'I am new user',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

