import 'package:dartz/dartz.dart';
import '../../../../shared/helpers/failure.dart';
import '../models/details.dart';

import '../datasources/poke_remote_datasource.dart';
import '../models/pokedex.dart';

abstract class PokeRepository {
  Future<Either<Failure, Pokedex>> fetchAllPokemons({String? url});
  Future<Either<Failure, Details>> fetchDetails(String url);
  Future<Either<Failure, String>> fetchDescription(int index);
  Future<Either<Failure, Details>> fetchByID(int index);
  Future<Either<Failure, Details>> fetchByName(String name);
}

class PokeImpl implements PokeRepository {
  final PokeRemoteDatasource _remoteDatasource;

  const PokeImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, Pokedex>> fetchAllPokemons({String? url}) async {
    try {
      final response = await _remoteDatasource.fetchAllPokemons(url);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Details>> fetchDetails(String url) async {
    try {
      final response = await _remoteDatasource.fetchDetails(url);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, String>> fetchDescription(int index) async {
    try {
      final response = await _remoteDatasource.fetchDescription(index);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Details>> fetchByID(int index) async {
    try {
      final response = await _remoteDatasource.fetchByID(index);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Details>> fetchByName(String name) async {
    try {
      final response = await _remoteDatasource.fetchByName(name);
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
