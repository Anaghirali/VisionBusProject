import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vision_bus/Screens/Login/login_screen.dart';
import 'package:vision_bus/Screens/Sugestoes/sugestoes_screen.dart';

class TelaChecagem extends StatefulWidget {
  const TelaChecagem({super.key});

  @override
  State<TelaChecagem> createState() => _TelaChecagem();
}

class _TelaChecagem extends State<TelaChecagem> {

  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
          if (user == null) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const LoginScreen(),));
          }else {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const TelaSugestao(),));
          }
        });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}