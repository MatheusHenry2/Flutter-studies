class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const LoginState._({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  const LoginState.initial() : this._();
  const LoginState.loading() : this._(isLoading: true);
  const LoginState.success() : this._(isSuccess: true);
  const LoginState.error(String message)
      : this._(errorMessage: message);
}
