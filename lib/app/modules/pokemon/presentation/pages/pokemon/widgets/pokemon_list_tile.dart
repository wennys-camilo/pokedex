import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../shared/external/helpers/pokemon_end_point.dart';
import '../../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../../../domain/entities/pokemon.dart';

class PokemonListTile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  String get index =>
      pokemon.url.replaceAll(PokemonEndPoint.baseUrl, '').replaceAll('/', '');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('./details', arguments: pokemon.url),
      child: Card(
        color: AppColors.backgroundColorDark,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primary, width: 1.0),
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
                      color: AppColors.black,
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
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(Utils.capitalize(pokemon.name),
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))),
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
