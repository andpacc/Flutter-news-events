import 'package:example/di/dependecy_injector.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:example/presentation/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class DetailsAgenda extends StatelessWidget {
  final Agenda agenda;

  const DetailsAgenda({
    super.key,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
      child: BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  GoRouter.of(context).replace(
                    AppRoutes.agenda.path,
                  );
                },
              ),
              title: Text(
                agenda.titulo,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    state.agendaStateData.agendaFavs.contains(agenda)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    state.agendaStateData.agendaFavs.contains(agenda)
                        ? context
                            .read<AgendaBloc>()
                            .add(ClearAgendaFavEvent(agenda: agenda))
                        : context
                            .read<AgendaBloc>()
                            .add(AddAgendaFavEvent(agenda: agenda));
                  },
                  padding: const EdgeInsets.all(5),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.share_outlined,
                    ),
                    onPressed: () {
                      Share.share('Este es mi evento: ${agenda.markkdown} ');
                    },
                    padding: const EdgeInsets.all(5),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Markdown(data: agenda.markkdown),
            ),
          );
        },
      ),
    );
  }
}
