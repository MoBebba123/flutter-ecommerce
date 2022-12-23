import 'package:ecommerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              title: const Text("create account"),
              leading: Radio(
                value: Auth.signup,
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Form(
                key: _signUpFormKey,
                child: Column(),
              ),
            ListTile(
              title: const Text("sign in"),
              leading: Radio(
                value: Auth.signin,
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
