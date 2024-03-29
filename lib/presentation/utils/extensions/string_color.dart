import 'package:flutter/material.dart';

extension StringColor on String {
  Color? get asColor {
    final value = replaceFirst('#', '0xFF');
    final v = int.tryParse(value);
    if (v == null) return null;
    return Color(v);
  }
}
