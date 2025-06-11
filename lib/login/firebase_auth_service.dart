import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app_logger.dart';
import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<void> signInWithGoogle() async {
    logger.i('Starting Google sign-in');
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        throw Exception('Sign in aborted');
      }
      final auth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      await _auth.signInWithCredential(credential);
      logger.i('Firebase sign in success');
    } catch (e, st) {
      logger.e('Firebase sign in error: $e', e, st);
      rethrow;
    }
  }
}
