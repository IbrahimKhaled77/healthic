import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Layout/Health_Layout/health_Specialized_Layout_Screen.dart';
import 'package:hea_apps/Layout/Health_Layout/health_patien_Layout_Screen.dart';
import 'package:hea_apps/Modeules/Forgot_password/Forgot_password_screen.dart';
import 'package:hea_apps/Modeules/Register_noutris/Register_Specialized_Screen.dart';
import 'package:hea_apps/Modeules/Register_patient/Register_Patien_Screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:hea_apps/Shared/Shealt_Compnent/Constants.dart';

import '../../Layout/Health_Layout/heath_Adima_Layout_Screen.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class LoginScreenHeath extends StatefulWidget {
  @override
  State<LoginScreenHeath> createState() => _LoginScreenHeathState();
}

class _LoginScreenHeathState extends State<LoginScreenHeath> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool _showPassword = true;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    // alignment: AlignmentDirectional.center,
                    children: [
                      //  colorbulid(context),
                      /*Icon(
                        MyFlutterApp.heartbeat,
                        color: Colors.white,
                        size: 150.0,
                      ),*/
                      SvgPicture.asset(
                        'assert/image/logogApp.svg',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "My Health",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      /*Image(image:AssetImage("assert/image/stethoscope.png"),
                        height: 190.0,
                        width: 190.0,
                      ),*/
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter your Email address';
                            }
                            if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(val)) {
                              return  'Enter a Valid Email address';
                            }
                            return  null;
                          },
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.teal,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            ),
                            /* border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(

                                // color: Colors.red,
                              ),
                            ),*/
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          obscureText: !_showPassword,
                          cursorColor: Colors.black26,
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.teal,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            ),

                            /* border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(

                                // color: Colors.red,
                              ),
                            ),*/
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.teal,
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                      'Could not sign in with those credentials';
                                      showTost(
                                          "user name Or password incorrect");
                                    });
                                  } else {
                                    if (email == "admin@gmail.com" &&
                                        password == "123456") {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdimaLayout()),
                                              (route) => false);
                                      showTost("login success");
                                    } else {
                                      //doctor
                                      var userType = await DatabaseService(
                                          uid: FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .userData;
                                      var userName = await DatabaseService(
                                          uid: FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .userNama;
                                      var userImage = await DatabaseService(
                                          uid: FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .userImage;
                                      Diohelper.SaveData(
                                          key: 'UserNmae', value: userName);
                                      Diohelper.SaveData(
                                          key: 'UserImage', value: userImage);
                                      Diohelper.SaveData(
                                          key: 'Usertype', value: userType);

                                      print("mytype" + userType);
                                      if (userType == "patint") {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>healthLayout_patien() ));
                                        Diohelper.SaveData(key: 'myCover', value: "");
                                        Diohelper.SaveData(
                                            key: 'Creatpatient',
                                            value: true)
                                            .then((value) {
                                          if (value) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        healthLayout_patien()),
                                                    (route) => false);
                                            showTost("login success");
                                          }
                                        });
                                      } else {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>healthLayout_Specialized() ));
                                        Diohelper.SaveData(
                                            key: 'creatSpecialized',
                                            value: true)
                                            .then((value) {
                                          if (value) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        healthLayout_Specialized()),
                                                    (route) => false);
                                            showTost("login success");
                                          }
                                        });
                                      }
                                    }
                                  }
                                }
                              },
                              child: Text(
                                "login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                  color: defultColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            if (rasterpatient == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPatien()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterSpecialized()));
                            }
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                              color: defultColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showTost(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    /*path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);*/
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget colorbulid(context) => ClipPath(
  // ignore: sort_child_properties_last
  child: Container(
    width: MediaQuery.of(context).size.width,
    height: 300,
    color: defultColor,
  ),
  clipper: CustomClipPath(),
);