import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/domain/entities/models/agenda.dart';
import 'package:example/domain/entities/models/lugar.dart';
import 'package:example/presentation/utils/extensions/easy_fold.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/get_agenda.dart';
import '../../../../domain/usecases/get_lugares_usecase.dart';

part 'map_event.dart';
part 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final GetAgendaNewsUseCase getAgendaNewsUseCase;
  final GetLugaresUseCase getLugaresUseCase;
  MapStateData get mapStatedata => state.mapStateData;

  MapBloc(this.getAgendaNewsUseCase, this.getLugaresUseCase)
      : super((const MapInitialState())) {
    on<InitializedMapEvent>(_onInitializeMapEvent);
    on<MarkerClickedEvent>(_onMarkerClickedEvent);
    on<MapCreatedEvent>(_onMapCreatedEvent);
  }

  FutureOr<void> _onInitializeMapEvent(
      InitializedMapEvent event, Emitter<MapState> emit) async {
    final agendaResult =
        await getAgendaNewsUseCase(GetAgendaNewsUseCaseParams());
    final lugaresResult = await getLugaresUseCase(GetLugaresUseCaseParams());

    agendaResult.fold((l) {
      emit(MapErrorState(
          mapStateData: mapStatedata, message: l.msg ?? "MAP ERROR STATE "));
    }, (r) {
      emit(MapLoadedState(
          mapStateData: mapStatedata.copyWith(
              eventosAgenda: r,
              lugares: lugaresResult.rightValue,
              lugarClicked: mapStatedata.lugarClicked)));
    });
  }

  FutureOr<void> _onMarkerClickedEvent(
      MarkerClickedEvent event, Emitter<MapState> emit) async {
    final lugar = mapStatedata.lugares.firstWhere((l) => l.id == event.lugarId);

    emit(MapLoadedState(
      mapStateData: mapStatedata.copyWith(lugarClicked: lugar),
    ));
  }

  FutureOr<void> _onMapCreatedEvent(
      MapCreatedEvent event, Emitter<MapState> emit) async {
    emit(MapLoadedState(
      mapStateData: mapStatedata.copyWith(mapController: event.mapController),
    ));
  }
}
