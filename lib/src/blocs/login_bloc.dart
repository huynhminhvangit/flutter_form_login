import 'dart:async';

import 'package:flutter_form_login/src/validators/validations.dart';

class LoginBloc {
  StreamController _streamEmailController = StreamController();
  StreamController _streamPasswordController = StreamController();

  Stream get emailStream => _streamEmailController.stream;
  Stream get passwordStream => _streamPasswordController.stream;

  String? isValidEmail(String email) {
    if (!Validations.isValidEmail(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? isValidPassword(String password) {
    if (!Validations.isValidPassword(password)) {
      return 'One number, uppercase, lowercase and at least 8 characters';
    }
    return null;
  }


  void dispose() {
    _streamPasswordController.close();
    _streamEmailController.close();
  }


}
