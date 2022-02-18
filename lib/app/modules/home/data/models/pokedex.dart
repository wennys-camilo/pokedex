import 'pokemon.dart';

class Pokedex {
  int count;
  String? next;
  String? previous;
  List<Pokemon>? results;
  Pokedex({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory Pokedex.fromMap(Map<String, dynamic> map) {
    return Pokedex(
      count: map['count']?.toInt() ?? 0,
      next: map['next'],
      previous: map['previous'],
      results: map['results'] != null
          ? List<Pokemon>.from(map['results']?.map((x) => Pokemon.fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return 'Pokedex(count: $count, next: $next, previous: $previous, results: $results)';
  }
}
