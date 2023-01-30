import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Layout/Health_Layout/health_patien_Layout_Screen.dart';
import 'package:hea_apps/Modeules/CreatProfile_patien/CubitCreatprofile/Cubita.dart';
import 'package:hea_apps/Modeules/CreatProfile_patien/CubitCreatprofile/statesa.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../services/auth.dart';
import '../../services/database.dart';

class CreatDaitePlan extends StatefulWidget {
  const CreatDaitePlan({
    Key? key,
    required this.id,
  }) : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;

  @override
  State<CreatDaitePlan> createState() => _CreatDaitePlanState();
}


class _CreatDaitePlanState extends State<CreatDaitePlan> {
  final _formKey = GlobalKey<FormState>();
  String food = '';
  String serSize = '';
  String kcl = '';
  String date = '';

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: defultColor),
              )),
          title: Text(
            "Add Diet plan  ",
            style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'food name',
                            labelStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            hintText: 'Rice',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xffF1F4F8),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "You must enter food ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => food = val);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'SER SIZE',
                            labelStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            hintText: 'Please enter SER SIZE...',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xffF1F4F8),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "You must enter SER SIZE ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => serSize = val);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'KCAL',
                            labelStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            hintText: 'Please enter KCAL...',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xffF1F4F8),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "You must enter KCAL ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => kcl = val);
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'date',
                            labelStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            hintText: 'Please enter date...',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color(0xff57646C),
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xffF1F4F8),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "You must enter date ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => date = val);
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() ) {

                                DatabaseService(
                                    uid: FirebaseAuth
                                        .instance.currentUser!.uid).addDitePlan(food, serSize, kcl, date, "false", widget.id).then((value) {
                                  showTost("add Success");
                                  Navigator.pop(context);
                                });


                              }
                            },
                            child: Text(
                              "Add plan",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
    );
  }

  void showTost(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


}



