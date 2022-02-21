import 'package:mobx/mobx.dart';
import '../../../domain/usescases/fetch_all_pokemons_usecase.dart';
import 'pokemon_state.dart';
part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final FetchAllPokemonsUsecase _fetchAllPokemonsUsecase;

  _PokemonControllerBase(this._fetchAllPokemonsUsecase);

  @observable
  PokemonState pokemonState = const PokemonState();

  @observable
  bool backgroundColorDark = true;

  @action
  onChangeBackGroundColor() => backgroundColorDark = !backgroundColorDark;

  @action
  Future<void> fetchAll() async {
    pokemonState = pokemonState.copyWith(loading: true);
    final result = await _fetchAllPokemonsUsecase();
    result.fold((l) {
      pokemonState = pokemonState.copyWith(failure: l, loading: false);
    }, (response) {
      pokemonState = pokemonState.copyWith(
        pokemonsFilters: response.results,
        pokemons: response.results,
        nextUrl: response.next,
        count: response.count,
        failure: null,
        loading: false,
      );
    });
  }

  @action
  Future<void> fetchNextPage() async {
    if (pokemonState.isMaxCount) return;
    final result = await _fetchAllPokemonsUsecase(url: pokemonState.nextUrl);
    result.fold((l) {
      pokemonState = pokemonState.copyWith(failure: l);
    }, (response) {
      final pokemons = [...pokemonState.pokemons, ...response.results];
      pokemonState = pokemonState.copyWith(
        pokemonsFilters: pokemons,
        pokemons: pokemons,
        nextUrl: response.next,
        count: response.count,
      );
    });
  }

  @action
  void onChangeSearch(String? name) {
    if (name == null) {
      pokemonState =
          pokemonState.copyWith(pokemonsFilters: pokemonState.pokemons);
    } else {
      final pokemons = pokemonState.pokemons
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      pokemonState = pokemonState.copyWith(pokemonsFilters: pokemons);
    }
  }
}
