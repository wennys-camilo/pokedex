import '../../domain/entities/abilities.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/entities/stats.dart';
import '../../domain/enums/element_type.dart';
import 'abilities_mapper.dart';
import 'element_type_mapper.dart';
import 'species_mapper.dart';
import 'stats_mapper.dart';

class PokemonDetailsMapper {
  PokemonDetails to(Map<String, dynamic> map) {
    return PokemonDetails(
      abilities: List<Abilities>.from(
          map['abilities']?.map((x) => AbilitiesMapper().to(x))),
      height: map['height']?.toDouble() / 10 ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      species: SpeciesMapper().to(map['species']),
      stats: List<Stats>.from(map['stats']?.map((x) => StatsMapper().to(x))),
      types: List<ElementType>.from(
          map['types']?.map((x) => ElementTypeMapper().to(x['type']['name']))),
      weight: map['weight']?.toDouble() / 10 ?? 0,
      description: map['description'],
    );
  }
}
