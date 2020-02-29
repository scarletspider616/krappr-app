import 'package:krappr/src/models/krappr_location_model.dart';

class ReviewModel {
  int _rating;
  String _userReview;
  KrapprLocationModel _location;

  ReviewModel(int rating, String userReview, KrapprLocationModel location){
    _rating = rating;
    _userReview = userReview;
    _location = location;
  }

  int get rating => _rating;
  String get userReview => _userReview;
  KrapprLocationModel get location => _location;
}