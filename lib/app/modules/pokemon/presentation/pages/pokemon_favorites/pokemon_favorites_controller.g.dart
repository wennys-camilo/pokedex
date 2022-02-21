// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonFavoritesController on _PokemonFavoritesControllerBase, Store {
  final _$pokemonFavoriteStateAtom =
      Atom(name: '_PokemonFavoritesControllerBase.pokemonFavoriteState');

  @override
  PokemonFavoriteState get pokemonFavoriteState {
    _$pokemonFavoriteStateAtom.reportRead();
    return super.pokemonFavoriteState;
  }

  @override
  set pokemonFavoriteState(PokemonFavoriteState value) {
    _$pokemonFavoriteStateAtom.reportWrite(value, super.pokemonFavoriteState,
        () {
      super.pokemonFavoriteState = value;
    });
  }

  final _$favoritesUrlAtom =
      Atom(name: '_PokemonFavoritesControllerBase.favoritesUrl');

  @override
  List<String> get favoritesUrl {
    _$favoritesUrlAtom.reportRead();
    return super.favoritesUrl;
  }

  @override
  set favoritesUrl(List<String> value) {
    _$favoritesUrlAtom.reportWrite(value, super.favoritesUrl, () {
      super.favoritesUrl = value;
    });
  }

  final _$fetchAsyncAction =
      AsyncAction('_PokemonFavoritesControllerBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
pokemonFavoriteState: ${pokemonFavoriteState},
favoritesUrl: ${favoritesUrl}
    ''';
  }
}
