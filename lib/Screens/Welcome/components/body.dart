import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Cadastro/cadastro_screen.dart';
import 'package:vision_bus/Screens/Login/login_screen.dart';
import 'package:vision_bus/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key,}) : super(key: key); 


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BEM-VINDO AO VISION BUS!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: size.height * 0.5,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const LoginScreen();
                      }
                    ),
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'CADASTRAR',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const TelaCadastro();
                      }
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}