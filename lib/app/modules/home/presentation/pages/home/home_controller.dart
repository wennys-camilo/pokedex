import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/helpers/failure.dart';
import '../../../data/models/details.dart';
import '../../../data/models/pokedex.dart';
import '../../../data/models/pokemon.dart';
import '../../../data/repositories/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  _HomeControllerBase({required this.repository});

  @observable
  bool loading = false;

  @observable
  bool backgroundColorDark = true;

  @observable
  Pokedex? pokedexResponse;

  @observable
  Details? details;

  @observable
  Details? searchResult;

  @observable
  String? description;

  @observable
  Option<Failure>? failure;

  @observable
  var favoritesList = ObservableList<Details>();

  @observable
  var pokemonList = ObservableList<Pokemon>();

  @observable
  var selectedsPokemosID = ObservableList<int>();

  var logger = Logger();

  @action
  onChangeBackGroundColor() => backgroundColorDark = !backgroundColorDark;

  @action
  onChangeDescription(int index) =>
      favoritesList[index].description = details!.description;

  @action
  Future<void> fetchPokemons({String? url}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchAllPokemons(url: url);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) {
      pokemonList.addAll([...response.results!]);
      pokedexResponse = response;
      loading = false;
    });
  }

  @action
  Future<void> fetchPokemonsNexaPage({String? url}) async {
    failure = none();
    final response = await repository.fetchAllPokemons(url: url);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
    }, (response) {
      pokedexResponse!.count = response.count;
      pokedexResponse!.next = response.next;
      pokedexResponse!.previous = response.previous;
      pokemonList.addAll([...response.results!]);
    });
  }

  @action
  Future<void> fetchDetails({required String url}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchDetails(url);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) {
      details = response;
      loading = false;
    });
  }

  @action
  Future<void> fetchDescription({required int index}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchDescription(index);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) {
      details?.description = response;
      searchResult?.description = response;
      loading = false;
    });
  }

  @action
  Future<void> fetchPokemonByName({required String name}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchByName(name.toLowerCase());
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      logger.w(failuresResult.message);
      loading = false;
    }, (response) {
      logger.w(response);
      searchResult = response;
      loading = false;
    });
  }

  @action
  Future<void> fetchFavorites({required int index}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchByID(index);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) {
      favoritesList.add(response);
      loading = false;
    });
  }

  @action
  void removeFavorites({required int id}) {
    favoritesList.removeWhere((element) => element.id == id);
    selectedsPokemosID.remove(id);
  }

  @action
  void addFavorites({required int index}) {
    selectedsPokemosID.add(index);
  }

  Future<void> idsFavoritesListGet() async {
    favoritesList.clear();
    for (var element in selectedsPokemosID) {
      await fetchFavorites(index: element);
    }
  }
}
