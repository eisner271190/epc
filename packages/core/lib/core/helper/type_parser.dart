import '../log/logger.dart';

/// Helper para parseo seguro de tipos desde `String`/env.
/// Centraliza conversiones y logging de fallos.
abstract final class TypeParser {
  TypeParser._();

  /// Intenta parsear [value] a `int`. Retorna `null` si no se puede parsear.
  static int? tryParseInt(String? value) {
    if (value == null) return null;
    final parsed = int.tryParse(value);
    if (parsed == null) {
      Logger.warning('[TypeParser] int parse failed', data: {'value': value});
    }
    return parsed;
  }

  /// Parsea [value] a `int`, devolviendo [defaultValue] si está ausente o inválido.
  static int parseInt(String? value, int defaultValue) {
    return tryParseInt(value) ?? defaultValue;
  }

  /// Intenta parsear [value] a `double`. Retorna `null` si no se puede parsear.
  static double? tryParseDouble(String? value) {
    if (value == null) return null;
    final parsed = double.tryParse(value);
    if (parsed == null) {
      Logger.warning(
        '[TypeParser] double parse failed',
        data: {'value': value},
      );
    }
    return parsed;
  }

  /// Parsea [value] a `double`, devolviendo [defaultValue] si está ausente o inválido.
  static double parseDoubleOrDefault(String? value, double defaultValue) {
    return tryParseDouble(value) ?? defaultValue;
  }

  /// Intenta parsear [value] a `bool`.
  /// Acepta: 'true','false','1','0','yes','no' (case-insensitive).
  /// Retorna `null` si no corresponde.
  static bool? tryParseBool(String? value) {
    if (value == null) return null;
    final v = value.trim().toLowerCase();
    if (v == 'true' || v == '1' || v == 'yes' || v == 'y') return true;
    if (v == 'false' || v == '0' || v == 'no' || v == 'n') return false;
    Logger.warning('[TypeParser] bool parse failed', data: {'value': value});
    return null;
  }

  /// Parsea [value] a `bool`, devolviendo [defaultValue] si está ausente o inválido.
  static bool parseBoolOrDefault(String? value, bool defaultValue) {
    return tryParseBool(value) ?? defaultValue;
  }

  /// Devuelve `value` trimmeado o `null` si es nulo o vacío.
  static String? tryParseString(String? value) {
    if (value == null) return null;
    final v = value.trim();
    return v.isEmpty ? null : v;
  }

  /// Devuelve `value` trimmeado o [defaultValue] si es nulo o vacío.
  static String parseStringOrDefault(String? value, String defaultValue) {
    return tryParseString(value) ?? defaultValue;
  }

  /// Intenta mapear [value] a un enum/lista de valores usando [nameOf].
  /// Retorna [defaultValue] si no se encuentra.
  static T? parseEnum<T>(
    String? value,
    Iterable<T> values,
    String Function(T) nameOf, [
    T? defaultValue,
  ]) {
    if (value == null) return defaultValue;
    final v = value.trim().toLowerCase();
    for (final item in values) {
      if (nameOf(item).toLowerCase() == v) return item;
    }
    Logger.warning('[TypeParser] enum parse failed', data: {'value': value});
    return defaultValue;
  }
}
