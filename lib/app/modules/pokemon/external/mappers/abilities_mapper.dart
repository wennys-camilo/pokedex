import '../../domain/entities/abilities.dart';

class AbilitiesMapper {
  Abilities to(Map<String, dynamic> map) {
    return Abilities(
      ability: map['ability']['name'],
    );
  }
}
