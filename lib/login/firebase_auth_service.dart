import 'dart:async';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<void> signInWithGoogle() async {
    // TODO: integrate Firebase authentication
    return Future.delayed(const Duration(seconds: 1));
  }
}
