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
        title: Text(REVIEW_SCREEN),
      ),
      drawer: ListViewDrawerBloc().getDefaultListDrawer(),
      body: Text(REVIEWS),
    );
  }
}
