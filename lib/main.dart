import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

import 'app_logger.dart';

import 'firebase_options.dart';
import 'login/login_view.dart';
import 'firebase_auth_service.dart';
import 'login/login_intent.dart';
import 'auth_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.i('Application starting');
  await Firebase.initializeApp(

  );
  logger.i('Firebase initialized');
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
