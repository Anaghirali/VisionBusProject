import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Welcome/welcome_screen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase. initializeApp();

  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vision Bus',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}
