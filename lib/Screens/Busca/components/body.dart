import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Busca/components/elevated_button_busca.dart';
import 'package:vision_bus/Screens/Linhas/linhasscreen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:vision_bus/Screens/Pontos/pontosScreen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final linha = TextEditingController();

    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Busca',
            style: TextStyle(
              fontFamily: 'LibreBaskerville',
              fontSize: 35,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Escolha abaixo a opção desejada',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                    fontSize: 23,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButtonBusca(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LinhasScreen()));
                      },
                      text: const Text(
                        'Linhas',
                        style: TextStyle(
                            fontFamily: 'LibreBaskerville', fontSize: 20),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20)),
                    ElevatedButtonBusca(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PontosScreen()));
                      },
                      text: const Text(
                        'Pontos',
                        style: TextStyle(
                            fontFamily: 'LibreBaskerville', fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    controller: linha,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                          color: Colors.black, width: 1.25),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.blue, width: 1.15),
                          borderRadius: BorderRadius.circular(16)),
                      hintText: 'Busque pela linha desejada',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/mapa.png',
                        height: 100,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      const Text(
                        'Ver Mapa',
                        style: TextStyle(
                            fontFamily: 'LibreBaskerville',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20)),
                      const Icon(
                        Icons.arrow_forward,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Histórico',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                    color: Colors.black,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
