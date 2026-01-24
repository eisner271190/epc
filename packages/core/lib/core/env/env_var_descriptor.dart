class EnvVarDescriptor {
  final String name;
  final bool isRequired;

  const EnvVarDescriptor({required this.name, this.isRequired = false});
}
