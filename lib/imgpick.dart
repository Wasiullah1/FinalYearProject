// import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:project_finalyear/Shop/screen/detail/home/homescreen.dart';
// import 'package:project_finalyear/home.dart';
import 'package:project_finalyear/makeup.dart';
// import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';

class Imgpick extends StatefulWidget {
  const Imgpick({Key key}) : super(key: key);

  @override
  State<Imgpick> createState() => _ImgpickState();
}

class _ImgpickState extends State<Imgpick> {
  List _outputs;
  // List result;
  File image;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    classifyImage(image);
  }

  Future pickImage1(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 201, 174),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            // Spacer(),
            image != null
                ? Image.file(
                    image,
                    width: 250,
                    height: 350,
                  )
                : Column(children: [
                    Image.asset("assets/images/self.png",
                        width: 160, height: 210, fit: BoxFit.fill),
                    Image.asset(
                      "assets/images/logo1.png",
                    ),
                  ]),
            image == null
                ? Text("Please Select Face Image")
                : Column(children: [
                    Image.asset("assets/images/self.png",
                        width: 160, height: 210, fit: BoxFit.fill),
                    Image.asset(
                      "assets/images/logo1.png",
                    ),
                  ]),

            // const SizedBox(
            //   height: 10,
            // ),
            _outputs != null
                ? Column(
                    children: [
                      // Text(
                      //   "${_outputs[0]["label"]}",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 20.0,
                      //     background: Paint()..color = Colors.white,
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Makeup(_outputs[0]["label"])));
                        },
                        // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(36),
                          primary: Color.fromARGB(255, 239, 165, 116),
                          onPrimary: Colors.black,
                        ),
                        child: Text(_outputs[0]["label"],
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red[700],
                            )
                            //
                            ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            buildButton(
                icon: Icons.image_outlined,
                Text: Text("Pick Image from Gallery",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
                onClicked: () => pickImage(ImageSource.gallery)),
            const SizedBox(
              height: 20,
            ),
            buildButton(
              Text: Text('Take a picture from Camera',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )),
              icon: Icons.camera_alt_outlined,
              onClicked: () {
                pickImage1(ImageSource.camera);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Makeup()));
              },
            ),
            // Spacer(),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildButton({
    Text Text,
    // String text,
    IconData icon,
    VoidCallback onClicked,
  }) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(56),
            primary: Color.fromARGB(255, 239, 165, 116),
            onPrimary: Colors.black,
          ),
          child: Row(
            children: [
              Icon(icon, size: 28, color: Colors.white),
              const SizedBox(
                width: 10,
              ),
              Text,
            ],
          ),
          onPressed: onClicked);
}

loadModel() async {
  await Tflite.loadModel(
    model: "assets/model_unquant.tflite",
    labels: "assets/labels.txt",
  );
}

@override
void dispose() {
  Tflite.close();
  dispose();
}
