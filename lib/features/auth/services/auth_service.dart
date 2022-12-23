import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign up user
  void SignUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        cart: [],
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{'Content-Type': "application/json"});
      print(res.body);
    } catch (e) {}
  }
}
