import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_finalyear/display.dart';
import 'package:tflite/tflite.dart';

class Imgpick extends StatefulWidget {
  const Imgpick({Key key}) : super(key: key);

  @override
  State<Imgpick> createState() => _ImgpickState();
}

class _ImgpickState extends State<Imgpick> {
  List _outputs;
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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 201, 174),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(children: [
            Spacer(),
            image != null
                ? Image.file(
                    image,
                    width: 200,
                    height: 200,
                  )
                : Image.asset("assets/images/self.png",
                    width: 160, height: 210, fit: BoxFit.fill),
            const SizedBox(
              height: 14,
            ),
            Image.asset(
              "assets/images/logo1.png",
            ),
            const SizedBox(
              height: 20,
            ),
            buildButton(
                Text: Text("Pick Gallery"),
                icon: Icons.image_outlined,
                onClicked: () => pickImage(ImageSource.gallery)),
            const SizedBox(
              height: 40,
            ),
            buildButton(
              Text: Text(
                'Pick Camera',
                style: TextStyle(color: Colors.red),
              ),
              icon: Icons.camera_alt_outlined,
              onClicked: () => pickImage1(ImageSource.camera),
            ),
            Spacer(),
            SizedBox(
              height: 15,
            ),
            _outputs != null
                ? Text(
                    "${_outputs[0]["label"]}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      background: Paint()..color = Colors.white,
                    ),
                  )
                : Container(),
          ]),
        ),
      );
  Widget buildButton({
    Text: Text,
    // String text,
    IconData icon,
    VoidCallback onClicked,
  }) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(56),
            primary: Color.fromARGB(255, 239, 165, 116),
            onPrimary: Colors.black,
            textStyle: TextStyle(fontSize: 20, color: Colors.red),
          ),
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(
                width: 16,
              ),
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
