import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_app/modes/user_info.dart';

class AuthDatabase extends ChangeNotifier {
  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref().child('userinfo');
  final Stream<QuerySnapshot> _userInfoStream = FirebaseFirestore.instance.collection('abc').snapshots();

//insert data from database
  void insertData(String name, String phone) {
    var user = {'name': name, 'phone': phone};
   _messagesRef.push().set(user).then((user) {
    }).catchError((error) {
      // print(error.toString());
    });
  }

List<UserInfo> userInfors =[];

void fetchUserInfoList() {
  print('test conect: $_userInfoStream');
_userInfoStream.listen((snapshot) { 
  final List<UserInfo> userInfor = snapshot.docs
  .map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserInfo(name: data['name'], phone: data['phone']);
  }).toList();
  this.userInfors = userInfor;
  notifyListeners();
});
}

// Update data

// delete data

}
