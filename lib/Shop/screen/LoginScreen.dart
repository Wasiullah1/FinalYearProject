import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_finalyear/Shop/models/currentAppUser.dart';
import 'package:project_finalyear/Shop/screen/SignUpScreen.dart';
// import 'package:project_finalyear/Shop/screen/detail/components/roundButton.dart';
import 'package:project_finalyear/display.dart';
import 'package:velocity_x/velocity_x.dart';

import 'detail/components/button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _blurAnimationController;

  @override
  void initState() {
    _blurAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0,
      upperBound: 6,
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

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwaordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String errorMessage;
  bool load = false;
  bool isloaded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 189, 150, 124),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    // SingleChildScrollView(),
                    _buildTitleText(context),
                    SizedBox(
                      height: 50,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 16,
                      shadowColor: Colors.black54,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none,
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) return "Email is required*";

                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                          RegExp regex = RegExp(pattern.toString());

                          if (!regex.hasMatch(value.trim())) {
                            return "Email address is not valid";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 16,
                      shadowColor: Colors.black54,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          //border: OutlineInputBorder(),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                            // } else if (value.length < 6) {
                            //   return "Your passwaord is less then 6 charactors";
                            // } else if (value.length > 15) {
                            //   return "Your passwaord is greator 15 charactors";
                          } else
                            return null;
                        },
                        controller: passwaordController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(),
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        24.widthBox,
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isloaded == false
                        ? buildSignInGradientButtonRow(
                            context,
                            'Sign In',
                            () async {
                              setState(() {
                                isloaded = true;
                              });
                              await signIn("${emailController.text}",
                                  "${passwaordController.text}");
                              setState(() {
                                isloaded = false;
                              });
                              print('User Login Successfully!');
                            },
                          )
                        : Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an account?  ',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)),
                          TextSpan(
                              text: 'Create',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUp()));
                                }),
                        ]),
                      ).p(24),
                    ),

                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => SignUp()));
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    if (_formkey.currentState.validate()) {
      try {
        setState(() {
          bool load = true;
        });
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  CurrentAppUser.currentUserData
                      .getCurrentUserData(uid.user.uid),
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
      setState(() {
        load = false;
      });
    }
  }

  Center _buildTitleText(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo2.png",

            // width: 400,
          ),
          Text(
            'Sign In to your account',
            softWrap: true,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          // Text(
          //   'Sign in to your account',
          //   softWrap: true,
          //   style: Theme.of(context).textTheme.headline6,
          // ),
        ],
      ),
    );
  }
}
