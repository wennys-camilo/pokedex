import '../../../domain/entities/pokemon_details.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';

class PokemonFavoriteState {
  final Failure? failure;
  final bool loading;
  final List<PokemonDetails> favorites;
  const PokemonFavoriteState({
    this.failure,
    this.loading = false,
    this.favorites = const [],
  });

  PokemonFavoriteState copyWith({
    List<PokemonDetails>? favorites,
    Failure? failure,
    bool? loading,
  }) {
    return PokemonFavoriteState(
        loading: loading ?? this.loading,
        failure: failure,
        favorites: favorites ?? this.favorites);
  }
}
