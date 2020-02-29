class LocationModel {
    double _latitude;
    double _longtitude;

    String _locationName;
    String _locationDescription;

    double get latitutde => _latitude;
    double get longitude => _longtitude;
    String get locationName => _locationName;
    String get locationDescription => _locationDescription;

    LocationModel(double latitude, double longitude, String locationName, String locationDescription){
      _latitude = latitude;
      _longtitude = longitude;
      _locationName = locationName;
      _locationDescription = locationDescription;
    }
}