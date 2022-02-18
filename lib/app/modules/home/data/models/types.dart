class Types {
  final String name;
  Types({
    required this.name,
  });

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      name: map['type']['name'] ?? '',
    );
  }

  @override
  String toString() => 'Types(name: $name)';
}
