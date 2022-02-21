import 'package:dartz/dartz.dart';
import '../entities/pokedex.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchAllPokemonsUsecase {
  Future<Either<Failure, Pokedex>> call({String? url});
}
