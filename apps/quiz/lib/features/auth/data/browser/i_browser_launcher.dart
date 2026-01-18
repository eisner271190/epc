/// Interface para lanzar el navegador con la URL de autenticación
abstract class IBrowserLauncher {
  Future<bool> launchAuthUrl(String url);
}
