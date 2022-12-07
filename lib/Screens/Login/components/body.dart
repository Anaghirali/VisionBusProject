import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vision_bus/Screens/Cadastro/cadastro_screen.dart';
import 'package:vision_bus/Screens/Principal/principal_screen.dart';
import 'package:vision_bus/components/ja_tem_uma_conta_check.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vision_bus/validators.dart';

class Body extends StatefulWidget {
  const 
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                  'assets/images/logo.png',
                  height: size.height * 0.5,
              ),
              TextFormFieldContainer(
                  child: TextFormField(
                    controller: _email,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório!'),
                      Validatorless.email('E-mail inválido')
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: kPrimaryColor,
                      ),
                      labelText: 'E-mail:',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              const SizedBox(height: 10,),
              TextFormFieldContainer(
                  child: TextFormField(
                    controller: _senha,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória!'),
                      Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres!')
                    ]),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      labelText: 'Senha:',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Esqueceu a senha?',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      var formValid = _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          login();
                        }
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
              ),
              JaTemUmaContaCheck(
                press: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaCadastro()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email.text, 
        password: _senha.text
      );
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const TelaPrincipal(),
        ));
      }
    }on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não encontrado!'),
            backgroundColor: Colors.redAccent,
          )
        );
      }else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sua senha está incorreta!'),
            backgroundColor: Colors.redAccent,
          )
        );
      }
    }
  }
}


class TextFormFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFormFieldContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}