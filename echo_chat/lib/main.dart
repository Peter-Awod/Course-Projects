import 'package:echo_chat/modules/chat/chat.dart';
import 'package:echo_chat/modules/login/login.dart';
import 'package:echo_chat/modules/register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EchoChat());
}

class EchoChat extends StatelessWidget {
  const EchoChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterScreen.id:(context) => RegisterScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,

    );
  }
}

