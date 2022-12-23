import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
      ),
      validator: (value) {},
    );
  }
}
