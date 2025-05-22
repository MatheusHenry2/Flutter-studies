import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (email == "matheus" && password == "123") {
                      print("correto");
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                      // Navigator.of(context).pushReplacement( // quando nao tem mais navegação fica com o voltar, meio que um sistema de navegação
                      //     MaterialPageRoute(builder: (context) => HomePage())
                      // );
                    } else {
                      print("login inválido");
                    }
                  },
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
