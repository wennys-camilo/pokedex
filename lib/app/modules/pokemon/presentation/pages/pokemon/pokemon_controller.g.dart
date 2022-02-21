// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonControllerBase, Store {
  final _$pokemonStateAtom = Atom(name: '_PokemonControllerBase.pokemonState');

  @override
  PokemonState get pokemonState {
    _$pokemonStateAtom.reportRead();
    return super.pokemonState;
  }

  @override
  set pokemonState(PokemonState value) {
    _$pokemonStateAtom.reportWrite(value, super.pokemonState, () {
      super.pokemonState = value;
    });
  }

  final _$backgroundColorDarkAtom =
      Atom(name: '_PokemonControllerBase.backgroundColorDark');

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

  final _$fetchAllAsyncAction = AsyncAction('_PokemonControllerBase.fetchAll');

  @override
  Future<void> fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  final _$fetchNextPageAsyncAction =
      AsyncAction('_PokemonControllerBase.fetchNextPage');

  @override
  Future<void> fetchNextPage() {
    return _$fetchNextPageAsyncAction.run(() => super.fetchNextPage());
  }

  final _$_PokemonControllerBaseActionController =
      ActionController(name: '_PokemonControllerBase');

  @override
  dynamic onChangeBackGroundColor() {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.onChangeBackGroundColor');
    try {
      return super.onChangeBackGroundColor();
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangeSearch(String? name) {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.onChangeSearch');
    try {
      return super.onChangeSearch(name);
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonState: ${pokemonState},
backgroundColorDark: ${backgroundColorDark}
    ''';
  }
}
