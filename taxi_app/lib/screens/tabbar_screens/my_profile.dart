import 'package:flutter/material.dart';
import 'package:taxi_app/firebase/firebase_auth.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

final FirAuth _authFirebase = FirAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () async {
                 await _authFirebase.logOut();
                 Navigator.pop(context);
              },
              icon: const Icon(Icons.person),
              label: const Text('logout'))
        ],
      ),
      body: const Center(child: Text('My profile', style: TextStyle(fontSize: 40))),
    );
  }
}
