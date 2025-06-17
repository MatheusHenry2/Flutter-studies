import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app_logger.dart';
import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<UserCredential> signInWithGoogle() async {
    logger.i('Starting Google sign-in');
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        logger.w('Google sign-in aborted by user');
        throw Exception('Sign in aborted');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCred = await _auth.signInWithCredential(credential);
      logger.i('Firebase sign-in success for UID=${userCred.user?.uid}');
      return userCred;
    } catch (e, st) {
      logger.e('Firebase sign-in error', e, st);
      rethrow;
    }
  }
}
