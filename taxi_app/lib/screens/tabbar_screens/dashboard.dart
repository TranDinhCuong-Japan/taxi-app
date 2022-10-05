import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/screens/tabbar_screens/home_menu.dart';

import '../../firebase/auth_database.dart';
import '../../modes/user_info.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final AuthDatabase _authDatabase = AuthDatabase();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthDatabase>(
      create: (_) => AuthDatabase()..fetchUserInfoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
                fontSize: 20.0, color: Colors.black, letterSpacing: 2.0),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        drawer: const Drawer(child: HomeMenu()),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name',
                        )),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a your phone number',
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _authDatabase.insertData(
                            _nameController.text, _phoneController.text);
                        setState(() {
                          _nameController.text = '';
                          _phoneController.text = '';
                        });
                      },
                      child: const Text('Add'))
                ],
              ),
            ),
            Consumer<AuthDatabase>(builder: (context, model, child) {
              List<UserInfo> list = model.userInfors;

              if (list.isEmpty) {
                return CircularProgressIndicator();
              }

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const FlutterLogo(size: 50),
                      title: Text(list[index].name.toString()),
                      subtitle: Text(list[index].phone.toString()),
                      trailing: TextButton.icon(
                        onPressed: () {
                         print(list[index].name);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text(''),
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
