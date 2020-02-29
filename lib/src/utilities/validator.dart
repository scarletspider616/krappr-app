import 'dart:async';
import 'package:email_validator/email_validator.dart';

// https://stackoverflow.com/questions/58115715/flutter-submit-login-bloc-using-stream-rxdart

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (String email, EventSink<String> sink) {
    if (EmailValidator.validate(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink<String> sink) {
    if (password.length > 7 && password.contains(new RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*"))) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 8 characters, and including at least one uppercase letter, one lowercase letter and one numbers');
    }
  });
}
