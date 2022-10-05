import 'package:flutter/material.dart';
import 'package:taxi_app/screens/tabbar_screens/chat.dart';
import 'package:taxi_app/screens/tabbar_screens/dashboard.dart';
import 'package:taxi_app/screens/tabbar_screens/my_profile.dart';
import 'package:taxi_app/screens/tabbar_screens/setting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentScreen = const Dashboard();
                  currentTab = 0;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: currentTab == 0 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: currentTab == 0 ? Colors.blue : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentScreen = const Chat();
                  currentTab = 1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    color: currentTab == 1 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: currentTab == 1 ? Colors.blue : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentScreen = const MyProfile();
                  currentTab = 2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: currentTab == 2 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'My profile',
                    style: TextStyle(
                      color: currentTab == 2 ? Colors.blue : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                setState(() {
                  currentScreen = const Setting();
                  currentTab = 3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    color: currentTab == 3 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Setting',
                    style: TextStyle(
                      color: currentTab == 3 ? Colors.blue : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
