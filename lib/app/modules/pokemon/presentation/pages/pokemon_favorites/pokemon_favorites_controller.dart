import 'package:mobx/mobx.dart';
import '../../../domain/usescases/fetch_all_pokemons_favorites_usecase.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/entities/pokemon_details.dart';
import '../../../infra/datasources/pokemon_remote_datasource.dart';
import 'pokemon_favorites_state.dart';
part 'pokemon_favorites_controller.g.dart';

class PokemonFavoritesController = _PokemonFavoritesControllerBase
    with _$PokemonFavoritesController;

abstract class _PokemonFavoritesControllerBase with Store {
  final FetchAllPokemonsFavoritesUsecase _allPokemonsFavoritesUsecase;

  final PokemonRemoteDatasource _pokemonRemoteDatasource;
  _PokemonFavoritesControllerBase(
      this._pokemonRemoteDatasource, this._allPokemonsFavoritesUsecase);

  @observable
  PokemonFavoriteState pokemonFavoriteState = const PokemonFavoriteState();

  @observable
  List<String> favoritesUrl = [];

  @action
  Future<void> fetch() async {
    try {
      pokemonFavoriteState = pokemonFavoriteState.copyWith(loading: true);

      final response = await _allPokemonsFavoritesUsecase.call();

      response.fold((error) {
        pokemonFavoriteState = pokemonFavoriteState.copyWith(failure: error);
      }, (response) {
        favoritesUrl = response;
      });

      final List<PokemonDetails> pokemonDetails = [];
      for (String url in favoritesUrl) {
        final pokemon = await _pokemonRemoteDatasource.fetchDetails(url);
        pokemonDetails.add(pokemon);
      }
      pokemonFavoriteState = pokemonFavoriteState.copyWith(
          favorites: pokemonDetails, loading: false);
    } on Failure catch (error) {
      pokemonFavoriteState = pokemonFavoriteState.copyWith(failure: error);
    }
  }
}
