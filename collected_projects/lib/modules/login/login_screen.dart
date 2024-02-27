import 'package:collected_projects/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailAddressController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(

                    controller: emailAddressController,
                    type: TextInputType.emailAddress,
                    label: 'Email address',
                    prefix: Icons.email,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      prefix: Icons.lock,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      obsecuredText: isPasswordHide,
                      suffix: isPasswordHide
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixPressed: () {
                        setState(() {
                          isPasswordHide = !isPasswordHide;
                        });
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  defaultLoginButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailAddressController.text);
                          print(passwordController.text);
                        }
                      },
                      text: 'Login',
                      backgroundColor: Colors.blueGrey.shade700),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register now',
                          style: TextStyle(color: Colors.blueGrey[700]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
