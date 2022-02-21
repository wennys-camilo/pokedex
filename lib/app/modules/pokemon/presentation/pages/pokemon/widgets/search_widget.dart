import 'package:flutter/material.dart';
import '../../../../../../shared/presentation/ui/themes/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String?) onChanged;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const SearchWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
    this.focusNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primary,
          ),
        ),
        suffixIcon: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: controller.text.isEmpty
                    ? Icon(
                        Icons.search,
                        size: 20,
                        color: AppColors.primary,
                      )
                    : IconButton(
                        onPressed: () {
                          controller.clear();
                          onChanged.call(null);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.primary,
                        )),
              );
            }),
        hintText: "Buscar pokemon",
        labelText: 'Buscar',
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.all(20.0),
        isDense: true,
      ),
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
