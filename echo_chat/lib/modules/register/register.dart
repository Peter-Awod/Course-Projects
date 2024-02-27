import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../shared/widgets/snack_bar.dart';
import '../../shared/constants.dart';
import '../../shared/widgets/custom_material_button.dart';
import '../../shared/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? emailAddress;

  String? password;

  var formKey = GlobalKey<FormState>();

  bool isLoading=false;

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
                  children: [
                    Image.asset(kLogoPath),
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
                          'REGISTER',
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
                      onChanged: (emailValue) {
                        emailAddress = emailValue;
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
                      buttonName: 'REGISTER',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            isLoading=true;
                            setState(() {

                            });
                            await UserRegistration();
                            showSnackBar(
                              context: context,
                              message: 'The account created successfully.',
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                context: context,
                                message: 'The password provided is too weak.',
                              );
                            }
                            else if (e.code == 'email-already-in-use') {
                              showSnackBar(
                                context: context,
                                message:
                                    'The account already exists for that email.',
                              );
                            }
                          }
                          catch (e)
                          {
                            showSnackBar(
                              context: context,
                              message:
                                  'There was an error.',
                            );
                            // print(e);
                          }

                          isLoading=false;
                          setState(() {

                          });
                        }
                        else{}
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
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


  Future<void> UserRegistration() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
