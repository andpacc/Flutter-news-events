import 'package:example/presentation/pages/agenda/bloc/agenda_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowEntradaLibre extends StatelessWidget {
  const RowEntradaLibre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Con entrada libre? "),
        BlocBuilder<AgendaBloc, AgendaState>(
          builder: (context, state) {
            return Switch(
              value: !state.agendaStateData.entradaLibre,
              onChanged: (value) {
                BlocProvider.of<AgendaBloc>(context)
                    .add(SwitchEntradaLibreEvent());
              },
            );
          },
        )
      ],
    );
  }
}
