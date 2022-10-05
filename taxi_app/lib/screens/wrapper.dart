import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/modes/user.dart';
import 'package:taxi_app/screens/auth_screens/login.dart';
import 'package:taxi_app/screens/home_screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return const Login();
    } else {
     return const Home();
    }
  }
}
