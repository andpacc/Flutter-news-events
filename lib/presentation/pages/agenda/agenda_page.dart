import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/pages/agenda/widgets/agenda_card.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class AgendaPage extends StatelessWidget {
  final String detailsPath;
  final List<Agenda>? filteredAgenda;
  const AgendaPage({super.key, required this.detailsPath, this.filteredAgenda});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
      child: _AgendaContent(detailsPath, filteredAgenda),
    );
  }
}

class _AgendaContent extends StatelessWidget {
  final String detailsPath;
  final List<Agenda>? filteredAgenda;
  const _AgendaContent(this.detailsPath, this.filteredAgenda);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        if (state is AgendaInitialState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                height: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        } else if (state is AgendaErrorState) {
          String mensaje = state.message;
          return Scaffold(
            body: Center(
              child: Text(mensaje),
            ),
          );
        } else {
          return CustomStackAgenda(
            favs: state.agendaStateData.agendaFavs,
            filtered: filteredAgenda != null
                ? filteredAgenda!
                : state.agendaStateData.agenda,
            lugares: state.agendaStateData.lugares,
            detailsPath: detailsPath,
          );
        }
      },
    );
  }
}

class CustomStackAgenda extends StatelessWidget {
  final List<Agenda> filtered;
  final List<Agenda> favs;
  final List<LugarEventos> lugares;
  final String detailsPath;
  const CustomStackAgenda(
      {super.key,
      required this.filtered,
      required this.favs,
      required this.lugares,
      required this.detailsPath});
  Future<void> _handleRefresh(BuildContext context) async {
    context.read<AgendaBloc>().add(InitializedAgendaEvent());
    return await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      LiquidPullToRefresh(
        onRefresh: () => _handleRefresh(context),
        color: primaryColor(context),
        animSpeedFactor: 10,
        showChildOpacityTransition: false,
        child: ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final item = filtered[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: AgendaCard(
                      showLocationIcon: true,
                      onTap: () {
                        GoRouter.of(context).replace(detailsPath, extra: item);
                      },
                      agendaEventos: item,
                      isFavourite: favs.contains(item),
                      lugarEventos: lugares
                          .firstWhere((element) => element.id == item.lugar)),
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}
