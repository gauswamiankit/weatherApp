// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCard extends StatelessWidget {
  final latitude;
  final longitude;

  MapCard({
    Key? key,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      markers: <Marker>{
        Marker(
          markerId: MarkerId(LatLng(latitude, longitude).toString()),
          position: LatLng(latitude, longitude),
          icon: BitmapDescriptor.defaultMarker,
        )
      },
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14.0,
      ),
    );
  }
}
