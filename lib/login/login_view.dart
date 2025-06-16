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
      body: StreamBuilder<LoginState>(
        stream: widget.intent.state,
        builder: (context, snapshot) {
          final state = snapshot.data ?? const LoginState.initial();
          if (state.isLoading) {
            logger.i('view -> loading');
          } else if (state.isSuccess) {
            logger.i('view -> success');
          } else if (state.errorMessage != null) {
            logger.i('view -> error');
          } else {
            logger.i('view -> initial');
          }
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFF5F5F5),
            child: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/imagens/logo3.png',
                            width: 220,
                            height: 220,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        state.isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6200EE),
                                    foregroundColor: Colors.white,
                                    minimumSize:
                                        const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () {
                                    logger.i('Google sign-in button pressed');
                                    widget.intent.signInWithGoogle();
                                  },
                                  icon: const Icon(Icons.login),
                                  label: const Text('Sign in with Google'),
                                ),
                              ),
                        if (state.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              state.errorMessage!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
