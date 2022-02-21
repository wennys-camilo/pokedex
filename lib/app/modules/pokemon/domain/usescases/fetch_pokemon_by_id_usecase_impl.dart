import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';
import 'fetch_pokemon_by_id_usecase.dart';

class FetchPokemonByIdUsecaseImpl implements FetchPokemonByIdUsecase {
  final PokemonRepository _repository;

  const FetchPokemonByIdUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, PokemonDetails>> call(int id) async {
    if (!(id >= 1)) {
      return left(DomainFailure(
          message: 'ID inválido!', stackTrace: StackTrace.current));
    }
    final result = await _repository.fetchByID(id);
    return result;
  }
}
