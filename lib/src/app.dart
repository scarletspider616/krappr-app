// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krappr/src/ui/screen/home_screen.dart';
import 'package:krappr/src/ui/screen/login_screen.dart';
import 'package:krappr/src/ui/theme/main_theme.dart';

import 'bloc/authorization_bloc.dart';

class App extends StatelessWidget {
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
}
