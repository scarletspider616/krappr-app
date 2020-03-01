import 'package:flutter_auth0/flutter_auth0.dart';

class Repository {
  final String clientId = 'JCx57cl7gNvckFezPZhEovFNHkuAPy60';
  final String domain = 'krappr.auth0.com';
  Auth0 auth;
  Repository(){
      auth = Auth0(baseUrl: 'https://$domain/', clientId: clientId);
  }
 
  Future<String> login(String email, String password) async {
    var token = "";
      var response = await auth.auth.passwordRealm({
        'username': email,
        'password': password,
        'realm': 'Username-Password-Authentication'
      });
      token = response["access_token"];
      return token;
  }

  Future<String> signUp(String email, String password) async {
    print(email);
    print(password);
    var token = "";
    try {
      var response = await auth.auth.createUser({
        'email': email,
        'password': password,
        'connection': 'Username-Password-Authentication'
      });
      print(response);

      token = response["access_token"];
    } catch (e) {
      print(e);
    }
      return token;
  }
}
