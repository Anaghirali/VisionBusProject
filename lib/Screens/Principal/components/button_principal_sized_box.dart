import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class ButtonPrincipalSizedBox extends StatelessWidget {
  final Color color;
  final VoidCallback press;
  final Icon icon;
  const ButtonPrincipalSizedBox({
    Key? key, this.color = kPrimaryColor, required this.press, required this.icon,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      height: 100,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: press,
        icon: icon,
        label: const Text(''),
      ),
    );
  }
}