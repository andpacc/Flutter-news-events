import 'package:flutter/material.dart';

typedef CategoryBuilder<T> = Widget Function(BuildContext context, T category);

class CustomCategoryList<T> extends StatelessWidget {
  final List<T> categories;
  final CategoryBuilder<T> itemBuilder;

  const CustomCategoryList({
    super.key,
    required this.categories,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, categories[index]);
      },
    );
  }
}
