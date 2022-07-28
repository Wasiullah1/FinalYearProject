import 'package:flutter/material.dart';
import 'package:project_finalyear/cam.dart';
import 'package:project_finalyear/dialogs.dart';
import 'package:project_finalyear/makeup.dart';

import 'imgpick.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dialogs dailogs = new Dialogs();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 239, 165, 116),
              title: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/images/logo2.png",
                    width: 260, height: 80, fit: BoxFit.fill),
              ),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: GestureDetector(
                        child: TextButton(
                            onPressed: () => dailogs.information(
                                context,
                                'About',
                                'It recommends Makeup product according to your Skin Color. ',
                                '--------------------------',
                                'SKINTONA',
                                'Version: 1.0',
                                'Developer: Wasiullah Soomro',
                                'Skin Tone Detection App FYP'),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ))))
              ],
              bottom: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Color.fromARGB(255, 67, 66, 66),
                  indicatorColor: Color.fromARGB(255, 67, 66, 66),
                  tabs: [
                    Tab(
                      child: Icon(Icons.camera_alt_rounded),
                    ),
                    Tab(
                      child: Text("RECOMMENDATION"),
                    ),
                  ]),
            ),
            body: TabBarView(
              children: [
                Imgpick(),
                Makeup(),
              ],
            )));
  }
}
