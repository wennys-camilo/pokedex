import 'package:flutter/material.dart';
import '../../../../shared/presentation/ui/themes/app_colors.dart';
import '../../../../shared/presentation/ui/themes/app_images.dart';

class HeaderLogoWidget extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const HeaderLogoWidget(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.logoHome),
          const SizedBox(
            width: 20,
          ),
          Text(
            'ioasys pokédex',
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Switch(
            activeColor: AppColors.primary,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
