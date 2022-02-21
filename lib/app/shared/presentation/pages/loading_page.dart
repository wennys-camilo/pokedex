import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokemon/presentation/pages/pokemon/pokemon_controller.dart';
import 'package:pokedex/app/shared/presentation/ui/themes/app_colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Modular.get<PokemonController>().backgroundColorDark
          ? AppColors.black
          : AppColors.white,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
