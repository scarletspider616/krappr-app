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
              return fullReview(snapshot,Theme.of(context));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

Widget fullReview(AsyncSnapshot<ReviewModel> snapshot, ThemeData themeData) {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 10),
        Text(
          snapshot.data.location.locationName,
          style: themeData.textTheme.headline,
        ),
        SizedBox(height: 10),
        Text(
          snapshot.data.location.locationDescription,
          style: themeData.textTheme.subtitle,
        ),
        SizedBox(height: 10),
        reviewStars(snapshot.data.rating,themeData.primaryColor, themeData.accentColor),
        SizedBox(height: 10),
        Text(
          snapshot.data.userReview,
          style: themeData.textTheme.body1),
      ]),
      alignment: FractionalOffset(0.5, 0.5));
}

Widget reviewStars(int numberOfStars, Color primary, Color accent) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star,
          color: numberOfStars > 0 ? accent : primary),
      Icon(Icons.star,
          color: numberOfStars > 1 ? accent : primary),
      Icon(Icons.star,
          color: numberOfStars > 2 ? accent : primary),
      Icon(Icons.star,
          color: numberOfStars > 3 ? accent : primary),
      Icon(Icons.star,
          color: numberOfStars > 4 ? accent : primary),
    ],
  );
}
