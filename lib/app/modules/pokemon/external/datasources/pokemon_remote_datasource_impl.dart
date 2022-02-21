import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/helpers/pokemon_end_point.dart';
import '../../domain/entities/pokedex.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../infra/datasources/pokemon_remote_datasource.dart';
import '../mappers/pokedex_mapper.dart';
import '../mappers/pokemon_details_mapper.dart';

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  final Dio _httpClient;

  const PokemonRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Pokedex> fetchAll({String? url}) async {
    try {
      final Response response =
          await _httpClient.get(url ?? '${PokemonEndPoint.baseUrl}?limit=15');

      return PokedexMapper().to(response.data);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<PokemonDetails> fetchDetails(String url) async {
    try {
      final Response response = await _httpClient.get(url);
      final Response responseDescription =
          await _httpClient.get(url.replaceAll('pokemon', 'pokemon-species'));
      return PokemonDetailsMapper().to((response.data as Map<String, dynamic>)
        ..addAll({
          'description': responseDescription.data['flavor_text_entries'][9]
              ['flavor_text']
        }));
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<PokemonDetails> fetchByID(int index) async {
    try {
      final Response response =
          await _httpClient.get('${PokemonEndPoint.baseUrl}$index');

      return PokemonDetailsMapper().to(response.data);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
