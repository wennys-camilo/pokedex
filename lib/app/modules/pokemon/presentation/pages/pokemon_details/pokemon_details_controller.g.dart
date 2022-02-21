// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailsController on _PokemonDetailsControllerBase, Store {
  final _$pokemonDetailsStateAtom =
      Atom(name: '_PokemonDetailsControllerBase.pokemonDetailsState');

  @override
  PokemonDetailsState get pokemonDetailsState {
    _$pokemonDetailsStateAtom.reportRead();
    return super.pokemonDetailsState;
  }

  @override
  set pokemonDetailsState(PokemonDetailsState value) {
    _$pokemonDetailsStateAtom.reportWrite(value, super.pokemonDetailsState, () {
      super.pokemonDetailsState = value;
    });
  }

  final _$getDetailsAsyncAction =
      AsyncAction('_PokemonDetailsControllerBase.getDetails');

  @override
  Future<void> getDetails(String url) {
    return _$getDetailsAsyncAction.run(() => super.getDetails(url));
  }

  final _$isFavoriteAsyncAction =
      AsyncAction('_PokemonDetailsControllerBase.isFavorite');

  @override
  Future<void> isFavorite(String url) {
    return _$isFavoriteAsyncAction.run(() => super.isFavorite(url));
  }

  final _$changeFavoriteAsyncAction =
      AsyncAction('_PokemonDetailsControllerBase.changeFavorite');

  @override
  Future<void> changeFavorite(String url) {
    return _$changeFavoriteAsyncAction.run(() => super.changeFavorite(url));
  }

  @override
  String toString() {
    return '''
pokemonDetailsState: ${pokemonDetailsState}
    ''';
  }
}
