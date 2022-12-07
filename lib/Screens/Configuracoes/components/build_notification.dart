import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildNotification extends StatelessWidget {
  final String title;
  final bool isActive;
  const BuildNotification({
    Key? key, required this.title, required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive, 
            onChanged: (bool val) {},
          ),
        )
      ],
    );
  }
}