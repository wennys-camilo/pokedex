import 'abilities.dart';
import 'species.dart';
import 'stats.dart';
import 'types.dart';

class Details {
  final List<Abilities> abilities;
  final double height;
  final int id;
  final String name;
  final Species species;
  final List<Stats> stats;
  final List<Types> types;
  final double weight;
  String? description;
  Details({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
    this.description,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      abilities: List<Abilities>.from(
          map['abilities']?.map((x) => Abilities.fromMap(x))),
      height: map['height']?.toDouble() / 10 ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      species: Species.fromMap(map['species']),
      stats: List<Stats>.from(map['stats']?.map((x) => Stats.fromMap(x))),
      types: List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
      weight: map['weight']?.toDouble() / 10 ?? 0,
    );
  }

  @override
  String toString() {
    return 'Details(abilities: $abilities, height: $height, id: $id, name: $name, species: $species, stats: $stats, types: $types, weight: $weight)';
  }
}
