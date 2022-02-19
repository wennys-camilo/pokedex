import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/widgets/header_logo_widget.dart';
import '../../../../../shared/ui/widgets/pokemon_list_tile.dart';
import '../home/home_controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    HomeController controller = Modular.get<HomeController>();
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: controller.backgroundColorDark
              ? const Color(0xff212121)
              : AppColors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(10), child: AppBar()),
          body: SafeArea(
            child: controller.pokedexResponse == null
                ? Center(
                    child: TextButton(
                      onPressed: () => controller.fetchPokemons(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          controller.loading
                              ? CircularProgressIndicator(
                                  color: AppColors.primary,
                                )
                              : const Icon(Icons.refresh),
                          Text(
                            controller.loading ? 'Aguarde' : 'Buscar novamente',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  )
                : controller.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            HeaderLogoWidget(
                              value: controller.backgroundColorDark,
                              onChanged: (_) =>
                                  controller.onChangeBackGroundColor(),
                            ),
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
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            GridView.builder(
                              physics: const ScrollPhysics(),
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              shrinkWrap: true,
                              itemCount: controller.favoritesList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount:
                                          (orientation == Orientation.portrait)
                                              ? 3
                                              : 4),
                              itemBuilder: (BuildContext context, int index) {
                                var favoriteItem =
                                    controller.favoritesList[index];
                                return GestureDetector(
                                  onTap: () async {
                                    if (!controller.failure!.isSome()) {
                                      await controller.fetchDescription(
                                          index: favoriteItem.id);
                                      controller.onChangeDescription(index);
                                      Modular.to.pushNamed('/details',
                                          arguments: favoriteItem);
                                    }
                                  },
                                  child: PokemonListTile(
                                      colorType: controller
                                          .favoritesList[index].baseColor,
                                      colorBackground:
                                          controller.backgroundColorDark
                                              ? AppColors.backgroundColorDark
                                              : AppColors.white,
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
