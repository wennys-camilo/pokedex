import 'package:flutter/material.dart';
import '../../../domain/enums/element_type.dart';

extension ElementTypeExtension on ElementType {
  Color get baseColor {
    switch (this) {
      case ElementType.normal:
        return const Color(0xffAAA67F);
      case ElementType.fire:
        return const Color(0xffF57D31);
      case ElementType.water:
        return const Color(0xff6493EB);
      case ElementType.grass:
        return const Color(0xFF74CB48);
      case ElementType.electric:
        return const Color(0xffF9CF30);
      case ElementType.ice:
        return const Color(0xff9AD6DF);
      case ElementType.fighting:
        return const Color(0xffC12239);
      case ElementType.poison:
        return const Color(0xffA43E9E);
      case ElementType.ground:
        return const Color(0xffDEC16B);
      case ElementType.flying:
        return const Color(0xffA891EC);
      case ElementType.psychic:
        return const Color(0xffFB5584);
      case ElementType.bug:
        return const Color(0xffA7B723);
      case ElementType.rock:
        return const Color(0xffB69E31);
      case ElementType.ghost:
        return const Color(0xff70559B);
      case ElementType.dark:
        return const Color(0xff75574C);
      case ElementType.dragon:
        return const Color(0xff7037FF);
      case ElementType.steel:
        return const Color(0xffB7B9D0);
      case ElementType.fairy:
        return const Color(0xffE69EAC);

      default:
        throw UnimplementedError();
    }
  }
}
