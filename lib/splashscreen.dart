import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_finalyear/Shop/models/currentAppUser.dart';
import 'package:project_finalyear/Shop/screen/LoginScreen.dart';
import 'package:project_finalyear/display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // await getUser();
    super.initState();

    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CurrentAppUser.currentUserData.getCurrentUserData(user.uid);
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo1.png",
            ),
          ],
        ),
      ),
    );
  }

  // getUser() async {
  //   var user = FirebaseAuth.instance.currentUser;
  //   print("here is user value *** " + user.toString());
  //   if (user == null){
  //      ()=> Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => LoginScreen()));}
  //   else {
  //     await CurrentAppUser.currentUserData.getCurrentUserData(user.uid);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   }
  // }
}
