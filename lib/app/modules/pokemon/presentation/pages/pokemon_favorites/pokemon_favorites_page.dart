import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/presentation/pages/failure_page.dart';
import '../../../../../shared/presentation/pages/loading_page.dart';
import '../../../../../shared/presentation/ui/themes/app_colors.dart';
import '../../../domain/entities/pokemon.dart';
import '../../utils/extension/element_types_extension.dart';
import '../../widgets/header_logo_widget.dart';
import '../../widgets/pokemon_list_tile.dart';
import '../pokemon/pokemon_controller.dart';
import 'pokemon_favorites_controller.dart';

class PokemonFavoritesPage extends StatefulWidget {
  const PokemonFavoritesPage({Key? key}) : super(key: key);

  @override
  State<PokemonFavoritesPage> createState() => _PokemonFavoritesPageState();
}

class _PokemonFavoritesPageState
    extends ModularState<PokemonFavoritesPage, PokemonFavoritesController> {
  bool get backgroundColorDark =>
      Modular.get<PokemonController>().backgroundColorDark;
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
          return FailurePage(failureAction: () => controller.fetch());
        }

        if (controller.pokemonFavoriteState.loading) {
          return const LoadingPage();
        }

        return Scaffold(
          backgroundColor:
              !backgroundColorDark ? AppColors.white : const Color(0xff212121),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(10), child: AppBar()),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderLogoWidget(
                      value: backgroundColorDark,
                      onChanged: (_) => Modular.get<PokemonController>()
                          .onChangeBackGroundColor()),
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

                      return PokemonListTile(
                        onTap: () async {
                          await Modular.to.pushNamed('/details',
                              arguments:
                                  'https://pokeapi.co/api/v2/pokemon/${favoriteItem.id}/');

                          await controller.fetch();
                        },
                        colorType: favoriteItem.types.first.baseColor,
                        pokemon: Pokemon(
                            name: favoriteItem.name,
                            url:
                                'https://pokeapi.co/api/v2/pokemon/${favoriteItem.id}/'),
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
