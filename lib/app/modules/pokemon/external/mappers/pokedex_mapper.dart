import '../../domain/entities/pokedex.dart';
import '../../domain/entities/pokemon.dart';
import 'pokemon_mapper.dart';

class PokedexMapper {
  Pokedex to(Map<String, dynamic> map) {
    return Pokedex(
        count: map['count']?.toInt() ?? 0,
        next: map['next'],
        previous: map['previous'],
        results: List<Pokemon>.from(
            map['results']?.map((x) => PokemonMapper().to(x))));
  }
}
