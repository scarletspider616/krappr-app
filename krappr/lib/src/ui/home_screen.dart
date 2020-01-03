import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/home_bloc.dart';

import 'list_view_drawer.dart';
import 'map.dart';

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
      body: MapPage(),
    );
  }

  Future navigateToMapPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
  }
}
