import 'package:flutter/material.dart';
import 'package:project_finalyear/Shop/screen/detail/home/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 239, 165, 116),
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg'), onPressed: () {}),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"
              // By default our  icon color is white
              // color: kTextColor,
              ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin),
      ],
    );
  }
}
