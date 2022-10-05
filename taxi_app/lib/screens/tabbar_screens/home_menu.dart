import 'package:flutter/material.dart';
import 'package:taxi_app/screens/tabbar_screens/my_profile.dart';
import 'package:taxi_app/services/list_menu.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List listMenu = [
    ListMenu(title: 'My profile', icon: 'ic_menu_user.png', screen: const MyProfile()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: ListView.builder(
              itemCount: listMenu.length,
              itemBuilder: (context, indext) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: (() {
                      Navigator.push(context
                        , MaterialPageRoute(builder: (context)=>listMenu[indext].screen));
                    }),
                    leading: Image.asset(listMenu[indext].icon),
                    title: Text(
                      listMenu[indext].title,
                      style: const TextStyle(fontSize: 18, color: Color(0xff323643)),
                    ),
                  ),
                );
              }),
        ));
  }
}
