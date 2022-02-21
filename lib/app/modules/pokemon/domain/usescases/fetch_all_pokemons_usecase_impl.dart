import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/pokedex.dart';
import '../repositories/pokemon_repository.dart';
import 'fetch_all_pokemons_usecase.dart';

class FetchAllPokemonsUsecaseImpl implements FetchAllPokemonsUsecase {
  final PokemonRepository _repository;

  const FetchAllPokemonsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Pokedex>> call({String? url}) async {
    final result = await _repository.fetchAll(url: url);
    return result;
  }
}
