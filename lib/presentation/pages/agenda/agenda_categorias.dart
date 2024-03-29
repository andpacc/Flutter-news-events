import 'package:example/presentation/widgets/custom_appbar.dart';
import 'package:example/presentation/widgets/custom_category.dart';
import 'package:example/presentation/widgets/row_categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/agenda_bloc.dart';

class AgendaCategorias extends StatelessWidget {
  const AgendaCategorias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: Column(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: CustomCategoryList(
                        categories: state.agendaStateData.categoriesAgenda,
                        itemBuilder: (context, category) => RowCategorias(
                              onChanged: (value) =>
                                  BlocProvider.of<AgendaBloc>(context)
                                      .add(CategoryAgendaSelectionEvent(
                                category.id,
                                value!,
                              )),
                              name: category.name,
                              selectedContainsCategoria: state
                                  .agendaStateData.selectedCategoriaAgenda
                                  .contains(category.id),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Text(
                      "Aceptar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
