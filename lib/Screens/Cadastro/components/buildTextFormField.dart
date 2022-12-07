import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class BuildTextFormField extends StatefulWidget {
  final TextInputType type;
  final Icon icon;
  final String text;
  final bool texto;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const BuildTextFormField({
    Key? key, required this.type, required this.icon, required this.text, required this.texto, required this.controller, required this.validator
  }) : super(key: key);

  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          obscureText: widget.texto,
          keyboardType: widget.type,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            border: InputBorder.none,
            labelText: widget.text,
            labelStyle: const TextStyle(color: Colors.white)
          ),
        ),
      ),
    );
  }
}