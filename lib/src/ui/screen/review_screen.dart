import 'package:flutter/material.dart';

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
      body: Text("Reviews"),
    );
  }
}
