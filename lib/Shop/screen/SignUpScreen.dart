import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_finalyear/Shop/models/appUser.dart';
import 'package:project_finalyear/Shop/models/currentAppUser.dart';
import 'package:project_finalyear/Shop/screen/HomeScreen.dart';
import 'package:project_finalyear/Shop/screen/LoginScreen.dart';
import 'package:project_finalyear/services/database_services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'detail/components/button.dart';
import 'detail/components/icon_button.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController _blurAnimationController;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  File imageFile;
  bool load = false;
  final _formKey = GlobalKey<FormState>();
  static const String id = '/signup';
  String username = "", email = "", password = "", contact = "";

  @override
  void initState() {
    _blurAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 5,
    );
    super.initState();
    _blurAnimationController.forward();
    _blurAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _blurAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 150, 124),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () async {
                      await _getFromGallery();
                      if (imageFile != null) {
                        setState(() {
                          load = true;
                          CurrentAppUser.currentUserData.image;
                        });
                        String url;
                        url = await DatabaseServices.uploadImage(
                            CurrentAppUser.currentUserData.uid, imageFile);
                        if (url != null) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(CurrentAppUser.currentUserData.uid)
                              .update({'image': url});
                          CurrentAppUser.currentUserData.image = url;
                          imageFile = null;
                          Fluttertoast.showToast(msg: 'Image uploaded');
                        } else {
                          Fluttertoast.showToast(msg: 'Something went wrong');
                        }
                        setState(() {
                          load = false;
                          CurrentAppUser.currentUserData.image;
                        });
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200000),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200000),
                        ),
                        child: imageFile == null
                            ? CachedNetworkImage(
                                imageUrl: CurrentAppUser.currentUserData.image,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.person),
                              )
                            : Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                              ),
                      ),
                    )),
                // Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
                _buildTitleText(context),
                15.heightBox,
                // Username----------------------------------------------------------
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 16,
                  shadowColor: Colors.black54,
                  child: TextFormField(
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                      ),
                      onChanged: (String value) {
                        username = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? "Enter Username" : null;
                      }),
                ),
                15.heightBox,
                // Email----------------------------------------------------------
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 16,
                  shadowColor: Colors.black54,
                  child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        // border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {
                        email = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? "Enter Email" : null;
                      }),
                ),
                15.heightBox,
                // Pasword----------------------------------------------------------
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 16,
                  shadowColor: Colors.black54,
                  child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        // border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {
                        password = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? "Enter Password" : null;
                      }),
                ),
                15.heightBox,
                // Contact----------------------------------------------------------
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 16,
                  shadowColor: Colors.black54,
                  child: TextFormField(
                      controller: contactController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Contact",
                        labelText: "Contact",
                        prefixIcon: Icon(Icons.phone),
                        border: InputBorder.none,
                        // border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {
                        contact = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? "Contact" : null;
                      }),
                ),
                10.heightBox,
                buildSignInGradientButtonRow(context, 'Create', () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: email.toString().trim(),
                          password: password.toString().trim());
                      await postDetailsToFirestore();
                      if (user != null) {
                        print('success');
                        toastMessage('User successfully created');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                        setState(() {
                          showSpinner = false;
                          setState(() {
                            usernameController.text = '';
                            emailController.text = '';
                            passwordController.text = '';
                            contactController.text = '';
                          });
                        });
                      }
                    } catch (e) {
                      print(e.toString());
                      toastMessage(e.toString());
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  }
                }),
                15.heightBox,
                Text('Or create account using social media',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onBackground)),
                15.heightBox,
                const SocialIconButtonsRow(),

                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account?  ',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.onBackground)),
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          }),
                  ]),
                ).p(14),
              ]).p(14),
        ),
      ),
    ));
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    AppUser userModel = AppUser();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.name = usernameController.text;
    userModel.Contact = contactController.text;
    userModel.image = CurrentAppUser.currentUserData.image;
    // userModel.role = "user";

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(AppUser.toMap(userModel));
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create account',
          softWrap: true,
          style: Theme.of(context).textTheme.headline4.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
