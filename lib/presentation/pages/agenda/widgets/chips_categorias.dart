import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChipsCategoriasAgenda extends StatelessWidget {
  const ChipsCategoriasAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        List<String> selectedCategoryNames = state
            .agendaStateData.categoriesAgenda
            .where((category) => state.agendaStateData.selectedCategoriaAgenda
                .contains(category.id))
            .map((category) => category.name)
            .toList();

        return SelectedChips(selectedCategories: selectedCategoryNames);
      },
    );
  }
}

class SelectedChips extends StatelessWidget {
  final List<String> selectedCategories;

  const SelectedChips({
    super.key,
    required this.selectedCategories,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return Wrap(
          spacing: 2,
          runSpacing: 1,
          children: selectedCategories
              .map(
                (category) => Chip(
                  label: Text(
                    category,
                    style: const TextStyle(fontSize: 12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
