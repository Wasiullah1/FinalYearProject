import 'dart:io';
import 'dart:ui' as ui;
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_finalyear/makeup.dart';
import 'package:tflite/tflite.dart';

class Imgpick1 extends StatefulWidget {
  const Imgpick1({Key key}) : super(key: key);

  @override
  State<Imgpick1> createState() => _ImgpickState();
}

class _ImgpickState extends State<Imgpick1> {
  File _imageFile;
  List<Face> _faces;
  bool isLoading = false;
  ui.Image _image;
  final picker = ImagePicker();
  List _outputs;
  // List result;
  File image;
  @override
  void initState() {
    super.initState();
    isLoading = true;

    loadModel().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      final imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      //if (imageFile == null) return;
      setState(() {
        isLoading = true;
      });
      final image = FirebaseVisionImage.fromFile(File(imageFile.path));
      final faceDetector = FirebaseVision.instance.faceDetector();
      List<Face> faces = await faceDetector.processImage(image);

      if (mounted) {
        setState(() {
          this._imageFile = File(imageFile.path);
          this._faces = faces;
          _loadImage(File(imageFile.path));
        });
      }
      //final imageTemporary = File(imageFile.path);
      //setState(() => this._imageFile  = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    //  classifyImage(image);
  }

  Future pickImage1(ImageSource source) async {
    try {
      final imageFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      //if (imageFile == null) return;
      setState(() {
        isLoading = true;
      });
      final image = FirebaseVisionImage.fromFile(File(imageFile.path));
      final faceDetector = FirebaseVision.instance.faceDetector();
      List<Face> faces = await faceDetector.processImage(image);

      if (mounted) {
        setState(() {
          this._imageFile = File(imageFile.path);
          this._faces = faces;
          _loadImage(File(imageFile.path));
        });
      }
      // final imageTemporary = File(imageFile.path);
      // setState(() => this._imageFile  = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    //  classifyImage(image);
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    var output = await Tflite.runModelOnImage(
      path: _imageFile.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
          isLoading = false;
          _outputs = output;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 201, 174),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            // Spacer(),
            isLoading
                ? Column(children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ])
                : (_imageFile == null)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 150,
                          ),
                          Image.asset(
                            "assets/images/logo1.png",
                          ),
                          // Center(child: Text('no image selected'))
                        ]),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Container(
                              child: FittedBox(
                                child: SizedBox(
                                  width: _image.width.toDouble(),
                                  height: _image.height.toDouble(),
                                  child: CustomPaint(
                                    painter: FacePainter(_image, _faces),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

            const SizedBox(
              height: 10,
            ),
            _outputs != null
                ? Column(
                    children: [
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

  _getImage() async {
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });

    final image = FirebaseVisionImage.fromFile(File(imageFile.path));
    final faceDetector = FirebaseVision.instance.faceDetector();
    List<Face> faces = await faceDetector.processImage(image);

    if (mounted) {
      setState(() {
        _imageFile = File(imageFile.path);
        _faces = faces;
        _loadImage(File(imageFile.path));
      });
    }
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

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;
  final List<Rect> rects = [];

  FacePainter(this.image, this.faces) {
    for (var i = 0; i < faces.length; i++) {
      rects.add(faces[i].boundingBox);
    }
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.red;

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(rects[i], paint);
    }
  }

  @override
  bool shouldRepaint(FacePainter old) {
    return image != old.image || faces != old.faces;
  }
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
