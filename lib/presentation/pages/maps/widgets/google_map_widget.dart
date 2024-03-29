import 'package:example/presentation/pages/maps/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    super.key,
    required this.markers,
  });

  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            context
                .read<MapBloc>()
                .add(MapCreatedEvent(mapController: controller));
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(state.mapStateData.lugares.first.latitud,
                state.mapStateData.lugares.first.longitud),
            zoom: 10,
          ),
          markers: markers,
        );
      },
    );
  }
}
