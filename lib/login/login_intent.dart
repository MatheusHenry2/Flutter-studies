import 'dart:async';

import 'auth_service.dart';
import 'login_state.dart';

class LoginIntent {
  final AuthService _authService;
  final _controller = StreamController<LoginState>.broadcast();

  Stream<LoginState> get state => _controller.stream;

  LoginIntent(this._authService) {
    _controller.add(const LoginState.initial());
  }

  Future<void> signInWithGoogle() async {
    _controller.add(const LoginState.loading());
    try {
      await _authService.signInWithGoogle();
      _controller.add(const LoginState.success());
    } catch (e) {
      _controller.add(LoginState.error(e.toString()));
    }
  }

  void dispose() {
    _controller.close();
  }
}
