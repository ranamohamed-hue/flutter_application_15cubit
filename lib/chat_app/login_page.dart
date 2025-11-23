import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                _buildtabs(),
                const SizedBox(height: 30),
                _buildPhoneInputField('Phone Number', '+43 123-456-7890'),
                SizedBox(height: 70),
                _buildNextStepButton(context),
                SizedBox(height: 100),
                _buildSignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildtabs() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabContent('Login', Icons.login_outlined, true),
          SizedBox(width: 40),
          _buildTabContent('Verification', Icons.verified_outlined, false),
        ],
      ),
      Container(
        height: 5,
        width: 130,
        color: Colors.purpleAccent,
        margin: EdgeInsets.only(top: 9),
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

Widget _buildPhoneInputField(String titlet, String hintText) {
  return TextFormField(
    keyboardType: TextInputType.phone,
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
        onPressed: () {},

        icon: const Icon(Icons.fast_forward, color: Colors.white, size: 15),
        label: const Text(
          '  Next Step   ',
          style: TextStyle(color: Colors.white, fontSize: 15),
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

Widget _buildSignUpText() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have Account?",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Signin',
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
