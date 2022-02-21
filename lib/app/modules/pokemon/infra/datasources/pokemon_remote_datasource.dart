import '../../domain/entities/pokemon_details.dart';
import '../../domain/entities/pokedex.dart';

abstract class PokemonRemoteDatasource {
  Future<Pokedex> fetchAll({String? url});
  Future<PokemonDetails> fetchDetails(String url);
  Future<PokemonDetails> fetchByID(int index);
}
