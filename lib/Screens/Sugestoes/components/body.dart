import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Principal/principal_screen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Deseja adicionar o seu endereço?',
            style: TextStyle(
              fontFamily: 'LibreBaskerville',
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 20,),
          const TextFieldContainer(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Exemplo: Rua Violeta, 280.',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          const Text(
            'Adicione as suas linhas favoritas!',
            style: TextStyle(
              fontFamily: 'LibreBaskerville',
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 20,),
          const TextFieldContainer(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Exemplo: 355',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TelaPrincipal();
                    }
                ),
              );
            },
            child: const Text(
              'Concluir',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key, required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}