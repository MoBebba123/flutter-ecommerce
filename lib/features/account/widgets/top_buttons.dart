import 'package:ecommerce/features/account/widgets/account_button.dart';
import 'package:ecommerce/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  final AuthService authService = AuthService();
  void logOutUser() {
    authService.logOutUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your orders",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn seller",
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "log out",
              onTap: logOutUser,
            ),
            AccountButton(
              text: "Wishlist",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
