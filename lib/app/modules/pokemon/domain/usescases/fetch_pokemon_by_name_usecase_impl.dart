import 'package:dartz/dartz.dart';
import 'fetch_pokemon_by_name_usecase.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';

class FetchPokemonByNameUsecaseImpl implements FetchPokemonByNameUsecase {
  final PokemonRepository _repository;
  const FetchPokemonByNameUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, PokemonDetails>> call(String name) async {
    if (name.isEmpty) {
      return left(DatasourceFailure(
          message: 'O nome não pode ser vazio!',
          stackTrace: StackTrace.current));
    }
    final result = await _repository.fetchByName(name);
    return result;
  }
}
