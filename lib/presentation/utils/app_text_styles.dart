import 'package:flutter/material.dart';

class AppTextStyle {
  //Nowaday cannot be consts for the flutter_screenutil
  static const TextStyle boldText = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle errorTextStyle = TextStyle(
    color: Colors.red,
  );
  static const TextStyle textTextStyle =
      TextStyle(fontSize: 14, color: Colors.black);
  static const TextStyle subTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 21,
    color: Colors.black,
  );
  static const TextStyle hintTextStyle =
      TextStyle(fontSize: 16, color: Colors.grey);
  static const TextStyle boldTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
