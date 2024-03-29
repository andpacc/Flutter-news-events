import 'package:example/di/dependecy_injector.dart';
import 'package:example/presentation/pages/maps/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../domain/entities/models/lugar.dart';
import 'bloc/map_bloc.dart';

class MapPage extends StatelessWidget {
  final LugarEventos? lugarEventos;
  final String lugarEventosPath;
  const MapPage({super.key, this.lugarEventos, required this.lugarEventosPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<MapBloc>()..add(InitializedMapEvent()),
        child: BodyMaps(
          lugarEventos: lugarEventos,
          lugarEventosPath: lugarEventosPath,
        ),
      ),
    );
  }
}

class BodyMaps extends StatelessWidget {
  final LugarEventos? lugarEventos;
  final String lugarEventosPath;
  const BodyMaps({
    super.key,
    this.lugarEventos,
    required this.lugarEventosPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        if (state is MapLoadedState) {
          Set<Marker> markers;
          if (lugarEventos == null) {
            markers = state.mapStateData.lugares
                .map(
                  (lugar) => Marker(
                    infoWindow: InfoWindow(
                      title: lugar.nombre,
                      snippet: "Pulsa para ver los eventos disponibles",
                      onTap: () {
                        GoRouter.of(context).push(
                            "$lugarEventosPath/${lugar.id}",
                            extra: state.mapStateData.lugarClicked);
                      },
                    ),
                    markerId: MarkerId(lugar.id.toString()),
                    position: LatLng(lugar.latitud, lugar.longitud),
                    onTap: () {
                      context
                          .read<MapBloc>()
                          .add(MarkerClickedEvent(lugarId: lugar.id));
                    },
                  ),
                )
                .toSet();
          } else {
            markers = {
              Marker(
                infoWindow: InfoWindow(
                  title: lugarEventos!.nombre,
                  snippet: "Pulsa para ver los eventos disponibles",
                  onTap: () {
                    GoRouter.of(context).push(
                        "$lugarEventosPath/${lugarEventos?.id ?? 0}",
                        extra: state.mapStateData.lugarClicked);
                  },
                ),
                markerId: MarkerId(lugarEventos!.id.toString()),
                position: LatLng(lugarEventos!.latitud, lugarEventos!.longitud),
                onTap: () {
                  context
                      .read<MapBloc>()
                      .add(MarkerClickedEvent(lugarId: lugarEventos!.id));
                },
              )
            };
          }

          return MapPageBody(
            markers: markers,
            lugarEvento: state.mapStateData.lugarClicked,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MapPageBody extends StatelessWidget {
  const MapPageBody({
    super.key,
    required this.markers,
    required this.lugarEvento,
  });

  final Set<Marker> markers;

  final LugarEventos? lugarEvento;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMapWidget(markers: markers),
        Positioned(
          bottom: 100,
          right: 10,
          child: Column(
            children: [
              if (lugarEvento != null)
                FloatingActionButton(
                  onPressed: () => launchUrlString(
                      "https://www.google.com/maps?q=${lugarEvento!.latitud},${lugarEvento!.longitud}"),
                  child: const Icon(Icons.directions),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
