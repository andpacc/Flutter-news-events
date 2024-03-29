import 'package:flutter/material.dart';

class IconFilterNumber {
  static IconData getFilterIcon(int selectedCount) {
    const filterIcons = {
      0: Icons.filter,
      1: Icons.filter_1,
      2: Icons.filter_2,
      3: Icons.filter_3,
      4: Icons.filter_4,
      5: Icons.filter_5,
      6: Icons.filter_6,
      7: Icons.filter_7,
      8: Icons.filter_8,
      9: Icons.filter_9,
    };

    return filterIcons.containsKey(selectedCount)
        ? filterIcons[selectedCount]!
        : Icons.filter_9_plus;
  }
}
