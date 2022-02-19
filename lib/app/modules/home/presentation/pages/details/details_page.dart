import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/models/details.dart';
import '../home/home_controller.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../../shared/ui/themes/app_colors.dart';
import '../../../../../shared/ui/themes/app_images.dart';
import 'widgets/stats_widget.dart';

class DetailsPage extends StatelessWidget {
  final Details details;

  const DetailsPage({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.capitalize(details.name)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('#${details.id}'),
          )
        ],
      ),
      backgroundColor: details.baseColor,
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
                color: controller.backgroundColorDark
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
                        child: Observer(
                          builder: (_) {
                            return IconButton(
                                onPressed: () {
                                  controller.selectedsPokemosID
                                          .contains(details.id)
                                      ? controller.removeFavorites(
                                          id: details.id)
                                      : controller.addFavorites(
                                          index: details.id);
                                },
                                icon: Icon(Icons.favorite,
                                    size: 30,
                                    color: controller.selectedsPokemosID
                                            .contains(details.id)
                                        ? AppColors.primary
                                        : AppColors.grey));
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 40),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: details.types
                                .map((t) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FilterChip(
                                        label: Text(
                                          Utils.capitalize(t.name),
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        backgroundColor:
                                            Details.color(type: t.name),
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
                                      color: controller.backgroundColorDark
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                    Text(
                                      details.weight.toString(),
                                      style: TextStyle(
                                        color: controller.backgroundColorDark
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: AppColors.grey.withOpacity(0.50)),
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
                                      color: controller.backgroundColorDark
                                          ? AppColors.white
                                          : AppColors.black,
                                    ),
                                    Text(
                                      details.height.toString(),
                                      style: TextStyle(
                                          color: controller.backgroundColorDark
                                              ? AppColors.white
                                              : AppColors.black),
                                    )
                                  ],
                                ),
                                Text(
                                  'Height',
                                  style: TextStyle(
                                      color: AppColors.grey.withOpacity(0.50)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                    children: details.abilities
                                        .map((t) => Text(
                                            Utils.capitalize(
                                              t.ability,
                                            ),
                                            style: TextStyle(
                                                color: controller
                                                        .backgroundColorDark
                                                    ? AppColors.white
                                                    : AppColors.black)))
                                        .toList()),
                                Text(
                                  'Moves',
                                  style: TextStyle(
                                      color: AppColors.grey.withOpacity(0.50)),
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
                            details.description ??
                                'Falha ao carregar a descrição!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: controller.backgroundColorDark
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
                              color: details.baseColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      StatsWidget(
                          typeStat: 'HP',
                          valueStat: details.stats[0].baseStat,
                          colorType: details.baseColor!),
                      StatsWidget(
                          typeStat: 'ATK',
                          valueStat: details.stats[1].baseStat,
                          colorType: details.baseColor),
                      StatsWidget(
                          typeStat: 'DEF',
                          valueStat: details.stats[2].baseStat,
                          colorType: details.baseColor),
                      StatsWidget(
                          typeStat: 'SATK',
                          valueStat: details.stats[3].baseStat,
                          colorType: details.baseColor),
                      StatsWidget(
                          typeStat: 'SDEF',
                          valueStat: details.stats[4].baseStat,
                          colorType: details.baseColor),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: StatsWidget(
                            typeStat: 'SPD',
                            valueStat: details.stats[5].baseStat,
                            colorType: details.baseColor),
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
                    'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${details.id}.svg',
                    fit: BoxFit.cover,
                    height: 150.00,
                    width: 150.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
