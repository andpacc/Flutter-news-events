import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TitleText({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              "VER TODO",
              style: TextStyle(
                  decoration: TextDecoration.combine(
                      [TextDecoration.underline, TextDecoration.overline]),
                  color: primaryColor(context),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
