import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

import 'firebase_options.dart';
import 'login/login_view.dart';
import 'login/firebase_auth_service.dart';
import 'login/login_intent.dart';
import 'login/auth_service.dart';

class AuthLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return event.message.contains('AUTH');
  }
}

final Logger logger = Logger(
  filter: AuthLogFilter(),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
