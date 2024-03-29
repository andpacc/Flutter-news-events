part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class InitializedMapEvent extends MapEvent {}

class MarkerClickedEvent extends MapEvent {
  final int lugarId;

  MarkerClickedEvent({required this.lugarId});
}

class MapCreatedEvent extends MapEvent {
  final GoogleMapController mapController;

  MapCreatedEvent({required this.mapController});
}
