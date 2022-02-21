import '../enums/element_type.dart';
import 'abilities.dart';
import 'species.dart';
import 'stats.dart';

class PokemonDetails {
  final List<Abilities> abilities;
  final double height;
  final int id;
  final String name;
  final Species species;
  final List<Stats> stats;
  final List<ElementType> types;
  final double weight;
  final String description;
  const PokemonDetails({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
    required this.description,
  });
}
