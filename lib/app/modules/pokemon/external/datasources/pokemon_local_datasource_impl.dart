import 'package:localstorage/localstorage.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../infra/datasources/pokemon_local_datasource.dart';

class PokemonLocalDatasourceImpl implements PokemonLocalDatasource {
  final LocalStorage _localStorage;

  PokemonLocalDatasourceImpl(this._localStorage);

  @override
  Future<bool> exists(String value) async {
    try {
      final favorites = await getAll();
      if (favorites.contains(value)) {
        return true;
      }
      return false;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<String>> getAll() async {
    try {
      final response = await _localStorage.getItem('favorites');
      if (response == null) return [];
      return (response as List).cast<String>();
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<void> insert(String value) async {
    try {
      final favorites = await getAll();
      if (favorites.contains(value)) return;
      await _localStorage.setItem('favorites', favorites..add(value));
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<void> remove(String value) async {
    try {
      final favorites = await getAll();
      if (!favorites.contains(value)) return;
      await _localStorage.setItem(
          'favorites', favorites..removeWhere((element) => value == element));
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
