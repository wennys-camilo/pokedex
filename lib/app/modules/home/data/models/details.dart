import 'package:flutter/material.dart';

import 'abilities.dart';
import 'species.dart';
import 'stats.dart';
import 'types.dart';

class Details {
  final List<Abilities> abilities;
  final double height;
  final int id;
  final String name;
  final Species species;
  final List<Stats> stats;
  final List<Types> types;
  final double weight;
  String? description;
  Details({
    required this.abilities,
    required this.height,
    required this.id,
    required this.name,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
    this.description,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      abilities: List<Abilities>.from(
          map['abilities']?.map((x) => Abilities.fromMap(x))),
      height: map['height']?.toDouble() / 10 ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      species: Species.fromMap(map['species']),
      stats: List<Stats>.from(map['stats']?.map((x) => Stats.fromMap(x))),
      types: List<Types>.from(map['types']?.map((x) => Types.fromMap(x))),
      weight: map['weight']?.toDouble() / 10 ?? 0,
    );
  }

  Color? get baseColor => color(type: types[0].name);

  static Color? color({required String type}) {
    switch (type) {
      case 'normal':
        return const Color(0xffAAA67F);
      case 'fire':
        return const Color(0xffF57D31);
      case 'water':
        return const Color(0xff6493EB);
      case 'grass':
        return const Color(0xFF74CB48);
      case 'electric':
        return const Color(0xffF9CF30);
      case 'ice':
        return const Color(0xff9AD6DF);
      case 'fighting':
        return const Color(0xffC12239);
      case 'poison':
        return const Color(0xffA43E9E);
      case 'ground':
        return const Color(0xffDEC16B);
      case 'flying':
        return const Color(0xffA891EC);
      case 'psychic':
        return const Color(0xffFB5584);
      case 'bug':
        return const Color(0xffA7B723);
      case 'rock':
        return const Color(0xffB69E31);
      case 'ghost':
        return const Color(0xff70559B);
      case 'dark':
        return const Color(0xff75574C);
      case 'dragon':
        return const Color(0xff7037FF);
      case 'steel':
        return const Color(0xffB7B9D0);
      case 'fairy':
        return const Color(0xffE69EAC);
      default:
        return Colors.grey;
    }
  }

  @override
  String toString() {
    return 'Details(abilities: $abilities, height: $height, id: $id, name: $name, species: $species, stats: $stats, types: $types, weight: $weight)';
  }
}
