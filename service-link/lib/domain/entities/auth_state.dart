class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;

  AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}