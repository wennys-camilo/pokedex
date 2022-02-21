import 'package:dartz/dartz.dart';
import 'package:pokedex/app/modules/pokemon/infra/datasources/pokemon_local_datasource.dart';
import '../../domain/entities/pokedex.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDatasource _remoteDatasource;

  const PokemonRepositoryImpl(
    this._remoteDatasource,
  );

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

  @override
  Future<Either<Failure, PokemonDetails>> fetchByName(String name) async {
    try {
      final response = await _remoteDatasource.fetchByName(name);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
