import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_finalyear/Home.dart';
import 'package:project_finalyear/makeup.dart';
import 'package:project_finalyear/imgpick.dart';
import 'package:project_finalyear/resultscreen.dart';

class ResultBar extends Imgpick {
  const ResultBar({Key key}) : super(key: key);

  @override
  State<ResultBar> createState() => _ResultBarState();
}

class _ResultBarState extends State<ResultBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          padding: EdgeInsets.only(top: 28.0),
          child: Image.asset(
            "assets/images/logo2.png",
            width: 260,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Makeup("${Makeup.label}"),
    ));
  }
}
