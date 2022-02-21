import 'package:dartz/dartz.dart';
import '../entities/pokedex.dart';
import '../entities/pokemon_details.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokedex>> fetchAll({String? url});
  Future<Either<Failure, PokemonDetails>> fetchDetails(String url);
  Future<Either<Failure, PokemonDetails>> fetchByID(int index);
  Future<Either<Failure, PokemonDetails>> fetchByName(String name);
}
