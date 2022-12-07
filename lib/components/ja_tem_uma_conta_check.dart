import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class JaTemUmaContaCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const JaTemUmaContaCheck({
    Key? key, this.login = true, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Você não possui uma Conta? ' : 'Já possui uma Conta',
          style: const TextStyle(color: Colors.blueGrey,),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Criar Conta.' : 'Entrar',
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}