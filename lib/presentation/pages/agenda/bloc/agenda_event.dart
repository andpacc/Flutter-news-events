part of 'agenda_bloc.dart';

@immutable
abstract class AgendaEvent {}

class InitializedAgendaEvent extends AgendaEvent {}

class AddAgendaFavEvent extends AgendaEvent {
  final Agenda agenda;

  AddAgendaFavEvent({required this.agenda});
}

class GetAgendaFavEvent extends AgendaEvent {}

class ClearAgendaFavEvent extends AgendaEvent {
  final Agenda agenda;

  ClearAgendaFavEvent({required this.agenda});
}

class CategoryAgendaSelectionEvent extends AgendaEvent {
  final int categoryAgendaId;
  final bool isSelected;

  CategoryAgendaSelectionEvent(this.categoryAgendaId, this.isSelected);
}

class ChangeSelectedLocalidadEvent extends AgendaEvent {
  final String localidad;
  final int numLocalidad;
  ChangeSelectedLocalidadEvent(this.localidad, this.numLocalidad);
}

class SwitchEntradaLibreEvent extends AgendaEvent {}

class ClearAllFavsEvent extends AgendaEvent {}

class SelectAgendaDateEvent extends AgendaEvent {
  final DateTime date;
  final bool esFechaInicial;
  SelectAgendaDateEvent(this.date, this.esFechaInicial);
}

class ResetFiltersEvent extends AgendaEvent {}

class ResetCalendarEvent extends AgendaEvent {}

class SubmitAgendaEvent extends AgendaEvent {
  final Sugerencias sugerencias;

  SubmitAgendaEvent(
    this.sugerencias,
  );
}
