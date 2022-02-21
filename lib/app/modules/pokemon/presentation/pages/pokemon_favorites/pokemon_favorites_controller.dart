import 'package:mobx/mobx.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/entities/pokemon_details.dart';
import '../../../infra/datasources/pokemon_local_datasource.dart';
import '../../../infra/datasources/pokemon_remote_datasource.dart';
import 'pokemon_favorites_state.dart';
part 'pokemon_favorites_controller.g.dart';

class PokemonFavoritesController = _PokemonFavoritesControllerBase
    with _$PokemonFavoritesController;

abstract class _PokemonFavoritesControllerBase with Store {
  final PokemonLocalDatasource _pokemonLocalDatasource;

  final PokemonRemoteDatasource _pokemonRemoteDatasource;
  _PokemonFavoritesControllerBase(
      this._pokemonLocalDatasource, this._pokemonRemoteDatasource);

  @observable
  PokemonFavoriteState pokemonFavoriteState = const PokemonFavoriteState();

  @action
  Future<void> fetch() async {
    try {
      pokemonFavoriteState = pokemonFavoriteState.copyWith(loading: true);
      List<String> favoritesUrl = await _pokemonLocalDatasource.getAll();
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
