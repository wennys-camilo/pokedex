import 'package:mobx/mobx.dart';
import 'package:pokedex/app/shared/domain/helpers/errors/failure.dart';
import '../../../domain/usescases/fetch_pokemon_details_by_url_usecase.dart';
import '../../../infra/datasources/pokemon_local_datasource.dart';
import 'pokemon_details_state.dart';
part 'pokemon_details_controller.g.dart';

class PokemonDetailsController = _PokemonDetailsControllerBase
    with _$PokemonDetailsController;

abstract class _PokemonDetailsControllerBase with Store {
  final FetchPokemonDetailsByUrlUseCase _fetchPokemonDetailsByUrlUseCase;

  final PokemonLocalDatasource _pokemonLocalDatasource;

  _PokemonDetailsControllerBase(
      this._fetchPokemonDetailsByUrlUseCase, this._pokemonLocalDatasource);

  @observable
  PokemonDetailsState pokemonDetailsState = const PokemonDetailsState();

  @action
  Future<void> getDetails(String url) async {
    pokemonDetailsState = pokemonDetailsState.copyWith(loading: true);
    final result = await _fetchPokemonDetailsByUrlUseCase(url);
    result.fold((l) {
      pokemonDetailsState =
          pokemonDetailsState.copyWith(failure: l, loading: false);
    }, (response) {
      pokemonDetailsState = pokemonDetailsState.copyWith(
          pokemonDetails: response, failure: null, loading: false);
    });
  }

  @action
  Future<void> isFavorite(String url) async {
    try {
      final response = await _pokemonLocalDatasource.exists(url);
      pokemonDetailsState = pokemonDetailsState.copyWith(isFavorite: response);
    } on Failure catch (error) {
      pokemonDetailsState = pokemonDetailsState.copyWith(failure: error);
    }
  }

  @action
  Future<void> changeFavorite(String url) async {
    try {
      if (pokemonDetailsState.isFavorite == null) return;
      if (pokemonDetailsState.isFavorite!) {
        await _pokemonLocalDatasource.remove(url);
        pokemonDetailsState = pokemonDetailsState.copyWith(isFavorite: false);
      } else {
        await _pokemonLocalDatasource.insert(url);
        pokemonDetailsState = pokemonDetailsState.copyWith(isFavorite: true);
      }
    } on Failure catch (error) {
      pokemonDetailsState = pokemonDetailsState.copyWith(failure: error);
    }
  }
}
