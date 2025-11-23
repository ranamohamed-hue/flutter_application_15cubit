import 'package:flutter/material.dart';
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
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              'Chat App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                const Text(
                  'Login On Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                _buildtabss(),
                const SizedBox(height: 30),
                _buildVerificationInputField(
                  'User Verification Number',
                  'User Verification Number...',
                ),
                SizedBox(height: 30),
                _buildNextStepButton(context),
                SizedBox(height: 40),
                _buildSignUpText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildtabss() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 40),
          _buildTabContent('Login', Icons.login_outlined, false),
          SizedBox(width: 60),
          _buildTabContent('Verification', Icons.verified_outlined, true),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(width: 100),
          Container(
            height: 5,
            width: 115,
            color: Colors.purpleAccent,
            margin: EdgeInsets.only(top: 5),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTabContent(String title, IconData icon, bool isactive) {
  return Row(
    children: [
      Icon(icon, color: isactive ? Colors.purpleAccent : Colors.grey, size: 20),
      SizedBox(width: 6),
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: isactive ? Colors.black : Colors.grey,
        ),
      ),
    ],
  );
}

Widget _buildVerificationInputField(String titlet, String hintText) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: titlet,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
      prefixIcon: const Icon(Icons.call, color: Colors.purpleAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    ),
  );
}

Widget _buildNextStepButton(BuildContext context) {
  return Center(
    child: SizedBox(
      child: ElevatedButton.icon(
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
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        },

        icon: const Icon(Icons.login_outlined, color: Colors.white, size: 15),
        label: const Text(
          ' Login  ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
      ),
    ),
  );
}

Widget _buildSignUpText(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Did Not Recive Code?",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        TextButton(
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
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
          },
          child: const Text(
            'Try Again',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
