import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/pokemon_repository.dart';
import 'fetch_all_pokemons_favorites_usecase.dart';

class FetchAllPokemonsFavoritesUsecaseImpl
    implements FetchAllPokemonsFavoritesUsecase {
  final PokemonRepository _repository;

  const FetchAllPokemonsFavoritesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<String>>> call() async {
    final result = await _repository.gelAllFavorites();
    return result;
  }
}
