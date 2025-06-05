import 'package:flutter/material.dart';

import 'login_intent.dart';
import 'login_state.dart';

class LoginView extends StatefulWidget {
  final LoginIntent intent;
  const LoginView({super.key, required this.intent});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void dispose() {
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
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 60),
                      state.isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: widget.intent.signInWithGoogle,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
