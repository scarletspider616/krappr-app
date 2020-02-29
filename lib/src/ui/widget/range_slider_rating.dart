import 'package:flutter/material.dart';

class RangeSliderRating extends StatefulWidget {
  @override
  _RangeSliderRatingState createState() => _RangeSliderRatingState();
}

class _RangeSliderRatingState extends State<RangeSliderRating> {
  RangeValues _values = RangeValues(1, 2);

  @override
  Widget build(BuildContext context) {

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SliderTheme(
        data: Theme.of(context).sliderTheme,
        child: RangeSlider(
          values: _values,
          min: 0,
          max: 5,
          divisions: 10,
          labels: RangeLabels('${_values.start}', '${_values.end}'),
          onChanged: (RangeValues values) {
            setState(() {
              _values = values;
            });
          },
        ),
      ),
      const Text('Bathroom Rating Acceptable Range'),
    ]);
  }
}
