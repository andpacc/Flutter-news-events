// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/pages/agenda/widgets/chips_categorias.dart';
import 'package:example/presentation/pages/agenda/widgets/localidad_list_tile.dart';
import 'package:example/presentation/pages/agenda/widgets/switch_selector.dart';
import 'package:example/presentation/pages/agenda/widgets/text_field_date.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AgendaFilters extends StatelessWidget {
  const AgendaFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () =>
                BlocProvider.of<AgendaBloc>(context).add(ResetFiltersEvent()),
            icon: const Icon(Icons.refresh_outlined),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: _AgendaCategoriesBody(),
      ),
    );
  }
}

class _AgendaCategoriesBody extends StatelessWidget {
  const _AgendaCategoriesBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          BodyContainer(),
          SafeArea(child: BottonAceptar()),
        ],
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return const ColumnTodosLosFiltros();
      },
    );
  }
}

class ColumnTodosLosFiltros extends StatelessWidget {
  const ColumnTodosLosFiltros({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "FECHAS: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            CustomCalendarTextField(
              title: "Desde",
              onDateSelected: (date) {
                context
                    .read<AgendaBloc>()
                    .add(SelectAgendaDateEvent(date, true));
              },
              selectedDate: state.agendaStateData.fechaInicial,
            ),
            CustomCalendarTextField(
              title: "Hasta",
              onDateSelected: (date) {
                context
                    .read<AgendaBloc>()
                    .add(SelectAgendaDateEvent(date, false));
              },
              selectedDate: state.agendaStateData.fechaFinal,
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "LOCALIDAD: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LocalidadesExpansionTile(),
            const SizedBox(
              height: 10,
            ),
            const TipoRowAgenda(),
            const ChipsCategoriasAgenda(),
            const RowEntradaLibre()
          ],
        );
      },
    );
  }
}

class TipoRowAgenda extends StatelessWidget {
  const TipoRowAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "TIPO: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () => GoRouter.of(context)
              .push('${AppRoutes.agenda.path}/filters/categoryAgenda'),
          child: const Row(
            children: [
              Text(
                "SELECCIONAR",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 150,
              ),
              Icon(Icons.keyboard_double_arrow_right_rounded),
            ],
          ),
        ),
      ],
    );
  }
}

class BottonAceptar extends StatelessWidget {
  const BottonAceptar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        bool isDisabled = state is AgendaErrorState;

        final filteredAgenda = state.agendaStateData.agenda.where((agenda) {
          final bool fechaHoraValida =
              state.agendaStateData.fechaInicial == null ||
                  agenda.fechahora.isAfter(state.agendaStateData.fechaInicial!);
          final bool localidadValida =
              state.agendaStateData.numeroSelectedLocalidad == null ||
                  state.agendaStateData.numeroSelectedLocalidad == -1 ||
                  agenda.localidad ==
                      state.agendaStateData.numeroSelectedLocalidad;
          final bool categoriaValida =
              state.agendaStateData.selectedCategoriaAgenda.isEmpty ||
                  state.agendaStateData.selectedCategoriaAgenda
                      .contains(agenda.categoria);
          final bool entradaLibreValida =
              state.agendaStateData.entradaLibre || (agenda.precio.isEmpty);

          return fechaHoraValida &&
              localidadValida &&
              categoriaValida &&
              entradaLibreValida;
        }).toList();

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: isDisabled
                ? null
                : () {
                    print(filteredAgenda);
                    GoRouter.of(context)
                        .go(AppRoutes.agenda.path, extra: filteredAgenda);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: SafeArea(
                child: Text(
                  "Aceptar",
                  style: TextStyle(
                      color: isDisabled ? Colors.grey.shade600 : null,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
