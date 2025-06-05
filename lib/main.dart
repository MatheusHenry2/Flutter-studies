import 'package:flutter/material.dart';
import 'login/login_view.dart';
import 'login/firebase_auth_service.dart';
import 'login/login_intent.dart';
import 'login/auth_service.dart';

void main() {
  final authService = FirebaseAuthService();
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  const MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: LoginView(intent: LoginIntent(authService)),
    );
  }
}
