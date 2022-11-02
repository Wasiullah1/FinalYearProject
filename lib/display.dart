import "package:flutter/material.dart";
import 'package:project_finalyear/Home.dart';
import 'package:project_finalyear/Shop/screen/detail/home/homescreen.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/cover.jpg'), fit: BoxFit.cover)),
            child: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.4),
                ])),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/logo2.png",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(

                          //    onDoubleTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>Shuffle()));},
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaterialApp(
                                          debugShowCheckedModeBanner: false,
                                          home: Home(),
                                        )));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 239, 165, 116),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Find your Skintone",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(

                          //    onDoubleTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>Shuffle()));},
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaterialApp(
                                        debugShowCheckedModeBanner: false,
                                        home: HomeScreen1())));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 239, 165, 116),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Buy Suitable Foundations",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ))));
  }
}
