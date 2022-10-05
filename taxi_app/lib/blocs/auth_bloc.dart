import 'dart:async';

import 'package:taxi_app/firebase/firebase_auth.dart';

class AuthBloc {
  final FirAuth _firAuth = FirAuth();

  final StreamController _nameStreamController = StreamController();
  final StreamController _phoneStreamController = StreamController();
  final StreamController _emailStreamController = StreamController();
  final StreamController _passStreamController = StreamController();

  Stream get nameStream => _nameStreamController.stream;
  Stream get phoneStream => _phoneStreamController.stream;
  Stream get emailStream => _emailStreamController.stream;
  Stream get passStream => _passStreamController.stream;

// check validate Sign up
  bool isValidate(String name, String phone, String email, String pass) {
    if (name.isEmpty) {
      _nameStreamController.sink.addError('Nhập tên của bạn.');
      return false;
    }
    _nameStreamController.sink.add('Ok');

    if (phone.isEmpty || phone.length < 10) {
      _phoneStreamController.sink.addError('Nhập số điện thoạicủa bạn');
      return false;
    }
    _phoneStreamController.sink.add('Ok');

    if (email.isEmpty || !email.contains("@")) {
      _emailStreamController.sink.addError('Nhập Email của bạn');
      return false;
    }
    _emailStreamController.sink.add('Ok');

    if (pass.isEmpty || pass.length < 6) {
      _passStreamController.sink.addError('Nhập pass từ 6 ký tự trở lên');
      return false;
    }
    _passStreamController.sink.add('Ok');

    return true;
  }

// Sign up
  void signUp(String name, String phone, String email, String password,
      Function onSuccess, Function(String) onRegisterError) {
    _firAuth.signUp(name, phone, email, password, onSuccess, onRegisterError);
  }

// check validate Sign in
  bool isValidateSignIn(String email, String password) {
    if (email.isEmpty || !email.contains('@')) {
      _emailStreamController.sink.addError('Kiểm tra lại email của bạn');
      return false;
    }
    _emailStreamController.sink.add('Ok');

    if (password.isEmpty) {
      _passStreamController.sink.addError('Nhập mật khẩu');
      return false;
    }
    _passStreamController.sink.add('Ok');
    return true;
  }

  // Login
  void signIn(String email, String password, Function onSuccess, Function(String) onSignInError){
    _firAuth.signIn(email, password, onSuccess, onSignInError);
  }

  void dispose() {
    _nameStreamController.close();
    _phoneStreamController.close();
    _emailStreamController.close();
    _passStreamController.close();
  }
}
