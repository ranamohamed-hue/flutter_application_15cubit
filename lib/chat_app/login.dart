import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';
import 'package:flutter_application_15cubit/chat_app/buildPhoneInputField.dart';
import 'package:flutter_application_15cubit/chat_app/buildnextstepbullon.dart';
import 'package:flutter_application_15cubit/chat_app/buildpart3.dart';
import 'package:flutter_application_15cubit/chat_app/buildtags.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = true;
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
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 140, 52, 158),
                    ),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  isLogin
                      ? 'Login On Your Account'
                      : 'Enter the verification code sent to your phone',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Buildtags(
                  isLoginActive: isLogin,
                  onlogintap: () => setState(() => isLogin = true),
                  onverification: () => setState(() => isLogin = false),
                ),
                SizedBox(height: 20),
                isLogin
                    ? SigninVerificationWidget(onNext: () {
                        setState(() => isLogin = false);
                      })
                    : LoginVerificationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SigninVerification Widget
class SigninVerificationWidget extends StatelessWidget {
  final VoidCallback onNext;
  const SigninVerificationWidget({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Buildphoneinputfield(
          title: 'User Verification Number',
          hintText: 'User Verification Number...',
        ),
        SizedBox(height: 30),
        Buildnextstepbullon(onPressed: onNext),
        SizedBox(height: 40),
        Buildpart(comment: "Did Not Receive Code?", action: 'Try Again'),
      ],
    );
  }
}

// LoginVerification Widget
class LoginVerificationWidget extends StatelessWidget {
  const LoginVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Buildphoneinputfield(
          title: 'User Verification Number',
          hintText: 'User Verification Number...',
        ),
        SizedBox(height: 20),
        Buildnextstepbullon(onPressed: () {}),
        SizedBox(height: 20),
        Buildpart(comment: "Did Not Receive Code?", action: 'Try Again'),
      ],
    );
  }
}
