import 'package:flutter/material.dart';

class NoFavouriteItem extends StatelessWidget {
  const NoFavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Icon(
          Icons.favorite,
          size: 150,
        ),
        SizedBox(height: 15),
        Text(
          'Pulsa sobre los corazones para añadirlos a la sección de favoritos',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
