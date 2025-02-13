class AuthState {
  final bool isLoading;
  final String? token;
  final String? errorMessage;

  const AuthState({
    this.isLoading = false,
    this.token,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    String? token,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
