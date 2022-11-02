import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:project_finalyear/Shop/models/appUser.dart';
// import 'package:splashscreen/Model/app_user.dart';

class CurrentAppUser extends AppUser with ChangeNotifier {
  static final CurrentAppUser _singleton = CurrentAppUser._internal();
  factory CurrentAppUser() => _singleton;
  CurrentAppUser._internal();
  static CurrentAppUser get currentUserData => _singleton;

  Future<bool> getCurrentUserData(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((event) {
        print("HHere we got ::::: >>>>>>>");
        Map<String, dynamic> data = event.data();
        print("HHere we got ::::: Map :: >>>>>>>$data ");
        CurrentAppUser.currentUserData.uid = userId;
        CurrentAppUser.currentUserData.uid = data['uid'] ?? '';
        CurrentAppUser.currentUserData.email = data['email'] ?? '';
        CurrentAppUser.currentUserData.name = data['name'] ?? '';
        CurrentAppUser.currentUserData.createdAt = data['created_at'] ?? '';
        CurrentAppUser.currentUserData.image = data['image'] ?? '';
        CurrentAppUser.currentUserData.Contact = data['Contact'] ?? '';
        // CurrentAppUser.currentUserData.likes = data['likes'] ?? "";
        CurrentAppUser.currentUserData.notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
