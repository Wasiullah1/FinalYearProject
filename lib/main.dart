import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_finalyear/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final auth = FirebaseAuth.instance;
  await Firebase.initializeApp();
  // ChangeNotifierProvider<ImageModel>(
  //   child: MyApp(), builder: (BuildContext context, MyApp) => MyApp)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: SplashScreen()));
  }
}
