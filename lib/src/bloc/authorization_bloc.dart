// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationBloc {
  String _tokenString = "";
  final PublishSubject _isSessionValid = PublishSubject<bool>();
  Stream<bool> get isSessionValid => _isSessionValid.stream;
  void dispose() {
    _isSessionValid.close();
  }

  // This is responsible for restoring the user session when the user opens the app from a terminated state.
  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get("token");
    if (_tokenString != null && _tokenString.length > 0) {
      _isSessionValid.sink.add(true);
    } else {
      _isSessionValid.sink.add(false);
    }
  }

  // This function is responsible for opening the user session, when the user logging in.
  void openSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    _tokenString = token;
    _isSessionValid.sink.add(true);
  }

  // This is responsible for closing the user session, when the user wants to logout from the application.
  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    _isSessionValid.sink.add(false);
  }
}

final authBloc = AuthorizationBloc();
