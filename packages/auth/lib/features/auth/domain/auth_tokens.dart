/// Simple POJO replacement for generated Freezed model to fix broken codegen
class AuthTokens {
  final String idToken;
  final String accessToken;
  final String? refreshToken;

  const AuthTokens({
    required this.idToken,
    required this.accessToken,
    this.refreshToken,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(
      idToken: json['idToken'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'idToken': idToken,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };

  AuthTokens copyWith({
    String? idToken,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthTokens(
      idToken: idToken ?? this.idToken,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
