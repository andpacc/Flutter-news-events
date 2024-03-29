import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/presentation/pages/agenda/widgets/agenda_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../agenda/bloc/agenda_bloc.dart';
import 'bloc/map_bloc.dart';

class MapaEventosLugares extends StatelessWidget {
  final String lugarId;
  final LugarEventos? lugar;
  const MapaEventosLugares(
      {super.key, required this.lugarId, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MapBloc>()..add(InitializedMapEvent()),
        ),
        BlocProvider(
          create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
        )
      ],
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, mapState) {
          final eventosFiltrados = context
              .read<MapBloc>()
              .mapStatedata
              .eventosAgenda
              .where((evento) => evento.lugar.toString() == lugarId)
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text(lugar?.nombre ?? ""),
            ),
            body: ListView.builder(
              itemCount: eventosFiltrados.length,
              itemBuilder: (context, index) {
                final item = eventosFiltrados[index];
                return BlocBuilder<AgendaBloc, AgendaState>(
                  builder: (context, state) {
                    final lugares = state.agendaStateData.lugares;
                    final agendaFavs = state.agendaStateData.agendaFavs;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: AgendaCard(
                              showLocationIcon: false,
                              onTap: () {},
                              agendaEventos: item,
                              isFavourite: agendaFavs.contains(item),
                              lugarEventos: lugares.isNotEmpty
                                  ? lugares.firstWhere(
                                      (element) => element.id == item.lugar)
                                  : null),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
