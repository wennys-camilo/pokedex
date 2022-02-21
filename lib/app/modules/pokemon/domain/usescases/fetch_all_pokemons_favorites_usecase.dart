import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchAllPokemonsFavoritesUsecase {
  Future<Either<Failure, List<String>>> call();
}
