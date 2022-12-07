import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vision_bus/Screens/Configuracoes/components/appbar_widget.dart';
import 'package:vision_bus/Screens/Configuracoes/components/build_account.dart';
import 'package:vision_bus/Screens/Configuracoes/components/build_notification.dart';
import 'package:vision_bus/Screens/Configuracoes/components/build_vision_bus.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:vision_bus/services/auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.person, color: kPrimaryColor,),
                SizedBox(width: 10,),
                Text(
                  'Conta',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 15, thickness: 2,),
            const SizedBox(height: 10,),
            BuildAccount(title: 'Informações da conta', press: () {},),
            BuildAccount(title: 'Convidar amigos', press: () {},),
            BuildAccount(title: 'Idioma', press: () {},),
            BuildAccount(title: 'Privacidade e segurança', press: () {},),
            BuildAccount(title: 'Sair conta', press: () {
              context.read<AuthService>().logout();
            },),
            const SizedBox(height: 40,),
            Row(
              children: const [
                Icon(Icons.notifications_active,color: kPrimaryColor,),
                SizedBox(width: 10,),
                Text(
                  'Notificações',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 15, thickness: 2,),
            const SizedBox(height: 10,),
            const BuildNotification(
              title: 'Padrão',
              isActive: true,
            ),
            const BuildNotification(
              title: 'Viagem',
              isActive: true,
            ),
            const BuildNotification(
              title: 'Benefícios',
              isActive: false,
            ),
            const SizedBox(height: 40,),
            Row(
              children: const [
                Icon(Icons.info, color: kPrimaryColor,),
                SizedBox(width: 10,),
                Text(
                  'Vision Bus',
                  style: TextStyle(
                    fontFamily: 'LibreBaskerville',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 15, thickness: 2,),
            const SizedBox(height: 10,),
            const BuildVisionBus(title: 'Sobre o Vision Bus',),
            const Divider(height: 15, thickness: 2,),
            const BuildVisionBus(title: 'Ajuda',),
            const Divider(height: 15, thickness: 2,),
            const BuildVisionBus(title: 'Termos de uso',),
            const Divider(height: 15, thickness: 2,),
            const BuildVisionBus(title: 'Política de privacidade',),
            const Divider(height: 15, thickness: 2,),
          ],
        ),
      ),
    );
  }
}