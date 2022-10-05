import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/firebase/firebase_auth.dart';
import 'package:taxi_app/firebase_options.dart';
import 'package:taxi_app/modes/user.dart';
import 'package:taxi_app/screens/wrapper.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: FirAuth().user,
      catchError: (_, __) => null,
      initialData: null,
      child: const MaterialApp(
          home: Wrapper(),
          ),
    );
  }
}

