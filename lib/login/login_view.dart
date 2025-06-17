import 'package:flutter/material.dart';
import 'login_intent.dart';
import 'login_state.dart';
import '../app_logger.dart';

class LoginView extends StatefulWidget {
  final LoginIntent intent;

  const LoginView({super.key, required this.intent});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    logger.i('LoginView initialized');
  }

  @override
  void dispose() {
    logger.i('LoginView disposed');
    widget.intent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 29),
            const Text(
              'Kotlin Quizzes',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF120D1C),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF120D1C),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Continue your Kotlin learning journey with our interactive quizzes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontSize: 16,
                  color: Color(0xFF120D1C),
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B30E8),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Login with Google',
                  style: TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFFFAF7FC),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
