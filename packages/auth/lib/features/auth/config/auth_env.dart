import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/core/env/i_env.dart';
import 'package:core/core/helper/env_helper.dart';
import 'package:core/core/log/logger.dart';

class AuthEnv implements IEnv {
  AuthEnv();

  static const String keyBackendHost = 'AUTH_BACKEND_HOST';
  static const String keyTokenExchangePath = 'AUTH_TOKEN_EXCHANGE_PATH';
  static const String keyLogoutPath = 'AUTH_LOGOUT_PATH';
  static const String keyCognitoDomain = 'AUTH_COGNITO_DOMAIN';
  static const String keyClientId = 'AUTH_CLIENT_ID';
  static const String keyRedirectUri = 'AUTH_REDIRECT_URI';
  static const String keyRedirectUriWeb = 'AUTH_REDIRECT_URI_WEB';
  static const String keyScopes = 'AUTH_SCOPES';
  static const String keyIdentityProvider = 'AUTH_IDENTITY_PROVIDER';
  static const String keyServiceMode = 'AUTH_SERVICE_MODE';

  static String get backendHost => getEnv(AuthEnv.keyBackendHost);
  static String get tokenExchangePath => getEnv(AuthEnv.keyTokenExchangePath);
  static String get logoutPath => getEnv(AuthEnv.keyLogoutPath);
  static String get cognitoDomain => getEnv(AuthEnv.keyCognitoDomain);
  static String get clientId => getEnv(AuthEnv.keyClientId);
  static String get redirectUri => getEnv(AuthEnv.keyRedirectUri);
  static String get scopes => getEnv(AuthEnv.keyScopes);
  static String get identityProvider => getEnv(AuthEnv.keyIdentityProvider);
  static String get serviceMode => getEnv(AuthEnv.keyServiceMode);

  static String getEnv(String key) => EnvHelper.getEnv(key);

  @override
  List<EnvVarDescriptor> buildListEnvs() {
    return [
      EnvVarDescriptor(name: keyBackendHost, isRequired: true),
      EnvVarDescriptor(name: keyTokenExchangePath),
      EnvVarDescriptor(name: keyLogoutPath),
      EnvVarDescriptor(name: keyCognitoDomain, isRequired: true),
      EnvVarDescriptor(name: keyClientId, isRequired: true),
      EnvVarDescriptor(name: keyRedirectUri),
      EnvVarDescriptor(name: keyRedirectUriWeb),
      EnvVarDescriptor(name: keyScopes),
      EnvVarDescriptor(name: keyIdentityProvider),
      EnvVarDescriptor(name: keyServiceMode),
    ];
  }

  static String get tokenExchangeUrl {
    return '$backendHost$tokenExchangePath';
  }

  static String get logoutUrl {
    return '$backendHost$logoutPath';
  }

  static String getAuthorizeUrl({
    required String codeChallenge,
    required String state,
  }) {
    Logger.log(
      'Building authorize URL | codeChallenge: ${codeChallenge.substring(0, 10)}..., state: $state',
    );

    final params = _buildAuthorizeParams(codeChallenge, state);
    final query = _buildQueryString(params);
    final url = '$cognitoDomain/oauth2/authorize?$query';

    Logger.log('Authorize URL built successfully');
    return url;
  }

  static Map<String, String> _buildAuthorizeParams(
    String codeChallenge,
    String state,
  ) {
    return {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'scope': scopes,
      'identity_provider': identityProvider,
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
      'state': state,
    };
  }

  /// URL de logout de Cognito
  static String getCognitoLogoutUrl() {
    Logger.log('Building Cognito logout URL');

    final params = _buildLogoutParams();
    final query = _buildQueryString(params);
    final url = '$cognitoDomain/logout?$query';

    Logger.log('Logout URL built: $url');
    return url;
  }

  static Map<String, String> _buildLogoutParams() {
    return {'client_id': clientId, 'logout_uri': redirectUri};
  }

  static String _buildQueryString(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
