import 'package:dio/dio.dart';

import '../../../../shared/helpers/failure.dart';
import '../models/details.dart';
import '../models/pokedex.dart';
import 'remote_datasource.dart';

abstract class PokeRemoteDatasource {
  Future<Pokedex?> fetchAllPokemons(String? url);
  Future<Details?> fetchDetails(String url);
  Future<String?> fetchDescription(int index);
  Future<Details?> fetchByID(int index);
  Future<Details?> fetchByName(String name);
}

class PokeRemoteDatasourceImpl extends RemoteDatasource
    implements PokeRemoteDatasource {
  final Dio _httpClient;

  const PokeRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Pokedex?> fetchAllPokemons(String? url) async {
    try {
      final Response response = await _httpClient
          .get(url ?? 'https://pokeapi.co/api/v2/pokemon?limit=15&offset=0');
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return Pokedex.fromMap(result);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<Details?> fetchDetails(String url) async {
    try {
      final Response response = await _httpClient.get(url);
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return Details.fromMap(result);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String?> fetchDescription(int index) async {
    try {
      final Response response = await _httpClient
          .get('https://pokeapi.co/api/v2/pokemon-species/$index/');
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return result['flavor_text_entries'][9]['flavor_text'];
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<Details?> fetchByID(int index) async {
    try {
      final Response response =
          await _httpClient.get('https://pokeapi.co/api/v2/pokemon/$index');
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return Details.fromMap(result);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<Details?> fetchByName(String name) async {
    try {
      final Response response =
          await _httpClient.get('https://pokeapi.co/api/v2/pokemon/$name');
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return Details.fromMap(result);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }
}
