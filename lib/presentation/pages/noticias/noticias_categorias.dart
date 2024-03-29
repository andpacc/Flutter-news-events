import 'package:example/domain/entities/models/categories_titulares.dart';
import 'package:example/presentation/pages/noticias/widgets/noticias_search_delegate.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/widgets/custom_appbar.dart';
import 'package:example/presentation/widgets/custom_category.dart';
import 'package:example/presentation/widgets/row_categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/noticias_bloc.dart';

class NoticiasCategories extends StatelessWidget {
  const NoticiasCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoticiaBloc, NoticiaState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final miBusqueda = await showSearch(
                      context: context,
                      delegate: SearchNoticiasDelegate(
                          categories: state.stateData.categoriaTitulares));
                  if (miBusqueda is CategoryTitulares) {
                    // ignore: use_build_context_synchronously
                    BlocProvider.of<NoticiaBloc>(context)
                        .add(CategoryNewsSelectionEvent(
                      miBusqueda.id,
                      true,
                    ));
                  }
                },
              ),
              IconButton(
                onPressed: () => BlocProvider.of<NoticiaBloc>(context)
                    .add(ResetNewsCategoryEvent()),
                icon: const Icon(Icons.refresh_outlined),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child: CustomCategoryList(
                        categories: state.stateData.categoriaTitulares,
                        itemBuilder: (context, category) => RowCategorias(
                              onChanged: (value) {
                                BlocProvider.of<NoticiaBloc>(context)
                                    .add(CategoryNewsSelectionEvent(
                                  category.id,
                                  value!,
                                ));
                              },
                              name: category.name,
                              selectedContainsCategoria: state
                                  .stateData.selectedCategoriaTitulares
                                  .contains(category.id),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    final noticiaEventos =
                        state.stateData.selectedCategoriaTitulares.isEmpty
                            ? state.stateData.titulares
                            : state.stateData.titulares.where((titular) {
                                return state
                                    .stateData.selectedCategoriaTitulares
                                    .contains(titular.categoria);
                              }).toList();

                    GoRouter.of(context)
                        .go(AppRoutes.noticias.path, extra: noticiaEventos);
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
