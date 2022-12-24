import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );
  User get user => _user;
  String get token => _user.token;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setToken(String token) {
    _user.token = token;
    notifyListeners();
  }
}
