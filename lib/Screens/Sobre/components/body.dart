import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/shared/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre o Vision Bus',
          style: TextStyle(
            fontFamily: 'LibreBaskerville'
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Quem Somos',
                style: TextStyle(
                  fontFamily: 'LibreBaskerville',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor
                ),
              ),
              const SizedBox(height: 35,),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: const Text(
                  'VISION BUS é um aplicativo desenvolvido por estudantes do curso de Desenvolvimento de Sistemas do Colégio Técnico de Campinas. Nosso objetivo é promover a inclusão social, e acessibilidade ao deficiênte visual a chegar até seu destino desejado, fazendo o uso do transporte público.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}