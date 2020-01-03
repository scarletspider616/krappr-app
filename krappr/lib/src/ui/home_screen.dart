import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/home_bloc.dart';

import 'list_view_drawer.dart';
import 'map_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: ListViewDrawer(),
      body: MapWidget(),
    );
  }
}
