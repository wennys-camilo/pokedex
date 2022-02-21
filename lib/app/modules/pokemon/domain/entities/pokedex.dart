import 'pokemon.dart';

class Pokedex {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;
  const Pokedex({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}
