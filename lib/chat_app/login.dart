import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';
import 'package:flutter_application_15cubit/chat_app/buildPhoneInputField.dart';
import 'package:flutter_application_15cubit/chat_app/buildnextstepbullon.dart';
import 'package:flutter_application_15cubit/chat_app/buildpart3.dart';
import 'package:flutter_application_15cubit/chat_app/buildtags.dart';
import 'package:flutter_application_15cubit/chat_app/signin_verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbarr(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 140, 52, 158),
                    ),

                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: const Color.fromARGB(255, 230, 221, 221),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                Buildtags(
                  isLoginActive: isLogin,
                  onlogintap: () {
                    setState(() => isLogin = true);
                  },
                  onverification: () {
                    setState(() => isLogin = false);
                  },
                ),

                SizedBox(height: 30),
                Buildphoneinputfield(
                  title: 'Name',
                  hintText: 'Enter Your Name',
                ),
                SizedBox(height: 20),
                Buildphoneinputfield(
                  title: 'Phone Number',
                  hintText: '+43 123-456-7890',
                ),

                SizedBox(height: 20),

                Buildnextstepbullon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                SigninVerification(),
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Buildpart(comment: "You Have Account?", action: 'Login'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
