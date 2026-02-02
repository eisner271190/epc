import 'package:core/profile/component_mode.dart';

class ComponentFactory<T> {
  final T mock;
  final T real;
  ComponentFactory({required this.mock, required this.real});
  T resolve(ComponentMode mode) => mode == ComponentMode.real ? real : mock;
}
