import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';
import 'package:flutter_application_15cubit/chat_app/buildPhoneInputField.dart';
import 'package:flutter_application_15cubit/chat_app/buildnextstepbullon.dart';
import 'package:flutter_application_15cubit/chat_app/buildpart3.dart';
import 'package:flutter_application_15cubit/chat_app/buildtags.dart';
import 'package:flutter_application_15cubit/chat_app/login_page.dart';

class SigninVerification extends StatefulWidget {
  const SigninVerification({super.key});

  @override
  State<SigninVerification> createState() => _SigninVerificationState();
}

class _SigninVerificationState extends State<SigninVerification> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbarr(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const Text(
                  'Login On Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Buildtags(isLoginActive: false),
                const SizedBox(height: 30),
                Buildphoneinputfield(
                  title: 'User Verification Number',
                  hintText: 'User Verification Number...',
                ),

                SizedBox(height: 30),
                Buildnextstepbullon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                LoginPage(),
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
                SizedBox(height: 40),
                Buildpart(comment: "Did Not Recive Code?", action: 'Try Again'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
