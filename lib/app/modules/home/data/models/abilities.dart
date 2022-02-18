class Abilities {
  final String ability;
  Abilities({
    required this.ability,
  });

  factory Abilities.fromMap(Map<String, dynamic> map) {
    return Abilities(
      ability: map['ability']['name'],
    );
  }

  @override
  String toString() => 'Abilities(ability: $ability)';
}
