// Temporary faked out user repository
// https://medium.com/swlh/how-to-create-a-simple-login-form-in-flutter-using-bloc-pattern-b55ad52a2a10

import "auth_provider.dart";

class Repository {
  final AuthProvider authProvider = AuthProvider();
  Future<String> login(String email, String password) =>
      authProvider.login(email: email, password: password);
}
