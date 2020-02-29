import 'package:flutter/material.dart';
import 'package:krappr/src/utilities/constants.dart';

import '../../bloc/list_view_drawer_bloc.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Review Screen"),
        ),
        drawer: ListViewDrawerBloc().getDefaultListDrawer(),
        body: Container (
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(height: 10),
              titleSummary(),
              SizedBox(height: 10),
              reviewStars(2),
              SizedBox(height: 10),
              Text("I really enjoyed the feeling of the seat on my ass.")
            ]),
            alignment: FractionalOffset(0.5, 0.5)
            ));
  }
}

Widget reviewStars(int numberOfStars) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: numberOfStars > 0 ? Colors.green[500] : Colors.black),
      Icon(Icons.star, color: numberOfStars > 1 ? Colors.green[500] : Colors.black),
      Icon(Icons.star, color: numberOfStars > 2 ? Colors.green[500] : Colors.black),
      Icon(Icons.star, color: numberOfStars > 3 ? Colors.green[500] : Colors.black),
      Icon(Icons.star, color: numberOfStars > 4 ? Colors.green[500] : Colors.black),
    ],
  );
}

Widget titleSummary() {
  return Text(
    "C-Tire Bathroom",
    style: TextStyle(fontSize: 30.0),
  );
}
