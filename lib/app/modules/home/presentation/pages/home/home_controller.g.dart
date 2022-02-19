// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$backgroundColorDarkAtom =
      Atom(name: '_HomeControllerBase.backgroundColorDark');

  @override
  bool get backgroundColorDark {
    _$backgroundColorDarkAtom.reportRead();
    return super.backgroundColorDark;
  }

  @override
  set backgroundColorDark(bool value) {
    _$backgroundColorDarkAtom.reportWrite(value, super.backgroundColorDark, () {
      super.backgroundColorDark = value;
    });
  }

  final _$pokedexResponseAtom =
      Atom(name: '_HomeControllerBase.pokedexResponse');

  @override
  Pokedex? get pokedexResponse {
    _$pokedexResponseAtom.reportRead();
    return super.pokedexResponse;
  }

  @override
  set pokedexResponse(Pokedex? value) {
    _$pokedexResponseAtom.reportWrite(value, super.pokedexResponse, () {
      super.pokedexResponse = value;
    });
  }

  final _$detailsAtom = Atom(name: '_HomeControllerBase.details');

  @override
  Details? get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(Details? value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$searchResultAtom = Atom(name: '_HomeControllerBase.searchResult');

  @override
  Details? get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(Details? value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_HomeControllerBase.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$failureAtom = Atom(name: '_HomeControllerBase.failure');

  @override
  Option<Failure>? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<Failure>? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$favoritesListAtom = Atom(name: '_HomeControllerBase.favoritesList');

  @override
  ObservableList<Details> get favoritesList {
    _$favoritesListAtom.reportRead();
    return super.favoritesList;
  }

  @override
  set favoritesList(ObservableList<Details> value) {
    _$favoritesListAtom.reportWrite(value, super.favoritesList, () {
      super.favoritesList = value;
    });
  }

  final _$pokemonListAtom = Atom(name: '_HomeControllerBase.pokemonList');

  @override
  ObservableList<Pokemon> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(ObservableList<Pokemon> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  final _$selectedsPokemosIDAtom =
      Atom(name: '_HomeControllerBase.selectedsPokemosID');

  @override
  ObservableList<int> get selectedsPokemosID {
    _$selectedsPokemosIDAtom.reportRead();
    return super.selectedsPokemosID;
  }

  @override
  set selectedsPokemosID(ObservableList<int> value) {
    _$selectedsPokemosIDAtom.reportWrite(value, super.selectedsPokemosID, () {
      super.selectedsPokemosID = value;
    });
  }

  final _$fetchPokemonsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPokemons');

  @override
  Future<void> fetchPokemons({String? url}) {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons(url: url));
  }

  final _$fetchPokemonsNextPageAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPokemonsNextPage');

  @override
  Future<void> fetchPokemonsNextPage({String? url}) {
    return _$fetchPokemonsNextPageAsyncAction
        .run(() => super.fetchPokemonsNextPage(url: url));
  }

  final _$fetchDetailsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchDetails');

  @override
  Future<void> fetchDetails({required String url}) {
    return _$fetchDetailsAsyncAction.run(() => super.fetchDetails(url: url));
  }

  final _$fetchDescriptionAsyncAction =
      AsyncAction('_HomeControllerBase.fetchDescription');

  @override
  Future<void> fetchDescription({required int index}) {
    return _$fetchDescriptionAsyncAction
        .run(() => super.fetchDescription(index: index));
  }

  final _$fetchPokemonByNameAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPokemonByName');

  @override
  Future<void> fetchPokemonByName({required String name}) {
    return _$fetchPokemonByNameAsyncAction
        .run(() => super.fetchPokemonByName(name: name));
  }

  final _$fetchFavoritesAsyncAction =
      AsyncAction('_HomeControllerBase.fetchFavorites');

  @override
  Future<void> fetchFavorites({required int index}) {
    return _$fetchFavoritesAsyncAction
        .run(() => super.fetchFavorites(index: index));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic onChangeBackGroundColor() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChangeBackGroundColor');
    try {
      return super.onChangeBackGroundColor();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeDescription(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChangeDescription');
    try {
      return super.onChangeDescription(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavorites({required int id}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeFavorites');
    try {
      return super.removeFavorites(id: id);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFavorites({required int index}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addFavorites');
    try {
      return super.addFavorites(index: index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
backgroundColorDark: ${backgroundColorDark},
pokedexResponse: ${pokedexResponse},
details: ${details},
searchResult: ${searchResult},
description: ${description},
failure: ${failure},
favoritesList: ${favoritesList},
pokemonList: ${pokemonList},
selectedsPokemosID: ${selectedsPokemosID}
    ''';
  }
}
