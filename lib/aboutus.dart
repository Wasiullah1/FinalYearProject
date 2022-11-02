import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 201, 174),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              "assets/images/muet.png",
              width: 300,
              height: 100,
            ),
          ),
          Center(
              child: Title(
                  color: Colors.white,
                  child: Text("Final Year Project Team",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      )))),
          Center(
              child: Title(
                  color: Colors.white,
                  child: Text("Computer Systems Department",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      )))),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/self.png"),
                  backgroundColor: Colors.white,
                  radius: 60,
                ),
                Text("Wasiullah",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    )),
                Text("18CS66",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/muzi.jpeg"),
                  radius: 60,
                ),
                Text("Muzamil Ahmed",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    )),
                Text("18CS64",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/mah.jpg"),
                  backgroundColor: Colors.blue[100],
                  radius: 60,
                ),
                Text("Mahnoor",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    )),
                Text("18CS16",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Title(
                  color: Colors.white,
                  child: Text("Supervisor",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      )))),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Sir.jpeg"),
                  backgroundColor: Colors.white,
                  radius: 60,
                ),
                Text("Dr. Irfan Bhacho",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    )),
                Text("Assistant Professor",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
