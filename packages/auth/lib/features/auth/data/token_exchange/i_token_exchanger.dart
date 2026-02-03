import '../../domain/auth_tokens.dart';

/// Interface para el intercambio de código por tokens con el backend
abstract class ITokenExchanger {
  Future<AuthTokens> exchangeCodeForTokens({
    required String code,
    required String codeVerifier,
  });
}
