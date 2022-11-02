import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_finalyear/aboutus.dart';
import 'package:project_finalyear/dialogs.dart';
import 'package:project_finalyear/display.dart';
import 'package:project_finalyear/imgpick1.dart';
import 'package:project_finalyear/userProfile.dart';

class Home extends StatefulWidget {
  static String label;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dialogs dailogs = new Dialogs();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Imgpick1(),
    AboutUs(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
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
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
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
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: GestureDetector(
                        child: TextButton(
                            onPressed: () => dailogs.information(
                                context,
                                'Terms & Conditions ',
                                'It recommends Makeup product according to your Skin Color. To increase the accuracy, Image must be taken in Day Light. Selfies are appreciated while using this app. Avoid using filtered or makeup worn images',
                                '--------------------------',
                                'SKINTONA',
                                'Version: 1.0.0',
                                'Developed by: Wasiullah Soomro',
                                'Skin Tone Detection App FYP'),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ))))
              ],
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
                    // Tab(child: Text("RECOMMENDATION")),
                  ]),
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 239, 165, 116),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: Colors.white),
                  label: 'FYP Team',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color.fromARGB(255, 21, 21, 21),
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}
