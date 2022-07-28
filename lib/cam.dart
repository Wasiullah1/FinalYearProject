import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'Home.dart';

class Camera extends StatefulWidget {
  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List _outputs;
  File _image;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrange[400],
      //   title: const Text('Face Tone Detection'),
      //   actions: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.only(right: 0.0),
      //       child: GestureDetector(
      //         child: FlatButton(
      //           onPressed: () {},
      //           child: Icon(
      //             Icons.more_vert,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: _loading
                ? Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    //height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/cover.jpg',
                            ),
                            fit: BoxFit.cover)),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.4),
                            ])),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                //    color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 2, color: Colors.transparent),
                              ),
                              child: _image != null
                                  ? Image.file(_image)
                                  : Center(
                                      child: Text(
                                      'No Image is uploaded',
                                      style:
                                          TextStyle(color: Colors.transparent),
                                    )),
                            ),
                            SizedBox(
                                //   height: 5,

                                ),
                            Center(
                              child: Column(
                                children: <Widget>[
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
                                  InkWell(
                                      child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange[400],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: TextButton(
                                      onPressed: pickImage1(),
                                      child: Text(
                                        "Camera",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                      child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange[400],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: TextButton(
                                      onPressed: pickImage(),
                                      child: Text(
                                        "Gallery",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
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
                          ],
                        )),
                  ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    // ignore: deprecated_member_use
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_image == null) return null;
    final image = File(_image.path);
    setState(() {
      _loading = true;
      this._image = image as File;
    });
    classifyImage(image);
  }

  pickImage1() async {
    // ignore: deprecated_member_use
    final _image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (_image == null) return null;
    final image = File(_image.path);
    setState(() {
      _loading = true;
      this._image = image as File;
    });
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

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
