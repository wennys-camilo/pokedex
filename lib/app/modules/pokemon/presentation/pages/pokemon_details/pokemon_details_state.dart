import '../../../domain/entities/pokemon_details.dart';
import '../../../domain/entities/species.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';

class PokemonDetailsState {
  final Failure? failure;
  final bool loading;
  final PokemonDetails pokemonDetails;
  final bool? isFavorite;
  const PokemonDetailsState({
    this.failure,
    this.loading = false,
    this.isFavorite,
    this.pokemonDetails = const PokemonDetails(
      abilities: [],
      description: '',
      id: 0,
      height: 0.0,
      name: '',
      species: Species(name: '', url: ''),
      stats: [],
      types: [],
      weight: 0.0,
    ),
  });

  PokemonDetailsState copyWith({
    PokemonDetails? pokemonDetails,
    Failure? failure,
    bool? loading,
    bool? isFavorite,
  }) {
    return PokemonDetailsState(
      failure: failure,
      loading: loading ?? this.loading,
      pokemonDetails: pokemonDetails ?? this.pokemonDetails,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
