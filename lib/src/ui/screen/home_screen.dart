import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/home_bloc.dart';

import '../../bloc/list_view_drawer_bloc.dart';
import '../widget/map_widget.dart';

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
        title: Text(title),
      ),
      drawer: ListViewDrawerBloc().getDefaultListDrawer(),
      body: MapWidget(),
    );
  }
}
