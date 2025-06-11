import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<void> signInWithGoogle() async {
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
  }
}
