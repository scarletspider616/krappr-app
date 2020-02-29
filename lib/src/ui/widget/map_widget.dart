import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with WidgetsBindingObserver {
  GoogleMapController mapController;
  String _mapStyleDefault;
  String _mapStyleDark;
  String _mapStyle;
  Position _position;

  @override
  void initState() {
    _initializeLocation();
    _initializeStyles();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      final Brightness brightness =
          WidgetsBinding.instance.window.platformBrightness;
      _setMapStyle(brightness);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(null);
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (_position == null) {
      return Text("Waiting for location");
    }

    if (mapController != null) {
      mapController.setMapStyle(null);
      mapController.setMapStyle(_mapStyle);
    } else {
      _setMapStyle(WidgetsBinding.instance.window.platformBrightness);
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      rotateGesturesEnabled: true,
      myLocationEnabled: true,
      compassEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(_position.latitude, _position.longitude),
        zoom: 11.0,
      ),
    );
  }

  void _setMapStyle(Brightness brightness) {
    if (brightness == Brightness.dark) {
      _mapStyle = _mapStyleDark;
    } else {
      _mapStyle = _mapStyleDefault;
    }
  }

  Future<void> _initializeStyles() async {
    await rootBundle
        .loadString('assets/style/map/dark_mode_map_theme.json')
        .then((jsonString) {
      _mapStyleDark = jsonString;
    });
    await rootBundle
        .loadString('assets/style/map/default_map_theme.json')
        .then((jsonString) {
      _mapStyleDefault = jsonString;
    });
    // initial setup
    setState(() {
      final Brightness brightness =
          WidgetsBinding.instance.window.platformBrightness;
      _setMapStyle(brightness);
    });
  }

  void _initializeLocation() async {
    Position currPosition = await Geolocator().getCurrentPosition();
    setState(() {
      _position = currPosition;
    });
  }
}
