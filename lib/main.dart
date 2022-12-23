import 'package:ecommerce/common/widgets/bottom_bar.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/features/auth/screens/auth_screen.dart';
import 'package:ecommerce/features/auth/services/auth_service.dart';
import 'package:ecommerce/home/screens/home_screen.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserDate(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var token = Provider.of<UserProvider>(context).user.token.isEmpty;
    print(token);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'amazon',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const AuthScreen()
          : const BottomBar(),
    );
  }
}
