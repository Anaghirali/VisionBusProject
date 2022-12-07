import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meus Favoritos',
          style: TextStyle(fontFamily: 'LibreBaskerville'),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}