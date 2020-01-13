import 'package:flutter/material.dart';
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

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    _initializeStyles();
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
    if (mapController != null) {
      mapController.setMapStyle(null);
      mapController.setMapStyle(_mapStyle);
    } else {
      // do the initial check for what brightness mode the OS is in, and apply the correct
      // correct map style
      // This is not done in init as it creates a race condition (afaik and tested)
      _initializeStyles();
      _setMapStyle(WidgetsBinding.instance.window.platformBrightness);
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
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

  // why isn't this in init joey?? Because init seems to get called after build
  // in the first build of the widget, which overwrites what we want to do with
  // our own brightness logic
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
}
