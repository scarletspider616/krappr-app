import 'package:krappr/src/models/location_model.dart';

class ReviewModel {
  int _rating;
  String _userReview;
  LocationModel _location;

  ReviewModel(int rating, String userReview, LocationModel location){
    _rating = rating;
    _userReview = userReview;
    _location = location;
  }

  int get rating => _rating;
  String get userReview => _userReview;
  LocationModel get location => _location;
}