import 'package:echo_chat/shared/constants.dart';

class MessageModel{
  final String message;
  final String emailAddress;

  MessageModel({required this.message, required this.emailAddress});

  factory MessageModel.fromJson(json){

    return MessageModel(message: json[kMessage],emailAddress: json[kEmailAddress]);
  }

}