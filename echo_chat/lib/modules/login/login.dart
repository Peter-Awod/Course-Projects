import 'package:echo_chat/modules/chat/chat.dart';
import 'package:echo_chat/modules/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/constants.dart';
import '../../shared/widgets/custom_material_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  var formKey = GlobalKey<FormState>();

  String? emailAddress;

  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogoPath,
                      height: 100,
                    ),
                    Text(
                      'ECHO CHAT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      onChanged: (emailAddressValue) {
                        emailAddress = emailAddressValue;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      onChanged: (passwordValue) {
                        password = passwordValue;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomMaterialButton(
                      buttonName: 'LOGIN',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailAddress!,
                              password: password!,
                            );
                            showSnackBar(
                              context: context,
                              message: 'Successfully login .',

                            );
                            Navigator.pushNamed(context, ChatScreen.id,arguments: emailAddress);
                          } on FirebaseAuthException catch (e) {
                            print('message error ${e.code}');
                            print('message error ${e.credential}');
                            if (e.code == 'wrong-password') {
                              showSnackBar(
                                context: context,
                                message:
                                    'Wrong password provided for that user.',
                              );
                              print("Wrong password provided for that user.");
                            } else if (e.code == 'user-not-found') {
                              showSnackBar(
                                context: context,
                                message: 'No user found for that email.',
                              );
                            }
                          } catch (e) {
                            showSnackBar(
                              context: context,
                              message: 'There was an error.',
                            );
                            print('meddssage erorr: ${e.toString()}');
                          }

                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UserLogin()async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
