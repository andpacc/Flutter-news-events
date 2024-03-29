import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:example/presentation/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class AgendaCard extends StatelessWidget {
  const AgendaCard(
      {super.key,
      required this.isFavourite,
      required this.agendaEventos,
      this.lugarEventos,
      required this.onTap,
      required this.showLocationIcon});
  final LugarEventos? lugarEventos;
  final bool isFavourite;
  final Agenda agendaEventos;
  final VoidCallback onTap;
  final bool showLocationIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  tertiaryColor(context),
                  tertiaryColor(context),
                  tertiaryColor(context),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 12,
            child: SizedBox(
              width: 300,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      agendaEventos.titulo,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 12,
            child: SizedBox(
              width: 180,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      lugarEventos?.nombre ?? "",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: SizedBox(
              width: 180,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      FormateadorFecha.formatFecha(agendaEventos.fechahora),
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Row(
              children: [
                Text(
                  agendaEventos.precio.isEmpty
                      ? "GRATIS"
                      : "${agendaEventos.precio}€",
                  style: TextStyle(
                    color: agendaEventos.precio.isEmpty
                        ? const Color(0xff39fe90)
                        : secondaryColor(context),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? primaryColor(context) : null,
                  ),
                  onPressed: () {
                    if (!isFavourite) {
                      context
                          .read<AgendaBloc>()
                          .add(AddAgendaFavEvent(agenda: agendaEventos));
                    } else {
                      context
                          .read<AgendaBloc>()
                          .add(ClearAgendaFavEvent(agenda: agendaEventos));
                    }
                  },
                  padding: const EdgeInsets.all(5),
                ),
                const SizedBox(width: 5),
                if (showLocationIcon)
                  IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: primaryColor(context),
                    ),
                    onPressed: () => GoRouter.of(context).push(
                        "${AppRoutes.map.path}/places/${lugarEventos?.id ?? 0}",
                        extra: lugarEventos),
                    padding: const EdgeInsets.all(5),
                  ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(
                    Icons.share_outlined,
                  ),
                  onPressed: () async {
                    await Share.share(
                        'Este es mi evento: ${agendaEventos.titulo} - ${lugarEventos?.nombre ?? ""} - ${FormateadorFecha.formatFecha(agendaEventos.fechahora)}');
                  },
                  padding: const EdgeInsets.all(5),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "+info",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
