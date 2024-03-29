import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/models/categories_agenda.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/domain/entities/models/sugerencias_eventos.dart';
import 'package:example/domain/usecases/get_agenda.dart';
import 'package:example/domain/usecases/get_agenda_categories_usecase.dart';
import 'package:example/domain/usecases/get_agenda_favs.dart';
import 'package:example/domain/usecases/get_agenda_sugerencias_usecase.dart';
import 'package:example/domain/usecases/get_localidades_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/models/agenda.dart';
import '../../../../domain/entities/models/localidades.dart';
import '../../../../domain/usecases/get_lugares_usecase.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

@injectable
class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  final GetAgendaNewsUseCase getAgendaNewsUseCase;
  final GetLocalidadesUseCase getLocalidadesUseCase;
  final GetAgendaCategoriesUseCase getAgendaCategoriesUseCase;
  final AddAgendaSugerenciasUsecase addAgendaSugerenciasUseCase;
  final GetLugaresUseCase getLugaresUseCase;

  final GetAgendaFavsNewsUseCase getAgendaFavsNewsUseCase;
  final AddAgendaFavsNewsUseCase addAgendaFavsNewsUseCase;
  final ClearAgendaFavsNewsUseCase clearAgendaFavsNewsUseCase;
  final ClearAllFavsNewsUseCase clearAllFavsNewsUseCase;
  AgendaStateData get agendaStateData => state.agendaStateData;

  AgendaBloc(
      this.getAgendaNewsUseCase,
      this.getAgendaFavsNewsUseCase,
      this.addAgendaFavsNewsUseCase,
      this.clearAgendaFavsNewsUseCase,
      this.clearAllFavsNewsUseCase,
      this.getLocalidadesUseCase,
      this.getAgendaCategoriesUseCase,
      this.addAgendaSugerenciasUseCase,
      this.getLugaresUseCase)
      : super(const AgendaInitialState()) {
    on<InitializedAgendaEvent>(_onInitializedAgendaEvent);
    on<AddAgendaFavEvent>(_onAddAgendaFavEvent);
    on<GetAgendaFavEvent>(_onGetAgendaFavEvent);
    on<ClearAgendaFavEvent>(_onClearAgendaFavEvent);
    on<ClearAllFavsEvent>(_onClearAllFavsEvent);
    on<ChangeSelectedLocalidadEvent>(_onChangeSelectedLocalidadEvent);
    on<CategoryAgendaSelectionEvent>(_onCategoryAgendaSelectionEvent);
    on<SwitchEntradaLibreEvent>(_onSwitchEntradaLibreEvent);
    on<SelectAgendaDateEvent>(_onSelectAgendaDateEvent);
    on<ResetCalendarEvent>(_onResetCalendarEvent);
    on<ResetFiltersEvent>(_onResetFiltersEvent);
    on<SubmitAgendaEvent>(_onSubmitAgendaEvent);
  }

  FutureOr<void> _onInitializedAgendaEvent(
      InitializedAgendaEvent event, Emitter<AgendaState> emit) async {
    try {
      final agendaResults =
          await getAgendaNewsUseCase(GetAgendaNewsUseCaseParams()).then(
              (value) => value.getOrElse(
                  () => throw Exception("Error cargando noticias de agenda")));
      final agendaFavs =
          await getAgendaFavsNewsUseCase(GetAgendaFavsNewsUseCaseParams()).then(
              (value) => value.getOrElse(
                  () => throw Exception("Error cargando favoritos")));
      final localidadesResults =
          await getLocalidadesUseCase(GetLocalidadesUseCaseParams()).then(
              (value) => value.getOrElse(
                  () => throw Exception("Error cargando localidades")));
      final agendaCategoriasResults =
          await getAgendaCategoriesUseCase(GetAgendaCategoriesUseCaseParams())
              .then((value) => value.getOrElse(
                  () => throw Exception("Error cargando categorías")));
      final lugaresEventosResults =
          await getLugaresUseCase(GetLugaresUseCaseParams()).then((value) =>
              value.getOrElse(
                  () => throw Exception("Error cargando lugares de eventos")));

      emit(AgendaLoadedState(
          agendaStateData: agendaStateData.copyWith(
        agenda: agendaResults,
        agendaFavs: agendaFavs,
        localidades: localidadesResults,
        categoriesAgenda: agendaCategoriasResults,
        fechaInicial: agendaStateData.fechaInicial,
        fechaFinal: agendaStateData.fechaFinal,
        lugares: lugaresEventosResults,
      )));
    } catch (e) {
      emit(AgendaErrorState(
          agendaStateData: agendaStateData, message: e.toString()));
    }
  }

  FutureOr<void> _onAddAgendaFavEvent(
      AddAgendaFavEvent event, Emitter<AgendaState> emit) async {
    final result = await addAgendaFavsNewsUseCase(
        AddAgendaFavsNewsUseCaseParams(agenda: event.agenda));
    result.fold(
        (l) => emit(AgendaErrorState(
            agendaStateData: agendaStateData,
            message: l.msg ?? "Error al obtener los eventos favoritos")), (r) {
      add(GetAgendaFavEvent());
      emit(AgendaLoadedState(agendaStateData: agendaStateData));
    });
  }

  FutureOr<void> _onClearAgendaFavEvent(
      ClearAgendaFavEvent event, Emitter<AgendaState> emit) async {
    final result = await clearAgendaFavsNewsUseCase(
        ClearAgendaFavsNewsUseCaseParams(agenda: event.agenda));
    result.fold(
        (l) => emit(AgendaErrorState(
            agendaStateData: agendaStateData,
            message: l.msg ?? "Error al borrar un evento favorito")), (r) {
      add(GetAgendaFavEvent());
      emit(AgendaLoadedState(agendaStateData: agendaStateData));
    });
  }

  FutureOr<void> _onClearAllFavsEvent(
      ClearAllFavsEvent event, Emitter<AgendaState> emit) async {
    final result =
        await clearAllFavsNewsUseCase(ClearAllFavsAgendaNewsUseCaseParams());
    result.fold((l) {
      emit(AgendaErrorState(
          agendaStateData: agendaStateData,
          message: l.msg ?? "Error al borrar todos los eventos favoritos"));
    }, (r) {
      add(GetAgendaFavEvent());
      emit(AgendaLoadedState(agendaStateData: agendaStateData));
    });
  }

  FutureOr<void> _onGetAgendaFavEvent(
      GetAgendaFavEvent event, Emitter<AgendaState> emit) async {
    final result =
        await getAgendaFavsNewsUseCase(GetAgendaFavsNewsUseCaseParams());
    result.fold((l) {
      emit(AgendaErrorState(
          agendaStateData: agendaStateData,
          message: l.msg ?? "ERROR AL OBTENER LOS FAVORITOS"));
    }, (r) {
      emit(AgendaLoadedState(
          agendaStateData: agendaStateData.copyWith(agendaFavs: r)));
    });
  }

  FutureOr<void> _onChangeSelectedLocalidadEvent(
      ChangeSelectedLocalidadEvent event, Emitter<AgendaState> emit) {
    emit(AgendaLoadedState(
        agendaStateData: agendaStateData.copyWith(
      selectedLocalidad: event.localidad,
      numeroSelectedLocalidad: event.numLocalidad,
    )));
  }

  FutureOr<void> _onCategoryAgendaSelectionEvent(
      CategoryAgendaSelectionEvent event, Emitter<AgendaState> emit) {
    final List<int> selectedCategories =
        List<int>.from(agendaStateData.selectedCategoriaAgenda);
    event.isSelected
        ? selectedCategories.add(event.categoryAgendaId)
        : selectedCategories.remove(event.categoryAgendaId);

    emit(AgendaLoadedState(
        agendaStateData: agendaStateData.copyWith(
            selectedCategoriaAgenda: selectedCategories)));
  }

  FutureOr<void> _onSwitchEntradaLibreEvent(
      SwitchEntradaLibreEvent event, Emitter<AgendaState> emit) {
    emit(AgendaLoadedState(
        agendaStateData: agendaStateData.copyWith(
      entradaLibre: !agendaStateData.entradaLibre,
    )));
  }

  FutureOr<void> _onSelectAgendaDateEvent(
      SelectAgendaDateEvent event, Emitter<AgendaState> emit) {
    if (event.esFechaInicial) {
      if (agendaStateData.fechaFinal != null &&
          event.date.isAfter(agendaStateData.fechaFinal!)) {
        emit(AgendaLoadedState(
          agendaStateData: agendaStateData.copyWith(
            fechaInicial: null,
            fechaFinal: null,
          ),
        ));
      } else {
        emit(AgendaLoadedState(
            agendaStateData: agendaStateData.copyWith(
          fechaInicial: event.date,
        )));
      }
    } else {
      if (agendaStateData.fechaInicial != null &&
          event.date.isBefore(agendaStateData.fechaInicial!)) {
        emit(AgendaLoadedState(
            agendaStateData: agendaStateData.copyWith(
          fechaInicial: null,
          fechaFinal: null,
        )));
      } else {
        emit(AgendaLoadedState(
            agendaStateData: agendaStateData.copyWith(
          fechaFinal: event.date,
        )));
      }
    }
  }

  FutureOr<void> _onResetCalendarEvent(
      ResetCalendarEvent event, Emitter<AgendaState> emit) {
    emit(AgendaLoadedState(
        agendaStateData: agendaStateData.copyWith(
      fechaInicial: null,
      fechaFinal: null,
    )));
  }

  FutureOr<void> _onResetFiltersEvent(
      ResetFiltersEvent event, Emitter<AgendaState> emit) {
    int currentYear = DateTime.now().year;
    int nextYear = currentYear + 1;
    emit(AgendaLoadedState(
      agendaStateData: agendaStateData.copyWith(
          fechaInicial: DateTime.now(),
          fechaFinal: DateTime.utc(nextYear),
          selectedCategoriaAgenda: [],
          entradaLibre: true,
          selectedLocalidad: null,
          numeroSelectedLocalidad: -1),
    ));
  }

  FutureOr<void> _onSubmitAgendaEvent(
      SubmitAgendaEvent event, Emitter<AgendaState> emit) async {
    final result = await addAgendaSugerenciasUseCase(
        AddAgendaSugerenciasUseCaseParams(sugerencias: event.sugerencias));
    result.fold(
        (l) => emit(AgendaErrorState(
            agendaStateData: agendaStateData,
            message: l.msg ?? "Error al añadir la sugerencia")),
        (r) => emit(AgendaLoadedState(
            agendaStateData:
                agendaStateData.copyWith(insertadoConExito: true))));
  }
}
