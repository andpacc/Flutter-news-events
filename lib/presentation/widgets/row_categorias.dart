import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';

class RowCategorias extends StatelessWidget {
  final String name;

  final bool selectedContainsCategoria;
  final ValueChanged onChanged;
  const RowCategorias({
    super.key,
    required this.name,
    required this.selectedContainsCategoria,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    print("$selectedContainsCategoria");
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: [
          Text(
            name,
            style: TextStyle(
                color: selectedContainsCategoria ? primaryColor(context) : null,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        child: Checkbox(
            activeColor: primaryColor(context),
            value: selectedContainsCategoria,
            onChanged: onChanged),
      ),
    ]);
  }
}
