/// Parámetros para resolver un componente: variable de entorno, implementación mock y real.
class ComponentParameter<T> {
  final Type interfaceType;
  final String envKey;
  final T mock;
  final T real;
  final String hashKey;

  ComponentParameter({
    required this.interfaceType,
    required this.envKey,
    required this.mock,
    required this.real,
  }) : hashKey = ComponentParameter.getHash(interfaceType);

  /// Genera una clave hash estable para el parámetro a partir de la interfaz.
  static String getHash(Type interfaceType) {
    final iface = interfaceType.toString();
    return '${iface}#${Object.hashAll([iface])}';
  }
}
