import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

AppBar buildAppBar (BuildContext context) {
  return AppBar(
    title: const Text(
      'Configurações',
      style: TextStyle(
        fontFamily: 'LibreBaskerville',
      ),
    ),
    centerTitle: true,
    backgroundColor: kPrimaryColor,
  );
}