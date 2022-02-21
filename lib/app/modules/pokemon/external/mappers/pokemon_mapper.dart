import '../../domain/entities/pokemon.dart';

class PokemonMapper {
  Pokemon to(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
