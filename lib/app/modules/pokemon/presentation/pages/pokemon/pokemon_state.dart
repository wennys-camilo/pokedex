import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/entities/pokemon.dart';

class PokemonState {
  final List<Pokemon> pokemons;
  final String? nextUrl;
  final List<Pokemon> pokemonsFilters;
  final Failure? failure;
  final bool loading;

  final int count;
  const PokemonState({
    this.pokemons = const [],
    this.nextUrl,
    this.failure,
    this.pokemonsFilters = const [],
    this.loading = false,
    this.count = 0,
  });

  bool get isMaxCount => pokemons.length == count;

  bool get isFilter => pokemonsFilters.length != pokemons.length;

  PokemonState copyWith({
    List<Pokemon>? pokemons,
    String? nextUrl,
    Failure? failure,
    bool? loading,
    List<Pokemon>? pokemonsFilters,
    String? search,
    int? count,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      nextUrl: nextUrl ?? this.nextUrl,
      failure: failure,
      loading: loading ?? this.loading,
      pokemonsFilters: pokemonsFilters ?? this.pokemonsFilters,
      count: count ?? this.count,
    );
  }
}
