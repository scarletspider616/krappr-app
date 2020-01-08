import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  String _mapStyle;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();

    rootBundle
        .loadString('assets/style/map/default_map_theme.json')
        .then((jsonString) {
      _mapStyle = jsonString;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    _loadMapStyle(context);
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }

  void _loadMapStyle(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      rootBundle
          .loadString('assets/style/map/dark_mode_map_theme.json')
          .then((jsonString) {
        _mapStyle = jsonString;
      });
    } else {
      rootBundle
          .loadString('assets/style/map/default_map_theme.json')
          .then((jsonString) {
        _mapStyle = jsonString;
      });
    }
  }
}
