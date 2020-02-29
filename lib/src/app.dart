// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:krappr/src/ui/screen/home_screen.dart';
import 'package:krappr/src/ui/screen/login_screen.dart';
import 'package:krappr/src/ui/theme/main_theme.dart';

import 'bloc/authorization_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PermissionStatus _permissionStatus;

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
          if (_permissionStatus != PermissionStatus.granted) {
            _askPermission();
          }
          if (snapshot.hasData && snapshot.data) {
            return HomeScreen();
          }
          return LoginScreen();
        });
  }

  void _updateStatus(PermissionStatus status) {
    if (status != _permissionStatus) {
      setState(() {
        _permissionStatus = status;
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
