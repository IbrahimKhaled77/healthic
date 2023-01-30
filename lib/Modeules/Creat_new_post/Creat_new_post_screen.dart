import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Icons/icons.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../Shared/Networkes/Logical/Diohelper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../services/database.dart';

class CreatNewPost extends StatefulWidget {


  @override
  State<CreatNewPost> createState() => _CreatNewPostState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

File? _photo;
final ImagePicker _picker = ImagePicker();
String myCv = "";

class _CreatNewPostState extends State<CreatNewPost> {
  final _formKey = GlobalKey<FormState>();
  String disc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: defultColor),
                )),
        title: Text(
          "CreatPost ",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate() && myCv !="") {
                DatabaseService(
                    uid: FirebaseAuth
                        .instance.currentUser!.uid).addNewPost(Diohelper.GetData(key: 'UserImage'),Diohelper.GetData(key: 'UserNmae'),(DateTime.now().millisecondsSinceEpoch).toString(),disc,myCv,"0","false").then((value) {
                  showTost("post add Success");
                  Navigator.pop(context);
                });



              }else{
                showTost("must add image");
              }
            },
            child: Text(
              "Post",
              style: TextStyle(
                color: defultColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      Diohelper.GetData(key: 'UserImage') == null
                          ? 'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg'
                          : Diohelper.GetData(key: 'UserImage'),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text(
                      Diohelper.GetData(key: 'UserNmae'),
                      style: TextStyle(
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: TextFormField(
                  // maxLines: 6,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "You must enter text ";
                    }
                  },
                  onChanged: (val) {
                    setState(() => disc = val);
                  },

                  decoration: InputDecoration(
                    hintText: 'what is on your mind ...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          myCv == ""
                              ? 'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg'
                              : myCv,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      backgroundColor: defultColor,
                      radius: 20.0,
                      child: Icon(
                        Icons.close,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBroken.image,
                            color: defultColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () => {showPicker(context)},
                            child: Text(
                              'add photo',
                              style: TextStyle(
                                color: defultColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 /* Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '# tags',
                        style: TextStyle(
                          color: defultColor,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
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
  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path!!);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(_photo!);
      var downloadURL = await storage.ref("files/$fileName").getDownloadURL();
// Create/Update firesotre document

      setState(() {
        myCv = downloadURL!.toString();
        print(downloadURL!.toString());
      });
    } catch (e) {
      print('error occured');
    }
  }
}
