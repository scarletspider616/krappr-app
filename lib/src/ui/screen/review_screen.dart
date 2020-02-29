import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/list_view_drawer_bloc.dart';
import 'package:krappr/src/bloc/review_bloc.dart';
import 'package:krappr/src/models/review_model.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    reviewBloc.fetchCurrentReview();
    return Scaffold(
        appBar: AppBar(
          title: Text("Review Screen"),
        ),
        drawer: ListViewDrawerBloc().getDefaultListDrawer(),
        body: StreamBuilder(
          stream: reviewBloc.currentReview,
          builder: (context, AsyncSnapshot<ReviewModel> snapshot) {
            if (snapshot.hasData) {
              return fullReview(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

Widget fullReview(AsyncSnapshot<ReviewModel> snapshot) {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 10),
        Text(
          snapshot.data.location.locationName,
          style: TextStyle(fontSize: 30.0),
        ),
        SizedBox(height: 10),
        Text(
          snapshot.data.location.locationDescription,
          style: TextStyle(fontSize: 12),
        ),
        reviewStars(snapshot.data.rating),
        SizedBox(height: 10),
        SizedBox(height: 10),
        Text(
          snapshot.data.userReview,
          style: TextStyle(fontSize: 12),
        ),
      ]),
      alignment: FractionalOffset(0.5, 0.5));
}

Widget reviewStars(int numberOfStars) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star,
          color: numberOfStars > 0 ? Colors.green[500] : Colors.black),
      Icon(Icons.star,
          color: numberOfStars > 1 ? Colors.green[500] : Colors.black),
      Icon(Icons.star,
          color: numberOfStars > 2 ? Colors.green[500] : Colors.black),
      Icon(Icons.star,
          color: numberOfStars > 3 ? Colors.green[500] : Colors.black),
      Icon(Icons.star,
          color: numberOfStars > 4 ? Colors.green[500] : Colors.black),
    ],
  );
}
