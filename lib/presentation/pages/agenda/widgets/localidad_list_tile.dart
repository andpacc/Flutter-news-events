//Lista de las localidades
import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalidadSingeChildScrollView extends StatelessWidget {
  const LocalidadSingeChildScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.agendaStateData.localidades.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.agendaStateData.localidades[index].nombre),
                onTap: () {
                  BlocProvider.of<AgendaBloc>(context).add(
                    ChangeSelectedLocalidadEvent(
                        state.agendaStateData.localidades[index].nombre,
                        state.agendaStateData.localidades[index].id),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

//Codigo de las localidades
class LocalidadesExpansionTile extends StatelessWidget {
  const LocalidadesExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return ExpansionTile(
          title: Text(
            state.agendaStateData.selectedLocalidad == null ||
                    state.agendaStateData.numeroSelectedLocalidad == -1
                ? "SELECCIONA UNA LOCALIDAD"
                : state.agendaStateData.selectedLocalidad!,
            style: const TextStyle(fontSize: 14),
          ),
          children: const [
            SizedBox(
              height: 200,
              child: LocalidadSingeChildScrollView(),
            ),
          ],
        );
      },
    );
  }
}
