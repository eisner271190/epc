class EnvVarDescriptor {
  final String name;
  final bool isRequired;
  final String? value;

  const EnvVarDescriptor({
    required this.name,
    required this.isRequired,
    this.value,
  });
}
