import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class ElevatedButtonBusca extends StatelessWidget {
  final Color color;
  final Text text;
  final VoidCallback press;
  const ElevatedButtonBusca({
    Key? key, 
    this.color = kPrimaryColor,
    required this.text, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: const Size(140, 60),
      ),
      child: text,
    );
  }
}