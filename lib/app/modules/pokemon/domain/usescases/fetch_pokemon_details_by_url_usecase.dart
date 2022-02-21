import 'package:dartz/dartz.dart';
import '../entities/pokemon_details.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchPokemonDetailsByUrlUseCase {
  Future<Either<Failure, PokemonDetails>> call(String url);
}
