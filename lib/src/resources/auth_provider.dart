// Temporary faked out user repository
// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import 'package:flutter/material.dart';

class AuthProvider {
  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1)); // fake network latency
    return 'token-info';
  }
}
