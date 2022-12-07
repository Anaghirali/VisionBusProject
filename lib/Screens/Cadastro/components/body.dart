import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vision_bus/Screens/Cadastro/components/buildTextFormField.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:vision_bus/tela_checagem.dart';
import 'package:vision_bus/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {

  _BodyState() {
    _valorSelecionado = _listaGraus[0];
  }

  final _listaGraus = ['Nenhuma', 'Baixa visão', 'Daltonismo', 'Cegueira'];
  String? _valorSelecionado = '';

  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _dataDeNascimento = TextEditingController();
  final _cpf = TextEditingController();
  final _telefone = TextEditingController();
  final _senha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    _nome.dispose();
    _email.dispose();
    _dataDeNascimento.dispose();
    _cpf.dispose();
    _telefone.dispose();
    _senha.dispose();
    _confirmarSenha.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          const Center(
            child: Text(
              'Vision Bus',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
                fontSize: 36,
                color: kPrimaryColor
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTextFormField(
                  controller: _nome,
                  validator: Validatorless.required('Nome Obrigatório!'),
                  text: 'Nome Completo: ',
                  icon: const Icon(Icons.person, color: Colors.white,),
                  type: TextInputType.name,
                  texto: false,
                ),
                BuildTextFormField(
                  controller: _email,
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail Obrigatório!'),
                    Validatorless.email('E-mail inválido')
                  ]),
                  text: 'E-mail: ',
                  icon: const Icon(Icons.mail, color: Colors.white,),
                  type: TextInputType.emailAddress,
                  texto: false,
                ),
                BuildTextFormField(
                  controller: _dataDeNascimento,
                  validator: Validatorless.multiple([
                    Validatorless.required('Data de Nascimento Obrigatória!'),
                    Validatorless.date('Data de Nascimento Inválida!')
                  ]),
                  text: 'Data de Nascimento: ',
                  icon: const Icon(Icons.calendar_month, color: Colors.white,),
                  type: TextInputType.number,
                  texto: false,
                ),
                BuildTextFormField(
                  controller: _cpf,
                  validator: Validatorless.multiple([
                    Validatorless.required('CPF Obrigatório!'),
                    Validatorless.cpf('CPF Inválido!')
                  ]),
                  text: 'CPF: ',
                  icon: const Icon(Icons.perm_identity, color: Colors.white,),
                  type: TextInputType.number,
                  texto: false,
                ),
                BuildTextFormField(
                  controller: _telefone,
                  validator: Validatorless.multiple([
                    Validatorless.required('Telefone Obrigatório!'),
                    Validatorless.number('Telefone Inválido!'),
                  ]),
                  text: 'Telefone: ',
                  icon: const Icon(Icons.phone, color: Colors.white,),
                  type: TextInputType.phone,
                  texto: false,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, left: 10, right: 5),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: DropdownButtonFormField(
                    validator: Validatorless.required('Campo Obrigatório'),
                    value: _valorSelecionado,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: 'Você possui algum tipo de deficiência visual?',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ), 
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    items: _listaGraus.map(
                      ((e) => DropdownMenuItem(value: e,child: Text(e),))
                    ).toList(), 
                    onChanged: (val) {
                      setState(() {
                        _valorSelecionado = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.white,
                    ),
                    dropdownColor: kPrimaryColor,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                BuildTextFormField(
                  controller: _senha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória!'),
                    Validatorless.min(6, 'Senha precisa ter pelo 6 caracteres!')
                  ]),
                  text: 'Senha: ',
                  icon: const Icon(Icons.lock, color: Colors.white,),
                  type: TextInputType.visiblePassword,
                  texto: true,
                ),
                BuildTextFormField(
                  controller: _confirmarSenha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirmar senha obrigatória!'),
                    Validatorless.min(6, 'Confirmar senha precisa ter pelo 6 caracteres!'),
                    Validators.compare(_senha, 'Senha diferente!'),
                  ]),
                  text: 'Confirmar senha: ',
                  icon: const Icon(Icons.lock, color: Colors.white,),
                  type: TextInputType.visiblePassword,
                  texto: true,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 30),
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      var formValid = _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            cadastrar();
                          }
                    }, 
                    child: const Text('Continuar', style: TextStyle(fontSize: 20),)
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: _email.text, password: _senha.text);
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nome.text);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const TelaChecagem()), (Route<dynamic> route) => false);
     }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mais forte!'),
            backgroundColor: Colors.redAccent,
          )
        );
      }else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este e-mail já foi cadastrado!'),
            backgroundColor: Colors.redAccent,
          )
        );
      }
    }
  }
}