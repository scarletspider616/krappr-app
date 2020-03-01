import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class RatingRangeBloc {
  final _ratingRangeBloc = PublishSubject<RangeValues>();

  Stream<RangeValues> get ratingRangeBloc => _ratingRangeBloc.stream;

  updateRatingRange(RangeValues values) {
    _ratingRangeBloc.sink.add(values);
  }

  void dispose() {
    // Close your streams in here
    _ratingRangeBloc.close();
  }
}

final ratingRangeBloc = RatingRangeBloc();
