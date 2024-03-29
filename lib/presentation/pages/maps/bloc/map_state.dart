// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_bloc.dart';

class MapStateData {
  final List<Agenda> eventosAgenda;
  final List<LugarEventos> lugares;
  final LugarEventos? lugarClicked;
  final GoogleMapController? mapController;

  const MapStateData({
    this.eventosAgenda = const [],
    this.lugares = const [],
    this.lugarClicked,
    this.mapController,
  });

  MapStateData copyWith({
    List<Agenda>? eventosAgenda,
    List<LugarEventos>? lugares,
    LugarEventos? lugarClicked,
    GoogleMapController? mapController,
  }) {
    return MapStateData(
      eventosAgenda: eventosAgenda ?? this.eventosAgenda,
      lugares: lugares ?? this.lugares,
      lugarClicked: lugarClicked,
      mapController: mapController,
    );
  }
}

abstract class MapState {
  final MapStateData mapStateData;

  const MapState({required this.mapStateData});
}

class MapInitialState extends MapState {
  const MapInitialState({super.mapStateData = const MapStateData()});
}

class MapLoadedState extends MapState {
  const MapLoadedState({required super.mapStateData});
}

class MapErrorState extends MapState {
  final String message;

  const MapErrorState({required super.mapStateData, required this.message});
}
