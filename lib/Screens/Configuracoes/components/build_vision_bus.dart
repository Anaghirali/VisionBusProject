import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class BuildVisionBus extends StatelessWidget {
  final String title;
  const BuildVisionBus({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'LibreBaskerville',
                color: kPrimaryColor,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}