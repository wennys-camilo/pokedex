import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/app/modules/pokemon/presentation/pages/pokemon_favorites/pokemon_favorites_controller.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/themes/app_images.dart';
import '../../../../../shared/ui/widgets/header_logo_widget.dart';
import '../../../../../shared/ui/widgets/pokemon_list_tile.dart';
import '../../utils/extension/element_types_extension.dart';

class PokemonFavoritesPage extends StatefulWidget {
  const PokemonFavoritesPage({Key? key}) : super(key: key);

  @override
  State<PokemonFavoritesPage> createState() => _PokemonFavoritesPageState();
}

class _PokemonFavoritesPageState
    extends ModularState<PokemonFavoritesPage, PokemonFavoritesController> {
  @override
  void initState() {
    super.initState();
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Observer(
      builder: (_) {
        if (controller.pokemonFavoriteState.failure != null) {
          return Scaffold(
            backgroundColor: AppColors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -(270 / 4.7),
                    left: MediaQuery.of(context).size.width - (350 / 1.6),
                    child: SvgPicture.asset(AppImages.pokeball)),
                Center(
                  child: TextButton(
                    onPressed: () => controller.fetch(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Falha ao carregar descrição!\nTente novamente.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.white),
                        ),
                        Icon(Icons.refresh)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (controller.pokemonFavoriteState.loading) {
          return Center(child: const CircularProgressIndicator());
        }

        return Scaffold(
          backgroundColor: const Color(0xff212121),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(10), child: AppBar()),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderLogoWidget(value: false, onChanged: (_) {}),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Meus Favoritos',
                          style:
                              TextStyle(color: AppColors.primary, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    shrinkWrap: true,
                    itemCount: controller.pokemonFavoriteState.favorites.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 3 : 4),
                    itemBuilder: (BuildContext context, int index) {
                      var favoriteItem =
                          controller.pokemonFavoriteState.favorites[index];
                      return GestureDetector(
                        onTap: () async {
                          await Modular.to.pushNamed('/details',
                              arguments:
                                  'https://pokeapi.co/api/v2/pokemon/${favoriteItem.id}/');

                          await controller.fetch();
                        },
                        child: PokemonListTile(
                            colorType: favoriteItem.types.first.baseColor,
                            colorBackground: AppColors.backgroundColorDark,
                            name: favoriteItem.name,
                            index: favoriteItem.id),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () => Modular.to.pop(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Voltar',
                          style: TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
