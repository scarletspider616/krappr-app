// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krappr/src/ui/home_screen.dart';
import 'package:krappr/src/ui/login_screen.dart';
import 'package:krappr/src/ui/theme_data.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bloc/authorization_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PermissionStatus _status;

  @override
  void initState() {
    super.initState();
    PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse)
    .then(_updateStatus);
  }
  @override
  Widget build(BuildContext context) {
    authBloc.restoreSession();
    return MaterialApp(
      title: 'Krappr',
      theme: appTheme,
      darkTheme: darkAppTheme,
      navigatorKey: Get.key,
      home: createContent(),
    );
  }

  createContent() {
    return StreamBuilder<bool>(
        stream: authBloc.isSessionValid,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return HomeScreen();
          }
          return LoginScreen();
        });
  }

  void _updateStatus(PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
      });
    }
  }

  void _askPermission() {
    PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse])
      .then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
    _updateStatus(status);
  }
}
