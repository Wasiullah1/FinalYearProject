import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_finalyear/Home.dart';
import 'dart:io';

class Makeup extends StatefulWidget {
  static String label;
  Makeup(String newLabel) {
    label = newLabel;
  }
  String title;
  @override
  State<Makeup> createState() => _MakeupState();
}

class _MakeupState extends State<Makeup> {
  File image;

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 239, 165, 116),
              leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home())),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  "assets/images/logo2.png",
                  width: 260,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              bottom: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Color.fromARGB(255, 67, 66, 66),
                  indicatorColor: Color.fromARGB(255, 220, 215, 215),
                  tabs: [
                    Tab(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.transparent,
                      ),
                    ),
                    //   // Tab(
                    //   //   child: Text("RECOMMENDATION"),
                  ]),
            ),
            backgroundColor: Color.fromARGB(255, 242, 201, 174),
            body: SingleChildScrollView(
              child: Column(children: [
                Scrollbar(
                  // child: SingleChildScrollView(
                  child: Container(
                    // child: Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 70.0),
                            child: Container(
                              width: 300,
                              height: 80,
                              child: (Text("${Makeup.label}",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 170, 58, 58),
                                  ))),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          "${Makeup.label}" != null
                              ? Condition()
                              : Image.asset("assets/images/self.png",
                                  width: 160, height: 210, fit: BoxFit.fill),
                          const SizedBox(
                            height: 14,
                          ),
                        ]),
                  ),
                ),

                // ),
                // ),
              ]),
            ),
          ),
        ));
  }

  Condition() {
    if ("${Makeup.label}" == "Fair") {
      return Column(children: [
        Image.asset("assets/images/1.png"),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "1N00 Albaster - for very fair skin tones with neutral undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Light Medium") {
      return Column(children: [
        Image.asset(
          "assets/images/5.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "1Y16 Warm Beige - for light skin tones with yellow undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Dark Medium") {
      return Column(children: [
        Image.asset(
          "assets/images/9.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "2Y32 Warm Caramel - for Medium skin tones with yellow undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Browned Caramel") {
      return Column(children: [
        Image.asset(
          "assets/images/14.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "3Y52 Warm Chestnut - for tan skin tones with yellow undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Espresso Milk Chocolate") {
      return Column(children: [
        Image.asset(
          "assets/images/32.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "4R64 Cool Walnut - for Tan to Deep Skin tones with red undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Cacao Black Skin") {
      return Column(children: [
        Image.asset(
          "assets/images/37.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "4R72 Warm Espresso - for Deeper skin tones with dark undertones",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Gray Scale") {
      return Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "It is Gray Scale Image, Please Give Correct Human Colored Face Input",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )))
      ]);
    } else if ("${Makeup.label}" == "Invalid Image") {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
              Text("It is Invalid Image, Please Give Correct Human Face Input",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )));
    }
  }
}
