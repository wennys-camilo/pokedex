import '../../domain/enums/element_type.dart';

class ElementTypeMapper {
  ElementType to(String value) {
    switch (value) {
      case 'normal':
        return ElementType.normal;
      case 'fire':
        return ElementType.fire;
      case 'water':
        return ElementType.water;
      case 'grass':
        return ElementType.grass;
      case 'electric':
        return ElementType.electric;
      case 'ice':
        return ElementType.ice;
      case 'fighting':
        return ElementType.fighting;
      case 'poison':
        return ElementType.poison;
      case 'ground':
        return ElementType.ground;
      case 'flying':
        return ElementType.flying;
      case 'psychic':
        return ElementType.psychic;
      case 'bug':
        return ElementType.bug;
      case 'rock':
        return ElementType.rock;
      case 'ghost':
        return ElementType.ghost;
      case 'dark':
        return ElementType.dark;
      case 'dragon':
        return ElementType.dragon;
      case 'steel':
        return ElementType.steel;
      case 'fairy':
        return ElementType.fairy;

      default:
        throw UnimplementedError();
    }
  }
}
