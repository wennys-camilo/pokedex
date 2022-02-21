import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../modules/pokemon/presentation/pages/pokemon/pokemon_controller.dart';

import '../../../../modules/pokemon/domain/entities/pokemon.dart';
import '../../../../shared/external/helpers/pokemon_end_point.dart';
import '../../../../shared/presentation/ui/themes/app_colors.dart';
import '../../../../shared/utils/utils.dart';

class PokemonListTile extends StatelessWidget {
  final Pokemon pokemon;
  final Color? colorType;
  final void Function()? onTap;
  const PokemonListTile({
    Key? key,
    this.colorType,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  String get index =>
      pokemon.url.replaceAll(PokemonEndPoint.baseUrl, '').replaceAll('/', '');

  bool get backgrouncColorDark =>
      Modular.get<PokemonController>().backgroundColorDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgrouncColorDark
            ? AppColors.backgroundColorDark
            : AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorType ?? AppColors.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        child: Stack(
          children: [
            Positioned(
                right: 5,
                child: Text(
                  '#$index',
                  style: TextStyle(
                      // ignore: prefer_if_null_operators
                      color: colorType != null
                          ? colorType
                          : backgrouncColorDark
                              ? AppColors.white
                              : AppColors.backgroundColorDark,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.network(
                      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$index.svg',
                      fit: BoxFit.contain,
                      placeholderBuilder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorType ?? AppColors.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        Utils.capitalize(pokemon.name),
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
