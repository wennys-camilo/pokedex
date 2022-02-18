import 'package:flutter/material.dart';
import '../../../../../../shared/ui/themes/app_colors.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onPressedSearch;
  const SearchWidget(
      {Key? key,
      this.onChanged,
      this.controller,
      required this.onPressedSearch})
      : super(key: key);
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(Icons.search, color: AppColors.primary, size: 25),
            onPressed: onPressedSearch,
          ),
        ),
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
