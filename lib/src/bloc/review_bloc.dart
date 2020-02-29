import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:krappr/src/models/review_model.dart';
import 'package:krappr/src/models/location_model.dart';

class ReviewBloc {
  final _currentReviewFetcher = PublishSubject<ReviewModel>();

  Stream<ReviewModel> get currentReview => _currentReviewFetcher.stream;

  fetchCurrentReview() async {
    //TODO: add repository to make an actual service call
    await Future.delayed(Duration(seconds: 1));
    LocationModel mockLocationModel = new LocationModel(0.0, 0.0, "Canadian Tire Bathroom", "Nearby the tree that look like snoopy" );
    ReviewModel currentMockModel = new ReviewModel(3, "Clean seats, lemon scent", mockLocationModel);
    _currentReviewFetcher.sink.add(currentMockModel);
  }

  void dispose() {
    // Close your streams in here
    _currentReviewFetcher.close();
  }
}
final reviewBloc = ReviewBloc();
