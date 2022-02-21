import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/app/modules/home/presentation/pages/details/details_controller.dart';
import '../../../data/models/details.dart';
import '../home/home_controller.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/themes/app_images.dart';
import 'widgets/stats_widget.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsController controller = Modular.get<DetailsController>();

  @override
  void initState() {
    fetchDetails();
    super.initState();
  }

  Future<void> fetchDetails() async {
    await controller.fetchDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Modular.get<HomeController>();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.details?.name != null
              ? Utils.capitalize(controller.details!.name)
              : ''),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(controller.details?.name != null
                  ? '#${controller.details!.id}'
                  : ''),
            )
          ],
        ),
        backgroundColor: controller.details?.baseColor ?? AppColors.black,
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
                child: controller.details == null
                    ? Center(
                        child: TextButton(
                          onPressed: () =>
                              controller.fetchDetails(id: widget.id),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              controller.loading
                                  ? CircularProgressIndicator(
                                      color: AppColors.white,
                                    )
                                  : Icon(
                                      Icons.refresh,
                                      color: AppColors.white,
                                    ),
                              Text(
                                controller.loading
                                    ? 'Aguarde'
                                    : 'Falha ao carregar descrição!\nTente novamente.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    : controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Card(
                            color: Modular.get<HomeController>()
                                    .backgroundColorDark
                                ? AppColors.cardColor
                                : AppColors.white,
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
                                            /*   controller.selectedsPokemosID
                                                    .contains(
                                                        controller.details!.id)
                                                ? controller.removeFavorites(
                                                    id: controller.details!.id)
                                                : controller.addFavorites(
                                                    index:
                                                        controller.details!.id);*/
                                          },
                                          icon: Icon(Icons.favorite,
                                              size: 30,
                                              color: /*controller
                                                      .selectedsPokemosID
                                                      .contains(controller
                                                          .details!.id)
                                                  ? AppColors.primary
                                                  : */
                                                  AppColors.grey))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 40),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: controller.details!.types
                                            .map((t) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: FilterChip(
                                                    label: Text(
                                                      Utils.capitalize(t.name),
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    backgroundColor:
                                                        Details.color(
                                                            type: t.name),
                                                    onSelected: (b) {},
                                                  ),
                                                ))
                                            .toList()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                ImageIcon(
                                                  const AssetImage(
                                                      AppImages.iconWeight),
                                                  color: Modular.get<
                                                              HomeController>()
                                                          .backgroundColorDark
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                                Text(
                                                  controller.details!.weight
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Modular.get<
                                                                HomeController>()
                                                            .backgroundColorDark
                                                        ? AppColors.white
                                                        : AppColors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Weight',
                                              style: TextStyle(
                                                  color: AppColors.grey
                                                      .withOpacity(0.50)),
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
                                                  color: Modular.get<
                                                              HomeController>()
                                                          .backgroundColorDark
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                                Text(
                                                  controller.details!.height
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Modular.get<
                                                                  HomeController>()
                                                              .backgroundColorDark
                                                          ? AppColors.white
                                                          : AppColors.black),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Height',
                                              style: TextStyle(
                                                  color: AppColors.grey
                                                      .withOpacity(0.50)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                                children: controller
                                                    .details!.abilities
                                                    .map((t) => Text(
                                                        Utils.capitalize(
                                                          t.ability,
                                                        ),
                                                        style: TextStyle(
                                                            color: Modular.get<
                                                                        HomeController>()
                                                                    .backgroundColorDark
                                                                ? AppColors
                                                                    .white
                                                                : AppColors
                                                                    .black)))
                                                    .toList()),
                                            Text(
                                              'Moves',
                                              style: TextStyle(
                                                  color: AppColors.grey
                                                      .withOpacity(0.50)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 20,
                                        bottom: 20),
                                    child: Center(
                                      child: Text(
                                        controller.details?.description ??
                                            'Falha ao carregar a descrição!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Modular.get<HomeController>()
                                                    .backgroundColorDark
                                                ? AppColors.white
                                                : AppColors.black),
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
                                          color: controller.details!.baseColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  StatsWidget(
                                      typeStat: 'HP',
                                      valueStat:
                                          controller.details!.stats[0].baseStat,
                                      colorType:
                                          controller.details!.baseColor!),
                                  StatsWidget(
                                      typeStat: 'ATK',
                                      valueStat:
                                          controller.details!.stats[1].baseStat,
                                      colorType: controller.details!.baseColor),
                                  StatsWidget(
                                      typeStat: 'DEF',
                                      valueStat:
                                          controller.details!.stats[2].baseStat,
                                      colorType: controller.details!.baseColor),
                                  StatsWidget(
                                      typeStat: 'SATK',
                                      valueStat:
                                          controller.details!.stats[3].baseStat,
                                      colorType: controller.details!.baseColor),
                                  StatsWidget(
                                      typeStat: 'SDEF',
                                      valueStat:
                                          controller.details!.stats[4].baseStat,
                                      colorType: controller.details!.baseColor),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: StatsWidget(
                                        typeStat: 'SPD',
                                        valueStat: controller
                                            .details!.stats[5].baseStat,
                                        colorType:
                                            controller.details!.baseColor),
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
                    controller.details?.id != null
                        ? SvgPicture.network(
                            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${controller.details?.id}.svg',
                            fit: BoxFit.cover,
                            height: 150.00,
                            width: 150.0,
                          )
                        : Container(),
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
