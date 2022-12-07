import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Busca/busca_screen.dart';
import 'package:vision_bus/Screens/Configuracoes/configuracoes_screen.dart';
import 'package:vision_bus/Screens/Favoritos/favoritos_screen.dart';
import 'package:vision_bus/Screens/Perfil/perfil_screen.dart';
import 'package:vision_bus/Screens/Sobre/sobre_screen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:vision_bus/Screens/Principal/components/button_principal_sized_box.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Vision Bus',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
                fontSize: 32,
                color: kPrimaryColor,
              ),
            ),
            const Text(
              'Acessibilidade para Todos',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
                fontSize: 16,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 30,),
            Tooltip(
              message: 'Buscar pontos e linhas',
              verticalOffset: 30,
              child: ButtonPrincipalSizedBox(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TelaBusca())
                  );
                },
                icon: const Icon(
                  Icons.directions_bus,
                  size: 90,
                  
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Tooltip(
              message: 'Favoritos',
              verticalOffset: 30,
              child: ButtonPrincipalSizedBox(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TelaFavoritos())
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                  size: 90,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Tooltip(
              message: 'Tela de perfil',
              verticalOffset: 30,
              child: ButtonPrincipalSizedBox(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TelaPerfil())
                  );
                },
                icon: const Icon(
                  Icons.person,
                  size: 90,
                )
              ),
            ),
            const SizedBox(height: 15,),
            Tooltip(
              message: 'Configurações',
              verticalOffset: 30,
              child: ButtonPrincipalSizedBox(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TelaConfiguracoes())
                  );
                },
                icon: const Icon(
                  Icons.miscellaneous_services,
                  size: 90,
                )
              ),
            ),
            const SizedBox(height: 15,),
            Tooltip(
              message: 'Sobre o aplicativo',
              verticalOffset: 30,
              child: ButtonPrincipalSizedBox(
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TelaSobre())
                  );
                },
                icon: const Icon(
                  Icons.info,
                  size: 90,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}