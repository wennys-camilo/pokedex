import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/widgets/header_logo_widget.dart';
import '../../../../../shared/ui/widgets/pokemon_list_tile.dart';
import 'home_controller.dart';
import 'widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchControllerText = TextEditingController();

  @override
  void initState() {
    controller.fetchPokemons();
    super.initState();
    reaction((_) => controller.failure, (_) {
      controller.failure!.map((failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.primary,
          duration: const Duration(seconds: 2),
          content: Text(failure.message),
        ));
      });
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    searchControllerText.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
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
                        controller: _scrollController,
                        child: Column(
                          children: [
                            HeaderLogoWidget(
                              value: controller.backgroundColorDark,
                              onChanged: (value) =>
                                  controller.onChangeBackGroundColor(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SearchWidget(
                                      controller: searchControllerText,
                                      onPressedSearch: () async {
                                        if (searchControllerText
                                            .text.isNotEmpty) {
                                          await controller.fetchPokemonByName(
                                            name: searchControllerText.text,
                                          );
                                          if (!controller.failure!.isSome()) {
                                            await controller.fetchDescription(
                                              index:
                                                  controller.searchResult!.id,
                                            );
                                            Modular.to.pushNamed(
                                              '/search',
                                              arguments: [
                                                controller.searchResult,
                                                controller.backgroundColorDark,
                                              ],
                                            );
                                            searchControllerText.clear();
                                          } else {
                                            searchControllerText.clear();
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              backgroundColor:
                                                  AppColors.primary,
                                              content:
                                                  const Text('Insira um nome!'),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () async {
                                      await controller.idsFavoritesListGet();
                                      Modular.to.pushNamed('/favorites');
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: AppColors.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GridView.builder(
                              physics: const ScrollPhysics(),
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              shrinkWrap: true,
                              itemCount: controller.pokemonList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount:
                                          (orientation == Orientation.portrait)
                                              ? 3
                                              : 4),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await controller.fetchDetails(
                                        url: controller.pokemonList[index].url);
                                    if (!controller.failure!.isSome()) {
                                      await controller.fetchDescription(
                                          index: index + 1);
                                      Modular.to.pushNamed('/details',
                                          arguments: controller.details);
                                    }
                                  },
                                  child: PokemonListTile(
                                      color: controller.backgroundColorDark
                                          ? AppColors.backgroundColorDark
                                          : AppColors.white,
                                      name: controller.pokemonList[index].name,
                                      index: index + 1),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () => controller.fetchPokemonsNextPage(
                                  url: controller.pokedexResponse!.next),
                              icon: Icon(Icons.keyboard_arrow_down_sharp,
                                  size: 40, color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
          ),
          floatingActionButton: Visibility(
            visible: controller.pokedexResponse?.results != null,
            child: FloatingActionButton.small(
              backgroundColor: AppColors.primary,
              onPressed: _scrollDown,
              child: const Icon(Icons.arrow_downward),
            ),
          ),
        );
      },
    );
  }
}
