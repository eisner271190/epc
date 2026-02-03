/// Interface para la generación de PKCE (Proof Key for Code Exchange)
abstract class IPKCEGenerator {
  String generateCodeVerifier();
  String generateCodeChallenge(String verifier);
}
