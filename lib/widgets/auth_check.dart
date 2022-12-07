import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:vision_bus/Screens/Login/login_screen.dart';
import 'package:vision_bus/Screens/Welcome/welcome_screen.dart';
import 'package:vision_bus/services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginScreen();
    else
      return WelcomeScreen();
  }


loading(){
  return const Scaffold(
  body: Center(
    child: CircularProgressIndicator(),
  )
);
}
}