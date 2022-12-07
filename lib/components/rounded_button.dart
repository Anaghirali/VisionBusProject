import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Login/login_screen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback press;
  const RoundedButton({
    Key? key, 
    required this.text,
    this.color = kPrimaryColor, required this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), backgroundColor: kPrimaryColor,
          ),
          onPressed: press,
          child: Text(text),
        ),
      ),
    );
  }
}