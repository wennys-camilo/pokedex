import '../../domain/entities/species.dart';

class SpeciesMapper {
  Species to(Map<String, dynamic> map) {
    return Species(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
