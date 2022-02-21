import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/pokedex.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_local_datasource.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDatasource _remoteDatasource;

  final PokemonLocalDatasource _localDatasource;

  const PokemonRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<Failure, bool>> existsFavorites(String value) async {
    try {
      final response = await _localDatasource.exists(value);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<String>>> gelAllFavorites() async {
    try {
      final response = await _localDatasource.getAll();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Unit>> insertFavorites(String url) async {
    try {
      await _localDatasource.insert(url);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorites(String url) async {
    try {
      await _localDatasource.remove(url);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Pokedex>> fetchAll({String? url}) async {
    try {
      final response = await _remoteDatasource.fetchAll(url: url);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, PokemonDetails>> fetchDetails(String url) async {
    try {
      final response = await _remoteDatasource.fetchDetails(url);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, PokemonDetails>> fetchByID(int index) async {
    try {
      final response = await _remoteDatasource.fetchByID(index);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
