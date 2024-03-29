import 'package:example/di/dependecy_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../domain/entities/models/sugerencias_eventos.dart';
import 'bloc/agenda_bloc.dart';

class SuggestEventScreen extends StatelessWidget {
  const SuggestEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AgendaBloc>()..add(InitializedAgendaEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Sugiere un evento"),
          ),
          body: const ContainerSugestionEvents()),
    );
  }
}

class ContainerSugestionEvents extends StatelessWidget {
  const ContainerSugestionEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey2 = GlobalKey<FormBuilderState>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: formKey2,
        child: ColumnaFormularios(
          formKey: formKey2,
        ),
      ),
    );
  }
}

class ColumnaFormularios extends StatelessWidget {
  const ColumnaFormularios({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AgendaBloc, AgendaState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FormBuilderTextField(
                      decoration: const InputDecoration(
                          labelText: "Titulo", hintText: "Introduce titulo"),
                      name: 'titulo',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      decoration: const InputDecoration(
                        labelText: "Precio",
                        hintText: "Introduce el precio del evento ",
                      ),
                      name: 'precio',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.integer(),
                      ]),
                    ),
                    FormBuilderTextField(
                      decoration: const InputDecoration(
                          labelText: "Lugar",
                          hintText: "Introduce el lugar de evento"),
                      name: 'Lugar',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      decoration: const InputDecoration(
                        labelText: "Descripcion del evento",
                        hintText: "Introduce la descripcion de tu evento",
                      ),
                      maxLines: 4,
                      name: 'Descripccion del evento',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'fecha',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: DateTime.now(),
                      inputType: InputType.both,
                      decoration: InputDecoration(
                        labelText: 'Fecha y hora',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            formKey.currentState!.fields['date']
                                ?.didChange(null);
                          },
                        ),
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                    ),
                    FormBuilderDropdown(
                        name: "categorias",
                        decoration: const InputDecoration(
                            labelText: "Selecciona una categoria"),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        items: state.agendaStateData.categoriesAgenda
                            .map((e) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: e,
                                child: Text(e.name)))
                            .toList()),
                    FormBuilderDropdown(
                        name: "Localidad",
                        decoration: const InputDecoration(
                            labelText: "Selecciona una localidad"),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        items: state.agendaStateData.localidades
                            .map((e) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: e,
                                child: Text(e.nombre)))
                            .toList()),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BotonEnviar(
            formKey: formKey,
          ),
        )
      ],
    );
  }
}

class BotonEnviar extends StatelessWidget {
  const BotonEnviar({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.saveAndValidate()) {
              Sugerencias sugerencias = Sugerencias(
                titulo: formKey.currentState!.value['titulo'],
                precio: formKey.currentState!.value['precio'] ?? "",
                lugar: formKey.currentState!.value['Lugar'],
                descripcion:
                    formKey.currentState!.value['Descripccion del evento'],
                fechaHora: formKey.currentState!.value['fecha'],
                categoria: formKey.currentState!.value['categorias'].name,
                localidad: formKey.currentState!.value['Localidad'].nombre,
              );
              context.read<AgendaBloc>().add(SubmitAgendaEvent(sugerencias));

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.greenAccent,
                  content: Text(
                    "Tu propuesta ha sido enviada con exito",
                    textAlign: TextAlign.center,
                  )));
            }
          },
          child: const Text(
            "Enviar",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
