import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'pokemon_details_controller.dart';
import 'widgets/stats_widget.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/themes/app_images.dart';
import '../../utils/extension/element_types_extension.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String url;
  const PokemonDetailsPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState
    extends ModularState<PokemonDetailsPage, PokemonDetailsController> {
  @override
  void initState() {
    super.initState();
    controller.getDetails(widget.url);
    controller.isFavorite(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      //TODO: CRIAR UMA TELA DE FALHA PADRÃO
      if (controller.pokemonDetailsState.failure != null) {
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
                  onPressed: () => controller.getDetails(widget.url),
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

      if (controller.pokemonDetailsState.loading) {
        return Center(child: const CircularProgressIndicator());
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(Utils.capitalize(
              controller.pokemonDetailsState.pokemonDetails.name)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child:
                  Text('#${controller.pokemonDetailsState.pokemonDetails.id}'),
            )
          ],
        ),
        backgroundColor:
            controller.pokemonDetailsState.pokemonDetails.types.first.baseColor,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -(270 / 4.7),
                  left: MediaQuery.of(context).size.width - (350 / 1.6),
                  child: SvgPicture.asset(AppImages.pokeball)),
              Positioned(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width - 20,
                left: 10.0,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  color: AppColors.cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  controller.changeFavorite(widget.url);
                                },
                                icon: Icon(Icons.favorite,
                                    size: 30,
                                    color: controller.pokemonDetailsState
                                                .isFavorite ??
                                            false
                                        ? AppColors.red
                                        : AppColors.grey))),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 40),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: controller
                                  .pokemonDetailsState.pokemonDetails.types
                                  .map((t) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FilterChip(
                                          label: Text(
                                            Utils.capitalize(t.name),
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          backgroundColor: t.baseColor,
                                          onSelected: (b) {},
                                        ),
                                      ))
                                  .toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(AppImages.iconWeight),
                                        color: AppColors.black,
                                      ),
                                      Text(
                                        controller.pokemonDetailsState
                                            .pokemonDetails.weight
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                        color:
                                            AppColors.grey.withOpacity(0.50)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(
                                          AppImages.iconHeight,
                                        ),
                                        color: AppColors.black,
                                      ),
                                      Text(
                                        controller.pokemonDetailsState
                                            .pokemonDetails.height
                                            .toString(),
                                        style:
                                            TextStyle(color: AppColors.black),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                        color:
                                            AppColors.grey.withOpacity(0.50)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                      children: controller.pokemonDetailsState
                                          .pokemonDetails.abilities
                                          .map((t) => Text(
                                              Utils.capitalize(
                                                t.ability,
                                              ),
                                              style: TextStyle(
                                                  color: AppColors.black)))
                                          .toList()),
                                  Text(
                                    'Moves',
                                    style: TextStyle(
                                        color:
                                            AppColors.grey.withOpacity(0.50)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 20),
                          child: Center(
                            child: Text(
                              controller.pokemonDetailsState.pokemonDetails
                                  .description,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Text(
                            'Base Stats',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: controller.pokemonDetailsState
                                    .pokemonDetails.types.first.baseColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        StatsWidget(
                          typeStat: 'HP',
                          valueStat: controller.pokemonDetailsState
                              .pokemonDetails.stats[0].baseStat,
                          colorType: controller.pokemonDetailsState
                              .pokemonDetails.types.first.baseColor,
                        ),
                        StatsWidget(
                          typeStat: 'ATK',
                          valueStat: controller.pokemonDetailsState
                              .pokemonDetails.stats[1].baseStat,
                          colorType: controller.pokemonDetailsState
                              .pokemonDetails.types.first.baseColor,
                        ),
                        StatsWidget(
                          typeStat: 'DEF',
                          valueStat: controller.pokemonDetailsState
                              .pokemonDetails.stats[2].baseStat,
                          colorType: controller.pokemonDetailsState
                              .pokemonDetails.types.first.baseColor,
                        ),
                        StatsWidget(
                          typeStat: 'SATK',
                          valueStat: controller.pokemonDetailsState
                              .pokemonDetails.stats[3].baseStat,
                          colorType: controller.pokemonDetailsState
                              .pokemonDetails.types.first.baseColor,
                        ),
                        StatsWidget(
                          typeStat: 'SDEF',
                          valueStat: controller.pokemonDetailsState
                              .pokemonDetails.stats[4].baseStat,
                          colorType: controller.pokemonDetailsState
                              .pokemonDetails.types.first.baseColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: StatsWidget(
                            typeStat: 'SPD',
                            valueStat: controller.pokemonDetailsState
                                .pokemonDetails.stats[5].baseStat,
                            colorType: controller.pokemonDetailsState
                                .pokemonDetails.types.first.baseColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SvgPicture.network(
                      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${controller.pokemonDetailsState.pokemonDetails.id}.svg',
                      fit: BoxFit.cover,
                      height: 150.00,
                      width: 150.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
