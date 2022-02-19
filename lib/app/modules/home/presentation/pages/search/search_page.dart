import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/ui/widgets/pokemon_list_tile.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../data/models/details.dart';

class SearchPage extends StatelessWidget {
  final Details details;
  final bool backgroundColorDark;
  const SearchPage(
      {Key? key, required this.details, required this.backgroundColorDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColorDark ? AppColors.backgroundColorDark : AppColors.white,
      appBar: AppBar(
        title: Text(Utils.capitalize(details.name)),
        elevation: 0,
        backgroundColor: details.baseColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
          ),
          children: [
            GestureDetector(
              onTap: () {
                Modular.to.pushNamed('/details', arguments: details);
              },
              child: PokemonListTile(
                colorType: details.baseColor,
                name: details.name,
                index: details.id,
                colorBackground: backgroundColorDark
                    ? AppColors.backgroundColorDark
                    : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
