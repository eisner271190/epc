import 'package:core/core/log/logger.dart';
import '../../config/auth_env.dart';
import '../pkce/i_pkce_generator.dart';
import '../oauth/i_oauth_state_manager.dart';
import '../browser/i_browser_launcher.dart';

class HostedUIInitiator {
  final IPKCEGenerator _pkceGenerator;
  final IOAuthStateManager _oauthStateManager;
  final IBrowserLauncher _browserLauncher;

  HostedUIInitiator({
    required IPKCEGenerator pkceGenerator,
    required IOAuthStateManager oauthStateManager,
    required IBrowserLauncher browserLauncher,
  }) : _pkceGenerator = pkceGenerator,
       _oauthStateManager = oauthStateManager,
       _browserLauncher = browserLauncher;

  Future<bool> initiateLogin() async {
    try {
      _logInitiateStart();
      final codeVerifier = _pkceGenerator.generateCodeVerifier();
      final codeChallenge = _pkceGenerator.generateCodeChallenge(codeVerifier);
      final state = _oauthStateManager.generateState();
      await _oauthStateManager.saveState(state, codeVerifier);
      final authorizeUrl = _buildAuthorizeUrl(codeChallenge, state);
      _logAuthorizeUrl(authorizeUrl);
      await _browserLauncher.launchAuthUrl(authorizeUrl);
      _logInitiateSuccess();
      return true;
    } catch (e, st) {
      _logInitiateError(e, st);
      return false;
    }
  }

  String _buildAuthorizeUrl(String codeChallenge, String state) {
    final url = AuthEnv.getAuthorizeUrl(
      codeChallenge: codeChallenge,
      state: state,
    );
    return url;
  }

  void _logInitiateStart() {
    Logger.info('auth.hosted_ui.initiate.start', data: {'event': 'start'});
  }

  void _logAuthorizeUrl(String url) {
    final masked = _maskUrl(url);
    Logger.info('auth.hosted_ui.authorize_url', data: {'url': masked});
  }

  void _logInitiateSuccess() {
    Logger.info('auth.hosted_ui.initiate.success', data: {'event': 'success'});
  }

  void _logInitiateError(Object error, StackTrace stackTrace) {
    Logger.error(
      'auth.hosted_ui.initiate.error',
      data: {'event': 'error'},
      error: error,
      stackTrace: stackTrace,
    );
  }

  String _maskUrl(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.queryParameters.isEmpty)
        return '${uri.scheme}://${uri.host}${uri.path}';
      final masked = uri.queryParameters.keys.map((k) => '$k=***').join('&');
      return '${uri.scheme}://${uri.host}${uri.path}?$masked';
    } catch (_) {
      return 'masked_url';
    }
  }
}
