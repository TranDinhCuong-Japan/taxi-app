import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_app/modes/user.dart';

class FirAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  MyUser? _userFromFirebase(User user) {
    return MyUser(uid: user.uid);
  }

  Stream<MyUser?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  // signup
  Future signUp(String name, String phone, String email, String password,
      Function onSuccess, Function(String) onRegisterError) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      _createUser(user.user!.uid, name, phone, onSuccess, onRegisterError);
      return _userFromFirebase(user.user!);
    }).catchError((error) {
      // print(error.toString());
      _signUpError(error.code, onRegisterError);
      return null;
    });
  }

  // Create User in realtime Fibase
  void _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {'name': name, 'phone': phone};
    var ref = _firebaseDatabase.ref().child("Users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((error) {
      onRegisterError('Đăng ký thất bại. kiểm tra lại.');
    });
  }

  void _signUpError(String code, Function(String) onRegisterError) {
    switch (code) {
      case 'weak-password':
        onRegisterError('Mật khẩu yếu');
        break;

      case 'email-already-in-use':
        onRegisterError('Email đã được đăng ký');
        break;

      case 'operation-not-allowed':
      case 'invalid-email':
        onRegisterError('Email không hợp lệ');
        break;

      default:
        onRegisterError('Đăng ký thất bại. Vui lòng kiểm tra lại');
        break;
    }
  }

// sign in
    Future signIn(String email, String password, Function onSuccess,
        Function(String) onSignInError) async {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        onSuccess();
        return _userFromFirebase(user.user!);
      }).catchError((error) {
        onSignInError(
            'Email hoặc mật khẩu không chính xác. Xin vui lòng thử lại!');
            return null;
      });
    }

// sign out
Future logOut() async {
 return await _firebaseAuth.signOut().then((user) {
  }).catchError((error){
return null;
  });
}

// close Stream

}
