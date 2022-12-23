import 'package:ecommerce/common/widgets/custom_button.dart';
import 'package:ecommerce/common/widgets/custom_textfield.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/features/auth/services/auth_service.dart';
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
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.SignUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.SignInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
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
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
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
              Container(
                padding: const EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                          controller: _emailController,
                          hintText: "email",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                          controller: _nameController,
                          hintText: "name",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                          controller: _passwordController,
                          hintText: "password",
                          obscureText: true),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "sign up",
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
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
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                          controller: _emailController,
                          hintText: "email ",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                          controller: _passwordController,
                          hintText: "password ",
                          obscureText: true),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "sign in",
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
