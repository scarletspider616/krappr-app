import 'package:krappr/src/resources/repository.dart';
import 'package:krappr/src/utilities/validator.dart';
import 'package:rxdart/rxdart.dart';

import 'authorization_bloc.dart';

class LoginBloc extends Validators {
  Repository repository = Repository();
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();
  final PublishSubject _loadingData = PublishSubject<bool>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (email, password) => true);
  Stream<bool> get loading => _loadingData.stream;

  Future<bool> login() async {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    _loadingData.sink.add(true);
    try {
      var token = await repository.login(validEmail, validPassword);
      authBloc.openSession(token);
      return true;
    } catch (e) {} finally {
      _loadingData.sink.add(false);
    }
    return false;
  }

  Future<bool> signUp() async {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    _loadingData.sink.add(true);
    try {
      var token = await repository.signUp(validEmail, validPassword);
      _loadingData.sink.add(false);
      authBloc.openSession(token);
      return true;
    } catch (e) {}
    return false;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _loadingData.close();
  }
}
