import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../ui/themes/app_images.dart';
import '../ui/themes/app_colors.dart';

class FailurePage extends StatelessWidget {
  final void Function()? failureAction;
  const FailurePage({Key? key, required this.failureAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: failureAction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Falha ao carregar descrição!\nTente novamente.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.white),
                  ),
                  const Icon(Icons.refresh)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
