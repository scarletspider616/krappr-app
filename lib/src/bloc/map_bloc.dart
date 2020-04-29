import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc {
  Future<List<Marker>> getNearbyBathrooms(Position location) async {
    // for now return fake data

    Marker bathroomMarker = Marker(
      markerId: MarkerId("Fake Bathroom"),
      position: LatLng(location.latitude, location.longitude),
      infoWindow: InfoWindow(title: "Fake Bathroom", snippet: "Nearby"),
      onTap: () {},
    );
    return [bathroomMarker];
  }
}
