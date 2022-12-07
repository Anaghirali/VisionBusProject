import 'package:flutter/material.dart';

class BuildAccount extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const BuildAccount({
    Key? key, required this.title, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}