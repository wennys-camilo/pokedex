import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/app_colors.dart';
import '../../utils/utils.dart';

class PokemonListTile extends StatelessWidget {
  final String name;
  final int index;
  final Color colorBackground;
  final Color? colorType;

  const PokemonListTile(
      {Key? key,
      required this.name,
      required this.index,
      required this.colorBackground,
      this.colorType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorBackground,
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
                '#${index.toString()}',
                style: TextStyle(
                    color: colorBackground == AppColors.white
                        ? AppColors.black
                        : Colors.white,
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
                      child: Text(Utils.capitalize(name),
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
    );
  }
}
