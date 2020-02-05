import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MinimumRatingWidget extends StatefulWidget {
  @override
  _MinimumRatingWidgetState createState() => _MinimumRatingWidgetState();
}

class _MinimumRatingWidgetState extends State<MinimumRatingWidget> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
        allowHalfRating: false,
        onRatingChanged: (v) {
          _rating = v;
          setState(() {});
        },
        starCount: 5,
        rating: _rating,
        size: 40.0,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color: Colors.black,
        borderColor: Colors.black,
        spacing: 0.0);
  }
}
