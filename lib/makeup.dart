import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'imgpick.dart';

class Makeup extends StatefulWidget {
  const Makeup({Key key}) : super(key: key);

  @override
  State<Makeup> createState() => _MakeupState();
}

class _MakeupState extends State<Makeup> {
  @override
  List _outputs;
  bool _loading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 201, 174),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
              child: Center(
            child: Column(children: <Widget>[
              Container(
                width: 300,
                height: 50,
                child: (Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          )
              // : Container()
              ),
        ),
      ),
    );
  }
}
