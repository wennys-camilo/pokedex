import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';
import 'fetch_pokemon_details_by_url_usecase.dart';

class FetchPokemonDetailsByUrlUsecaseImpl
    implements FetchPokemonDetailsByUrlUseCase {
  final PokemonRepository _repository;
  const FetchPokemonDetailsByUrlUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, PokemonDetails>> call(String url) async {
    if (url.isEmpty) {
      return left(DatasourceFailure(
          message: 'A url não pode ser vazia!',
          stackTrace: StackTrace.current));
    }
    final result = await _repository.fetchDetails(url);
    return result;
  }
}
