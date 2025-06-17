import 'dart:async';

import '../app_logger.dart';
import '../auth_service.dart';
import 'login_state.dart';

class LoginIntent {
  final AuthService _authService;
  final _controller = StreamController<LoginState>.broadcast();

  Stream<LoginState> get state => _controller.stream;

  LoginIntent(this._authService) {
    logger.i('state: initial');
    _controller.add(const LoginState.initial());
  }

  Future<void> signInWithGoogle() async {
    logger.i('state: loading');
    _controller.add(const LoginState.loading());
    try {
      logger.i('signInWithGoogle called');
      await _authService.signInWithGoogle();
      logger.i('state: success');
      _controller.add(const LoginState.success());
    } catch (e, st) {
      logger.e('error: $e', e, st);
      logger.i('state: error');
      _controller.add(LoginState.error(e.toString()));
    }
  }

  void dispose() {
    _controller.close();
  }
}
