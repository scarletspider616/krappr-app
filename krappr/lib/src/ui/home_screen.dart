import 'package:flutter/material.dart';
import 'package:krappr/src/bloc/home_bloc.dart';

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
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to Map'),
              onPressed: () {
                navigateToMapPage(context);
              },
            ),
            RaisedButton(
              onPressed: bloc.logoutUser,
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
  Future navigateToMapPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
  }
}
