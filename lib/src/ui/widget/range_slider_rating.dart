import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/rating_range_bloc.dart';

class RangeSliderRating extends StatefulWidget {
  @override
  _RangeSliderRatingState createState() => _RangeSliderRatingState();
}

class _RangeSliderRatingState extends State<RangeSliderRating> {
  @override
  Widget build(BuildContext context) {
    RangeValues defaultValues = RangeValues(3, 5);

    return StreamBuilder(
      stream: ratingRangeBloc.ratingRangeBloc,
      builder: (context, AsyncSnapshot<RangeValues> snapshot) {
        if (snapshot.hasData) {
          return buildSlider(Theme.of(context).sliderTheme, snapshot.data);
        } else {
          return buildSlider(Theme.of(context).sliderTheme, defaultValues);
        }
      },
    );
  }

  Widget buildSlider(SliderThemeData sliderTheme, RangeValues values) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SliderTheme(
        data: Theme.of(context).sliderTheme,
        child: RangeSlider(
          values: values,
          min: 0,
          max: 5,
          divisions: 10,
          labels: RangeLabels('${values.start}', '${values.end}'),
          onChanged: (RangeValues values) {
            ratingRangeBloc.updateRatingRange(values);
          },
        ),
      ),
      const Text('Bathroom Rating Acceptable Range'),
    ]);
  }
}
