import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/home_bloc.dart';
import 'package:krappr/src/utilities/constants.dart';

import '../../bloc/list_view_drawer_bloc.dart';
import '../widget/map_widget.dart';
import '../widget/range_slider_rating.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc = HomeBloc();
  String title = "Home Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(HOME_SCREEN),
        ),
        drawer: ListViewDrawerBloc().getDefaultListDrawer(),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Expanded(
                flex: 9,
                child: MapWidget(),
              ),
              Expanded(flex: 1, child: RangeSliderRating())
            ])));
  }
}
