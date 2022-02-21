import 'package:flutter/material.dart';
import '../../../../../../shared/ui/themes/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String?) onChanged;
  final TextEditingController controller;

  const SearchWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
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
                    ? const Icon(Icons.search)
                    : IconButton(
                        onPressed: () {
                          controller.clear();
                          onChanged.call(null);
                        },
                        icon: const Icon(Icons.clear)),
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
