import 'package:dartz/dartz.dart';
import '../entities/pokemon_details.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchPokemonByIdUsecase {
  Future<Either<Failure, PokemonDetails>> call(int index);
}
