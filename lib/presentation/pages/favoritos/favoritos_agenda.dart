import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/pages/agenda/widgets/agenda_card.dart';
import 'package:example/presentation/pages/favoritos/favoritos_notfound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritosEventos extends StatelessWidget {
  final String detailsPath;
  const FavoritosEventos({super.key, required this.detailsPath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
      child: BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          if (state is AgendaInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgendaErrorState) {
            String mensaje = state.message;
            return Scaffold(
              body: Center(
                child: Text(mensaje),
              ),
            );
          } else {
            List<Agenda> agendaEventos = state.agendaStateData.agendaFavs;
            return Stack(
              children: [
                CustomFavoritosStackAgenda(
                  agendaFavoritosEventos: agendaEventos,
                  detailsPath: detailsPath,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class CustomFavoritosStackAgenda extends StatelessWidget {
  final String detailsPath;
  const CustomFavoritosStackAgenda({
    super.key,
    required this.agendaFavoritosEventos,
    required this.detailsPath,
  });

  final List<Agenda> agendaFavoritosEventos;

  @override
  Widget build(BuildContext context) {
    if (agendaFavoritosEventos.isEmpty) {
      return const NoFavouriteItem();
    } else {
      return ListView.builder(
        itemCount: agendaFavoritosEventos.length,
        itemBuilder: (context, index) {
          final item = agendaFavoritosEventos[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: BlocBuilder<AgendaBloc, AgendaState>(
              builder: (context, state) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: AgendaCard(
                            showLocationIcon: true,
                            onTap: () {
                              GoRouter.of(context)
                                  .push(detailsPath, extra: item);
                            },
                            isFavourite: agendaFavoritosEventos.contains(item),
                            agendaEventos: agendaFavoritosEventos[index],
                            lugarEventos: state.agendaStateData.lugares
                                .firstWhere((element) =>
                                    element.id ==
                                    agendaFavoritosEventos[index].lugar))));
              },
            ),
          );
        },
      );
    }
  }
}
