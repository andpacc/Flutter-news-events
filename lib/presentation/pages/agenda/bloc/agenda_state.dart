// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'agenda_bloc.dart';

class AgendaStateData {
  final List<Agenda> agenda;
  final List<Agenda> agendaFavs;
  final List<Localidad> localidades;
  final List<LugarEventos> lugares;
  final String? selectedLocalidad;
  final int? numeroSelectedLocalidad;
  final List<CategoriesAgenda> categoriesAgenda;
  final List<int> selectedCategoriaAgenda;
  final bool entradaLibre;
  final DateTime? fechaInicial;
  final DateTime? fechaFinal;
  final bool insertadoConExito;
  final List<Agenda> filteredAgenda;

  const AgendaStateData(
      {this.entradaLibre = true,
      this.selectedCategoriaAgenda = const [],
      this.categoriesAgenda = const [],
      this.filteredAgenda = const [],
      this.selectedLocalidad,
      this.localidades = const [],
      this.agendaFavs = const [],
      this.agenda = const [],
      this.lugares = const [],
      this.numeroSelectedLocalidad,
      this.fechaInicial,
      this.fechaFinal,
      this.insertadoConExito = false});

  AgendaStateData copyWith({
    List<Agenda>? agenda,
    List<Agenda>? agendaFavs,
    List<Localidad>? localidades,
    List<LugarEventos>? lugares,
    String? selectedLocalidad,
    int? numeroSelectedLocalidad,
    List<CategoriesAgenda>? categoriesAgenda,
    List<int>? selectedCategoriaAgenda,
    bool? entradaLibre,
    DateTime? fechaInicial,
    DateTime? fechaFinal,
    bool? insertadoConExito,
    List<Agenda>? filteredAgenda,
  }) {
    return AgendaStateData(
        agenda: agenda ?? this.agenda,
        agendaFavs: agendaFavs ?? this.agendaFavs,
        localidades: localidades ?? this.localidades,
        lugares: lugares ?? this.lugares,
        selectedLocalidad: selectedLocalidad ?? this.selectedLocalidad,
        numeroSelectedLocalidad:
            numeroSelectedLocalidad ?? this.numeroSelectedLocalidad,
        categoriesAgenda: categoriesAgenda ?? this.categoriesAgenda,
        selectedCategoriaAgenda:
            selectedCategoriaAgenda ?? this.selectedCategoriaAgenda,
        entradaLibre: entradaLibre ?? this.entradaLibre,
        fechaInicial: fechaInicial ?? this.fechaInicial,
        fechaFinal: fechaFinal ?? this.fechaFinal,
        insertadoConExito: insertadoConExito ?? this.insertadoConExito,
        filteredAgenda: filteredAgenda ?? this.filteredAgenda);
  }
}

@immutable
abstract class AgendaState {
  final AgendaStateData agendaStateData;

  const AgendaState({required this.agendaStateData});
}

class AgendaInitialState extends AgendaState {
  const AgendaInitialState({super.agendaStateData = const AgendaStateData()});
}

class AgendaLoadedState extends AgendaState {
  const AgendaLoadedState({required super.agendaStateData});
}

class AgendaErrorState extends AgendaState {
  final String message;

  const AgendaErrorState(
      {required super.agendaStateData, required this.message});
}
