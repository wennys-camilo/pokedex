import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../shared/presentation/ui/themes/app_colors.dart';
import '../../widgets/header_logo_widget.dart';
import '../../widgets/pokemon_list_tile.dart';
import 'pokemon_controller.dart';
import 'pokemon_state.dart';
import 'widgets/search_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends ModularState<PokemonPage, PokemonController> {
  late final ScrollController _scrollController;
  late final TextEditingController searchControllerText;
  final FocusNode _focusSearch = FocusNode();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    searchControllerText = TextEditingController();
    controller.fetchAll();
    reaction<PokemonState>((_) => controller.pokemonState, (state) {
      if (state.failure != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.primary,
          duration: const Duration(seconds: 2),
          content: Text(state.failure?.message ?? ''),
        ));
      }
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
    _focusSearch.dispose();
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
            child: controller.pokemonState.failure != null ||
                    controller.pokemonState.loading
                ? Center(
                    child: TextButton(
                      onPressed: () => controller.fetchAll(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          controller.pokemonState.loading
                              ? CircularProgressIndicator(
                                  color: AppColors.primary,
                                )
                              : const Icon(Icons.refresh),
                          Text(
                            controller.pokemonState.loading
                                ? 'Aguarde'
                                : 'Buscar novamente',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  )
                : controller.pokemonState.loading
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
                                onChanged: (_) =>
                                    controller.onChangeBackGroundColor()),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SearchWidget(
                                      focusNode: _focusSearch,
                                      controller: searchControllerText,
                                      onChanged: (value) =>
                                          controller.onChangeSearch(value),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () async =>
                                        Modular.to.pushNamed('./favorites'),
                                    icon: Icon(
                                      Icons.favorite,
                                      color: AppColors.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            controller.pokemonState.pokemonsFilters.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Ops',
                                          style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Este pokemon não está aqui ;(',
                                          style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                : GridView.builder(
                                    physics: const ScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .pokemonState.pokemonsFilters.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: (orientation ==
                                                    Orientation.portrait)
                                                ? 3
                                                : 4),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return PokemonListTile(
                                        onTap: () {
                                          Modular.to.pushNamed('./details',
                                              arguments: controller.pokemonState
                                                  .pokemonsFilters[index].url);
                                          _focusSearch.unfocus();
                                        },
                                        pokemon: controller.pokemonState
                                            .pokemonsFilters[index],
                                      );
                                    },
                                  ),
                            Visibility(
                              visible: !controller.pokemonState.isMaxCount &&
                                  !controller.pokemonState.isFilter,
                              child: IconButton(
                                onPressed: () => controller.fetchNextPage(),
                                icon: Icon(Icons.keyboard_arrow_down_sharp,
                                    size: 40, color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
          floatingActionButton: Visibility(
            visible: controller.pokemonState.pokemonsFilters.isNotEmpty &&
                !controller.pokemonState.loading &&
                !controller.pokemonState.isMaxCount &&
                controller.pokemonState.failure == null,
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
